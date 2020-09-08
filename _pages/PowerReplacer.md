---
layout: page
title: Power Replacer SuiteCRM Add-On
permalink: /power-replacer/
---

### Email Templates that mold to your Customers

This SuiteCRM add-on takes email templates and variable-substitution taken to the next level! 
Well, actually, taken to the next _ten_ levels...

Email communication is crucial. Having it integrated with your CRM, able to work with customer and sales 
information from a centralized database, is a big part of the reason why you got a CRM in the first place. 

You need your CRM Emails to...

* **_Work_**: you can't have codes like `$contact_user_name` going out un-replaced to your dear customers. 
* Have **context**: any field from the record you're working on should be available.
* Have **more context**: related records typically hold crucial information, you need to be able to 
reach them easily.
* mold to your Customer's **identity**: their language, gender, time zone...
* mold to your Customer's **relationship with you**: data from their past interactions, preferences, 
purchases, invoices...
* be fully **preview-able** - see exactly what the receiver will see, before sending.

## How It Works

You can watch the Demo Video (12 minutes, with sound). You'll probably want to go full-screen to see it better.

<video autoplay controls width="600"> 
    <source src="/images/PowerReplacerAlpha.mp4" type="video/mp4">
</video>

### New Syntax Options in Email Templates

Super-charges your Email Templates with dozens of additional syntax options so that this vision
can become reality.
 
Now you can use all these in your Compose Email window, or in Campaigns, or all the other places where 
Email Templates are used:

| Feature | Goal |
| ------------- | ------------- |
| **Conditions** | If...then...else logic that tests your data and adapts the text.  |
| **Localization** | Text labels respect the user's preferred language. |
| **Date formatting** | Specify how you want your dates shown. |
| **Date operations** | Specify dates as "1st of next month" or "Wednesday next week" and see them translated into specific days in your email. Do date calculus adding days, weeks, etc. |
| **Time zones** | Make your text sensitive to your time zone, or your customer's time zone. |
| **Related records** | Access the records related to the one you're working one. Examples: get subject of latest email form customer, total of outstanding invoices, etc.| 
| **Loops** | Iterate over a number of related records, for example, and create a comma-separated list or a table. | 
| **Maths** | Do mathematical calculations in your templates. |
| **String processing** | Various string operations: change case, concatenate, white-space control, find and replace, word wrap, regular expressions, etc. |
| **Encoding** | Control character encoding. |
| **Currencies** | Advanced currency formatting. |
| **CSS Management** | Include external CSS files from disk. They can be big and complete, but optionally only the **used** styles will actually get copied into the Email, and they will be transformed into inline CSS. |
| and **much** more... | |

### Dynamic Attachments

Since you can also specify email attachments with the enhanced new language, you can

* conditionally send attachments only to some recipients, based on some data in their record
* attach some files only if it's the first time the person is being contacted
* send specific attachments to specific people (for example, each user gets his own monthly invoice)
* with some custom code, generate attachments on the fly, right before sending
* adapt content according to whether the file to be attached exists or not
* change filename while attaching, substituting for a better-looking one ("Your October invoice.pdf" instead of "000342566-Oct-20.pdf")

### Sand-boxed Security

Security is not an after-thought. Full sand-boxing of Templates is available - you can list allowed 
tags and filters one by one. Only white-listed Template options will be executed.

### Extensible

Template functions can be extended in code. So you can develop things like...

* grabbing beautiful Google charts of live data for that customer
* converting currencies with their live-fetched valuations for the day when the email is being sent
* complex calculations on your CRM data, delivered with simplicity to the template for presentation
* consume any external API to get extra live data from your other corporate systems  
* generate time-limited tokens for additional security in tracker links.
* for deliveries, include up-to-date tracker information from your parcel service.
* generate QR codes or other barcodes from record data
* ... and much more!

### Calculated Fields

Oh, did I mention you also get advanced **Calculated fields** 😮 everywhere in SuiteCRM? 

If you double-click to **inline edit** a field, you can insert one of the advanced template formulas in there, 
and it will be converted before saving. Your browser will remember you entered it there once, so they 
are easy to retrieve when you use the same formula often.

This means that a thousand possibilities open up for you: quickly grab data from a related record, 
enter calculated dates, evaluate conditions, etc. 

This add-on is a bomb that multiplies SuiteCRM's usefulness, saves employees' time while increasing 
productivity and sales. 

### Campaigns Improvements

This add-on also adds a much-requested and much-needed feature to Campaigns: the ability to **preview the 
entire Campaign**, seeing all the emails that will be sent out, in one page, with all variables substituted,
before sending the Campaign.

It's only natural that you want to check _what_ you're sending before you send...   

### For End-Users or for Developers?

This all sounds very powerful, and it's not drag-and-drop. You need to write a Template text with some 
codes to handle the transformations described above. 

So yeah, this might not be every end-users cup of tea... maybe some technical help might be needed
for the more complex templates. And yes, they can get complex.

But still, this will be well within the reach of _many_ end-users, who will definitely be able 
to learn their template syntax and make their own, or make adjustments to existing ones. 
Every team out there should have at least one or two people that can do this sort of work, 
and that others can ask for help. 

In fact, what some end-users will love about this is that it frees them from the developers. They will
be able to get their work done, and adjust their CRM processes, without having to go through all the 
hierarchy and budgeting and delays of getting developers to do something for them. 

### Technical Info

Check the [Technical info page](/power-replacer-technical) for details about Requirements, Releases, future features, etc.

## Sponsor Now!

So, what are you waiting for?

[![Sponsor button](../images/sponsor_btn.png) me on Github](https://github.com/sponsors/pgorod) and get 
access to this great SponsorWare add-on!

You will also effectively be **contributing to the SuiteCRM project** as a whole, by keeping
me in the Community working to write code that will **all** eventually be donated into Core!

If enough people sponsor, we will effectively have one more developer working for SuiteCRM - that's
why I could be selling these add-ons in the SuiteCRM Store, for higher prices and forever, but I 
chose not to.

