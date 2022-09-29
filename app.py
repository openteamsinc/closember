import os
import humanize
import sys
from quart_trio import QuartTrio
import os
import datetime
import trio
import asks
from pathlib import Path

PAT = os.environ["PAT"]

# headers = {"Authorization": f"Bearer {PAT}"}

from cachetools.func import ttl_cache, TTLCache

RC = TTLCache(1024, ttl=240)

YEAR = 2022

ONGOING = (
    datetime.datetime(YEAR, 11, 1, 0, 0)
    < datetime.datetime.now()
    < datetime.datetime(YEAR, 12, 1, 0, 0)
)

if ONGOING:
    CUT_DATE = f"{YEAR}-11-01T00:00:00Z"
else:
    CUT_DATE = f"{YEAR}-11-01T00:00:00Z"


# in https://docs.github.com/en/graphql/overview/explorer
# trying to find oldest created issue.
LONGEST_OPEN_QUERRY = (
    """
{
  search(query: "topic:closember", type: REPOSITORY, last: 100) {
    issueCount
    edges {
      node {
        ... on Repository {
          issues(first: 100, orderBy: {field: CREATED_AT, direction: ASC}, states: CLOSED, filterBy: {since:\""""
    + CUT_DATE
    + """"}) {
            edges {
              node {
                closedAt
                url
                createdAt
                number
              }
            }
          }
          nameWithOwner
        }
      }
    }
  }
  rateLimit {
    limit
    cost
    remaining
    resetAt
  }
}
"""
)

print(LONGEST_OPEN_QUERRY)

from pathlib import Path
import json

CACHE = Path("cache.json")


class FakeRequest:

    status_code = 200

    def __init__(self, data):

        self.data = data

    def json(self):
        return self.data


GCACHE = {}


async def asks_post(url, *, querry, pat):
    global GCACHE
    if CACHE.exists() and not GCACHE:
        GCACHE = json.loads(CACHE.read_text())
    key = json.dumps([url, querry], indent=2)
    res = GCACHE.get(key, None)
    if res is not None:
        print("Using Cached request")
        return FakeRequest(res)
    else:
        print("Real Querry", url, querry)
        res = await asks.post(
            "https://api.github.com/graphql",
            json={"query": querry},
            headers={"Authorization": f"Bearer {pat}"},
        )
        GCACHE[key] = res.json()
    CACHE.write_text(json.dumps(GCACHE))
    assert res is not None
    return res


async def _rec(query, slug, cursor):
    print("recurse")
    q = query(slug, cursor)
    request = await asks_post("https://api.github.com/graphql", querry=q, pat=PAT)
    res = request.json()
    pinfo = res.get("data", {}).get("search", {}).get("pageInfo", {})
    if pinfo.get("hasNextPage", {}):
        endCursor = pinfo["endCursor"]
        return res["data"]["search"]["edges"] + await _rec(query, slug, endCursor)
    else:
        return res["data"]["search"]["edges"]


async def run_query(
    query, slug
):  # A simple function to use requests.post to make the API call. Note the json= section.
    RC.expire()
    q = query(slug)
    res = RC.get(q, None)
    if res is None:

        request = await asks_post("https://api.github.com/graphql", querry=q, pat=PAT)
        if request.status_code == 200:
            res = request.json()
            pinfo = res.get("data", {}).get("search", {}).get("pageInfo", {})
            if pinfo.get("hasNextPage"):
                endCursor = pinfo["endCursor"]
                res["data"]["search"]["edges"].extend(
                    await _rec(query, slug, endCursor)
                )

            RC[q] = res
            return res
        else:
            raise Exception(
                "Query failed to run by returning code of {}. {}".format(
                    request.status_code, q
                )
            )
    else:
        return res


STARGAZERS = """
{
  repository(name: "closember", owner: "openteamsinc") {
    stargazers(last: 100) {
      totalCount
      edges {
        node {
          avatarUrl
          login
          url
          followers {
            totalCount
          }
        }
      }
    }
  }
}
"""

# The GraphQL query (with a few aditional bits included) itself defined as a multi-line string.

