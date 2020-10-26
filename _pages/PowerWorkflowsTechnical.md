---
layout: page
title: Power Workflows SuiteCRM Add-On - Technical Info
permalink: /power-workflows-technical/
---

## Technical Information

### Introduction

It is a SponsorWare add-on for SuiteCRM that provides enhanced Workflow capabilities, 
by adding buttons in views that manually trigger Workflows.

Check out the full [Product page and Demo video](/power-workflows).

### Requirements

* SuiteCRM version 7.9 or newer, using the SuiteP Theme.
* PHP version - any that works with SuiteCRM

### Ideas for Future Features

#### 1. Localization

Allow translating the button text.

#### 2. Separate Buttons

The most obviously needed feature is to change the buttons in Views so that they trigger 
_specific_ Workflows, instead of saying **Run Workflows** and running all applicable ones.

This also implies removing the buttons when there are no applicable Workflows.

This requires overcoming a few technical challenges:

* find a nice way to allow you to configure the Workflows with options meant for this feature. 
If I was working in Core, I would just add fields with new options to the Workflows Edit view.
As an add-on, I am more limited.
* since the code generating the buttons goes into every view in SuiteCRM, it needs to be performant.
I need to find efficient ways to load and compute the whole array of possible Workflows for 
every module, I'd prefer not to repeat that work every time a page loads.  

#### 3. Asynchronous Operations

For the longer-running operations, such as the ones triggered from List Views with many records, 
it would be better to execute asynchronously, without hanging the UI while waiting for the 
operation to complete. Since I am already in an AJAX call that easily lends itself to being 
made asynchronous, it would be nice to allow for that.  

#### 4. Security Groups Options

I'd like to add the ability to restrict the presence of each specific Workflow button with 
the usual SuiteCRM **Security Groups** and **Roles**. This way you could easily configure who has
which buttons available to them.  

### Releases

* PowerWorkflows v0.5 (Alpha) released on 15th June 2020.
    * "Run Workflows" buttons added in Detail views, all Subpanels, and List views.
    * Small report shown when hovering button after execution.
    * Handles the two kinds of Action menus in Detail Views (according 
    to **`Admin / System Settings / Display actions within menus`**.
    * Handles special subpanels like **History** and **Activities**, where record type is variant.

