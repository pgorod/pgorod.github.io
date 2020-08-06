---
layout: page
title: Power Replacer SuiteCRM Add-On - Technical Info
permalink: /power-replacer-technical/
---

## Technical Information

### Introduction

PowerReplacer is a SponsorWare add-on for SuiteCRM that provides enhanced Templating capabilities, 
vastly improving regular emails, campaigns, and even ordinary fields.

Check out the full [Product page and Demo video](/power-replacer).

### Requirements

* SuiteCRM version 7.9 or newer, using the SuiteP Theme.
* PHP version - minimum 7.2.5 (note that PHP.net is no longer supporting 7.2.x, so an even newer version is recommended)

### Ideas for Future Features

* keep improving the Emails experience
* keep improving the Campaigns experience
* extend these templating capabilities to PDF generation.

### Releases

* PowerReplacer v0.5 (Alpha) released on 30th July 2020.
    * Twig Template syntax available on Emails Module, Compose View, with Preview option
    * Same for Campaigns Emails
    * Full Campaign previews
    * Smart context gives you access to more beans in your variables: not just the current records, but also 
    assigned users, beans retrieved from email `to`, `cc` and `bcc` fields, system options, etc.
    * Custom Twig functions provided: `related` (navigate relationships no reach nearby beans), 
    `photo` (provide image from bean image fields), `owner` (find bean from email address), `recent`
    (access the most recently visited bean from a certain module), `attach` (evaluate an expression and
    use it as the name of a file to attach to email)   
    * ability to use templates from any field anywhere in CRM (calculated fields).


