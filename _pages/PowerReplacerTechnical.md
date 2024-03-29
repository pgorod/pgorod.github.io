---
layout: page
title: Power Replacer SuiteCRM Add-On - Technical Info
permalink: /power-replacer-technical/
---

## Technical Information

### Introduction

PowerReplacer is a SponsorWare add-on for SuiteCRM that provides enhanced Templating capabilities, 
vastly improving regular emails and campaigns.

Check out the full [Product page and Demo video](/power-replacer).

### Requirements

* SuiteCRM version 7.12.x, using the SuiteP Theme
* (if you're still with SuiteCRM 7.11.x, ask me for a possible partial compatibility)
* PHP version - minimum 7.3
* SuiteCRM 8.x support coming soon!

### Documentation 

To learn how to use Templates, and details on the language options available, check out 
the [Templates Documentation](/templates-documentation).

### Current scope of features

* Works with...
    * Emails module, Compose Window
    * Compose Window, launched as a pop-up from other modules' Activities subpanel.
    * Templates defined in the Email Templates module.
    * Templates defined in the PDF Templates module, which appear as **Print to PDF** option in each
    module's Detail view. 
    * Emails sent from Campaigns module.
    * Emails sent from Workflows.
    * The "Direct HTML" email editor (as chosen on each user's profile)
* does **not** (yet) work with... 
    * Email notifications (meeting reminders, assignments, etc).
    * other emails sent automatically by SuiteCRM (automatic replies, password confirmations, double opt-in, etc) 
    * the variables drop-downs on the screens to edit emails or templates are still using the old variables scheme. 
    All entry of variable names for the new functionality is currently manual.
    * The other email editors (as chosen on each user's profile). You can't use TinyMCE or Mozaik. 
    These editors are part of the problem, not the solution, im my humble opinion. You can't produce decent HTML for 
    elaborate automated emails from them - that's not what they're designed to do.
    * Security Groups: for now, users can navigate data from within templates, regardless of Roles and Security groups 
    settings. An alternative security scheme can still provide you with some control: you can limit access by allowed 
    Twig functions and filters (sandbox); and you can make any critical data only accessible via a custom filter, 
    where you can check Security Groups from PHP code.  

### Ideas for Future Features

* keep improving the Emails experience
* keep improving the Campaigns experience
* add templates to auto-replies (Cases module)

### Releases

* PowerReplacer v0.7 (Beta) released on 1st July 2022.
    * Added templated Emails from Workflows
    * Added partial 7.11.x compatibility for people who haven't upgraded yet.
    * Refactoring
    * More configurable

* PowerReplacer v0.5 (Beta) released on 30th July 2020.
    * Twig Template syntax available on Emails Module, Compose View, with Preview option
    * Same for Campaigns Emails
    * Full Campaign previews
    * Smart context gives you access to more beans in your variables: not just the current records, but also 
    assigned users, beans retrieved from email `to`, `cc` and `bcc` fields, system options, etc.
    * Custom Twig functions provided: `related` (navigate relationships to reach nearby beans), 
    `photo` (provide image from bean image fields), `owner` (find bean from email address), `recent`
    (access the most recently visited bean from a certain module), `attach` (evaluate an expression and
    use it as the name of a file to attach to email)   


