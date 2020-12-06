<html>
<header>
<!-- Google Fonts -->
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Roboto:300,300italic,700,700italic">

<!-- CSS Reset -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/normalize/8.0.1/normalize.css">

<!-- Milligram CSS -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/milligram/1.4.1/milligram.css">
<link href="https://fonts.googleapis.com/css2?family=Nunito:wght@700&display=swap" rel="stylesheet">


<style>
.green-glow {
    color: #00af00;
    text-shadow: 0 0 5px #57e663DD;
}
.red-glow {
    color: #d80f0f;
    text-shadow: 0 0 5px #d80f0fDD;
}

li > p {
    display: inline;
}

.wrapper > .container {
   max-width: 80rem;
}

.sg > img {max-width: 50px; border-radius: 50px}
a.sg {display: inline-block;}


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



div#closed-sign {
   background-color: #53ad4d;
    border-radius: 15px;
    border: 10px solid white;
    color: white;
    height: 11rem;
    display: block;
    padding:3rem;
    font-size: 35pt;
    width: 33rem;
    margin-left: auto;
    margin-right: auto;
    transform: rotate(-10deg);
    margin-top: 50px;
    margin-bottom: 50px;
    font-family: 'Nunito', cursive;
    box-shadow: 5px 9px 17px 3px rgba(0,0,0,0.75);
    transition-delay: 0.2s;
    transition: 0.6s;
}

div#closed-sign:hover{
    background-color: #e0665d;
}

h2 {

text-align: center; 

}

.title {
   font-size: 8rem;
}

.header {
    padding-top: 0rem;
}

.header .container {
    padding-top: 3.5rem;
    padding-bottom: 3.5rem;
}


#closed-sign:before, #closed-sign:after {
   position: absolute;
   top: 0.17em;
   left: 0;
   width: 100%;
    transition: 0.6s;
    transition-delay: 0.2s;
    box-sizing: border-box;
}
    
#closed-sign:before {
    opacity: 0;
    content: "Close";
}

#closed-sign:after {
    opacity: 1;
    content: "Closing soon";
}

#closed-sign:hover:before {
   opacity:1;
}


#closed-sign:hover:after {
    opacity: 0;
}


.footer{
    background-color: #f4f5f6;
    padding: 3rem;
}



</style>
</header>


<body>
 <main class=wrapper>
 <nav class="navigation"></nav>
 <header class="header" id="home"><section class="container"><h1 class="title">Closember</h1>
 <h2>It's over for 2020 !</h2>
 <p>but we'll be back in 2021 and will attempt to count issues closed during the whole year !</p>
 <p>Close/Merge as many issues and PR during the month of November</p>
   <div id='closed-sign'>
      
   </div>
   <h3><span class='green-glow'>{{total_closed}}</span> / <span class='red-glow'>{{to_go}} </span> </h3>
   <blockquote>
<p>Perfection is achieved, not when there is nothing more to add, but when there is nothing left to take away.</p>
<footer><small>― Antoine de Saint-Exupéry,</small></footer>
</blockquote>
   <p><span class='green-glow'>{{total_closed}}</span> issues and pull-requests closed (or merged) so far ! We need your help for
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

## Why Closember ?

----- 

#### Closember aims to increase awareness about Open Source maintainer burnout and promote practices to make maintaining open-source less stressful and more enjoyable for everyone. [more...](#more)



## Closeboard 

{% endmarkdown %}

<table class='c1'>
<tr>
<th>#</th>
<th>Repo</th>
<th>Closed Issues</th>
<th>Closed PRs</th>
</tr>
{% for e,v in entries|reverse %}
<tr>
  <td>{{loop.index}}</td>
  <td ><a href='https://github.com/{{e}}'>{{e}}<a></td>
  <td class='green-glow'>{{v.get("Issue", 0)}}</td>
  <td class='green-glow'>{{v.get("PullRequest", 0)}}</td>
</tr>
{% endfor %}
</table>
  <div style='text-align:center'><a class='button' href='#add-topic'>Add Your Repositories</a></div>


<blockquote>
<p>Remember remember to close PR in in Novemeber.</p>
<footer><small>― A Maintainer,</small></footer>
</blockquote>


{% markdown %}

