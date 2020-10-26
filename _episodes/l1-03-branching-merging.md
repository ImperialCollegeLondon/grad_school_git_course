---
title: "Branching and Merging"
teaching: 40
exercises: 20
questions:
- How can I or my team work on multiple features in parallel?
- How can changes from parallel tracks of work be combined?
objectives:
- Explain what git branches are and when they should be used
- Use a branch to develop a new feature and incorporate it into your code
- Identify the branches in a project and which branch is currently in use
- Describe a scalable workflow for development with git
keypoints:
- Git allows non-linear commit histories called branches
- A branch can be thought of as a label that applies to set of commits
- Branches can and should be used to carry out development of new features
- Branches in a project can be listed with git branch and created with git branch branch_name
- The HEAD refers to the current position of the project in its commit history
- The current branch can be changed using git checkout branch_name
- Once a branch is complete the changes made can be integrated into the project using git merge branch_name
- Merging creates a new commit in the target branch incorporating all of the changes made in a branch
- Conflicts arise when two branches contain incompatible sets of changes and must be resolved before a merge can complete
- Identify the details of merge conflicts using git diff and/or git status
- A merge conflict can be resolved by manual editing followed by git add [conflicted file]... and git commit -m "commit_message"
---

## Motivation for branches

In the previous section we tracked a guacamole recipe with Git.

Up until now our repository had only one branch with one commit coming after the
other:

![Linear]({{ site.baseurl }}/fig/branch1.png "Linear git
repository"){:class="img-responsive"}

* Commits are depicted here as little boxes with abbreviated hashes.
* Here the branch `master` points to a commit.
* "HEAD" is the current position (remember the recording head of tape
  recorders?).
* When we talk about branches, we often mean all parent commits, not only the
  commit pointed to.

### Now we want to do this:

<div style="border:2px solid #000000;"> <img src="{{ site.baseurl
  }}/fig/octopus.jpeg" width="60%"> <br> Source: <a
  href="https://twitter.com/jay_gee/status/703360688618536960">https://twitter.com/jay_gee/status/703360688618536960</a>
  </div>

Software development is often not linear:

* We typically need at least one version of the code to "work" (to compile, to
  give expected results, ...).
* At the same time we work on new features, often several features concurrently.
  Often they are unfinished.
* We need to be able to separate different lines of work really well.

The strength of version control is that it permits the researcher to **isolate
different tracks of work**, which can later be merged to create a composite
version that contains all changes:

