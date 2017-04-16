---
layout: post
title: Customizations in the custom folder
---

SuiteCRM's code can be customized in many places. The basic rule is pretty simple: whenever it needs a php file, it will look first inside the `custom` folder, and use any customized file that you placed there. Only if it's not there it will keep looking in the original place of the file.

So, for example, if you want to customize 

`modules/Contacts/language/en_us.lang.php`

then **create any necessary directories** and copy the file over to

`custom/modules/Contacts/language/en_us.lang.php`

and make your changes in this second file.

Use a minimalistic approach, and copy only the files you really need to change.

## Are these customizations upgrade-safe? ##

If you edited SuiteCRM's files directly, the changes wouldn't be upgrade-safe, meaning an upgrade could replace those files with new ones, and your changes would be overriden.

But if you use the `custom` folder like instructed above, then upgrades won't replace them (upgrades never write files in `custom` directory), and so your changes will be kept - that's why they're called upgrade-safe (well, almost - see below).

## Are the customizations picked up immediately? ##

If it's a regular php file with code in it, normally you don't have to do anything, just reload the page and it's changed. There could be caching issues on the server side causing you to not see the change immediately, but my experience (on Linux, with Apache) is that it recognizes the change immediately.

But some php files are special in SuiteCRM. The ones like vardefs, layoutdefs, etc. For these files you often need to go into Admin, `Repair` menu and run a repair called `Quick repair and rebuild` to force the files to be read and processed. This is because SuiteCRM doesn't directly use these files on normal operation; it just uses them to create another set of php files (that compile elements from several sources of SuiteCRM customizations), and this second set is what gets served to your browser.

## Are upgrade-safe changes _completely_ upgrade-safe? ##

**No!** There's a _caveat_ that I've never seen expressed, and that I've never seen happen in real-life, but feels very obvious indeed.

If an upgrade changes a SuiteCRM file, then there must be a reason for that change. Frequently, it's tied to changes in other files. So the problem you could get is that if an upgrade changes a SuiteCRM file, and you have a copy of it `custom` folder, your version will be used, but you can still get all these problems:

- miss out on a new feature
- miss out on a security fix
- break your system because the new changed file that came with the upgrade needs to work coherently with other new files, or with changes to the database.

So, once you start customizing, especially files with code (not just layouts and strings) keep an eye on what changes come with each upgrade.