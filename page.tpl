<html>
<head>

<title>Closember 2022 by Quansight</title>
<meta name="description" content="Closember aims to increase awareness about open source maintainer burnout and promote practices to make maintaining open source less stressful and more enjoyable for everyone.">

<!-- Facebook Meta Tags -->
<meta property="og:title" content="Closember 2022 by Quansight">
<meta property="og:image" content="https://closember.org/assets/Closember_OG.png">
<meta property="og:description" content="Closember aims to increase awareness about open source maintainer burnout and promote practices to make maintaining open source less stressful and more enjoyable for everyone.">
<meta property="og:url" content="https://closember.org">

<meta name="twitter:card" content="summary_large_image" >
<meta name="twitter:title" content="Closember 2022 by Quansight">
<meta property="twitter:domain" content="closember.org">
<meta property="twitter:url" content="https://closember.org">
<meta name="twitter:description" content="Closember aims to increase awareness about open source maintainer burnout and promote practices to make maintaining open source less stressful and more enjoyable for everyone.">
<meta name="twitter:image" content="https://closember.org/assets/Closember_OG.png">


<!-- Google Fonts -->
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Roboto:300,300italic,700,700italic">

<!-- CSS Reset -->
<!--<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/normalize/8.0.1/normalize.css">-->

<!-- Milligram CSS -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/milligram/1.4.1/milligram.css">
<!--<link href="https://fonts.googleapis.com/css2?family=Nunito:wght@700&display=swap" rel="stylesheet">-->
<link href="https://fonts.googleapis.com/css2?family=Playball" rel="stylesheet">
<link href="https://fonts.cdnfonts.com/css/mj-alghifari" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/vega@5.21.0"></script>
<script src="https://cdn.jsdelivr.net/npm/vega-lite@5.2.0"></script>
<script src="https://cdn.jsdelivr.net/npm/vega-embed@6.20.2"></script>

<!-- Place this tag in your head or just before your close body tag. -->

<!-- Custom page styles -->
<style>
{% include 'style.css' %}
</style>

</head>

