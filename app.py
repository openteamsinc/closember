import flask
import requests
import os
PAT = os.environ['PAT']

headers = {"Authorization": f"Bearer {PAT}"}

from cachetools.func import ttl_cache


@ttl_cache(ttl=180)
def run_query(query): # A simple function to use requests.post to make the API call. Note the json= section.
    request = requests.post('https://api.github.com/graphql', json={'query': query}, headers=headers)
    if request.status_code == 200:
        return request.json()
    else:
        raise Exception("Query failed to run by returning code of {}. {}".format(request.status_code, query))

        

# The GraphQL query (with a few aditional bits included) itself defined as a multi-line string.


def query(slug):
    print("Q", slug)
    return (
        """
{
  search(query: "repo:"""
        + slug
        + """ is:closed created:<2020-08-01 closed:>2020-08-01", type: ISSUE, last:100) {
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
    print("QO", slug, type_)
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

from flask import Flask

app = Flask(__name__)


slugs = [
    "ipython/ipython",
    "ipython/traitlets",
    "jupyterhub/jupyterhub",
    "numpy/numpy",
    "sympy/sympy",
    "matplotlib/matplotlib",
]

from collections import Counter


@app.route("/")
def hello_world():

    env = Environment(
        loader=FileSystemLoader(os.path.dirname(__file__)),
        autoescape=select_autoescape(["tpl"]),
        extensions=["jinja_markdown.MarkdownExtension"],
    )
    tpl = env.get_template("page.tpl")
    entries = {}
    tot = {}
    rq = 5000
    for s in sorted(set(slugs)):
        print("slug...", s)
        res = run_query(query(s))
        rq = min(rq, res["data"]["rateLimit"]["remaining"])

        search = res["data"]["search"]
        entries[s] = search["issueCount"]
        c = Counter([s["node"]["__typename"] for s in search["edges"]])
        entries[s] = dict(c)

        res = run_query(query_open(s, "pr"))
        rq = min(rq, res["data"]["rateLimit"]["remaining"])
        prs = res["data"]["search"]["issueCount"]

        res = run_query(query_open(s, "issue"))
        rq = min(rq, res["data"]["rateLimit"]["remaining"])
        issues = res["data"]["search"]["issueCount"]

        tot[s] = {"Issue": issues, "PullRequest": prs}

        rq = min(rq, res["data"]["rateLimit"]["remaining"])

    print("rendering...")
    entries = [(k, v) for k, v in entries.items()]
    tot = [(k, v) for k, v in tot.items()]

    entries = list(
        sorted(entries, key=lambda x: x[1].get("Issue", 0) + x[1].get("PullRequest", 0))
    )
    tot = list(
        sorted(tot, key=lambda x: x[1].get("Issue", 0) + x[1].get("PullRequest", 0))
    )
    return tpl.render(entries=entries, rq=rq, tot=tot)


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


if __name__ == "__main__":
    import os

    port = os.environ.get("PORT", 5000)
    print("Seen config port ", port)
    prod = os.environ.get("PROD", None)
    if prod:
        app.run(port=port, host="0.0.0.0")
    else:
        app.run(port=port)
