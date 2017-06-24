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

<div style="text-align:center"><img src="{{ site.baseurl }}/images/upstream-origin-local-2.png" alt="Git Origin and Upstream" style="width: 400px;"/>

Image taken from [here](https://coding.abel.nu/2015/03/fixing-a-pull-request-from-master/), then edited by me.
</div>

See, when you're on the online GitHub site, you only care about the top part of this scheme. You don't want any work setting up the lower block, your local install, and learning about Push and Pull, when all you need to do is bring a branch up to date with salesAgility. So what the script does is create the lower part automatically, do it for you, and remove it afterwards.

So, here's the script, complete with reassuring comments:

{% highlight bash %}
#!/bin/bash

# These point to your github forked repo of SuiteCRM:
user=yourUser
fork=SuiteCRM_Forked

echo -------
echo "This script will reset a branch on a SuiteCRM fork to look exactly like the official repo."
echo "It will delete any work you have on that branch in your fork, but you will want to use this on branches like"
echo "hotfix and develop, where you shouldn't be doing your work anyway, so it should be safe."
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
{% endhighlight %}

This is for Linux but it works great in Windows 10 if you install the Linux Bash Shell from Microsoft.