<body>
  <main class="wrapper">

    <nav class="navigation" id="nav">
      <div class="nav">
        <a href="#why-closember">Why&nbsp;Closember?</a>
        <span class="nav-divide">||</span>
        <a href="#how-to-participate">How&nbsp;to&nbsp;Participate</a>
        <span class="nav-divide">||</span>
        <a href="#for-maintainers">For&nbsp;Maintainers</a>
        <span class="nav-divide">||</span>
        <a href="#closeboards">Closeboards</a>
        <span class="nav-divide">||</span>
        <a href="#show-your-support">Show&nbsp;Your&nbsp;Support</a>
      </div>
    </nav>

    <header class="header" id="home"><section class="container">
      <div class="hero" id="hero">  {{svg|safe}}  </div>
      <h2>Closember 2022 Is Here</h2>

      <h3><em>
        Hacktoberfest has officially ended—let’s start closing some issues
        while supporting open source maintainers
      </em></h3>

      <p style="text-align: center;">
        Closember is a month-long initiative for maintainers, contributors, and open source enthusiasts run by <a href="https://quansight.com" target="_blank">Quansight</a>,
        <a href="https://openteams.com" target="_blank">OpenTeams</a>, and
        <a href="https://faiross.org" target="_blank">FairOSS</a>.
        The goal of Closember is to encourage better and healthier open source community practices while raising awareness about maintainer burnout.
      </p>

      <p>&nbsp;</p>

    </section></header>

    <h2 id="why-closember">Why Closember?</h2>

    <p>
      Closember was created as a companion to Hacktoberfest, an annual event that encourages contributions to open source projects, especially by newer contributors.
    </p>
    <p>
      A big motivation for Closember was in response to the unexpected consequences downstream of early Hacktoberfests, where mostly well-meaning, but inexperienced contributors overloaded projects with low-quality GitHub pull requests (PRs) in order to get swag and rewards. The result was massive amounts of extra work for project maintainers to clean up in the aftermath.
    </p>
    <p>
      Closember emphasizes that participating in open source is a two-way street between maintainers and contributors. Maintaining projects requires significant time and effort, and that work needs to be noticed, valued, and validated. However, best practices for project maintenance and maintainer self-care aren’t always obvious. Closember raises awareness of this in order to support the community as a whole.
    </p>

    <div class="back-to-top">
      <a href="#nav">(back to top)</a>
    </div>

    <h2 id="how-to-participate">How to Participate</h2>

    <p>
      Get ready to choose your own Closember adventure—there’s no one way to participate.
    </p>
    <p>
      If you’ve never used GitHub before, your first step is going to be
      <a href="https://github.com/signup" target="_blank">signing up for a free account</a>. While there are other collaborative <a href="https://git-scm.com/" target="_blank">git</a>-based development services out there—<a href="https://gitlab.com" target="_blank">GitLab</a> and <a href="https://bitbucket.org/" target="_blank">Atlassian Bitbucket</a> are two of the most popular—Closember is centered on GitHub.
    </p>
    <p>
      If you’ve opened issues or PRs on projects in the past, you can start by taking a look at your own GitHub <a href="https://github.com/issues" target="_blank">issues</a> and <a href="https://github.com/pulls" target="_blank">PRs</a> to see if any of them are outdated or have already been fixed. After that, start browsing projects! Take a look at your favorite projects and see if they’ve been tagged with <code>closember</code>, or browse the <a href="https://github.com/topics/closember" target="_blank">list of <code>closember</code> projects</a>.
    </p>
    <p>
      Once you’ve picked a project, engage! Check out the project’s repository to see if they’ve posted instructions for the help they’re looking for during Closember—if they have, follow them.
    </p>
    <p>
      If not, then browse their issues and PRs to see if any are stale or need action from their creator, and comment on them to start the conversation again. Sometimes, discussion will happen and move the issue/PR forward. Other times, no one will respond, and then you can recommend to the project maintainers that it can be closed.
    </p>
    <p>
      If you’re familiar with contribution workflows, continuous integration, bots, or other tools to improve project maintainability, create an issue and ask the project maintainers if they’d be interested in this sort of contribution.
    </p>
    <p>
      To stay in the loop throughout Closember, follow <a href="https://twitter.com/ClosemberDev" target="_blank">@ClosemberDev</a> & use the <a href="https://twitter.com/hashtag/closember" target="_blank">#Closember</a> hashtag on Twitter, and watch the <a href="https://github.com/openteamsinc/closember/issues" target="_blank">Closember repo</a> on GitHub:
    </p>

    <div style="text-align: center;">
      <img src="assets/watch_repo.png" width="70%"><br /><br />
    </div>

    <div class="back-to-top">
      <a href="#nav">(back to top)</a>
    </div>

    <h2 id="for-maintainers">For Maintainers: How to Get Ready</h2>

    <p>
      All right, maintainers—so you have a project that could use some maintainability help, and you’d like to get in on the Closember action. What should you do to get ready?
    </p>
    <p>
      Well, first of all, keep in mind that the most fundamental point of Closember is maintainer health and well-being. So, take care of yourself first, whatever that means ... diet, exercise, sleep, relaxation ... only you know what you need. Another thing to consider is that working with Closember contributions <em>will</em> involve extra time and effort on your part. So, even if your project could use some help, the best thing for you <em>might</em> be not to participate!
    </p>
    <p>
      If you decide to jump in, though, the biggest thing you need to do before tagging your repo with <code>closember</code> is to decide what kind of help you want: triaging, infrastructure, automation, project restructuring/refactoring…. There are lots of possibilities! Take stock of your project and identify one or two (or more!) areas where it would most benefit from some maintenance help.
    </p>
    <p>
      Then, edit your README to let Closember visitors know what sort of help you’re looking for, tag your repo with <code>closember</code>, and engage with the community as they come by! You could even take some extra time and triage/close a few issues or PRs yourself, if the mood strikes.
    </p>

    <div class="back-to-top">
      <a href="#nav">(back to top)</a>
    </div>

    <h2 id="closeboards">Closeboards</h2>

    <p>
      As we’ve described above, Closember is mainly about the health of open source maintainers and projects. So, while we’ve defined some Closember success metrics for ourselves, these metrics aren’t the be-all and end-all. Each open source community and project can have its own goals and metrics, which fit its size, philosophy, etc.—part of the fun and purpose of Closember is the discussion around what it means for a community to be ‘healthy.’ For example, you have to be aware of the possibility for ‘<a href="https://en.wikipedia.org/wiki/Normalization_of_deviance" target="_blank">normalization of deviance</a>’, where even though a practice is accepted, it’s still unhealthy.
    </p>
    <p>
      The metrics we’re calculating here are focused on closing old issues and PRs, since that’s something that’s pretty easy to quantify. Again, there are no objectively good or bad metrics—these are merely the ones we’ve chosen to present. Our metrics are calculated for each participating repository, and are:
    </p>
    <ol>
      <li>Total issues closed during Closember, which were opened before Closember</li>
      <li>Total issues opened before Closember, which are not yet closed</li>
      <li>Overall oldest issues closed during Closember</li>
    </ol>
    <blockquote>
      <em>Remember, remember, to close a PR in November.</em> <br />
      <br />
      &mdash; A Maintainer
    </blockquote>
    <p>
      To the numbers!
    </p>
    <p>
      Overall, of the <span class="gray-glow">{{ total_closed + to_go }}</span> issues and PRs open as of the start of Closember, <span class="green-glow">{{total_closed}}</span> have been closed and <span class="red-glow">{{to_go}}</span> are still open.
    </p>

    <h3 id="closed-issues-prs">Closed Issues/PRs</h3>

    <p style="font-style: italic">
      Participating repos with the most pre-Closember issues & PRs that have been closed during Closember.
    </p>

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
        <td><a href='https://github.com/{{e}}'>{{e}}<a></td>
        <td class='green-glow'>{{v.get("Issue", 0)}}</td>
        <td class='green-glow'>{{v.get("PullRequest", 0)}}</td>
      </tr>
    {% endfor %}
    </table>

    <h3 id="open-issues-prs">Open Issues/PRs</h3>

    <p style="font-style: italic">
      Participating repos with the least remaining pre-Closember issues & PRs still open.
    </p>

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
          <td><a href='https://github.com/{{e}}'>{{e}}<a></td>
          <td class='red-glow'>{{v.get("Issue", 0)}}</td>
          <td class='red-glow'>{{v.get("PullRequest", 0)}}</td>
        </tr>
      {% endfor %}
    </table>

    <h3 id="oldest-closed-issue">Oldest Closed Issues</h3>

    <p style="font-style: italic">
      Participating repos with the oldest issues closed during Closember.
    </p>

    <p style="font-size: smaller;">
      Note: Data for the oldest closed PR isn't reported here because it doesn't appear to be available in the GitHub API. If you figure out a way to get at this data, please <a href="https://github.com/openteamsinc/closember/issues/new">let us know</a>!

      {% if other|length < 1 %}
        (Also, this table is currently empty because there's no data yet!)
      {% endif %}
    </p>

    <table class='c2'>
      <tr>
        <th>#</th>
        <th>Repository</th>
        <th>Closed After</th>
        <th>Oldest issue closed</th>
      </tr>
      {% if other|length < 1 %}
        <tr>
          <td>&ndash;</td>
          <td>&ndash;</td>
          <td>&ndash;</td>
          <td>&ndash;</td>
        </tr>
      {% else %}
        {% for item in other %}
          <tr>
            <td>{{loop.index}} </td>
            <td><a href='https://github.com/{{item.repo}}'>{{item.repo}}<a></td>
            <td class='green-glow' title='opened on {{item.open}} – closed on {{item.close}} – opened for {{item.delta}} '>{{item.delta|naturaldelta}}</td>
            <td><a href='{{item.url}}'>{{item.repo}}#{{item.number}}</td>
          </tr>
        {% endfor %}
      {% endif %}
    </table>

    <h2 id="show-your-support">Show Your Support</h2>

    <p>
      In addition to engaging with your favorite open source projects, support Closember by starring our <a href="https://github.com/openteamsinc/closember" target="_blank">repo</a>! Right now we have {{ sg_total }} Github stargazers:
    </p>

    <div class='avatar-container'>
      {% for sg in top_sg %}
        <a class='sg' href="{{sg.url}}"><img width="50px", height='50px' src="{{sg.avatar}}" /><div>{{sg.login}}</div></a>
      {% endfor %}
    </div>

    <p>&nbsp;</p>

    <p>
      If you're interested in partnering with us in support of Closember, please <a href="mailto:connect@quansight.com">email us.</a> Closember is currently sponsored by <a href="https://quansight.com" target="_blank">Quansight</a>, <a href="https://openteams.com" target="_blank">OpenTeams</a>, and <a href="https://faiross.org" target="_blank">FairOSS</a>.
    </p>

    <div class="sponsor-table">
      <a href='https://quansight.com'><img src='assets/quansight.jpg' alt="Quansight Logo" width="200" height="200"></a>

      <a href='https://openteams.com/'><img src='assets/openteams.webp' alt="OpenTeams logo" width="307" height="175"></a>

      <a href='https://faiross.org/'><img src='assets/faiross.png' alt="FairOSS logo" width="247" height="150"></a>
    </div>


    <footer class="footer"><section class="container">

    <div style="text-align: center;"><strong>Footer</strong></div>

    <script async defer src="https://buttons.github.io/buttons.js"></script>
    </section></footer>


  </main>
</body>
</html>