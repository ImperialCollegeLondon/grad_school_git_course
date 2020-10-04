---
title: "Why use a Version Control System?"
teaching: 10
exercises: 0
questions:
- "What is version control software?"
- "Why should I use it?"
objectives:
- Explain what version control software does
- Describe the advantages of using version control
- State that Git is an example of version control softwares
keypoints:
- Version control software refers to a type of program that records sets of changes made to files
- VCS is a ubiquitous tool for software development
- Tracking changes makes it easier to maintain neat and functional code
- Tracking changes aids scientific reproducibility by providing a mechanism to recreate a particular state of your code base
- VCS provides a viable mechanism for 100's of people to work on the same set of files
- VCS lets you undo mistakes and restore a code base to a previous working state
- Git is the most widely used version control software
- Using Git allows access to online tools for publication and collaboration
---

## The Essence of Version Control

- A system for managing your work (not necessarily just code) which **records
  snapshots** of the current state of a set of files
- Provides a historical record for your project
- Reports "diffs" that describe the file changes between snapshots
- Implements **branching**:
  - Allows working on several different features at the same time and switching
    between them whilst also maintaining a working copy of the code
  - Different people can work on the same code/project without interfering with
    each other
  - You can experiment with an idea and discard it if it turns out to be bad
- Implements **merging**:
  - The opposite of branching
  - Combines different branches together

---

## What Can Go Wrong Without Version Control

Consider the following directory listing. This is a common situation that can
occur when working without version control (in fact it's probably the best
case scenario).

```shell
mylib-1.2.4_18.3.07.tgz         somecode_CP_10.8.07.tgz
mylib-1.2.4_27.7.07.tgz         somecode_CP_17.5.07.tgz
mylib-1.2.4_29.4.08.tgz         somecode_CP_23.8.07_final.tgz
mylib-1.2.4_6.10.07.tgz         somecode_CP_24.5.07.tgz
mylib-1.2.5_23.4.08.tgz         somecode_CP_25.5.07.tgz
mylib-1.2.5_25.5.07.tgz         somecode_CP_29.5.07.tgz
mylib-1.2.5_6.6.07.tgz          somecode_CP_30.5.07.tgz
mylib-1.2.5_bexc.tgz            somecode_CP_6.10.07.tgz
mylib-1.2.5_d0.tgz              somecode_CP_6.6.07.tgz
mylib-1.3.0_4.4.08.tgz          somecode_CP_8.6.07.tgz
mylib-1.3.1_4.4.08.tgz          somecode_KT.tgz
mylib-1.3.2_22.4.08.tgz         somecode_PI1_2007.tgz
mylib-1.3.2_4.4.08.tgz          somecode_PI_2007.tgz
mylib-1.3.2_5.4.08.tgz          somecode_PI2_2007.tgz
mylib-1.3.3_1.5.08.tgz          somecode_PI_CP_18.3.07.tgz
mylib-1.3.3_20.5.08.tgz         somecode_11.5.08.tgz
mylib-1.3.3_tstrm_27.6.08.tgz   somecode_15.4.08.tgz
mylib-1.3.3_wk_10.8.08.tgz      somecode_17.6.09_unfinished.tgz
mylib-1.3.3_wk_11.8.08.tgz      somecode_19.7.09.tgz
mylib-1.3.3_wk_13.8.08.tgz      somecode-20.7.09.tgz
...
```
The trouble with this way of working:
* Lots of manual work to manage these files
* Names are uninformative
* Not clear which versions of mylib and somecode are compatible
* Difficult to find changes between versions

### Mistakes Happen

Without recorded snapshots you cannot:
* Undo mistakes and go back to a working version of your code
* Find out when a mistake was made and which results it may affect
* You might not even be able to tell what your mistake was (*"It was working
  yesterday..."*)

### Working on different things

* For example new features and bug fixes, but you also want to use the current
  code for ongoing analysis
* Usually leads to multiple different copies of the code
* Copies need to be combined back together - but this often doesn't happen

### Collaboration

* *"I will just finish my work and then you can start with your changes."*
* *"Can you please send me the latest version?"*
* *"Where is the latest version?"*
* *"Which version are you using?"*
* *"Which version have the authors used in the paper I am trying to reproduce?"*


### Reproducibility

* How do you indicate which version of your code you have used in your paper?
* When you find a bug, how do you know when precisely this bug was introduced
  (are published results affected? do you need to inform collaborators or users
  of your code?).


## What about Dropbox or Google Drive?

Using a system like this solves some but not all of the issues above:
* Document/code is in one place, no need to email snapshots.
* How can you use an old version? Possible to get old versions but in a much
  less useful way - snapshots of files, not directories.
* What if you want to work on multiple versions at the same time? Do you make a
  copy? How do you merge copies?
* What if you don't have internet?

## Git - A Version Control System

The materials of this course focus on teaching the version control software
(VCS) Git. Whilst there are many different implementations of VCS, Git has
become established as by far the most widely used. We focus on use of Git via
its command line interface as we believe this is the best way to communicate the
important fundamental concepts.

Git is a very powerful tool. Unfortunately it is also quite difficult to start
using. Git often uses confusing and unintuitive terminology and the benefits of
its use are often only apparent in the longer term. Today we will make every
effort to demystify Git and make clear why it's usage is an essential part of
any programming activity.

<center><blockquote class="twitter-tweet"><p lang="en" dir="ltr">&quot;It&#39;s called a merge commit, Marty! It&#39;s a directed acyclic graph! We need to bisect and revert, and then use interactive rebasing possibly with a cherry-pick. What aren&#39;t you getting about this!?&quot; <a href="https://t.co/zahjHhiB33">pic.twitter.com/zahjHhiB33</a></p>&mdash; Gabriel Lebec (@g_lebec) <a href="https://twitter.com/g_lebec/status/1312115110685540352?ref_src=twsrc%5Etfw">October 2, 2020</a></blockquote> <script async src="https://platform.twitter.com/widgets.js" charset="utf-8"></script></center>

These materials are written in the style of [The Carpentries][carpentries]. If
attending an instance of this workshop you are fully encouraged to "type along"
with the instructor in order to be able to complete the exercises.

[carpentries]: https://carpentries.org/

{% include links.md %}
