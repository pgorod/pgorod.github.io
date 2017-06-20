---
layout: post
title: 'Audit file accesses to track your customizations'
categories: [File System, Customization, Logs, Troubleshooting]
---

So, you need to know which file SuiteCRM is trying to load from where? Or why your customization file isn't getting picked up? Or what files Studio has changed? Here's what I would call an advanced debugging/troubleshooting technique.

Apart from anything you can find from the logs, sometimes you just wish you could see exactly which disk accesses were being made. Well, you can.

In Windows, this is done with a nice little app called Process Monitor (part of the brilliant SysInternals Suite you can download from Microsoft). But that is not the object of this post, here I will be discussing only the Linux solution: **auditctl**.

**auditctl** will let you monitor specific folders and see exactly what SuiteCRM is trying to read/write, and whether it's succeding or not, and whether it's failing due to permissions problems.

`sudo apt-get install auditd audispd-plugins`

If you need to find your config file, to edit the log location, try this

`find / -name auditd.conf  2>/dev/null`
`nano /etc/audit/auditd.conf`


Now you need to add rules saying what you want to monitor. I suggest something like this (adapt to your paths, of course):

`auditctl -a exit,always -F dir=/var/www/html/custom -F perm=rwa`
`auditctl -a exit,always -F dir=/var/www/html/modules -F perm=rwa`


To list currently active rules:
`auditctl -l`

Now you can tail your log at the moment when you're accessing the screens, or when you're changing something in studio, or when you're doing a Rebuild, to understand what's going on:


`cat /var/log/audit/audit.log | grep Line_Items.php`
`tail -f /var/log/audit/audit.log  | grep -i 'custom/modules/AOS_Products_Quotes'`
`tail -f /var/log/audit/audit.log  | grep -i 'Invoices\|Products\|Quotes'`


That third example is an "OR", it will match any of those words.

To delete ALL rules, when you're finished, so that performance isn't hurt in the future:
`auditctl -D`

With this I believe you can see "under the hood" what SuiteCRM is trying to load, including directories it is searching, before deciding to load a file. You can also detect if the problem is caused by insufficient permissions. This is a great way to get a grip on what's wrong with some file you're trying to customize.