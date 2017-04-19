---
layout: post
title: How are Attachments stored?
---

At some point you might need to go under the hood and see how SuiteCRM stores **Attachments** in the database, and in the file system. So here's a guide to help you out.

Let me start with a few non-obvious points about what **Attachments** _are_ in SuiteCRM.

Attachments can be well, attached to either Emails or Notes (not obvious). Actually the creation of an Attachment to a campaign, for example, will result in a Note being created with that Attachment. Even so, you shouldn't conclude that Notes and Attachments are the same thing, because not all Notes contain (or are) Attachments. Some might just have a text (that shows directly on the Note), but not an attached file (that you can click to download and open locally on your computer).

Finally, when viewing a Contact or Account, you won't see a subpanel for Notes, nor for Attachments. What you do get is a subpanel called History which includes Notes along with other completed items in recent related history.