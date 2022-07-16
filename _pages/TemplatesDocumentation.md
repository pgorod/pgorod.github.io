---
layout: page
title: Templates Documentation
permalink: /templates-documentation/
---

## Introduction

My PowerTools add-ons (PowerFields and PowerReplacer) for SuiteCRM allow you to use variables and other "low-code" constructs into 
your SuiteCRM emails and PDF's.

This page provides some syntatic details and examples to help learn that.

## Most of it is Twig!

Twig is the templating language that comes with the famous PHP framework Symfony. And that is essentially what my add-ons templating 
language is built on. So head over to their Documentation, the official [Twig v.3.x Docs](https://twig.symfony.com/doc/3.x/).

You'll probably just need to use the Section titled **Twig for Template Designers**. If you're a developer looking to extend the 
language with custom code, then you'll also be interested in **Twig for Developers** section.

## My additions to Twig for SuiteCRM purposes


Twig extensions provided by PowerFields and PowerReplacer for SuiteCRM:

* owner($emailAddress)
  Twig Function. Receives an email address or an email address array. Returns a Target, Contact, Lead or Account bean.

  Given an email address, return the best bean that matches that email address. This tries to be clever and uses weights by module type, and prefers primary addresses. Example usage: owner(cc|first) gives you a contact bean whose email address was the first CC address for an email.

- bean($module, $id)
  Twig Function. Receives a module name (accepts both upper and lower case initial) and a bean id of that module. Returns the bean.

#### recent($module = '')
  Twig Function. Receives an optional module name. Returns and array.
  Given a module name, or no module at all, returns an array of Beans that were "Recently Used", similar to the one found on the left-hand column in the UI. If given a module name, that array is filtered to include only records from that module.
  
cancel($msg = '', $condition = true)
  Twig Funtion. Receives an optional message text and an optional boolean. Doesn't return anything.
  Triggers an exception in the template handling if the $condition is true (does nothing if it false). Uses the optional message text as part of the exception message. Use to allow the template itself to test validity and eventually block the action (for example, don't send the email if some part is missing).

related($relatedModule)
   Twig filter. Applied to a Bean object, and given a module name, returns an array of related Bean objects of that module.
   A couple of usage examples: contact|related(account)      contact|related(quotes)|last
   The module name can be loosely-defined, you can use 'leads' or 'Leads', and 'quotes' or 'aos_quotes'.
   Traverses middle tables in one movement, where appropriate; to get from 'leads' to 'quotes' you don't have to worry about the relationship table 'leads_quotes'. 
   
photo
   Twig filter. Applied to a Bean with a photo field. Returns a string.
   Copies the photo file to the 'public' directory so it can be accessed externally by email recipients. Returns a valid HTML IMG tag with the photo's address.
   
render
   Twig filter. Applied to a string. Returns string.
   Transforms a Twig template received as a string into its rendered HTML. Could be used to apply templates stored in the database.

topdf($fileName = '')
   Twig filter. Applied to PDF template bean. Receives optional file name. Returns the filename.
   Creates a PDF file on the server, rendering the PDF Template through the same Twig engine.
   The filename can be provided, or it will use a default ($sugar_config['upload_dir'] . 'topdf.pdf';) and that name will be returned.
   
attach($displayName = '') 
   Twig Filter. Applied to an array containing either filenames or Note objects. Receives optional string. Returns nothing.
   Use to attach files to emails, either by getting them directly from the server disk, or from files attached to Notes beans.
   (this double possibility makes it easy to use for attachements in Email and PDF templates).
   If a display Name is provided, the email is sent with a "pretty name" for the attachment, which doesn't have to match the file name.
   Technical note: has side-effects, creates $this->pickedObjects and $this->files2Attach arrays with attached Notes and files. These are not seen by the rest of the template, but are essential to affect the code calling this template, so that the emails are actually sent with these attachments.

Special values made available to templates. 

Ways of triggering these templates:

1. Go to an edit view, or double-click in Detail view to trigger an inline edit, and type a template directly. 
I suggest {% raw %}{{ 2 + 2 }}{% endraw %} as an initial test. It should get saved as "4". you might need to 
refresh the screen to see the change. Note that the field must start with that {% raw %}{{{% endraw %} in the very first position 
(this can be configured differently).

2. 



- try formula in inlineEdit, several field types

- try context "was" and "were.name"

- go in Studio, cases, field description, set autonew and auto

- in those, try context "currentEdit"

