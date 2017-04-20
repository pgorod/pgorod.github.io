---
layout: post
title: SuiteCRM Concepts Explained: Documents, Notes, Attachments
categories: Concepts, Documents, Notes, Attachments
---

These SuiteCRM concepts seem to mix and overlap in unexpected manners, causing some initial confusion. This guide will help you sort everything out.

Documents are files that you upload into the system for later reference. The distinguishing feature of this concept is that it allows for Revisions, meaning SuiteCRM will keep all previous versions as you upload new ones, instead of replacing them. You can add some comments to each revision. 

Attachments are also uplodaded files, but they can be, well, attached to either Emails or Cases or Notes. Even so, you shouldn't conclude that Notes and Attachments are the same thing, because not all Notes contain (or are) Attachments. Some might just have a text (that shows directly on the Note), but not an attached file (that you can click to download and open locally on your computer). Attachments do not have the option to keep multiple revisions.

When attaching something to a Case or an Email, you get a chance of attaching both a Document and a File (Attachment). Not very intuitively, if it's an Attached file it will get created as a Note in SuiteCRM. For example, the creation of an Attachment to a campaign, for example, will result in a Note being created with that Attachment.

When viewing a Contact or Account, you won't see a subpanel for Notes, nor for Attachments. What you do get is a subpanel called History which includes Notes along with other completed items in recent related history. Documents do have a subpanel all for themselves.

The AOP Portal allows for customers to send you documents by attaching them to Cases. They can, of course, also send you documents with Emails.

So, to untangle all that from the point of view of each concept:

### Notes: ### 
- can be just text without file
- can also have an attached file
- are created automatically when you attach something to an Email, Case or Campaign
- show in History subpanel, when viewing Contacts, Accounts, etc.

### Documents: ###
- support multiple revisions
- support more fields like category, sub-category, expiration date, etc.
- always must include a file
- show in their own Documents subpanel, when viewing Contacts, Accounts, etc.

### Concept overlaps: ###
- all files uploaded to the system become either a Document Revision or a Note
- not all Notes are Attachments, they can be just text
- but all Attachments are Notes

In other posts, I explain how [Documents]({% post_url 2017-4-19-How-are-Documents-Stored %}) and Attachments are stored in the database and in the file system.
