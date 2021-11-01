---
title: "Committing and History"
teaching: 30
exercises: 20
questions:
- How do I start a project using Git?
- How do I record changes made in a project?
- How do I view the history of a project?
- How can I correct mistakes I make with Git?
objectives:
- Explain how and why Git must be configured
- Explain what a repository is
- List the commands used to create a Git commit
- Describe the difference between the working directory, staging area and index
- Use a commit history to find information about a repository
- List the commands that can be used to undo previous commits
- Explain potential issues with rewriting the commit history
keypoints:
- Setup Git with your details using git config --global user.name "FIRST_NAME LAST_NAME" and git config --global user.email "email@example.com"
- A git repository is the record of the history of a project and can be created with git init
- Git records changes to files as commits
- Git must be explicitly told which changes to include as part of commit (known as staging changes) with git add [file]...
- Staged changes can be stored in a commit with git commit -m "commit message"
- You can check which files have been changed and/or staged with git status
- You can see the full changes made to files with git diff for unstaged files and git diff --cached
- The commit history of a repository can be checked with git log
- The command git revert commit_ref creates a new commit which undoes the changes of the specified commit
- The command git reset --soft HEAD^ removes the previous commit from the history
---

## First Things First

You should have already completed the [setup instructions](../setup) for this
workshop and have Git installed. Launch a command line environment (in Windows
launch "Git Bash" from the Start Menu, on Linux or Mac start a new Terminal). We
will use this command line interface throughout these materials. We focus on
teaching Git with the command line as we believe this is the most thorough and
portable way to communicate the underlying concepts. 

