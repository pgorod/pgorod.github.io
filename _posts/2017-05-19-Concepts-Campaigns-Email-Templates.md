---
layout: post
title: 'SuiteCRM Concepts Explained: Campaigns, Target Lists, Email Templates'
categories: [Concepts, Campaigns, Target Lists, Email Templates]
---

Campaigns in SuiteCRM are powerful, but complex and confusing, especially when you are just starting out. In this post I'll try to explain the most important concepts, and connect them to each screen in the Campaign Wizard.

> This post is a work in progress, it will evolve and be completed in the future!

Basically, you can think of a Campaign as a combination of these things:

1. A group of people to whom you want to communicate something. This is represented in SuiteCRM as one or more `Target Lists`. 
2. What you want to communicate: if it's an Email Campaign, this is represented in SuiteCRM as an `Email Template`.


## Understanding Target Lists

A `Target List` is basically a group of addressable entities. Entities can be `Accounts`, `Contacts`, `Leads`, `Users` and `Targets`. All of these entities can have an associated Email, so when it's time to send Campaigns you can make any combination of these and group them into a `Target List`.
So you never put  these entities directly into a Campaign, you always use a `Target List` first to group them, and then use _that_ in the `Campaign`.

SuiteCRM will also auto-populate a few `Target Lists` for you afer a Campaign. See the **Campaign Results** section below.

To manage `Target Lists`, you can do it from both sides of the equation:
1. Either go into the `Target Lists` module (`Marketing` menu), and Select entities from their respective sub-panels;
2. Or go into the entities module you want (for example, `Leads`), and do some search there to get the records you want. Then select them and click **Bulk Action**, and then **Add to target list**. Finally, select which `Target List` you want to add them to.

The first method is probably better if you want to mix different kinds of entities in the same Campaign. But most often you won't, and so the second method, from within a specific module, will probably give you more control over searching and selection of your records.

## Understanding Email Templates

`Email Templates` are the letters you send to your audience by email, in their generic form. You can send the exact same text to everyone, but normally you will want to personalize it, so these templates can have variables to be populated at the time of sending the `Campaign`.

For example, you might use a variable with the person's name to open your letter with "Hello $contact_name!". Or you could use dates, amounts due, whatever you have in your modules.

Many people only see `Email Templates` within the `Campaigns Wizard`, but actually they're an independent SuiteCRM module, with the typical features (List view, Detail view, Edit view, etc.). You only need to know the not-so-standard way of accessing it: click either **Campaigns** or **Emails** in the **Marketing** menu, and then on left hand menu you'll find **View Email Templates**,  and **Create Email Template**. I actually prefer working on the Templates from here, apart from the Campaign Wizard, but it's a matter of personal choice.

When editing Templates, you have a rich text editor where you can insert formatted text, images, links, etc., to produce nice looking Newsletters and campaign emails.

## Wizards can do surprising things

The Campaigns Wizard is the obvious place to set up a Campaign. There are a few not-so-obvious things about that Wizard that might help you navigate it...

1. **You can relaunch the Wizard**. It's not just an initial step for Campaign Creation. It's also a way to Edit a Campaign, repeat it, and edit elements of a Campaign (Templates and Target Lists). To relaunch the Wizard, go into `Campaigns` module, click on a Campaign, and there's an action on the top to launch the Wizard again (this can be either in a dropdown menu or separate button, depending on your settings).

2. In the Target List step of the Wizard, you can **create a new Target List** from within the Wizard. You can also **edit a list**, by clicking on it, and it opens in a new window so you can add or remove `Targets`.

3. In the Email Templates step of the Wizard, you can **create a new Email Template** from within the Wizard. This can be done by starting with a brand new template, or by starting from a copy of an existing one. You can also **edit a template** directly in the Window.


## Campaign Results

(article to be completed)
