---
layout: page
title: PowerFields SuiteCRM Add-On
permalink: /power-fields/
---

### Save user's time, make your processes faster and more reliable

Sometimes it's the simplest things that slow you down. Those things you have to do over and over. The ones
where you can easily make mistakes.

Which value should be in this record, in this field? If the answer is not direct - just something you type  
so that the CRM will record it for you - then you need **formulas**, or **calculated fields**.

Applications are endless, but here are some examples...
- calculating a discount percentage based on the Opportunity amount stored in another field
- turning a quickly-typed **`20`** into a nice-looking `"A 20 day evaluation period will be granted"`.
- using multiple conditions to determine the due date of the next Call to customer
- just when a sale is being closed, grabbing a currency conversion ratio from an online provider and storing it in a field.
- changing the Lead status only after confirming the necessary related Account data is filled.
- adding some historic information about the record to a field - stamping it with edit dates, successive assigned users, etc.
- doing math or date calculus
- applying text, number and phone formats, handling time zones, currencies, etc.
- concatenating data from related records into a single comma-separated list: **`Bought: Apples, Pears, Grapes`**

### How It Works

The syntax is Twig templates - with some super-useful SuiteCRM extensions (for example, to easily access
related records). You can read more about what it allows in my page describing [PowerReplacer add-on](/power-replacer) 
which essentially applies the same technology to Email templates.

#### Option 1: Entering formulas directly by hand

Maximum flexibility! Only you can know what-goes-where.

You can type a formula in any field in an **edit view** of any module, or in an **inline edit** (when you 
double-click to edit a field), and it will be converted before saving. Your browser will remember you 
entered it there once, so they are easy to retrieve when you use the same formula often.

Some users like to keep a list of useful formulas ready to copy-paste as appropriate, to save them time.

#### Option 2: Entering formulas from Studio

In Studio, in the **Fields** area of every module, you can specify two new settings for each field: 
- **Auto New**: formula that will be applied to that field when creating new records. You can think of this 
as an advanced "default value" setting. 
- **Auto Edit**: formula that will be applied to the field whenever the record is edited in an edit view, or 
the field is inline-edited individually.

This way you get the full power of templates to access related records, set up dependent fields, make 
calculations, formats, or even (by extending the code) grab extra information from an external 
corporate system!

#### Option 3: Combine the two approaches!

Set up your formula in Studio, but have it include a reference to what was in the field before, or 
what the user just typed when editing. Think of this as an automated find-and-replace of user edits.

It also allows for validation code, and for ensuring consistent formatting of entered numbers, 
dates, currencies, etc.

Some of the things that used to require a **Workflow** or an `after_save` **Logic Hook** can be handled 
in a much simpler and user-friendly way with this approach.

### Completely extensible!

Twig templates let you add your own commands, filters, etc. So, with some simple development work,
you can make extremely advanced features be condensed into simple keywords that your users can 
apply when needed.

### Open-source wins!

If you ask, how does this stack-up against the competition? SugarCRM has SugarLogic, and SalesForce has Formulas.
But I would boldly claim that when these PowerFields are out of beta, they will be way more powerful and versatile 
than those features from the closed-source, rent-seeking CRM's.

Not because I am a genius for writing all of this, but simply because I am building on what others (some of them geniuses) 
have done before me. I use the open-source Twig templating language, which is modern, technically brilliant, fast and
infinitely extensible. 

And with SuiteCRM being fully open-source, there's nothing you can't reach - all the data and all the code is yours. This 
is not just a nice thing to say and an important business ownership strategy; it's also a practical problem solver. 
You can basically extend these calculated fields with bits of code to do whatever you want with your CRM.

Open-source calculated fields are _naturally_ better than closed-source ones!

### Technical Info

Check the [Technical info page](/power-fields-technical) for details about Requirements, Releases, future features, etc.

## Sponsor Now!

So, what are you waiting for?

[![Sponsor button](../images/sponsor_btn.png) me on Github](https://github.com/sponsors/pgorod) and get 
access to this great SponsorWare add-on!

You will also effectively be **contributing to the SuiteCRM project** as a whole, by keeping
me in the Community working to write code that will **all** eventually be donated into Core!

If enough people sponsor, we will effectively have one more developer working for SuiteCRM - that's
why I could be selling these add-ons in the SuiteCRM Store, for higher prices and forever, but I 
chose not to.