![Git collaborative]({{ site.baseurl }}/fig/branching_full_example.png "Example
of commit history wit multiple branches and merges"){:class="img-responsive"}

* We see branching points and merging points.
* Main line development is often called `master`.
* Other than this convention there is nothing special about `master`, it is just
  a branch.
* Commits form a directed acyclic graph (arrows point from parent commits to
  child commits).
* Commits are **relative** to the preceding (parent) commit. Whilst we
  previously talked about Git taking "snapshots" of your project this is
  slightly misleading. Git actually records *the changes made since the last
  commit*. The difference is subtle but powerful, it makes commands like `git
  revert` possible.

A group of commits that create a single narrative are called a **branch**.
There are different branching strategies, but it is useful to think that a
branch tells the story of a feature, e.g. "fast sequence extraction" or "Python
interface" or "fixing bug in matrix inversion algorithm".

### Which Branch Are We Using?

To see where we are (where HEAD points to) use `git branch`:
~~~
$ git branch
~~~
{: .commands}
~~~
* master
~~~
{: .output}

* This command shows where we are, it does not create a branch.
* There is only `master` and we are on `master` (star represents the `HEAD`).

In the following we will learn how to create branches, how to switch between
them and how to merge changes from different branches.

---

> ## A useful alias
>
> We will now define an *alias* in Git, to be able to nicely visualize branch
> structure in the terminal without having to remember a long Git command
> (more details about aliases are given
> [in a later section]({{ site.baseurl }}/11-aliases)):
>
> ```shell
> $ git config --global alias.graph "log --all --graph --decorate --oneline"
> ```
{: .callout}

## Creating and Working with Branches

Firstly lets take stock of the current state of our repository:
~~~
$ git graph
~~~
{: .commands}
~~~
* ddef60e (HEAD -> master) Revert "Added instruction to enjoy"
* 8bfd0ff Added 1/2 onion to ingredients
* 2bf7ece Added instruction to enjoy
* ae3255a Adding ingredients and instructions
~~~
{: .output}

We have four commits and you can see that we are working on the master branch
from `HEAD -> master` next to the most recent commit. This can be represented
diagrammatically:

![Git collaborative]({{ site.baseurl }}/fig/branch1.png
"Repository before branching"){:class="img-responsive"}

Let's create a branch called `experiment` where we try out adding some
coriander to `ingredients.md`.

~~~
$ git branch experiment
$ git graph
~~~
{: .commands}
~~~
* ddef60e (HEAD -> master, experiment) Revert "Added instruction to enjoy"
* 8bfd0ff Added 1/2 onion to ingredients
* 2bf7ece Added instruction to enjoy
* ae3255a Adding ingredients and instructions
~~~
{: .output}

Notice that the name of our new branch has appeared next to latest commit. HEAD
is still pointing master however denoting that we have created a new branch but
we're not using it yet. This looks like:

![Git collaborative]({{ site.baseurl }}/fig/branch2.png
"Repository after experiment branch creation"){:class="img-responsive"}

To start using the new branch we need to check it out:
~~~
$ git checkout experiment
$ git graph
~~~
{: .commands}
~~~
* ddef60e (HEAD -> experiment, master) Revert "Added instruction to enjoy"
* 8bfd0ff Added 1/2 onion to ingredients
* 2bf7ece Added instruction to enjoy
* ae3255a Adding ingredients and instructions
~~~
{: .output}

Now we see `HEAD -> experiment` next to the top commit indicating that we are
now working with, and any commits we make will be part of the `experiment`
branch. As shown before which branch is currently checkout out can be confirmed
with `git branch`.

![Git collaborative]({{ site.baseurl }}/fig/branch3.png
"Repository with HEAD at new experiment branch"){:class="img-responsive"}

Now when we make new commits they will be part of the `experiment` branch. To
test this let's add 2 tbsp coriander to `ingredients.md`. Stage this and commit
it with the message "try with some coriander".

~~~
$ git add ingredients.md
$ git commit -m "try with some coriander"
$ git graph
~~~
{: .commands}
~~~
* 96fe069 (HEAD -> experiment) try with some coriander
* ddef60e (master) Revert "Added instruction to enjoy"
* 8bfd0ff Added 1/2 onion to ingredients
* 2bf7ece Added instruction to enjoy
* ae3255a Adding ingredients and instructions
~~~
{: .output}


![Git collaborative]({{ site.baseurl }}/fig/branch4.png
"Repository with one commit on experiment branch"){:class="img-responsive"}

Note that the master branch is unchanged whilst a new commit (labelled `e1`) has
been created as part of the experiment branch. 

As mentioned previously, one of the advantages of using branches is working on
different features in parallel. You may have already spotted the typo in
`ingredients.md` but let's say that we've only just seen it in the midst of
our work on the `experiment` branch. We could correct the typo with a new commit
in `experiment` but it doesn't fit in very well here - if we decide to discard
our experiment then we also lose the correction. Instead it makes much more
sense to create a correcting commit in `master`:

~~~
$ git checkout master
$ # make change to ingredients.md
$ git add ingredients.md
$ git commit -m "Corrected typo in ingredients.md"
$ git graph
~~~
{: .commands}
~~~
* d4ca89f (HEAD -> master) Corrected typo in ingredients.md
| * 96fe069 (experiment) try with some coriander
|/  
* ddef60e Revert "Added instruction to enjoy"
* 8bfd0ff Added 1/2 onion to ingredients
* 2bf7ece Added instruction to enjoy
* ae3255a Adding ingredients and instructions
~~~
{: .output}
![Git collaborative]({{ site.baseurl }}/fig/branch5.png
"Repository with one commit on master and experiment branches"){:class="img-responsive"}

## Merging

Now that we have our two separate tracks of work they need to be combined back
together. We should already have the `master` branch checked out (double check
with `git branch`). The below command can then be used to perform the merge.
~~~
$ git merge --no-edit experiment
~~~
{: .commands}
~~~
Merge made by the 'recursive' strategy.
 ingredients.md | 1 +
 1 file changed, 1 insertion(+)
~~~
{: .output}

now use:
~~~
$ git graph
~~~
{: .commands}
~~~
*   40070a5 (HEAD -> master) Merge branch 'experiment'
|\
| * 96fe069 (experiment) try with some coriander
* | d4ca89f Corrected typo in ingredients.md
|/
* ddef60e Revert "Added instruction to enjoy"
* 8bfd0ff Added 1/2 onion to ingredients
* 2bf7ece Added instruction to enjoy
* ae3255a Adding ingredients and instructions
~~~
{: .output}

![Git collaborative]({{ site.baseurl }}/fig/branch6.png
"Repository with first merge"){:class="img-responsive"}

Merging creates a new commit in whichever branch is being **merged into** that
contains the combined changes from both branches. The commit has been
highlighted in a separate colour above but it is the same as every commit we've
seen so far except that it has two parent commits. Git is pretty clever at
combining the changes automatically, combining the two edits made to the same
file for instance. Note that the experiment branch is still present in the
repository.

> ## Now you try
> 
> As the experiment branch is still present there is no reason further commits
> can't be added to it. Create a new commit in the `experiment` branch adjusting
> the amount of coriander in the recipe. Then merge `experiment` into `master`.
> You should end up with a repository history matching: ![Git
> collaborative]({{ site.baseurl }}/fig/branch7.png "Repository with second
> merge"){:class="img-responsive"}
>
> > ## Solution
> >
> > ~~~
> > $ git checkout experiment
> > $ # make changes to ingredients.md
> > $ git add ingredients.md
> > $ git commit -m "Reduced the amount of coriander"
> > $ git checkout master
> > $ git merge --no-edit experiment
> > $ git graph
> > ~~~
> > {: .commands}
> > ~~~
> > *   567307e (HEAD -> master) Merge branch 'experiment'
> > |\
> > | * 9a4b298 (experiment) Reduced the amount of coriander
> > * |   40070a5 Merge branch 'experiment'
> > |\ \
> > | |/
> > | * 96fe069 try with some coriander
> > * | d4ca89f Corrected typo in ingredients.md
> > |/
> > * ddef60e Revert "Added instruction to enjoy"
> > * 8bfd0ff Added 1/2 onion to ingredients
> > * 2bf7ece Added instruction to enjoy
> > * ae3255a Adding ingredients and instructions
> > ~~~
> > {: .output}
> {: .solution}
{: .challenge}

## Conflicts

Whilst Git is good at automatic merges it is inevitable that situations arise
where incompatible sets of changes need to be combined. In this case it is up to
you to decide what should be kept and what should be discarded. First lets set
up a conflict:
~~~
$ git checkout master
$ # change line to 1 tsp salt in ingredients.md
$ git add ingredients.md
$ git commit -m "Reduce salt"
$ git checkout experiment
$ # change line to 3 tsp in ingredients.md
$ git add ingredients.md
$ git commit -m "Added salt to balance coriander"
$ git graph
~~~
{: .commands}
~~~
* d5fb141 (HEAD -> experiment) Added salt to balance coriander
| * 7477632 (master) reduce salt
| *   567307e Merge branch 'experiment'
| |\  
| |/  
|/|   
* | 9a4b298 Reduced the amount of coriander
| *   40070a5 Merge branch 'experiment'
| |\  
| |/  
|/|   
* | 96fe069 try with some coriander
| * d4ca89f Corrected typo in ingredients.md
|/  
* ddef60e Revert "Added instruction to enjoy"
* 8bfd0ff Added 1/2 onion to ingredients
* 2bf7ece Added instruction to enjoy
* ae3255a Adding ingredients and instructions
~~~
{: .output}

![Git collaborative]({{ site.baseurl }}/fig/branch8.png
"Repository with merge conflict"){:class="img-responsive"}

Now we try and merge `experiment` into `master`:
~~~
$ git checkout master
$ git merge --no-edit experiment 
~~~
{: .commands}
~~~
Auto-merging ingredients.md
CONFLICT (content): Merge conflict in ingredients.md
Automatic merge failed; fix conflicts and then commit the result.
~~~
{: .output}

As suspected we are warned that the merge failed. This puts Git into a special
state in which the merge is in progress but has not been finalised by creating a
new commit in master. Fortunately `git status` is quite useful here:
~~~
$ git status
~~~
{: .commands}
~~~
On branch master
You have unmerged paths.
  (fix conflicts and run "git commit")
  (use "git merge --abort" to abort the merge)

Unmerged paths:
  (use "git add <file>..." to mark resolution)
	both modified:   ingredients.md

no changes added to commit (use "git add" and/or "git commit -a")
~~~

This suggests how we can get out of this state. If we want to give up on this
merge and try it again later then we can use `git merge --abort.`. This will
return the repository to its pre-merge state. We will likely have to deal with
the conflict at some point though so may as well do it now. Fortunately we don't
need any new commands. We just need to edit the conflicted file into the state
we would like to keep, then add and commit as usual.

Let's look at ingredients.md to understand the conflict:
~~~
* 2 avocados
* 1 lime
<<<<<<< HEAD
* 1 tsp salt
=======
* 3 tsp salt
>>>>>>> experiment
* 1/2 onion
* 1 tbsp coriander
~~~

Git has changed this file for us and added some lines which highlight the
location of the conflict. This may be confusing at first glance (a good editor
may add some highlighting which can help), but you are essentially being asked
to choose between the two versions presented. The tags `<<<<<<< HEAD` and
`>>>>>>> experiment` are used to indicate which branch each version came from
(HEAD here corresponds to `master` as that is our checked out branch). 

The conflict makes sense, we can either have 1 tsp of salt or 3. There is no way
for Git to know which it should be so it has to ask you. Let's resolve it by
choosing the version from the master branch. Edit `ingredients.md` so it looks
like:
~~~
* 2 avocados
* 1 lime
* 1 tsp salt
* 1/2 onion
* 1 tbsp coriander
~~~

now stage, commit and check the result:
~~~
$ git add ingredients.md
$ git commit -m "Merged experiment into master"
$ git graph
~~~
{: .commands}
~~~
*   e361d2b (HEAD -> master) Merged experiment into master
|\  
| * d5fb141 (experiment) Added salt to balance coriander
* | 7477632 reduce salt
* |   567307e Merge branch 'experiment'
|\ \  
| |/  
| * 9a4b298 Reduced the amount of coriander
* |   40070a5 Merge branch 'experiment'
|\ \  
| |/  
| * 96fe069 try with some coriander
* | d4ca89f Corrected typo in ingredients.md
|/  
* ddef60e Revert "Added instruction to enjoy"
* 8bfd0ff Added 1/2 onion to ingredients
* 2bf7ece Added instruction to enjoy
* ae3255a Adding ingredients and instructions
~~~
{: .output}

![Git collaborative]({{ site.baseurl }}/fig/branch9.png
"Repository with third merge"){:class="img-responsive"}

## Summary

Let us pause for a moment and recapitulate what we have just learned:

```shell
$ git branch               # see where we are
$ git branch <name>        # create branch <name>
$ git checkout <name>      # switch to branch <name>
$ git merge <name>         # merge branch <name> (to current branch)
```

Since the following command combo is so frequent:

```shell
$ git branch <name>        # create branch <name>
$ git checkout <name>      # switch to branch <name>
```

There is a shortcut for it:

```shell
$ git checkout -b <name>   # create branch <name> and switch to it
```

### Typical workflow

These commands can be used in a typical workflow that looks like the below:
```shell
$ git checkout -b new-feature  # create branch, switch to it
$ git commit                   # work, work, work, ...
                               # test
                               # feature is ready
$ git checkout master          # switch to master
$ git merge new-feature        # merge work to master
$ git branch -d new-feature    # remove branch
```

{% include links.md %}
