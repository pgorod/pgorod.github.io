---
layout: post
title: How are Documents stored in the Database?
---

At some point you might need to go under the hood and see how SuiteCRM stores `Documents` in the database, and in the file system. So here's a guide to help you out.

I tried creating a document attached to a contact, and went into the database (using phpMyAdmin) to see what had been created, it seems to work like this:

There's a table in the database with the relationship between documents and contacts, called `documents_contacts`.

Here you find the `id` of the contact and of the document (tables `contacts` and `documents`).

Then, in the `documents` table, you need an extra level of **document revisions**, that's what gets stored as a file: it's a specific revision. That's what's specific of the **Documents** concept in SuiteCRM, it allows for several versions of the same document to be stored, unlike most other data where newer values simply replace older values. In the database, this is reflected in table `document_revisions`.

There will be a file in your `upload` directory whose name is exactly the `id` field of that document revision (e.g. something like `85c2ee00-a1ce-3c59-55bb-572397afb36e`)

The file name as visible to the user (like `invoice.doc`) will be stored both in the `documents` table and in the `documents` table, but not on the file system. Only ids of revisions are used on the file system.

So to get a full list translating document names to files on the filesystem, use this from SQL:

``SELECT `filename`, concat("upload/", `id`) FROM `document_revisions` ``

watch out for multiple files with the same name, these would be different revisions of the same document.