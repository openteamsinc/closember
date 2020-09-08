<html>
<header>
<!-- Google Fonts -->
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Roboto:300,300italic,700,700italic">

<!-- CSS Reset -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/normalize/8.0.1/normalize.css">

<!-- Milligram CSS -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/milligram/1.4.1/milligram.css">

<style>
.c1 td + td , .green-glow {
    color: #00af00;
    text-shadow: 0 0 5px #57e663DD;
}
.c2 td + td, .red-glow {
    color: #d80f0f;
    text-shadow: 0 0 5px #d80f0fDD;
}

li > p {
    display: inline;
}

.wrapper > .container {
   max-width: 80rem;
}



.wrapper {
    display: block;
    overflow: hidden;
    position: relative;
    width: 100%
}

.wrapper .container {
    max-width: 80rem
}

.wrapper>.container {
    padding-bottom: 7.5rem;
    padding-top: 7.5rem
}

.header {
    background-color: #f4f5f6;
    padding-top: 1rem
}

@media(min-width: 40rem) {
    .header {
        padding-top:5rem
    }
}

.header+section {
    border-top: 0
}

.header .container {
    border-top: 0;
    padding-bottom: 7.5rem;
    padding-top: 7.5rem;
    position: relative;
    text-align: center
}

.header .title {
    font-family: Gotham Rounded A,Gotham Rounded B,Helvetica Neue,Arial,sans-serif
}



.header .button {
    margin-bottom: 4rem;
    margin-top: 2rem
}

</style>
</header>


<body>
 <main class=wrapper>
 <nav class="navigation"></nav>
 <header class="header" id="home"><section class="container"><h1 class="title">Closember</h1>
   <blockquote>
<p>Perfection is achieved, not when there is nothing more to add, but when there is nothing left to take away</p>
<footer>― Antoine de Saint-Exupéry,</footer>
</blockquote>
   <p><span class='green-glow'>{{total_closed}}</span> issues and pull-requests closed so far ! We need your help for
   the <span
   class='red-glow'>{{to_go}} </span> that need to go... </p>
   <a class="button" href="#help" title="Getting Started">Start Closing Issues</a>
   </section></header>
  <section class='container'>


{% if CUT_DATE %}
<p>This is a draft, right now the issue count use {{CUT_DATE}} as a threshold it will be changes to <b>November
1<sup>st</sup></b>
closer to release</p>
{% endif %}

{% markdown %}

#### Closember aims to increase awareness about Open Source maintainer burnout and promote practices to make maintaining open-source less stressful and more enjoyable for everyone.

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

This table track the number of issues that have been close in each of project during the month of Closember. 
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
{% for e,v in remaining %}
<tr>
  <td>{{loop.index}} - {{e}}</td><td>{{v.get("Issue", 0)}}</td><td>{{v.get("PullRequest", 0)}}</td>
</tr>
{% endfor %}
</table>

{% markdown %}

## Zeno Paradox

... you keep closing but they keep opening new ones. Let's track project with the least new PRs or issues.




{% endmarkdown %}


<h3 id='help'>What should I do ?</h3>


{% markdown %}


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

 - You can find the list of all issues *you have opened* at https://github.com/issues, do the same as above but _you can close your own issues too_.

 - Head to https://github.com/pulls, this is all the pull-requests that you have submitted
   - Are they still relevant ?
   - Close them if not, think about finishing them otherwise. 

 - Finish someone else Pull-Request: Many drive by contributors start pull-request but do not finish them. Maybe you can
   take over, Once your version of the code is merged suggest for the old pull-request to be closed. 

### how to be listed on this leaderboard ?

Add the "closember" topic to your repositories. Next time the site is updated you'll be listed.

### Why is the score not changing ? 

GitHub requests are cached for a few minutes, maybe 1 maybe 10, maybe 60, depend on my mood, or how much traffic we get. 
It should update soon. But please relax. It's  not a sprint, it's a marathon.

### show me this website code

https://github.com/carreau/closember – please come close issues.



 



{% endmarkdown %}


</section>
<footer>
<small>Remaining querries {{rq}}</small>
</footer>
</main>
</body>
</html>


