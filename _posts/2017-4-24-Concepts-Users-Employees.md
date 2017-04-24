---
layout: post
title: 'Concepts: Users, Employees, Portal Users'
categories: [Concepts, Users, Employees, Portal Users]
---

This is an area of SuiteCRM concepts which I find particularly confusing and clarification is required.

The terms `Users` and `Employees` overlap _a lot_ in SuiteCRM, but they are not completely equivalent. 

Both modules are a bit "special" modules. You access them from unusual places. You'll find `Employees` in the menu on the top-right corner, and `Users` in the `Admin` menu, under `User Management`. Then you can also find them on the top menus, under `Support`, under `All`, but this also has a weird behaviour. You never see both options side-by-side at once, they seem to shift into one another, and you see `Users` when you are in the Users module, and `Employees` when you are in the Employees module. One wonders what "they" were thinking...

### Employees ###

Basically the idea of `Employees` is to represent **a person that works for your company**. This lets you add a bunch of data for that person, but it's simple "address book" stuff. Don't expect any handling of work hours or of compensation payments (you could try and model that in other areas of the app if you really need to).

If you create an `Employee` in SuiteCRM he/she will also appear in the `Users` list.

### Users ###

The idea of `User` is to represent a **person who can log in to your SuiteCRM system**. Apart from the same kind of "Address book" info, you crucially include a user name and an email as a required field.

Then you have a few tabs with more information you can add/tweak: full email account settings, theme options, which modules the user can see, external apps to connect, etc.

And yes, if you create a `User` in SuiteCRM he/she will also appear in the `Employees` list!

### Administrators are special users ###

There is a field for every user specifying the `User type`, which can be `Regular user` or `Administrator`. The system will not let you delete the last user who is an Administrator, to guarantee there is always at least one user with full access to configure the system.

### The overlaps and differences ###

So, how can we make sense of all of this? The essential point is that normally the same people that work for you are the ones that you want logging in to your system... 

- all users are employees
- not all employees are users

So how does SuiteCRM provide a way for you to express a person who is not your employee but that you want accessing your system? Well, there is a way, but very limited and different, who is the `Portal User` (see below).

On the other hand, an Employee who does not use the CRM is simple to achieve. It doens't do much, though, except save his name and address and other fields like these.

If you create an `Employee` you can later turn him into a `User` by going into the `Users` module and adding a username and password.

We could say `Employee` is a minor concept in SuiteCRM, while `User` is a big concept, with a lot of data and implications for security, record assignments, etc.

### Portal Users ###

I won't go into this so deeply, but it's worth mentioning that you can activate the `AOP Portal` on `Admin` area, and the when viewing (not editing!) a `Contact`, you'll get a button on the top to `Create Portal User`. This will let you give simple `Contacts` (not `Employees`, and not `Users`) an access to your system, but at a different URL, and for a very different experience. The functionality is like that of a support area, limited to opening `Cases` and checking their evolution. It can be programmed to handle more aspects of the app, of course.