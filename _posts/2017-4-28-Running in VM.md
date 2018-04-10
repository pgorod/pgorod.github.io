---
layout: post
title: 'Why you should be running SuiteCRM in a VM'
categories: [Architecture, VM, Backups, Migration]
---

Here are some arguments in defense of the option to install SuiteCRM inside a Virtual Machine (VM), instead of on bare metal. That's what I always do and I'm never turning back. These are basically the generic arguments in favor of virtualization, with some specific considerations regarding SuiteCRM.

1. You get the **perfect backups**: entire machines, completely configured, ready to run. if you've ever tried rebuilding a server from simple data backups, only to start stumbling on all the configurations and system options you did throughout the years but can't remember anymore... you know how much this is worth. Most (not very competent) sysadmins never even test their backups, and often discover they can't really restore from them. None of this is a problem with full system backups.

2. **Snapshots**: going to update your Linux packages? Or your SuiteCRM version? Or even some code you're working on, or a crucial change in Studio that's worrying you? Or some clean up operation in the database? All these things involve risk: but if could only take a snapshot of the full state of your system, and easily go back to that state in case anything goes wrong... well, you can with VM's! 

3. **Fault-tolerance**: one simple disk fatal failure, or power-supply failure, and your company stops working - not a pleasant situation to be in, and not very professional either. If you get two servers, and replicate one from the other, if one goes down you just have to fail-over to the replica. 

4. **Clones for prototyping and testing**: similar to the snapshot option, but for larger scale tests. You copy the entire VM to another location, and test there. You can have a development machine that is an exact clone of your  real server, with your real data on it. You can try Beta versions, or install Pull Requests that haven't been merged into the main product yet. You can play with SuiteCRM without fear. You can bring your server with you on your laptop. 

5. **Easy migrations and hardware changes**. Need to change to a newer, better server? Just move the VM and start it. Have multiple VM's in one server? You can move CPU's and memory from one to the other at the click of a button.

6. **Migrate to the cloud**, or at least be prepared for it: if you're running a VM, you can also host that VM in a cloud service (Like AWS or Azure). If you're not ready to do it today, then at least be ready to easily do it whenever you want. And be able to tell your management when they come to you with "cloud" hype buzzwords: "sure, it's cloud-ready, I can move it up whenever we decide, should be easy". This really solves that uneasiness they get when you try to convince them you don't _have to_ be on the Cloud, despite everything they read in business magazines. : - )

7. **Easy Scale-up**: if your server is running slow with too much activity, despite having generous hardware, get a second server, clone your SuiteCRM system, stop MySQL on one server, and stop Apache on the other. Adjust the configuration file so that the one running the app uses the other one as a database. There, you've just split your server into two and it wasn't a big complicated project...

### Performance ###

SuiteCRM is not very demanding in terms of hardware, to start with. A simple system will run quite well on very modest hardware. Most of the people complaining about SuiteCRM's performance eventually find out some other issue like the need to do some database maintenance or fix some bug. Of course if you start having many users and a lot of activity things might get more demanding.

It's 2017, don't use old spinning disks, use SSD's, it really pays. Unless you already have a big, fancy, expensive, RAID or NAS system that's really great to use instead.

For test and development machines, 3 Gb RAM will suffice, and about 10Gb for the disk, which is quite impressive.

### Anything against? ###

Sure, some opposite arguments might also apply. These would be the generic reasons you can find online for why you prefer _not_ to virtualize some server. For SuiteCRM I would say the only one I can find relevant is hardware performance, in case you have a very I/O intensive server and after careful consideration decide you can't really virtualize without suffering some performance hit. But this is unlikely, and as a rule of thumb: if you have that kind of installation, you know what you're doing, and you're not here reading my introductory advice about virtualisation : - )

See [My SuiteCRM hardware and system architecture]({{ site.baseurl }}{% post_url 2017-4-29-Architecture %}) for how I put all this together in real-life, with extra tips.