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
language is built on. So head over to their Documentation, the official [Twig v.3.x Docs](https://twig.symfony.com/doc/3.x/), 
95% of what you need to know is there!

You'll probably just need to use the Section titled **Twig for Template Designers**. If you're a developer looking to extend the 
language with custom code, then you'll also be interested in **Twig for Developers** section.

## My additions to Twig for SuiteCRM purposes

Twig extensions provided by PowerFields and PowerReplacer for SuiteCRM:

#### owner($emailAddress)
Twig Function. Receives an email address or an email address array. Returns a Target, Contact, Lead or Account bean.

Given an email address, return the best bean that matches that email address. 
This tries to be clever and uses weights by module type, and prefers primary addresses. 
Example usage: owner(cc|first) gives you a contact bean whose email address was the first CC address for an email.

#### bean($module, $id)
 Twig Function. Receives a module name (accepts both upper and lower case initial) and a bean id of that module. Returns the bean.

#### recent($module = '')
 Twig Function. Receives an optional module name. Returns and array.
 Given a module name, or no module at all, returns an array of Beans that were "Recently Used", similar to 
the one found on the left-hand column in the UI. If given a module name, that array is filtered to include 
only records from that module.
 
#### cancel($msg = '', $condition = true)
 Twig Function. Receives an optional message text and an optional boolean. Doesn't return anything.
 Triggers an exception in the template handling if the $condition is true (does nothing if it false). Uses the optional 
message text as part of the exception message. Use to allow the template itself to test validity and eventually 
block the action (for example, don't send the email if some part is missing).

#### related($relatedModule)
 Twig filter. Applied to a Bean object, and given a module name, returns an array of related Bean objects of that module.
 A couple of usage examples: contact|related(account)  contact|related(quotes)|last
 The module name can be loosely-defined, you can use 'leads' or 'Leads', and 'quotes' or 'aos_quotes'.
 Traverses middle tables in one movement, where appropriate; to get from 'leads' to 'quotes' you don't have to worry 
about the relationship table 'leads_quotes'. 
 
#### photo
 Twig filter. Applied to a Bean with a photo field. Returns a string.
 Copies the photo file to the 'public' directory so it can be accessed externally by email recipients. 
Returns a valid HTML IMG tag with the photo's address.
 
#### render
 Twig filter. Applied to a string. Returns string.
 Transforms a Twig template received as a string into its rendered HTML. Could be used to apply templates stored in the database.

#### topdf($fileName = '')
 Twig filter. Applied to PDF template bean. Receives optional file name. Returns the filename.
 Creates a PDF file on the server, rendering the PDF Template through the same Twig engine.
 The filename can be provided, or it will use a default ($sugar_config['upload_dir'] . 'topdf.pdf';) and that name will be returned.
 
#### attach($displayName = '') 
 Twig Filter. Applied to an array containing either filenames or Note objects. Receives optional string. Returns nothing.
 Use to attach files to emails, either by getting them directly from the server disk, or from files attached to Notes beans.
 (this double possibility makes it easy to use for attachements in Email and PDF templates).
 If a display Name is provided, the email is sent with a "pretty name" for the attachment, which doesn't have to match the file name.
 **Technical note**: has side-effects, creates `$this->pickedObjects` and `$this->files2Attach` arrays with attached Notes and files. 
These are not seen by the rest of the template, but are essential to affect the code calling this template, 
so that the emails are actually sent with these attachments.

### Special objects and values made available to templates

Every time PowerReplacer or PowerFields are setting up to apply your template in a given situation, they will 
"look around" for the most appropriate and useful contextual information to pass into the template. 
If you're in an Edit view of a Quote, you will have a `quote` object available with all the fields. If you are sending an Email 
you will have access both to the SuiteCRM record related to the Email, and some other things like 
the Email recipients and attachments.

`{moduleName}` - Whichever module name makes sense to have in that situation: `contact`, `quote`, etc. Note that this is 
just the actual record you're working from, so only one module name will be available, not all. Of course, you can 
use the `related` filter to navigate to adjacent records.

`person` - if using Accounts, Leads, Users, Contacts or Targets, an additional generic pseudo-module-name will 
be available: `person`. This facilitates sending campaigns to multiple types while writing expressions that apply to all
of them such as `person.name`.

`module` - the name of the module you're on.

`field` - when applicable, the name of the field you're editing.

`site_url` - the value of the property with the same name that you can define in `config.php`. This is applicable to email
templates and is typically used to make up URLs pointing to resources in your site. See the `photo` filter for easier 
ways to include images.

`thisEmail` - Email object that the template is working on at the moment. 

`inboundEmail` - applicable in auto-replies only. Contains Email object of the incoming Email being replied to. 

### Ways of triggering these templates:

1. Go to an **Edit view**, or double-click in Detail view to trigger an **Inline Edit**, and type a template directly. 
I suggest `{% raw %}{{ 2 + 2 }}{% endraw %}` as an initial test. It should get saved as "4". you might need to 
refresh the screen to see the change. Note that the field must start with that `{% raw %}{{{% endraw %}` in the very first position 
(this can be configured differently).

2. **From the Emails Compose** window by typing a template directly in the `Subject` or `Body` fields. Of course, 
more often you will want to pull in a predefined template from the Email Templates module. Note the **Preview** 
button at the bottom, it is really helpful to see the produced results and check everything looks ok before you send.

3. **From Email Campaigns**. Note the new "Check all" button at the bottom of the last step in the wizard, it will give you a 
complete Campaign Preview.

4. **From Workflows**, with a new Action called "Send PowerReplacer Email". Check the logs in case the email doesn't get sent.

5. You can create PDFs from PowerReplacer templates from **Print as PDF** action in detail views, and as **PDF attachments**
using the `topdf` filter inside Email templates.

## Some examples

This is the template used for nice-looking emails in my Demo video:
```
{% raw %}
{%- apply inline_css(source("custom_css")) -%}
{%- apply nl2br-%}
{% set quote = person|related('aos_quotes')|last %}
{% set assigned = bean('users', person.assigned_user_id) %}
<p>{{ (person.sex_c=='M') ? 'Mon cher' : 'Ma chère' }} {{ person.name }},
 
Your recent quote received at {{ quote.date_modified|date("F jS g:ia", "Europe/Rome") }} (your local time) is being processed. If you approve the Quote today, estimated expedition date is <b>{{ now | date_modify('+ 3 weekdays') | date("F jS", "Europe/Rome") }}</b>.

</p>
{%- endapply -%}
{{ include("products.html") }}
{{ include("signature.html") }}
{{ attach('upload' ~ '/terms.pdf', 'Terms & Conditions.pdf') }}
{%- endapply -%}

{% endraw %}
```

This references a few other files that get included:

**products.html**:
```html
{% raw %}
{%- apply inline_css(source("custom_css")) -%}
<table>
    <thead>
    <tr>
        <th>Name</th><th>Image</th><th>Value</th>
    </tr>
    </thead>
    <tbody>
    {% for item in quote|related('aos_products') %}
    <tr>
        <td>{{ item.name|raw }}</td>
        <td>{{ item|photo }}</td>
        <td class="price">{{ item.price|format_currency('EUR') }}</td>
    </tr>
    {% endfor %}
    <tr>
        <td><b>Total (EUR):</b></td>
        <td></td>
        <td class="price"><b>{{ quote.total_amt|format_currency('EUR') }}</b></td>
    </tr>
    </tbody>
</table>
{%- endapply -%}
{% endraw %}
```

**signature.html**:
```html
{% raw %}
{%- apply inline_css(source("custom_css")) -%}
<p></p>
<table>
    <tbody>
    <tr>
        <td>{{ assigned|photo }}</td>
        <td><b>{{ assigned.name }}</b> is standing by to assist you with this purchase.<br/>Questions? Please dial {{ assigned.phone_work }} (Office), {{ assigned.phone_mobile }} (Mobile) or simply reply to this email.</td>
        <td><img src="http://voipalameda.no-ip.org:201/public/emailImages/hopeShoes.png" width=80></td>
    </tr>
    </tbody>
</table>
{%- endapply -%}
{% endraw %}
```

The **custom_css** reference loads a file from `custom/pgr/PowerReplacer/custom_styles.css` which you can edit to fit 
your tastes and needs:
```css
{% raw %}
@media screen {
  @font-face{
    font-family:'Lato';
    font-style:normal;
    font-weight:400;
    src:local('Lato'), url('http://fonts.gstatic.com/s/opensans/v10/cJZKeOuBrn4kERxqtaUH3bO3LdcAZYWl9Si6vvxL-qU.woff') format('woff');
  }
}

body, p, th, td {
  font-family: 'Lato', 'Lucida Grande', 'Lucida Sans Unicode', Tahoma, Sans-Serif;
}

table {
  border: solid 1px #DDEEEE;
  border-collapse: collapse;
  border-spacing: 0;
  font: normal 13px Lato, sans-serif;
}
table thead th {
  background-color: #58638f;
  border: solid 1px #DDEEEE;
  color: white;
  padding: 10px;
  text-align: left;
}
table tbody td {
  border: solid 1px #DDEEEE;
  color: #333;
  padding: 10px;
}
td.price {
  text-align: right;
}
{% endraw %}
```


