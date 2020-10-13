---
layout: page
title: PowerFields SuiteCRM Add-On - Technical Info
permalink: /power-fields-technical/
---

## Technical Information

### Introduction

PowerFields is a SponsorWare add-on for SuiteCRM that provides Formulas and Calculated Fields capabilities, 
vastly improving your ability to pre-fill or update data, using conditions, look-ups, etc.

Check out the full [Product page and Demo video](/power-fields).

### Requirements

* SuiteCRM version 7.9 or newer, using the SuiteP Theme.
* PHP version - minimum 7.2.5 (note that PHP.net is no longer supporting 7.2.x, so an even newer version is recommended)

### Current scope of features

* Works with...  
    * Formulas typed directly in Edit view fields.
    * Formulas type directly in fields using Inline edit.
    * default field formulas specified in Studio for new records.
    * default field formulas specified in Studio for record edits.
    * text fields
* does **not** (yet) work with... 
    * other field types (coming soon).
    * specifying formulas in Workflows (replacing the current basic calculated fields found there).

### Ideas for Future Features

* support more field types.
* support for Workflows.

### Releases

* PowerFields v0.5 (Alpha) released on 13th October 2020.
    * Twig Template syntax generically available for fields in the CRM for every record type.
    * formulas can be typed (or pasted) directly in the fields, both from Edit views and Inline edits.
    * formulas can also be specified for automatic application from Studio Field definitions. Separate 
    formulas allowed for application to new records, and for any edits. 
    * the Studio formulas can use the information typed in the field during edits; this enables writing 
    "smart replace" formulas to turn simple expressions into more elaborate texts, saving user's time.  
    * Smart context gives you access to more beans in your variables: not just the current records, but also 
    assigned users, etc.
    * Custom Twig functions provided: `related` (navigate relationships no reach nearby beans), 
    `photo` (provide image from bean image fields), `owner` (find bean from email address), `recent`
    (access the most recently visited bean from a certain module), and more.