PARTICIP = """
query TopicRepo {
  search(query: "topic:closember", type: REPOSITORY, first: 100) {
    edges {
      
      node {
   			... on Repository {
          name
          owner{login}
        }
      }
    }
  }
}
"""


def query(slug, after="null"):
    if after is not "null" and not after.startswith('"'):
        after = '"' + after + '"'
    res = (
        """
{
  search(query: "repo:"""
        + slug
        + """ is:closed created:<"""
        + CUT_DATE
        + """ closed:>"""
        + CUT_DATE
        + """", type: ISSUE, last:100, after:"""
        + after
        + """) {
        edges{
            node{
                __typename
                ... on Issue {
                  id
                  closedAt
                }
                ... on PullRequest {
                  id
                  closedAt
                }
            }
        }
        pageInfo {
        	endCursor
        	hasNextPage
      	}
  }
  rateLimit {
    limit
    cost
    remaining
    resetAt
  }
}
"""
    )
    return res


def query_open(slug, type_):
    res = (
        """
{
  search(query: "repo:"""
        + slug
        + f""" is:open is:{type_}","""
        + """ type: ISSUE, last: 100) 
   {
    issueCount
   }
   rateLimit {
    limit
    cost
    remaining
    resetAt
  }

 
}
"""
    )
    return res


# result = run_query(query) # Execute the query
# remaining_rate_limit = result["data"]["rateLimit"]["remaining"] # Drill down the dictionary
# print("Remaining rate limit - {}".format(remaining_rate_limit))

from jinja2 import Environment, FileSystemLoader, PackageLoader, select_autoescape


# app = Flask(__name__)
app = QuartTrio(__name__)


slugs = []

from collections import Counter


async def get_p():
    data = await run_query(lambda s: PARTICIP, "")
    data = data["data"]["search"]["edges"]
    return [n["node"]["owner"]["login"] + "/" + n["node"]["name"] for n in data] + slugs


@app.route("/")
async def hello_world():
    return await render()


@app.route("/hero.svg")
async def hero():
    with open("hero.svg") as f:
        return f.read()


from dateutil.parser import isoparse


async def get_longest_open():
    res = await run_query(lambda s: LONGEST_OPEN_QUERRY, "")
    from collections import namedtuple

    LongestClosed = namedtuple(
        "LongestClosed", "delta,repo,url,open,closed,number".split(",")
    )

    duration_pairs = []
    for repo in res["data"]["search"]["edges"]:
        dpl = []
        reponame = repo["node"]["nameWithOwner"]
        for issue in repo["node"]["issues"]["edges"]:

            closed = isoparse(issue["node"]["closedAt"])
            opened = isoparse(issue["node"]["createdAt"])
            if closed < isoparse("2021-12-01T00:00:00Z"):
                dpl.append(
                    LongestClosed(
                        closed - opened,
                        reponame,
                        issue["node"]["url"],
                        opened,
                        closed,
                        issue["node"]["number"],
                    )
                )
        if dpl:
            duration_pairs.append(list(sorted(dpl, reverse=True))[0])

    return list(sorted(duration_pairs, reverse=True))


