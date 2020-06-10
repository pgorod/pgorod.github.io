---
layout: page
title: Power Workflows SuiteCRM Add-On
permalink: /power-workflows/
---

### Somewhere between automatic and manual, there lies **Productivity**...

In SuiteCRM, with Workflows you can automatically react to an event. 
You can also have Workflows go over all your records in a certain module. Meanwhile, your users 
work on manually reviewing and actioning other things in the CRM.

When these manual things are laborious and repetitive, waste your Users' time, and are prone 
to manual error, that's when you feel the need for something more.

Workflows are a great way to define a sequence of actions to apply on a record, all from 
a graphical UI. If only it was easier to trigger them right there, on the spot, when looking at
a record...

### Workflows you can trigger manually from Views!

So, [my sponsors on Github](https://github.com/sponsors/pgorod) get access to this great add-on 
which will greatly increase the power of SuiteCRM. This will convert to happier users and 
saved money in your organization, in no time.

While setting up a Workflow, you get a new option in the **Run** dropdown:

![New option in "Run" dropdown](../images/pw_dropdown.png)

This marks the Workflow as something that will not be run when some scheduler runs, 
or when some record is changed, but rather **when a user decides** to run it on a record she 
has on the screen in front of her.

#### Run Workflows from the Detail view action buttons

In each record (any kind, including custom modules), you will get a new **Action button** 
called **Run Workflows** on the top. Here we show the menu as separate buttons, but it's
also there if your System Settings define it's a dropdown menu instead.

![New button in Detail view Action buttons](../images/pw_detail.png)

Pressing that button will invoke all Workflows with these characteristics, on the current record:
* marked as Active
* applicable to the current module
* marked as **From User Actions in Views** in the **Run** dropdown
* the conditions on the Workflow are true for the current record

#### Run Workflows from any Sub-panel in Detail views

In each record (any kind, including custom modules), you will get a new **Action button** 
called **Run Workflows** on the top. Here we show the menu as separate buttons, but it's
also there if your System Settings define it's a dropdown menu instead.

![New button in Detail view Action buttons](../images/pw_subpanel.png)

