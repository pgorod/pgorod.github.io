---
layout: post
title: 'How are Email addresses stored?'
categories: [Database, Email]
---

A look at how SuiteCRM stores Email addresses in the Database. This applies to all entities that have email addresses.

> Currently this post covers only the simple topic of storing Email addresses. One day I plan to expand it to include how actual Email content is stored.

## The several entities that can have Email addresses

In SuiteCRM, all of these entities can have Email addresses: `Contacts`, `Leads`, `Targets`, `Users`, `Accounts`, and perhaps more that I'm not remembering now.

Developers call entities `beans` because of the way they are internally represented and handled.

## Database structure

There is a table handling the relationship between people and their email addresses called `email_addr_bean_rel`.

In there, the columns `bean_id` and `bean_module` specify the entity that has an email address. For example, if `bean_module` is `Users`, you can use `bean_id` to look the user up in the `users` table.

Then there is a column called `email_address_id` which is a reference to the `id` column in table `email_addresses`. 

## Example Query

Here is a sample query to extract a list of `Users` with their Email addresses:

{% highlight sql %}
SELECT users.user_name,
      email_address
 FROM users
      LEFT JOIN email_addr_bean_rel
             ON email_addr_bean_rel.bean_id=users.id
            AND email_addr_bean_rel.bean_module = 'Users'
            AND email_addr_bean_rel.primary_address = 1
            AND email_addr_bean_rel.deleted = 0
      LEFT JOIN email_addresses
             ON email_addresses.id = email_addr_bean_rel.email_address_id
            AND email_addresses.deleted = 0
{% endhighlight %}

This can easily be adapted to the other entities like `Contacts`, `Leads`, etc.