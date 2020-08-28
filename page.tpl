<html>
<header>
<link rel="stylesheet" href="https://unpkg.com/sakura.css/css/sakura.css" type="text/css">
</header>


<body>

{% markdown %}
# Closetember

> Perfection is achieved, not when there is nothing more to add, but when there is nothing left to take away

― Antoine de Saint-Exupéry,


Life as a open source maintainer is rarely about getting more Pull request of writing more code. It is a bout properly
caring about your garden, cleaning it and making sure it is pretty for when you, or others are visiting it. 

This means that a project that only have a few opened pull request, well curated issues that are closed when not
relevant **encourages contribution** and **is good for maintainers mental health**.

Less stress also leads to **friendlier interactions**.

We thus encourage to contribute to _closetember_, and work with your favorite maintainers to decrese the number of
opened issues and pull-requests for a _more dynamic_


{% endmarkdown %}

Issues opened before xxx closed during closetember

<h3>Closerboard</h3>

{% markdown %}

This table track the number of issues that have been close in each of project during the month of Closetember. 
Issues opened during closetember do not count to encourage people to close older issues.

{% endmarkdown %}


<table>
{% for e,v in entries.items() %}
<tr>
  <td>{{e}}</td><td>{{v}}</td>
</tr>
{% endfor %}
</table>

TODO: above is only issues, find PRs.


{% markdown %}

## Looserboard PR

TODO: tables with the _least_ amount of open PRs total, not delta.

{% endmarkdown %}


{% markdown %}

## Looserboard Issues

TODO: tables with the _least_ amount of open Issues, total, not delta.

{% endmarkdown %}

{% markdown %}

##  Failure board Issues

TODO: tables with the smallest amount of opened issues during Closetember, open and reclosed still count

{% endmarkdown %}


{% markdown %}

## Failure board PRs

TODO: tables with the smallest amount of opened PR during Closetember, open and reclosed still count



{% endmarkdown %}




{% markdown %}

### What should I do ?

This is about you first; you need to be a good mental state in order to help other. Personally I'll walk in circle for
about 2 hours, clean my desk for it to tidy, remove extra icons for my desktop and also try to decrease my amount of
unread mail. Like can I get under 1000. Also find a couple of things and click "unsubscribe", it can be mails, or slack
channels or un-follow people on twitter.

Once you feel great about yourself go help others.


### How can I help other ?

Great question ! You often do not need to know how to code to contribute to closetember !

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


