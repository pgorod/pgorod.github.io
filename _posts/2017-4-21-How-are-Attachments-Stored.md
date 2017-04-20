---
layout: post
title: How are Attachments stored?
categories: Database, File System, Attachments, Notes
---

At some point you might need to go under the hood and see how SuiteCRM stores **Attachments** in the database, and in the file system. So here's a guide to help you out.

If haven't read this already, start with a few non-obvious points about what **Attachments** _are_ in SuiteCRM, by reading [SuiteCRM Concepts Explained: Documents, Notes, Attachments]({% post_url 2017-4-20-Concepts-Docs-Attach-Notes %})

## In the database ##

So Email, Campaigns and Case attachments all get stored as Notes in SuiteCRM. 

The relevant table in the database is aptly called `notes`. It contains an `id` field, which is going to be important, and some additional fields specifying the file name and the file MIME type.

Each note record, unless it was created directly as a loose Note, will have a `parent_type` (for example `Emails`). This relates the attachment to the record to which it is connected. There is also a `parent_id` so you can put these two together and go into some other table (say `Cases`) and match that `parent_id` with the `id` on the other table to see the related record. Notice that there is no reverse link, you can't find out from looking at a `cases` table which records have associated attachments or not.


## In the file system ##

The actual file on your system will be in the `upload` directory, with a name equal to the `id` of the `note` record.

So, to see all the Email attachment files on your system, run this in MySql:

```
SELECT notes.id, emails.id, CONCAT("upload/", filename), file_mime_type FROM notes INNER JOIN emails ON notes.parent_type = 'Emails' AND notes.parent_id = emails.id INNER JOIN emails_text ON emails.id = emails_text.email_id
```

That filename shown by this query is the filename as seen by the user. You can pull **other fields** from the "Notes" and "Emails" tables, if you need (recipients, sender, date, etc.). You can also adapt that query to the **other record types** (`cases`, `email templates`, etc.)

The fact that every single file goes into the same directory is not very ordered and can actually lead into problems with the file system if you start having huge amounts of files. It would be nice for SuiteCRM to separate these into folders (by record type) in the future.
