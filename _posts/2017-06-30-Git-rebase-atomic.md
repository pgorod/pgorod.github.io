---
layout: post
title: 'Bringing a Git branch up-to-date with its origin - an atomic hack'
categories: [Development, Git]
---

So, you want to contribute some code from your repo to the original project? But Github is showing other commits you don't want to include, and you don't know how to remove them... 

## Method #1 - do things properly

Learn Git, understand the project's workflow, set up your local repositories correctly, set up the remotes, issue the correct git commands. This method is **not** the subject of this post... :-)

## Method #2 - the ugly, but practical, hack

__"But I just want it to let me do a simple PR! I don't have time to learn all that..."__

Ok, so here's a nice little atomic procedure for you. Atomic doesn't mean it explodes (hopefully), it means it's self-contained, does it's job without any previous set up, and leaves no local traces behind it. It's fire and forget.

What this does is create a new directory, start a local clone, set everything up, bring a branch on your forked repo up to date with the origin repo, and delete everything local in the end. After that, you can easily and safely do your PR.

#!/bin/bash

# These point to your github forked repo of SuiteCRM:
user=yourUser
fork=SuiteCRM_Forked

echo -------
echo This script will reset a branch on a SuiteCRM fork to look exactly like the official repo.
echo It will delete any work you have on that branch in your fork.
echo "It won't delete anything on SalesAgility's repo, because you don't have the rights to push there..."
echo -------
echo 'What is the branch you want to reset (usually hotfix)? '
read theBranch

echo "Press any key to continue reset of branch $theBranch on $user/$fork"
read -rsp $'...\n' -n 1 key

mkdir TempRepo
cd TempRepo
git init
git remote add origin https://github.com/$user/$fork.git
git remote add upstream https://github.com/salesagility/SuiteCRM.git
git fetch upstream
git checkout $theBranch
git push origin $theBranch --force
cd ..
rm -R TempRepo