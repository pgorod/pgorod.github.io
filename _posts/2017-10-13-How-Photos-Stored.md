---
layout: post
title: How are Contact Photos Stored?
categories: [Database, File System]
---

When uploading a ton of images to match each Contact you have, it's useful to avoid doing it from the user interface, and go directly into the file system and database.

## The Contacts `Photo` field

Some people don't even notice this exists - but it is actually quite useful for many purposes. You can go into Studio and make a `Photo` fields visible for the `Contacts` module. Enable it on the `Detail View`, the `Edit View`, and any `List views` and `Contact Subpanel` (in other modules' views) you find relevant.

## In the database

The database stores a very simple bit of information in the `contacts` table when you upload a Contact's photo: the `photo` field containing the name of the file you originally provided, like `johndoe.jpg`.

Note that this is not the name of how the file is stored within SuiteCRM - it is just what you provided, in case it's useful to you. It shows in the edit view, and you can click the `Browse` button near it, to select a new photo from your local operating system.

## In the file system

Essentially, the photos go in the `upload` folder, with a name formed by the Contact's database `id` and the suffix `_photo`. No file extension is kept.

So, suppose a contact has an `id` of `72c555b3-0ead-d66c-4c2a-57549a2e130b`, as seen on the `contacts` table. 

Tip: you can also easily grab the `id` from the browser, when in the detail view of that contact; it's the final code in the URL, after `record=`, or after `record%3D` (example: `http://10.0.0.200/index.php?action=ajaxui#ajaxUILoc=index.php%3Fmodule%3DContacts%26action%3DDetailView%26record%3D**72c555b3-0ead-d66c-4c2a-57549a2e130b**`

So, with that `id`, any photo in the upload folder named `72c555b3-0ead-d66c-4c2a-57549a2e130b_photo` will get picked up and displayed as the contact's photo.