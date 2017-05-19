---
layout: post
title: 'SuiteCRM Concepts Explained: Campaigns, Target Lists, Email Templates'
categories: [Concepts, Campaigns, Target Lists, Email Templates]
---

Campaigns in SuiteCRM are powerful, but complex and confusing, especially when you are just starting out. In this post I'll try to explain the most important concepts, and connect them to each screen in the Campaign Wizard.

> This post is a work in progress, it will evolve and be completed in the next few days!

Basically, you can think of a Campaign as a combination of these three things:

1. A group of people to whom you want to communicate something. This is represented in SuiteCRM as one or more `Target Lists`. 
2. What you want to communicate: if it's an Email Campaign, this is represented in SuiteCRM as an `Email Template`.
3. 

## Understanding Target Lists

A `Target List` is basically a group of addressable entities. Entities can be `Accounts`, `Contacts`, `Leads`, `Users` and `Targets`. All of these entities can have an associated Email, so when it's time to send Campaigns you can make any combination of these and group them into a `Target List`.
So you never put  these entities directly into a Campaign, you always use a `Target List` first to group them, and then use _that_ in the `Campaign`.
SuiteCRM will also auto-populate a few `Target Lists` for you afer a Campaign. See the **Campaign Results** section below.

To manage `Target Lists`, you can do it from both sides of the equation:
1. Either go into the `Target Lists` module (`Marketing` menu), and Select entities from their respective subpanels;
2. Or go into the entities module you want (for example, `Leads`), and do some search there to get the records you want. Then select them and click **Bulk Action**, and then **Add to target list**. Finally, select which `Target List` you want to add them to.

The first method is probably better if you want to mix different kinds of entities in the same Campaign. But most often you won't, and so the second method, from within a specific module, will probably give you more control over searching and selection of your records.
