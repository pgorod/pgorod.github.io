---
layout: post
title: 'My SuiteCRM hardware and system architecture'
categories: [Architecture, VM, Backups, Migration]
---

I'm happy with my architecture and I think it's a bit original, so I'd like to share it here. It's basically an extremely unexpensive set up for a non-profit with a tight budget. But I would use it on a commercial company any day.

I run **Microsoft Hyper-V Server** as a virtualisation layer. This is the FREE server, without any GUI. It takes a bit getting used to but hey, it's free. It has excellent hardware compatibility for cheaper hardware, unlike VMWare.

Inside that I run **SuiteCRM over Ubuntu**, latest version. Microsoft has been contributing directly to the kernel to improve Hyper-V compatibility, and it is now excellent (dynamic memory and all). Using SuiteCRM over Linux, it seems to me, gives less problems than over Windows.

I use Intel I7's and SSD disks, but nothing too fancy. It's not a large organization.

The main advantage of this set up is that I can get a virtualization feature that normally is reserved only for payed version, but on a free setup: that feature is **replication**. I can run a couple of Hyper-V servers and have them replicate the VM between them. Fail-over from one to the other is a breeze, really easy.

I also plan to do this for performance reasons: one server runs SuiteCRM database, the other runs SuiteCRM web server and app. Each replicates to the other. So in case of failure, I simply run both on the same server, with some performance penalty, of course, but the good thing is that I can make use of my replication hardware for performance on the good days, and for disaster recovery on the bad days.

Having replication (plus backups) is what enables me to drop the requirement for expensive hardware. I got this idea from Google, they realized that since they need to have several layers of disaster recovery they might as well use cheap hardware and just replace it as needed.

I have several layers of Backups. Some full VM backups (occasional, heavy, but most useful), some file copying from inside the VM (frequent, more lightweight). You should know that Replication is for fault-tolerance, Backups are for Data security and recovery. Different things, and you need both. If you have just replication, when you delete something by accident on one server, it gets replicated to the other, and you're left with no option to get your data back unless you have proper Backups.

**A replicated, virtualized, fault-tolerant, full-featured, performant CRM for around $ 1,500.**

And then there's my smaller Test system: a replicated, virtualized, copy of that running on even cheaper hardware, a couple of refurbished laptops with SSD's and 16 GB RAM, totaling $ 600. 