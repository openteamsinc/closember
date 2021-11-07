<html>
<head>
<meta property="og:title" content="Closember 2021 by Quansight">
<meta property="og:image" content="https://closember.org/assets/Closember_OG.png">
<meta property="og:description" content="Closember aims to increase awareness about Open Source maintainer burnout and promote practices to make maintaining open-source less stressful and more enjoyable for everyone.">
<meta property="og:url" content="https://closember.org">

<meta name="twitter:card" content="summary_large_image" />
<meta property="twitter:title" content="Closember 2021 by Quansight">
<meta name="twitter:description" content="Closember aims to increase awareness about Open Source maintainer burnout and promote practices to make maintaining open-source less stressful and more enjoyable for everyone">
<meta property="twitter:image" content="https://closember.org/assets/Closember_OG.png">

<!-- Google Fonts -->
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Roboto:300,300italic,700,700italic">

<!-- CSS Reset -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/normalize/8.0.1/normalize.css">

<!-- Milligram CSS -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/milligram/1.4.1/milligram.css">
<link href="https://fonts.googleapis.com/css2?family=Nunito:wght@700&display=swap" rel="stylesheet">
<link href="https://fonts.googleapis.com/css2?family=Playball" rel="stylesheet">
<link href="https://fonts.cdnfonts.com/css/mj-alghifari" rel="stylesheet">

<!-- Place this tag in your head or just before your close body tag. -->


<style>
.green-glow {
    color: #1b721b;
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

.avatar-container{
    text-align: center;
}

.sg > img {
    width: 50px ;
    border-radius: 50px ;
    display: block;
    margin-left: auto;
    margin-right: auto;
}

.sg > img {max-width: 50px; border-radius: 50px}
a.sg {
    min-width: 70px;
    display: inline-block;
    text-align: center;
    padding: 10px ;
    border-radius: 10px ;
    transition: all 1.5s ease;
}
a.sg > img{
    transition: all 1.5s ease;
    filter: sepia(40%);
}
a.sg:hover > img {
    filter: sepia(10%);
}
a.sg:hover {
    background: #e676063d;
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

.button{
    background-color: #ee4740;
    border-color: #ee4740;
    border-radius: 30px;
}

a {
    color: #ee4740;
}

h3, p, ul, body {
color: #493222;
}



svg {
width: 100%;  
margin-top: -150;
margin-bottom: -100px;

};
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
    display: none;
}

div#closed-sign:hover{
    background-color: #e0665d;
}

