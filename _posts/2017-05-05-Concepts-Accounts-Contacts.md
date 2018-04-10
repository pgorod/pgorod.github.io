---
layout: post
title: 'SuiteCRM Concepts Explained: Accounts, Contacts and Sub-Accounts'
categories: [Concepts, Accounts, Contacts]
---

`Accounts` and `Contacts` are very central concepts in SuiteCRM. Normally your data-modelling decisions start here - and there are a few subtleties you need to learn.

An `Account` is basicaly a representation of an impersonal entity, like a company, an institution, etc. 

Then it articulates with the several representations of persons (`Contacts`, `Leads`, `Targets`). Of these, the main one is clearly `Contacts`, which is a person in full standing in your CRM: it is the personal entity that keeps more information, and that links to all other modules in the CRM, so that you can keep a view of the History of your relationship with that person. Customers will almost always be modelled as `Contacts`.

So, almost every system you design around SuiteCRM is going to make use of both of these concepts. **Your main institutions will be modelled as `Accounts`**, **your main persons will be modelled as `Contacts`**. 

**I don't recommend starting with new entities to model companies or people**. For example, you might think, my business deals with Artists, so I will go into Studio and create a module called `Artists`. Sure, you can do that, and you can even base it on the `Contacts` module so that most fields will already be there. But the default `Contacts` is so linked to everything in the CRM, that you will be better off using it directly. You can rename it to `Artists` if that's really the only thing a contact will ever be in your company - but this is a superficial name change that keeps everything the same underneath. The new module would be more difficult to integrate. The same goes for the `Accounts` module.

### An Account can have many Contacts ### 

The most common relationship between these two central concepts is this: each Account can contain zero, one or many `Contacts`. These could be the many people you know inside an organization.

But you can also use an `Account` as an alternative way to group people. For example, you might create an `Account` called "Impressionists" and put all your impressionistic style Artists in it. You could - but I'm not recommending you do. A custom field called "Painting style" in the Contacts record might serve you better for these purposes.

But I gave the example just to show that sometimes the relationship doesn't strictly have to be "people who work for a company". It could be a system keeping data about students of a group of schools, and each student would be in an account for her own school.

So, how should you make a wise decision about whether to segment your people by a field, or by `Accounts`? Only you can say that, but as hints I would say: only use Accounts if it is a primary relationship in your data, an important aspect of your data; and if you don't need to use Accounts for anything else; and if you need to use that information to differentiate security accesses (some users can only see or edit records from one `Account`, buy not the other).

### Sub-Accounts ###

There is a concept in SuiteCRM that allows making some `Accounts` part of others. This could be used for any case of _entity-inside-entity_, like for a central company that contains several other companies, or several branches, or locations, or departments.

To use this, go into the detail record of an `Account` and edit it. You will find a field there called `Member of`, with a selector for `Accounts`. What you choose there will make your current `Account` a member of the other `Account`, its `Parent Account`.

To see things from the other side of the relationship, if you go into a parent `Account`, you'll see a subpanel called `Member Organizations` with a list of its sub-accounts. If you remove rows from this list, you will break the relationship (but the sub-account will only be unlinked, it won't be deleted).

There can be **several levels** in this composition, so that an `Account` can be the parent of another `Account`, which in turn has other `Accounts` underneath it as `Member organizations`. So in theory you could represent a full organization chart of a large corporation with this.

And **how does this affect the relationship with Contacts?** Well, Contacts are still only linked to a single specific Account, and it can be at any level in the hierarchy. But with clever work under the hood, with some SQL you could have fancier operations like loading every contact of every sub-account into a Target List you can email, for example.

Where this is most useful is for **security accesses**. If you limit access to a certain Account, SuiteCRM will be smart enough to consider everything under that `Account`, including `Sub-Accounts`. This makes it easy to segment your data in high-level blocks, as well as with greater detail if you need to.

For example, in the system modelling several schools, you could have top-level `Accounts` for each school, then sub-accounts for each Class, in order to group students (modelled as `Contacts`) under these `Accounts`. In terms of security, a teacher from one of the schools (modelled as a `User` of your system) can be given access only to records from that school.

### Exceptionally, a Contact can belong to several accounts ###

SuiteCRM is built to have only one Account attributed to a Contact. The user interface follows that assumption. However, there is a known gap in the system. You _can_ add a second account to a user, making him effectively belong in both. You can also extend this to a third account, and more... 

If you do this, the user interface will behave strangely. It will still only show one Account in a Contact's record (I'm not sure if it shows the first one inserted, the last one inserted, or just a random pick). So you see a single Account linked, but if you delete it, instead of seeing an unlinked record, the second Account will magically appear in its place.

There might be good reasons to use this system, imperfect as it is. If you need to, you can work around it's interface limitations in two ways:

- handle the relationships directly from the database (you will find multiple rows in table `accounts_contacts` for a single contact)
- if you don't see the second Account from the Contacts detail record, you can still see the Contact in the Accounts record, as an item in a subpanel. From that line you can select "delete". Remember deleting in subpanels doesn't delete the full records, it only deletes the relationship between the record you are on, and that linked record.

### Setting up Security ###

Although it's a different topic, if you're interested in modelling groups, subgroups and people, you will probably want to consider the different accesses you will be letting each group of users have. So a recommended reading is this: <a href="https://www.sugaroutfitters.com/docs/securitysuite/example-of-a-typical-setup" target="_blank">A Typical Hierarchy Setup</a>.

_If you have any further questions or comments to improve this article, please leave a comment below!_