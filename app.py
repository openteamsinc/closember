import os
import humanize
import sys
from quart_trio import QuartTrio
import os
import datetime
import trio
import asks
from pathlib import Path
PAT = os.environ['PAT']

headers = {"Authorization": f"Bearer {PAT}"}

from cachetools.func import ttl_cache, TTLCache

RC = TTLCache(1024, ttl=240)


ONGOING = datetime.datetime.now() > datetime.datetime(2021, 11, 1, 0, 0)

if ONGOING:
    CUT_DATE = "2021-11-01"
else:
    CUT_DATE = "2020-11-01"


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
    + """T00:00:00Z"}) {
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


# @ttl_cache( ttl=240)
async def run_query(
    query,
):  # A simple function to use requests.post to make the API call. Note the json= section.
    RC.expire()
    res = RC.get(query, None)
    if res is None:

        request = await asks.post(
            "https://api.github.com/graphql", json={"query": query}, headers=headers
        )
        if request.status_code == 200:
            res = request.json()
            RC[query] = res
            return res
        else:
            raise Exception(
                "Query failed to run by returning code of {}. {}".format(
                    request.status_code, query
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


def query(slug):
    return (
        """
{
  search(query: "repo:"""
        + slug
        + """ is:closed created:<"""
        + CUT_DATE
        + """ closed:>"""
        + CUT_DATE
        + """", type: ISSUE, last:100) {
        issueCount
        edges{
            node{
                __typename
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


slugs = [
]

from collections import Counter


async def get_p():
    data = await run_query(PARTICIP)
    data = data["data"]["search"]["edges"]
    return [n["node"]["owner"]["login"] + "/" + n["node"]["name"] for n in data] + slugs


@app.route("/")
async def hello_world():
    return await render()


async def get_longest_open():
    res = await run_query(LONGEST_OPEN_QUERRY)
    from dateutil.parser import isoparse
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
    reses2 = {}
    reses3 = {}

    async def loc(storage, key, query):
        storage[key] = await run_query(query)

    async def get_sg(sgs):
        sgs.update(await run_query(STARGAZERS))

    print("Start contacting github...")
    slgs = sorted(set(await get_p()))
    other = await get_longest_open()
    async with trio.open_nursery() as n:
        for s in slgs:
            n.start_soon(loc, reses1, s, query(s))
            n.start_soon(loc, reses2, s, query_open(s, "pr"))
            n.start_soon(loc, reses3, s, query_open(s, "issue"))
        sgs = {}
        n.start_soon(get_sg, sgs)
    print("Done")

    all_sg = sgs["data"]["repository"]["stargazers"]
    sg_total = all_sg["totalCount"]
    top_sg = [
        {
            "login": x["node"]["login"],
            "avatar": x["node"]["avatarUrl"],
            "url": x["node"]["url"],
        }
        for x in all_sg["edges"]
    ]

    for s in slgs:
        # await loc(reses1, s, query(s))
        res1 = reses1[s]
        res2 = reses2[s]
        res3 = reses3[s]

        rq = min(rq, res1["data"]["rateLimit"]["remaining"])

        search = res1["data"]["search"]
        entries[s] = search["issueCount"]
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
    )
    print("done")
    return res


@app.route("/<path:p>")
def addp(p):
    global slugs
    try:
        org,name = p.split('/')
        if org.isalnum() and name.isalnum():
            slugs.append(p)
        return 'ok'
    except Exception:
        return 'no'


def main():

    port = os.environ.get("PORT", 5000)
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
