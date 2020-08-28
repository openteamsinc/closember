import flask
import requests
import os
PAT = os.environ['PAT']

headers = {"Authorization": f"Bearer {PAT}"}


def run_query(query): # A simple function to use requests.post to make the API call. Note the json= section.
    request = requests.post('https://api.github.com/graphql', json={'query': query}, headers=headers)
    if request.status_code == 200:
        return request.json()
    else:
        raise Exception("Query failed to run by returning code of {}. {}".format(request.status_code, query))

        

# The GraphQL query (with a few aditional bits included) itself defined as a multi-line string.       
slug = 'matplotlib/matplotlib'
def query(slug):
    return """
{
  search(query: "repo:"""+slug+""" is:closed created:<2020-08-01 closed:>2020-08-01", type: ISSUE, last: 100) {
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

#result = run_query(query) # Execute the query
#remaining_rate_limit = result["data"]["rateLimit"]["remaining"] # Drill down the dictionary
#print("Remaining rate limit - {}".format(remaining_rate_limit))

from jinja2 import Environment, FileSystemLoader, PackageLoader, select_autoescape

from flask import Flask
app = Flask(__name__)

slugs = ['ipython/ipython']

@app.route('/')
def hello_world():

    env = Environment(
        loader=FileSystemLoader(os.path.dirname(__file__)),
        autoescape=select_autoescape(["tpl"]),
    )
    tpl = env.get_template("page.tpl")
    entries = {}
    for s in slugs:
        entries[s] = run_query(query(s))['data']['search']['issueCount']

    print(entries)

    return tpl.render(entries=entries)


@app.route('/<path:p>')
def addp(p):
    global slugs
    try:
        org,name = p.split('/')
        if org.isalnum() and name.isalnum():
            slugs.append(p)
        return 'ok'
    except Exception:
        return 'no'

 