This table track the number of Issues and Pull requests that have been closed(or merged) in each of project during the month of Closember. 
Issues opened during closember **do not count** to encourage people to close older issues.

## Total Open

{% endmarkdown %}

<table class='c2'>
<tr>
<th>#</th>
<th>Repo</th>
<th>Open Issues</th>
<th>Open PRs</th>
</tr>
{% for e,v in remaining %}
<tr>
  <td>{{loop.index}} </td>
  <td ><a href='https://github.com/{{e}}'>{{e}}<a></td>
  <td class='red-glow'>{{v.get("Issue", 0)}}</td>
  <td class='red-glow'>{{v.get("PullRequest", 0)}}</td>
</tr>
{% endfor %}
</table>
  <div style='text-align:center'><a class='button' href='#add-topic'>Add Your Repositories</a></div>


{% markdown %}

Those are _suggested_ metrics, they are of course not absolute. Your community should have its own goal, though be
careful about the [Normalization of
deviance](https://en.wikibooks.org/wiki/Professionalism/Diane_Vaughan_and_the_normalization_of_deviance).

{% endmarkdown %}

<h2> Show your support : {{sg_total}} Supporters </h2>

<p>Star <a href='https://github.com/openteamsinc/closember'>our repository</a> to show your support even if your own
organisation or project don't participate</p>

{% for sg in top_sg %}
<a class='sg' href="{{sg.url}}"><img src={{sg.avatar}}/><div>{{sg.login}}</div></a>
{% endfor %}

{% markdown %}

----- 

<h3 id='more'>Maintainers in Open Source</h3>


[The Role of a Maintainer](http://matthewrocklin.com/blog/2019/05/18/maintainer) in  Open-Source is rarely only about
writing more code and getting more Pull-Requests. It is about properly caring, knowing how to say "No" and thinking
about **long term sustainability**.

Having a well-setup process, not too many tasks running at the same time can be critical for Maintainers **cognitive
load**, and **mental health**, as well as provide a **easier environment for new contributors**.

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


## Zeno Paradox

... you keep closing but they new ones keep being opened. This is why issues or pull-requests open during November do not
count toward the total. This is not meant to disrupt the normal flow of work, but to encourage you to help maintainers
taking care of older issues and pull-requests.


{% endmarkdown %}


<h3 id='help'>What should I do ?</h3>


{% markdown %}


This is about **you** first; you need to be a good mental state in order to help other. Personally I'll walk in circle for
about 2 hours, clean my desk for it to tidy, remove extra icons for my desktop and also try to decrease my amount of
unread mails. Like can I get under 1000 ? Also find a couple of things and click "unsubscribe", it can be mails, or slack
channels or un-follow people on twitter/facebook/instagram.

Once you feel great about yourself go help others. What you just did for yourself here, you can now help doing for the
maintainers of your favorites projects, and make those project better for everyone. 

### Maintainers: How to get ready:

 - Tag the repositories you control with `closember` topic, they will be listed here automatically soon. If you can't,
   don't want to for some reason, we can hardcode your repository in the list (see
   https://github.com/openteamsinc/closember/issues/3). 
 - GitHub have the "Maintainer" role for teams that _should_ allow users to open/close issues without giving push
   rights.
 - If U.S citizen, remember to vote on Nov 3rd.

### How can I help other ?

Great question ! You often do not need to know how to code to contribute to Closember ! FOr any project you will
contribute to, make sure to check their guideline, and avoid eager closing of issues/PRs if that's not the desire of the
maintainers. The following are a guideline, adapt them to fit _your skills_ as well as _skills that can be of used for
projects_.

 - **find your favorite project**, look at an old opened issue. Can you reproduce it ? Is it still relevant? If not, leave a
   nice comment, like :
    - "I tried to reproduce this issue, but on the latest released version it does not seem to be a problem anymore".
    - "This has actually been fixed by XXXX"
    - "I think that this was an issues back in 2003, but no one uses ie6 anymore, I belive this can be closed.".

   It will be less work for the maintainers, and they'll close the issue for you.

 - You can find the list of all issues *you have opened* at https://github.com/issues, do the same as above but _you can
   close your own issues too_.

 - Head to https://github.com/pulls, this is all the pull-requests that you have submitted
   - Are they still relevant ?
   - Close them if not, think about finishing them otherwise. 
   - Maybe at least think about rebasing them and `git push --force-with-lease` to make sure the test pass on the latest
     versions.

 - Finish someone else Pull-Request: Many drive by contributors start pull-request but do not finish them. Maybe you can
   take over ? Once your version of the code is merged suggest for the old pull-request to be closed.

<h3 id='add-topic'>how to be listed on this leaderboard ?</h3>

**Add the [`closember` topic](https://github.com/topics/closember)** to your repositories. Next time the site is updated you'll be listed.

### Why is the score not changing ? 

GitHub requests are cached for a few minutes, maybe 1 maybe 10, maybe 60, depend on my mood, or how much traffic we get. 
It should update soon. But please relax. It's not a sprint, it's a marathon.

### Show me this website code

https://github.com/openteamsinc/closember – please come close issues.


### I closed all my issues / I really want to code...

Ok, fine, you want an excuse to write some code. Still you can do things the make maintainer life easier. A couple
pet peevs of mine.

  - Add Version number to your deprecation warnings, when I see a deprecation message I want to know since which version
    it is deprecated and what's the replacement without having to go dive in the docs.
  - Turn your deprecation warnings into error in your test suite, and make sure you are not using (when possible),
    deprecated functionalities.
  - Bump your minimal requirements for old libraries when you can. 
  - Knows more than one small project doing almost the same things ? Try to get maintainers to merge codebases /
    collaborate.
  - Cleanup your git stale branches, 
  - Delete forks of repositories you are not contributing to.
  - create a systemwide `.gitignore` to not add `*.un~` and `.DS_Store` to every `.gitignore` project you contribute to.

### I want to lean more about Open-Source

While we haven't read it yet, we recommend [Working in Public: The Making and Maintenance of Open Source
Software](https://press.stripe.com/#working-in-public) by [Nadia Eghbal](https://nadiaeghbal.com/)


### Do I get a Lousy T-Shirt ?

Open-teams, FairOSS and Quansight are working on this, and how we can sponsors this better. Likely not this year, but
we'll see for next. It is also a tough problem as not everyone can close any issue, so come talk to us if you want to
find a way for user to claim having helped and maintainers to validate those claims.

## Partners

Closember is currently sponsored by [Quansight](https://www.quansight.com/), [FairOSS](https://faiross.org/) and
[OpenTeams](https://openteams.com/landing/).


## F.A.Q. with creator

 - Why did you created Closember ?
 - It's something I wanted to do for some time, I regularly participate to
   [hacktoberfest](https://hacktoberfest.digitalocean.com/) both as a user and maintainer. As a maintainer it can be a
   deluge of PRs that can be tough to deal with. As a use, large number of PRs can be demotivating.
 - Can you extend on what you mean with dealing will pull-requests ?
 - Yes, even when you receive a well-meaning pull-request for a feature or bug-fix you want, those usually need some
   polishing to adapt to the code guideline, and get test and documentation added. Many of those contributions are
   by "drive by" contributors are often unfinished, a bit like someone giving you flour, eggs, sugar and a cake recipe
   for your birthday.
 - Can you expand on the demotivation you face as a user with many PRs ? 
 - I occasionally contribute to repositories I'm not familiar with. Some of those are more than a thousand PRs opened.
   It is hard to be confident that one more PRs, even perfect will be noticed by maintainers, it's also unclear whether
   someone is already doing the work, or if my work will conflict with someone else. I often have to reach
   personally to other maintainers – when I know them personally – to get noticed. This is definitively something which
   can be difficult to new contributor or less privileged people.





 



{% endmarkdown %}


</section>
<footer class='footer'>
<section class=container>
{% markdown %}
Powered by [Quart](https://pypi.org/project/Quart-Trio/), [Trio](https://trio.readthedocs.org),
[Asks](https://asks.readthedocs.io/en/latest/) and [Jinja2](https://jinja.palletsprojects.com/en/2.11.x/).
Theme from [milligram](https://milligram.io/). No JS. </br><small>Remaining querries {{rq}} - {{NOW}}. Interested in
sponsoring ? <a href='mailto:mbussonnier@quansight.com'>email us</a></small>.
{% endmarkdown %}
</section>
</footer>
</main>
</body>
</html>


