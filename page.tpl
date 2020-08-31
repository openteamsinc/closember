<html>
<header>
<link rel="stylesheet" href="https://unpkg.com/sakura.css/css/sakura-dark.css" type="text/css">
<style>
.c1 td + td {
    color: #00af00;
    text-shadow: 0 0 5px #57e663DD;
}
.c2 td + td{
    color: #d80f0f;
    text-shadow: 0 0 5px #d80f0fDD;
}
</style>
</header>


<body>

{% markdown %}
# Closember

> Perfection is achieved, not when there is nothing more to add, but when there is nothing left to take away

― Antoine de Saint-Exupéry,


#### Closetember aims to increase awareness about Open Source maintainer burnout and promote practices to make maintaining open-source less stressful and more enjoyable for everyone.

Maintaining Open-Source is rarely about writing more code and getting more Pull-Requests. It is about properly
caring, knowing how to say "No" and thinking about long term sustainability.

Having a well-setup process, not too many tasks running at the same time can be critical for Maintainers mental load,
and mental health, as well as provide a easier environment for new contributors.


This means that when project have less open pull requests, well curated issues that are closed when not
relevant it is easier to get timely reviews, there is less chances to have duplicate work, less chance of code
conflicts, and easier time finding potential duplicate bugs.

Less task, and less stress also leads to **friendlier interactions**.

We thus encourage to contribute to _closember, and work with your favorite maintainers, on your favorite repositories
to decrease the number of opened issues and pull-requests for a _more dynamic_, better maintained ecosystem, cleaner and
leaner environment.

We also encourage you to avoid duplicate work by merging similar projects when relevant.


## Join us to close issues and PRs

The tables below tracks multiple metrics to help you achieve goals. There are no good, or bad metrics, but it is fun to
be able to compare.

> Please be careful about projects guideline and whether an issue should be closed,
> some project close issues/PR that have not been commented on in a while, some other only close issues when it is
> resolved and a release has been made. In case of doubt, ask.


### Closeboard 

This table track the number of issues that have been close in each of project during the month of Closetember. 
Issues opened during closember do not count to encourage people to close older issues.

{% endmarkdown %}

<table class='c1'>
<tr>
<th>Repo</th>
<th>Closed Issues</th>
<th>Closed PRs</th>
</tr>
{% for e,v in entries|reverse %}
<tr>
  <td>{{loop.index}} – {{e}}</td><td>{{v.get("Issue", 0)}}</td><td>{{v.get("PullRequest", 0)}}</td>
</tr>
{% endfor %}
</table>


{% markdown %}

## Total Open

{% endmarkdown %}

<table class='c2'>
<tr>
<th>Repo</th>
<th>Open Issues</th>
<th>Open PRs</th>
</tr>
{% for e,v in tot %}
<tr>
  <td>{{loop.index}} - {{e}}</td><td>{{v.get("Issue", 0)}}</td><td>{{v.get("PullRequest", 0)}}</td>
</tr>
{% endfor %}
</table>

{% markdown %}

## Zeno Paradox

... you keep closing but they keep opening new ones. Let's track project with the least new PRs or issues.




### What should I do ?

This is about you first; you need to be a good mental state in order to help other. Personally I'll walk in circle for
about 2 hours, clean my desk for it to tidy, remove extra icons for my desktop and also try to decrease my amount of
unread mail. Like can I get under 1000. Also find a couple of things and click "unsubscribe", it can be mails, or slack
channels or un-follow people on twitter.

Once you feel great about yourself go help others.


### How can I help other ?

Great question ! You often do not need to know how to code to contribute to closember !

 - find your favorite project, look at an old opened issue. Can you reproduce it ? Is it still relevant? If notm leave a
   nice comment, like :
    - "I tried to reproduce this issue, but on the latest released version it does not seem to be a problem anymore".
    - "This has actually been fixed by XXXX"
    - "I think that this was an issues back in 2003, but no one uses ie6 anymore".

   It will be less work for the maintainers, and they'll close the issue for you.

 - You can find the list of all issues *you have opened* at https://github.com/issues, do the same as above but _you can
   close your own issues too_.

 - Head to https://github.com/pulls, this is all the pull-requests that you have submitted
   - Are they still relevant ?
   - Close them if not, think about finishing them otherwise. 

 - Finish someone else Pull-Request: Many drive by contributors start pull-request but do not finish them. Maybe you can
   take over, Once your version of the code is merged suggest for the old pull-request to be closed. 

 



{% endmarkdown %}


<footer>
<small>Remaining querries {{rq}}</small>
</footer>
</body>
</html>


