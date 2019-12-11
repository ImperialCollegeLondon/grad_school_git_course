# Contributing

We are very interested in receiving feedback on these materials, particularly
from anybody who has attended the course.

## How to Contribute

The easiest way to get started is to file an issue to tell us about a spelling
mistake, some awkward wording, or a factual error.

1.  If you have a [GitHub][github] account, or are willing to [create
    one][github-join], but do not know how to use Git, you can report problems
    or suggest improvements by [creating an issue][issues].  This allows us to
    assign the item to someone and to respond to it in a threaded discussion.

2.  If you are comfortable with Git, and would like to add or change material,
    you can submit a pull request (PR).  Instructions for doing this are
    [included below](#using-github).

## Where to Contribute

1.  If you wish to change this lesson,
    please work in <https://github.com/ImperialCollegeLondon/grad_school_git_course>,
    which can be viewed at <https://imperialcollegelondon.github.io/grad_school_git_course>.

## What to Contribute

There are many ways to contribute, from writing new exercises and improving
existing ones to updating or filling in the documentation and submitting [bug
reports][issues] about things that don't work, aren't clear, or are missing.  If
you are looking for ideas, please see the 'Issues' tab for a list of issues
associated with this repository.

Comments on issues and reviews of pull requests are just as welcome: we are
smarter together than we are on our own.  Reviews from novices and newcomers are
particularly valuable: it's easy for people who have been using these lessons
for a while to forget how impenetrable some of this material can be, so fresh
eyes are always welcome.

## What *Not* to Contribute

Our lessons already contain more material than we can cover in a typical
workshop, so we are usually *not* looking for more concepts or tools to add to
them.  As a rule, if you want to introduce a new idea, you must (a) estimate how
long it will take to teach and (b) explain what you would take out to make room
for it.  The first encourages contributors to be honest about requirements; the
second, to think hard about priorities.

We are also not looking for exercises or other material that only run on one
platform. Our workshops typically contain a mixture of Windows, macOS, and Linux
users; in order to be usable, our lessons must run equally well on all three.

## Using GitHub

If you choose to contribute via GitHub, you may want to look at [How to
Contribute to an Open Source Project on GitHub][how-contribute].  To manage
changes, we follow [GitHub flow][github-flow].  Each lesson has two maintainers
who review issues and pull requests or encourage others to do so.  The
maintainers are community volunteers and have final say over what gets merged
into the lesson.  To use the web interface for contributing to a lesson:

1.  Fork the originating repository to your GitHub profile.
2.  Within your version of the forked repository, move to the `gh-pages` branch
    and create a new branch for each significant change being made.
3.  Navigate to the file(s) you wish to change within the new branches and make
    revisions as required.
4.  Commit all changed files within the appropriate branches.
5.  Create individual pull requests from each of your changed branches
    to the `gh-pages` branch within the originating repository.
6.  If you receive feedback, make changes using your issue-specific branches of
    the forked repository and the pull requests will update automatically.
7.  Repeat as needed until all feedback has been addressed.

When starting work, please make sure your clone of the originating `gh-pages`
branch is up-to-date before creating your own revision-specific branch(es) from
there.  Additionally, please only work from your newly-created branch(es) and
*not* your clone of the originating `gh-pages` branch.  Lastly, published copies
of all the lessons are available in the `gh-pages` branch of the originating
repository for reference while revising.

[github]: https://github.com
[github-flow]: https://guides.github.com/introduction/flow/
[github-join]: https://github.com/join
[how-contribute]: https://egghead.io/series/how-to-contribute-to-an-open-source-project-on-github
[issues]: https://guides.github.com/features/issues/