async def render():

    env = Environment(
        loader=FileSystemLoader(os.path.dirname(__file__)),
        autoescape=select_autoescape(["tpl"]),
        extensions=["jinja_markdown.MarkdownExtension"],
    )
    env.filters["naturaldelta"] = humanize.naturaldelta
    tpl = env.get_template("page.tpl")
    entries = {}
    remaining = {}
    rq = 5000

    reses1 = {}
    res_total_open_prs = {}
    res_total_open_issues = {}

    async def loc(storage, key, query):
        assert not isinstance(query, str)
        storage[key] = await run_query(query, key)

    async def get_sg(sgs):
        sgs.update(await run_query(lambda s: STARGAZERS, ""))

    print("Start contacting github...")
    slgs = sorted(set(await get_p()))
    other = await get_longest_open()
    async with trio.open_nursery() as n:
        for s in slgs:
            n.start_soon(loc, reses1, s, query)
            n.start_soon(loc, res_total_open_prs, s, lambda s: query_open(s, "pr"))
            n.start_soon(
                loc, res_total_open_issues, s, lambda s: query_open(s, "issue")
            )
        sgs = {}
        n.start_soon(get_sg, sgs)
    print("Done")

    all_sg = sgs["data"]["repository"]["stargazers"]
    sg_total = all_sg["totalCount"]
    top_sg = [
        {
            "login": x["node"]["login"],
            "avatar": x["node"]["avatarUrl"] + "&s=50",
            "url": x["node"]["url"],
        }
        for x in all_sg["edges"]
    ]
    monthly_counter_per_slug = {}
    for s in slgs:
        # await loc(reses1, s, query(s))
        res1 = reses1[s]
        res2 = res_total_open_prs[s]
        res3 = res_total_open_issues[s]

        rq = min(rq, res1["data"]["rateLimit"]["remaining"])

        search = res1["data"]["search"]
        entries[s] = sum(
            [
                isoparse(x["node"]["closedAt"]) < isoparse("2021-12-01T00:00:00Z")
                for x in res1["data"]["search"]["edges"]
            ]
        )

        # we we compute the number os issues closed/open each month.
        monthly_counter = {x: {"Issue": 0, "PullRequest": 0} for x in range(1, 13)}
        for month, type_ in [
            (isoparse(x["node"]["closedAt"]).month, x["node"]["__typename"])
            for x in res1["data"]["search"]["edges"]
        ]:
            monthly_counter[month][type_] += 1

        monthly_counter_per_slug[s] = [
            {
                "date": f"2021-{m:02d}",
                "Issues": monthly_counter[m]["Issue"],
                "PR": monthly_counter[m]["PullRequest"],
            }
            for m in range(1, 13)
        ]

        c = Counter([s["node"]["__typename"] for s in search["edges"]])
        entries[s] = dict(c)

        rq = min(rq, res2["data"]["rateLimit"]["remaining"])
        prs = res2["data"]["search"]["issueCount"]

        rq = min(rq, res3["data"]["rateLimit"]["remaining"])
        issues = res3["data"]["search"]["issueCount"]

        remaining[s] = {"Issue": issues, "PullRequest": prs}

        rq = min(rq, res3["data"]["rateLimit"]["remaining"])
        print("Rate limit:", rq)

    print("rendering...")
    entries = [(k, v) for k, v in entries.items()]
    remaining = [(k, v) for k, v in remaining.items()]

    total_closed = sum(
        [v[1].get("Issue", 0) + v[1].get("PullRequest", 0) for v in entries]
    )

    to_go = sum([v[1].get("Issue", 0) + v[1].get("PullRequest", 0) for v in remaining])

    entries = list(
        sorted(entries, key=lambda x: x[1].get("Issue", 0) + x[1].get("PullRequest", 0))
    )
    remaining = list(
        sorted(
            remaining, key=lambda x: x[1].get("Issue", 0) + x[1].get("PullRequest", 0)
        )
    )
    svg = Path("hero.svg").read_text()
    res = tpl.render(
        entries=entries,
        rq=rq,
        remaining=remaining,
        total_closed=total_closed,
        to_go=to_go,
        other=other,
        CUT_DATE=CUT_DATE,
        ONGOING=ONGOING,
        NOW=datetime.datetime.now().strftime("%d/%m/%Y %H:%M:%S"),
        sg_total=sg_total,
        top_sg=top_sg,
        svg=svg,
        monthly_counter_per_slug=monthly_counter_per_slug,
    )
    print("done")
    return res


@app.route("/<path:p>")
def addp(p):
    global slugs
    try:
        org, name = p.split("/")
        if org.isalnum() and name.isalnum():
            slugs.append(p)
        return "ok"
    except Exception:
        return "no"


def main():

    port = os.environ.get("PORT", 5001)
    print("Seen config port ", port)
    prod = os.environ.get("PROD", None)
    if prod:
        app.run(port=port, host="0.0.0.0")
    else:
        app.run(port=port)


if __name__ == "__main__":
    if "static" in sys.argv:
        build = Path("build")
        build.mkdir(exist_ok=True)
        p = build / "index.html"
        p.write_text(trio.run(render))
        print(f"written to {p}")

        assets = Path("assets")
        (build / "assets").mkdir(exist_ok=True)
        for img in assets.glob("*"):
            (build / "assets" / img.name).write_bytes(img.read_bytes())

    else:
        main()