You can use the command line to interact with Git but there is still some extra
information you must provide before it is ready to use. Enter the below commands
using your relevant personal information as required (don't type the `$`).

~~~
$ git config --global user.name "FIRST_NAME LAST_NAME"
$ git config --global user.email "email@example.com"
~~~
{: .commands}

The information provided here will be included with every snapshot you record
with Git. In collaborative projects this is used to distinguish who has made
what changes. The `--global` part of the command sets this information for
any projects on which you might work on this computer. Therefore you only need
to perform the above commands once for each new computer Git is installed on.

> ## The Command Line Interface
> 
> For users not generally familiar with using command line interfaces its worth
> taking a moment to consider the commands that were just run. To understand
> what we just did lets break down the first command:
> 1. `git`
>   * This simply indicates to the command line that we want to something with
>     Git.
>   * All commands that we use today will start with this.
> 2. `config`
>   * Git is a very powerful tool with lots of functionality so next we need to
>     indicate what we want to do with it.
>   * Putting `config` indicates we want to change something about how Git
>     is configured.
> 3. `--global`
>   * Parts that start with dashes are called flags and are used to fine tune
>     the behaviour of the command given.
>   * The role of the `--global` flag is explained above.
> 4. `user.name "FIRST_NAME LAST_NAME"`
>   * Finally we tell Git what we want to configure and the details to use.
{: .callout}

## Creating a Repository

Now that Git is ready to use lets see how to start using it with a new
project. In Git terminology a project is called a repository (frequently
shortened to repo). 

For this workshop you were provided with a [zip file](../code/recipe.zip). If
you have not already, please download it and **place it in your home
directory**. The zip file contains a directory called `recipe` which in turn
contains 2 files - `instructions.md` and `ingredients.md`. This is the project
we'll be working with, whilst not based on code this recipe for guacamole is an
intuitive example to illustrate the functionality of Git. To extract the archive run the below command:
~~~
$ unzip recipe.zip
~~~
{: .commands}

Then change the working directory of the terminal the newly created `recipe`
directory:
~~~
$ cd recipe
~~~
{: .commands}

You'll need to repeat `cd recipe` if you open a new command line interface. Feel
free to open `ingredients.md` and `instructions.md` and take a look at them (use
a normal file browser if you're not comfortable doing this on the command
line). Files with a `.md` extension are using a format called Markdown, don't
worry about this now, for our immediate purposes these are just text files. Use
of Markdown and Github will come up in the next session however.

To start using Git with our recipe we need to create a repository for it. Make
sure the current working directory for your terminal is `recipe` and run:
~~~
$ git init
~~~
{: .commands}
~~~
Initialized empty Git repository in /home/username/recipe/.git/
~~~
{: .output}

The path you see in the output will vary depending on your operating system.

## Creating The First Snapshot

Before we do anything else run the below:
~~~
$ git status
~~~
{: .commands}
~~~
On branch master

No commits yet

Untracked files:
  (use "git add <file>..." to include in what will be committed)

	ingredients.md
	instructions.md

nothing added to commit but untracked files present (use "git add" to track)
~~~
{: .output}
This is a very useful command that we will use a lot. It should be your first
point of call to figure out the current state of a repository and often suggests
commands that can be used for different tasks.

Don't worry about all the output for now, the important bit is that the 2 files
we already have are untracked in the repository (directory). We want to **add
the files** to the list of files tracked by Git. Git does not track any files
automatically and you need make a conscious decision to add a file. Let's do
what Git hints at:

~~~
$ git add ingredients.md
$ git add instructions.md
$ git status
~~~
{: .commands}

~~~
On branch master

No commits yet

Changes to be committed:
  (use "git rm --cached <file>..." to unstage)

	new file:   ingredients.md
	new file:   instructions.md
~~~
{: .output}

Now this change is ***staged*** and ready to be committed (note that we could
have saved some typing here with the command `git add ingredients.md
instructions.md`).

Let us now commit the change to the repository:

~~~
$ git commit -m "adding ingredients and instructions"

[master (root-commit) aa243ea] adding ingredients and instructions
 2 files changed, 8 insertions(+)
 create mode 100644 ingredients.md
 create mode 100644 instructions.md
~~~
{: .commands}

We have now finished creating the first snapshot in the repository. Named after
the command we just used, a snapshot is usually referred to in Git as a
**commit**, or sometimes a **changeset**. We will use the term commit from now
on. Straight away query the status to get this useful command into our muscle
memory:

~~~
$ git status
~~~
{: .commands}
~~~
On branch master
nothing to commit, working tree clean
~~~
{: .output}

The output we get now is very minimal. This highlights an important point about
the status command - it's purpose is to report on changes in the repository
**relative to the last commit**. In order to see the commits made in a project
we can use:

~~~
$ git log
~~~
{: .commands}
~~~
commit b7cd5f6ff57968a7782ff8e74cc9921cc7463c30 (HEAD -> master)
Author: Christopher Cave-Ayland <c.cave-ayland@imperial.ac.uk>
Date:   Mon Dec 30 12:51:04 2019 +0000

    adding ingredients and instructions
~~~
{: .output}

We'll talk in more detail about the output here but for now the main point is to
recognise that a commit has been created with your personal information and
the message you specified.

## Staging and Committing

For our first commit we saw that this is a two step process - first we use `git
add` then `git commit`. This is an important pattern used by Git. To understand
this in more detail it's useful to know that git has three 'areas'.

* The Working Directory (or Working Tree)
  * This is the copy of the files that you actually work with in a normal way.
* The Staging Area (or index)
  * When you run `git add` a copy of a file is taken from the working tree and
    placed here.
  * New (untracked) files must be added to the staging area before git will
    track them.
  * If a tracked file has been changed it must be added to staging area for that
    change to be included in a commit.
  * This is known as **staging files** or **adding them to the staging area**.
  * Only files in the staging area are included in a commit.
* The Repository
  * When you run `git commit` a new commit is created in the repository.
  * All files in the staging area are moved to the repository as part of the new commit.

The relationship between the commands we've seen so far and the different areas
of Git are show below:
![Linear]({{ site.baseurl }}/fig/git_areas.png "Relationship between the
different git areas and the commands seen so far"){:class="img-responsive"}

> ## Exercise: Create some more commits
>
> Add "1/2 onion" to `ingredients.md` and also the instruction "enjoy!" to
> `instructions.md`. Do not stage the changes yet.
>
> When you are done editing the files, try:
>
> ```shell
> $ git diff
> ```
> There's lots of information here so take some time to understand the
> output. If your output doesn't contain colours you may want to run `git diff
> --color`.
>
> First, practice what we have just seen by **staging and committing** the
> changes to `instructions.md`. Remember to include an informative commit
> message.
>
> Now, run `git status` and `git diff`. Then, **stage and commit** the changes
> to `ingredients.md` but, after each step run `git status`, `git diff` and
> `git diff --cached`. What is the difference between the two diff commands? How
> does running staging and committing change the status of a file?
>
{: .challenge}

> ## Why stage?
>
> The last exercises highlights the reason Git use a staging area before making
> commits. You can make file changes as you want all at once and then group them
> together logically to make individual commits. We'll see why having only sets
> of related changes for a specific purpose in a single commit is so useful
> later on.
{: .callout}

## Git History and Log

We used `git log` previously to see the first commit we created. Let's run it
again now.

~~~
$ git log
~~~
{: .commands}

~~~
commit b6ff1ca61f08241ec741f6fc58ab2a443a253d89 (HEAD -> master)
Author: Christopher Cave-Ayland <c.cave-ayland@imperial.ac.uk>
Date:   Tue Dec 31 12:32:04 2019 +0000

    Added 1/2 onion to ingredients

commit 2bf7ece2f57594873678f9c17832010730970b28
Author: Christopher Cave-Ayland <c.cave-ayland@imperial.ac.uk>
Date:   Tue Dec 31 12:28:19 2019 +0000

    Added instruction to enjoy

commit ae3255af37e82a98c57f16a057acd1ad5a15ff28
Author: Christopher Cave-Ayland <c.cave-ayland@imperial.ac.uk>
Date:   Tue Dec 31 12:27:14 2019 +0000

    Adding ingredients and instructions
~~~
{: .output}

Your output will differ from the above not only in the date and author fields
but in the alphanumeric sequence (hash) at the start of each commit.

* We can browse the development and access each state that we have committed.
* The long hashes following the word commit are random and uniquely label a
  state of the code.
* Hashes are used when comparing versions and going back in time.
* If the first characters of the hash are unique it is not necessary to type the
  entire hash.
* Output is in reverse chronological order, i.e. newest commits on top.
* Notice the label HEAD at the top, this indicates the indicates the commit that
  the current working directory is based on.

> ## Exercise: Recalling the changes for a commit
>
> The command `git log` shows us the metadata for a commit but to see the
> file changes recorded in a commit you can use `git show`:
> ```shell
> $ git show [commit hash]
> ```
>
> Use one of the commit hashes from your Git history. To see the contents from
> when the commit was made try:
> ```shell
> $ git show [commit hash]:ingredients.md
> ```
{: .challenge}

## To Err is Human, To Revert Divine


### Rewriting History

A very common and frustrating occurrence when using Git is making a commit and
then realising you forgot to stage something, or staged something you shouldn't
have. Fortunately the Git commit history is not set in stone and can be changed.

To undo the most recent commit you can use:
~~~
$ git reset --soft HEAD^
~~~
{: .commands}

Follow this up with:
~~~
$ git log
~~~
{: .commands}
~~~
commit 2bf7ece2f57594873678f9c17832010730970b28 (HEAD -> master)
Author: Christopher Cave-Ayland <c.cave-ayland@imperial.ac.uk>
Date:   Tue Dec 31 12:28:19 2019 +0000

    Added instruction to enjoy

commit ae3255af37e82a98c57f16a057acd1ad5a15ff28
Author: Christopher Cave-Ayland <c.cave-ayland@imperial.ac.uk>
Date:   Tue Dec 31 12:27:14 2019 +0000

    Adding ingredients and instructions
~~~
{: .output}

Notice we've gone from three commits to two. Let's also run:
~~~
$ git status
~~~
{: .commands}
~~~
On branch master
Changes to be committed:
  (use "git restore --staged <file>..." to unstage)
	modified:   ingredients.md

~~~
{: .output}
This shows that the content which was part of the commit has been moved back
into the staging area.

From here we can choose what to do. We could stage some additional changes and
create a new commit, or we could unstage ingredients.md and do something else
entirely. For now lets just restore the commit we removed by committing again:
~~~
$ git commit -m "Added 1/2 onion to ingredients"
~~~
{: .commands}

> ## Changing History Can Have Unexpected Consequences
>
> Using `git reset` to remove a commit is only a good idea if you have **not
> shared** it yet with other people. If you make a commit and share it on GitHub
> or with a colleague by other means then removing that commit from your Git
> history will cause inconsistencies that may be difficult to resolve later. We
> only recommend this approach for commits that are only in your local working
> copy of a repository.
{: .callout}

### Reversing a Commit

Sometimes after making a commit we later (sometimes multiple commits later)
realise that it was misguided and should not have been included. For instance,
it's a bit of cliche to tell people to "enjoy" at the end of a recipe, so lets
get rid of it with:
~~~
$ git revert --no-edit COMMIT_HASH
~~~
{: .commands}
~~~
[master a70e1c5] Revert "Added instruction to enjoy"
 Date: Tue Dec 31 12:37:47 2019 +0000
 1 file changed, 1 deletion(-)
~~~
{: .output}

Check the contents of `instructions.md` and you should see that the enjoy
instruction is gone. To fully understand what revert is doing check out the
repository history:

~~~
$ git log
~~~
{: .commands}
~~~
commit ddef60e05eae3cc73ea5be3f98df6ae372e43750 (HEAD -> master)
Author: Christopher Cave-Ayland <c.cave-ayland@imperial.ac.uk>
Date:   Tue Dec 31 14:55:52 2019 +0000

    Revert "Added instruction to enjoy"
    
    This reverts commit 2bf7ece2f57594873678f9c17832010730970b28.

...
~~~
{: .output}

Using `git revert` has added a new commit which reverses the changes made in the
specified commit.

This is a good example of why making seperate commits for each change is a good
idea. If we had committed the changes to both `ingredients.md` and
`instructions.md` at once we would not have been able to revert just the enjoy
instruction.

> ## The Ultimate Guide to Undoing in Git
>
> It can be quite easy to get into a messy state in Git and it can be difficult
> to get help via a search engine that covers your exact situation. If you need
> help we recommend consulting ["On undoing, fixing, or removing commits in
> git"](https://sethrobertson.github.io/GitFixUm/fixup.html). This page contains
> a very comprehensive and readable guide to getting out of a sticky situation
> with Git.
>
{: .callout}

{% include links.md %}