h2 {

text-align: center; 
font-family: Playball, 'MJ AlGhifari', sans-serif;
color: #493222;

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
    transition: 0.6s;
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

.frame {
    height: 175px;      /* equals max image height */
    width: 260px;
    white-space: nowrap;
    
    text-align: center; margin: 1em 0;
    height: auto;
    margin: 2em auto 2em auto;
}

.helper {
    display: inline-block;
    height: 100%;
    vertical-align: middle;
}

frame.img {
    vertical-align: middle;
    max-height: 25px;
    max-width: 160px;
}




</style>
</head>
<body>
 <main class=wrapper>
 <nav class="navigation"></nav>
 <header class="header" id="home"><section class="container">
<!-- <h1 class="title">Closember</h1>-->
 {% if ONGOING %}
    <h2>Let s Go</h2>
   <div id='hero'>
   {{svg|safe}}
   </div>
 {% else %}
    <h2>Get Ready for this season</h2>
   <div id='hero'>
   {{svg|safe}}
   </div>
    <p>We're getting ready for 2021! Current numbers are arbitrary and will be reset on Nov 1st.</p>
 {% endif %}
 <p>Close/Merge as many issues and PR as possible during the month of November</p>
   <!--<div id='closed-sign'>-->
   </div>
   <h3><span class='green-glow'>{{total_closed}}</span> / <span class='red-glow'>{{to_go}} </span> </h3>
   <blockquote>
<p>Perfection is achieved, not when there is nothing more to add, but when there is nothing left to take away.</p>
<footer><small>― Antoine de Saint-Exupéry,</small></footer>
</blockquote>
   <p><span class='green-glow'>{{total_closed}}</span> issues and pull-requests closed (or merged) so far! We need your help with
   the <span
   class='red-glow'>{{to_go}} </span> that need to go... </p>
   <a class="button" href="#help" title="Getting Started">Start Closing Issues</a>
   </section></header>
  <section class='container'>


{% if not ONGOING %}
<p>This is a draft, right now the issue count use {{CUT_DATE}} as a threshold it will be changed to <b>November
1<sup>st</sup></b>
closer to release</p>
{% endif %}

{% markdown %}

## Why Closember ?

#### Closember aims to increase awareness about Open Source maintainer burnout and promote practices to make maintaining open-source less stressful and more enjoyable for everyone. [more...](#more)

----- 

## Did you know ?
----- 

#### You can go to https://github.com/issues and https://github.com/pulls to see all the issues/pull-requests **you** opened. Are those still relevant ? Maybe close a few if not.

----- 

## Closeboard 

{% if not ONGOING %}
Placeholder values : Will be reset to 0 on Nov 1st when Closember starts.
{% endif %}


{% endmarkdown %}

<table class='c1'>
<tr>
<th>#</th>
<th>Repository</th>
<th>Closed Issues</th>
<th>Closed/Merged PRs</th>
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
<p>Remember remember to close a PR in November.</p>
<footer><small>― A Maintainer,</small></footer>
</blockquote>


{% markdown %}

This table tracks the number of Issues and Pull requests that have been closed(or merged) in each of projects during the month of Closember. 
Issues opened in Closember **do not count** in an effort to encourage the closing of older issues.

## Total Open

{% if not ONGOING %}
Placeholder values : Will be reset to 0 on Nov 1st when Closember starts.
{% endif %}

{% endmarkdown %}

<table class='c2'>
<tr>
<th>#</th>
<th>Repository</th>
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

There is no perfect metric, and we sometimes f
et that issues are forgotten on the last page of the issue list.
Here is a leader board of who has closed the oldest issues during the month.

## Longest open issue

This shows the longest opened issue closed during Closember.

(Note: there is not longest open PR because of GitHub API. Unless you find a way to do it)

{% if not ONGOING %}
Placeholder values : Will be reset to 0 on Nov 1st when Closember starts.
{% endif %}

{% endmarkdown %}

<table class='c2'>
<tr>
<th>#</th>
<th>Repository</th>
<th>Closed After</th>
<th>Oldest issue closed</th>
</tr>
{% for item in other %}
<tr>
  <td>{{loop.index}} </td>
  <td ><a href='https://github.com/{{item.repo}}'>{{item.repo}}<a></td>
  <td class='green-glow' title='opened on {{item.open}} – closed on {{item.close}} – opened for {{item.delta}} '>{{item.delta|naturaldelta}}</td>
  <td ><a href='{{item.url}}'>{{item.repo}}#{{item.number}}</td>
</tr>
{% endfor %}
</table>
{% markdown %}

------

{% endmarkdown %}
  <div style='text-align:center'><a class='button' href='#add-topic'>Add Your Repositories</a></div>

{% markdown %}



Those are _suggested_ metrics, they are of course not absolute. Your community should have its own goal, though be
careful about the [Normalization of
deviance](https://en.wikibooks.org/wiki/Professionalism/Diane_Vaughan_and_the_normalization_of_deviance). You can also
suggest metrics, send us a PR, or open an issue.

{% endmarkdown %}


<h2> Show your support : {{sg_total}} Supporters </h2>

<p>Star <a href='https://github.com/openteamsinc/closember'>our repository</a> to show your support even if your own
organizations or projects don't participate <!-- Place this tag where you want the button to render. -->
<a class="github-button" href="https://github.com/openteamsinc/closember" data-icon="octicon-star" aria-label="Star
opentaemsinc/closember on GitHub">Star</a> </p>


<div class='avatar-container'>
{% for sg in top_sg %}
<a class='sg' href="{{sg.url}}"><img src={{sg.avatar}}/><div>{{sg.login}}</div></a>
{% endfor %}
</div>

{% markdown %}

----- 

<h3 id='more'>Maintainers in Open Source</h3>


[The Role of a Maintainer](http://matthewrocklin.com/blog/2019/05/18/maintainer) in  Open-Source is rarely about simply
writing more code or getting more Pull-Requests. It is about properly caring, knowing how to say "No" and thinking
about **long term sustainability**.

Having a well-setup process, not too many tasks running at the same time, can be critical for Maintainers **cognitive
load**, and **mental health**, as well as provide an **easier environment for new contributors**.

When projects have fewer open pull requests, and well curated issues that are closed when not
relevant it is easier to get timely reviews. As a result maintainers more easily avoid duplicate work, have less risk of code
conflicts, and have an easier time finding potential duplicate bugs.

Fewer tasks, and less stress also lead to **friendlier interactions**.

Therefore, we encourage contributions to Closember. Work with your favorite maintainers, on your favorite repositories
to decrease the number of opened issues and pull-requests for a _more dynamic_, better maintained, cleaner,
leaner, environment and ecosystem.

We also encourage you to avoid duplicate work by merging similar projects when relevant.


## Join us to close issues and PRs

The tables below tracks multiple metrics to help you achieve goals. There are no good, or bad metrics, but it is fun to
be able to compare.

> Please be careful about project guidelines and whether an issue should be closed,
> some projects close issues/PR that have not been commented on in a while, some others only close issues when it is
> resolved and a release has been made. If you are ever in doubt, ask.


## Zeno Paradox

... you keep closing them but new ones keep opening. This is why issues or pull-requests opened during November do not
count toward the total. This is not meant to disrupt the normal flow of work, but to encourage you to help maintainers
take care of older issues and pull-requests.


{% endmarkdown %}


<h3 id='help'>What should I do?</h3>


{% markdown %}


This is about **you** first; you need to be in a good mental state in order to help others. Personally I'll walk in circles for
about 2 hours, tidy my desk, remove extra icons for my desktop, and also try to decrease my amount of
unread emails. Like can I get under 1000? Another trick is to find a couple of things and click "unsubscribe", it can be emails, or slack
channels or un-follow people on twitter/facebook/instagram.

Once you feel great about yourself go help others. What you just did for yourself here, you can now do for the
maintainers of your favorites projects, and make those project better for everyone. 

### Maintainers: How to get ready:

 - Speak with your co-maintainers/contributors, and let them know that you are considering participation. You can send your
   community links to this page and requests help. You can organise groups that would be responsible for reviewing old
   issues and seeing if they are still relevant, and setup guidelines on how to proceed during the month of November.

 - Tag the repositories you control with the `closember` topic, they will be listed here automatically soon. If you can't or
   don't want to for some reason, we can hard-code your repository in the list (see
   https://github.com/openteamsinc/closember/issues/3). 

 - You can star our repository to show support as well.

 - You may want to consider using the GitHub "Triage" role, this will let you give users the ability to open/close issues
   without giving push rights. See [this page on GitHub docs that list permissions of each
   group](https://docs.github.com/en/organizations/managing-access-to-your-organizations-repositories/repository-permission-levels-for-an-organization)

### How can I help other?

Great question! You often do not need to know how to code to contribute to Closember! For any project you
contribute to, make sure to check their guidelines, and avoid eager closing of issues/PRs if that's not the desire of the
maintainers. The following guide is intended to be adapted to _your skills_ and _skills that can be of use for
projects_.

 - **find your favorite project**, look at an old opened issue. Can you reproduce it ? Is it still relevant? If not, leave a
   nice comment, like :
    - "I tried to reproduce this issue, but on the latest released version it does not seem to be a problem anymore".
    - "This has actually been fixed by XXXX"
    - "I think that this was an issues back in 2003, but no one uses ie6 anymore, I believe this can be closed.".

   It will be less work for the maintainers, and they'll close the issue for you.

 - You can find the list of all issues *you have opened* at https://github.com/issues, do the same as above but _you can
   close your own issues too_.

 - Head to https://github.com/pulls, this has all the pull-requests that you have submitted
   - Are they still relevant ?
   - Close them if not, think about finishing them otherwise. 
   - Maybe at least think about rebasing them and `git push --force-with-lease` to make sure the test passes on the latest
     versions.

 - Finish the Pull-Request of someone else: Many drive by contributors start pull-request but do not finish them. Maybe you can
   take over? Once your version of the code is merged suggest that the old pull-request to be closed.

<h3 id='add-topic'>How to be listed on this leader-board ?</h3>

**Add the [`closember` topic](https://github.com/topics/closember)** to your repositories. Next time the site is updated you'll be listed.

### Why is the score not changing ? 

GitHub requests are cached for a few minutes, maybe 1 maybe 10, maybe 60, depend on my mood, or how much traffic we get. 
It should update soon. But please relax. It's not a sprint, it's a marathon.

### Show me this website code

https://github.com/openteamsinc/closember – please come close issues.


### I closed all my issues / I really want to code...

Ok, fine, you want an excuse to write some code. Still you can do things the make maintainer life easier. A couple
pet peeves of mine.

  - Add Version number to your deprecation warnings, when I see a deprecation message I want to know since which version
    it is deprecated and what's the replacement without having to go dive in the docs.
  - Turn your deprecation warnings into error in your test suite, and make sure you are not using (when possible),
    deprecated functionalities.
  - Bump your minimal requirements for old libraries when you can. 
  - Knows more than one small project doing almost the same things ? Try to get maintainers to merge codebases /
    collaborate.
  - Cleanup your git stale branches, 
  - Delete forks of repositories you are not contributing to.
  - create a system-wide `.gitignore` to not add `*.un~` and `.DS_Store` to every `.gitignore` project you contribute to.

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


<div class=frame>
    <a href='https://quansight.com'><img src='assets/quansight.jpg'></a>
</div>
<div class=frame>
    <a href='https://openteams.com/'><img src='assets/openteams.webp'></a>
</div>
<div class=frame>
    <a href='https://faiross.org/'><img src='assets/faiross.png'></a>
</div>



## F.A.Q. with creator

 - Why did you create Closember ?
 - It's something I have wanted to do for some time. I regularly participate to
   [hacktoberfest](https://hacktoberfest.digitalocean.com/) both as a user and maintainer. As a maintainer it can be a
   deluge of PRs that can be tough to deal with. As a user, large number of PRs can be demotivating.
 - Can you extend on what you mean with dealing will pull-requests ?
 - Yes, even when you receive a well-meaning pull-request for a feature or bug-fix you want, those usually need some
   polishing to adapt to the code guidelines, and get tests and documentation added. Many of those contributions
   by "drive by" contributors are often unfinished, a bit like someone giving you flour, eggs, sugar, and a cake recipe
   for your birthday.
 - Can you expand on the demotivation you face as a user with many PRs? 
 - I occasionally contribute to repositories I'm not familiar with. Some of those have more than a thousand PRs opened.
   It is hard to be confident that one more PR, even perfect, will be noticed by maintainers, it's also unclear whether
   someone is already doing the work, or if my work will conflict with someone else. I often have to reach out
   personally to other maintainers – when I know them personally – to get noticed. This is definitely something which
   can be difficult for a new contributor or less privileged people.
 - Anything else ?
   Chris [pointed out](https://twitter.com/choldgraf/status/1452701624095232000) that
   [https://www.volunteeramnestyday.net/](https://www.volunteeramnestyday.net/) was also a good resource to look at.





## Comments


<!-- You can comments on this page using [utterances](https://utteranc.es/) (in progress) or directly on -->

Comments on the [Following GitHub Issue](https://github.com/openteamsinc/closember/issues/6) will appear below.

<script src="https://utteranc.es/client.js"
        repo="openteamsinc/closember"
        issue-number="6"
        theme="github-light"
        crossorigin="anonymous"
        async>
</script>



{% endmarkdown %}


</section>
<footer class='footer'>
<section class=container>
{% markdown %}
Powered by [Quart](https://pypi.org/project/Quart-Trio/), [Trio](https://trio.readthedocs.org),
[Asks](https://asks.readthedocs.io/en/latest/) and [Jinja2](https://jinja.palletsprojects.com/en/2.11.x/).
Theme from [milligram](https://milligram.io/). No JS. Hero illustration by <a href='https://twitter.com/irinafumarel'>Irina Fumarel</a>
</br>
<small>Remaining querries {{rq}} - {{NOW}}. Interested in
sponsoring ? <a href='mailto:mbussonnier@quansight.com'>email us</a></small>.
{% endmarkdown %}
<script async defer src="https://buttons.github.io/buttons.js"></script>
</section>
</footer>
</main>
</body>


</html>


