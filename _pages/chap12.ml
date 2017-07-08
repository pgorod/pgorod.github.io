---
permalink: "/chap12.html"
layout: page
title: "Chapter 12"
---
<span id="chap11.xhtml"></span>

<div>

## <span class="section-number">12. </span>Logic Hooks ##

### Intro ###

Logic hooks allow you to hook into various events in SuiteCRM to fire custom code. This can allow you to, for example, make a call to an external API, or to create a new record if certain events occur.

### Types ###

Logic hooks can occur in three contexts. These contexts are Application Hooks, Module Hooks and User Hooks. These are detailed below.

### Application Hooks ###

Application hooks are hooks which are fired in the application context (that is, they are not fired against a particular module). These hooks must be defined in the top level logic hook (i.e. <code>custom/modules/logic_hooks.php</code>).

; after_entry_point
: Called after SuiteCRM has initialised but before any other processing is carried out.
; after_ui_footer
: Called after the UI footer.
; after_ui_frame
: Fired after the UI has been displayed but before the footer has been displayed.
; server_round_trip
: Fired at the end of every page request.

### User Hooks ###

User hooks are fired for certain login/logout actions. Similar to Application Hooks, these hooks must be defined in the top level logic hook (i.e. custom/modules/logic_hooks.php).

; after_login
: Fired after a user logs in to SuiteCRM .
; after_logout
: Fired when a user logs out of SuiteCRM.
; before_logout
: Fired before a user logs out of SuiteCRM.
; login_failed
: Fired when a user attempts to login to SuiteCRM but the login fails.

### Module Hooks ###

Module Hooks are called on various record actions for a specific module.

; after_delete
: Fired when a record is deleted.
; after_relationship_add
: Fired after a relationship is added between two records. Note that this may be called twice, once for each side of the relationship.
; after_relationship_delete
: Fired after a relationship between two records is deleted.
; after_restore
: Fired after a record is undeleted.
; after_retrieve
: Fired after a record is retrieved from the DB.
; after_save
: Fired after a record is saved. Note that due to some peculiarities some related modules may not be persisted to the database. The logic hook is fired within the SugarBean classes save method. Some implementing classes may save related beans after this method returns. A notable example of this is the saving of email addresses in Company modules.
; before_delete
: Fired before a record is deleted.
; before_relationship_add
: Fired before a relationship is added between two records. Note that this may be called twice, once for each side of the relationship.
; before_relationship_delete
: Fired before a relationship between two records is deleted. Note that this may be called twice, once for each side of the relationship.
; before_restore
: Fired before a record is undeleted.
; before_save
: Fired before a record is saved.
; handle_exception
: Fired when an exception occurs in a record.
; process_record
: Fired when a record is processed ready to be displayed in list views or dashlets.

### Job Queue Hooks ###

Job queue hooks are fired for scheduler jobs. Similar to application hooks these hooks must be defined in the top level logic hook (i.e. <code>custom/modules/logic_hooks.php</code>).

; job_failure
: Fired when a scheduled job either returns false to signify failure or throws an exception and it will not be retried. See the section on [[#chap12.xhtml#scheduled-tasks-chapter|Scheduled Tasks]].
; job_failure_retry
: Fired when a scheduled job either returns false to signify failure or throws an exception but it will be retried. See the section on [[#chap12.xhtml#scheduled-tasks-chapter|Scheduled Tasks]].

### Implementing ###

Depending on the Logic Hook type logic hooks are either placed into<br />
<code>custom/modules/Logic_Hooks.php</code> or <code>custom/modules/&lt;TargetModule&gt;/Logic_Hooks.php</code>.

#### Logic_Hooks.php ####

The logic hook file itself specifies which logic hooks to fire on this event. It looks something like this:

<div class="code-block">

Example 12.1: Logic hook file


-----

<div class="highlight">

<pre> 1 &lt;?php
 2 // Do not store anything in this file that is not part of the array or the hook
 3 //version.  This file will be automatically rebuilt in the future.
 4  $hook_version = 1;
 5 $hook_array = Array();
 6 // position, file, function
 7 $hook_array['before_save'] = Array();
 8 $hook_array['before_save'][] = Array(
 9                               77,
10                               'updateGeocodeInfo',
11                               'custom/modules/Cases/CasesJjwg_MapsLogicHook.php',
12                               'CasesJjwg_MapsLogicHook',
13                               'updateGeocodeInfo');
14 $hook_array['before_save'][] = Array(
15                               10,
16                               'Save case updates',
17                               'modules/AOP_Case_Updates/CaseUpdatesHook.php',
18                               'CaseUpdatesHook',
19                               'saveUpdate');
20 $hook_array['before_save'][] = Array(
21                               11,
22                               'Save case events',
23                               'modules/AOP_Case_Events/CaseEventsHook.php',
24                               'CaseEventsHook',
25                               'saveUpdate');
26 $hook_array['before_save'][] = Array(
27                               12,
28                               'Case closure prep',
29                               'modules/AOP_Case_Updates/CaseUpdatesHook.php',
30                               'CaseUpdatesHook',
31                               'closureNotifyPrep');
32 $hook_array['before_save'][] = Array(
33                               1,
34                               'Cases push feed',
35                               'custom/modules/Cases/SugarFeeds/CaseFeed.php',
36                               'CaseFeed',
37                               'pushFeed');
38 $hook_array['after_save'] = Array();
39 $hook_array['after_save'][] = Array(
40                               77,
41                               'updateRelatedMeetingsGeocodeInfo',
42                               'custom/modules/Cases/CasesJjwg_MapsLogicHook.php',
43                               'CasesJjwg_MapsLogicHook',
44                               'updateRelatedMeetingsGeocodeInfo');
45 $hook_array['after_save'][] = Array(
46                               10,
47                               'Send contact case closure email',
48                               'modules/AOP_Case_Updates/CaseUpdatesHook.php',
49                               'CaseUpdatesHook',
50                               'closureNotify');
51 $hook_array['after_relationship_add'] = Array();
52 $hook_array['after_relationship_add'][] = Array(
53                               77,
54                               'addRelationship',
55                               'custom/modules/Cases/CasesJjwg_MapsLogicHook.php',
56                               'CasesJjwg_MapsLogicHook',
57                               'addRelationship');
58 $hook_array['after_relationship_add'][] = Array(
59                               9,
60                               'Assign account',
61                               'modules/AOP_Case_Updates/CaseUpdatesHook.php',
62                               'CaseUpdatesHook',
63                               'assignAccount');
64 $hook_array['after_relationship_add'][] = Array(
65                               10,
66                               'Send contact case email',
67                               'modules/AOP_Case_Updates/CaseUpdatesHook.php',
68                               'CaseUpdatesHook',
69                               'creationNotify');
70 $hook_array['after_relationship_delete'] = Array();
71 $hook_array['after_relationship_delete'][] = Array(
72                               77,
73                               'deleteRelationship',
74                               'custom/modules/Cases/CasesJjwg_MapsLogicHook.php',
75                               'CasesJjwg_MapsLogicHook',
76                               'deleteRelationship');</pre>

</div>

-----


</div>
Let’s go through each part of the file.

<div class="code-block">

<div class="highlight">

<pre>4 $hook_version = 1;</pre>

</div>

</div>
This sets the hook version that we are using. Currently there is only one version so this line is unused.

<div class="code-block">

<div class="highlight">

<pre>5 $hook_array = Array();</pre>

</div>

</div>
Here we set up an empty array for our Logic Hooks. This should always be called $hook_array.

<div class="code-block">

<div class="highlight">

<pre>7 $hook_array['before_save'] = Array();</pre>

</div>

</div>
Here we are going to be adding some before_save hooks so we add an empty array for that key.

<div class="code-block">

<div class="highlight">

<pre> 8 $hook_array['before_save'][] = Array(
 9                               77,
10                               'updateGeocodeInfo',
11                               'custom/modules/Cases/CasesJjwg_MapsLogicHook.php',
12                               'CasesJjwg_MapsLogicHook',
13                               'updateGeocodeInfo');</pre>

</div>

</div>
Finally we reach an interesting line. This adds a new logic hook to the before_save hooks. This array contains 5 entries which define this hook. These are:

####= Sort order ####=

The first argument (77) is the sort order for this hook. The logic hook array is sorted by this value. If you wish for a hook to fire earlier you should use a lower number. If you wish for a hook to be fired later you should use a higher number. The numbers themselves are arbitrary.

####= Hook label ####=

The second argument (‘updateGeocodeInfo’) is simply a label for the logic hook. This should be something short but descriptive.

####= Hook file ####=

The third argument is where the actual class for this hook is. In this case it is in a file called <code>custom/modules/Cases/CasesJjwg_MapsLogicHook.php</code>. Generally you will want the files to be somewhere in custom and it is usual to have them in <code>custom/modules/&lt;TheModule&gt;/&lt;SomeDescriptiveName&gt;.php</code> or <code>custom/modules/&lt;SomeDescriptiveName&gt;.php</code> for Logic Hooks not targeting a specific module. However the files can be placed anywhere.

####= Hook class ####=

The fourth argument is the class name for the Logic Hook class. In this case<br />
<code>CasesJjwg_MapsLogicHook</code>. It is usual for the class name to match the file name but this is not required.

####= Hook method ####=

The fifth, and final, argument is the method that will be called on the class. In this case <code>updateGeocodeInfo</code>.

#### Adding your own logic hooks ####

When adding logic hooks you should make full use of the Extensions framework (see the section on Extensions). This involves creating a file in<br />
<code>custom/Extension/application/Ext/LogicHooks/</code> for application hooks and<br />
<code>custom/Extension/modules/&lt;TheModule&gt;/Ext/LogicHooks/</code> for module specific hooks. These files can then add to/alter the <code>$hook_array</code> as appropriate.

{|
|width="50%"| [[File:images/leanpub_info-circle.png|50px|class=sidebar-image|information]]
|width="50%"| After adding a new logic hook it is necessary to perform a quick repair and rebuild in the admin menu for this to be picked up.
|}

#### Logic Hook function ####

The logic hook function itself will vary slightly based on the logic hook type. For module hooks it will appear similar to:

<div class="code-block">

Example 12.2: Example logic hook method


-----

<div class="highlight">

<pre>1     class SomeClass
2     {
3         function someMethod($bean, $event, $arguments)
4         {
5           //Custom Logic
6         }
7     }</pre>

</div>

-----


</div>
Application logic hooks omit the $bean argument:

<div class="code-block">

Example 12.3: Example logic hook method for application hooks


-----

<div class="highlight">

<pre>1     class SomeClass
2     {
3         function someMethod($event, $arguments)
4         {
5           //Custom Logic
6         }
7     }</pre>

</div>

-----


</div>
####= $bean (<code>SugarBean</code>) ####=

The $bean argument passed to your logic hook is usually the bean that the logic hook is being performed on. For User Logic Hooks this will be the current User object. For module logic hooks (such as <code>before_save</code>) this will be the record that is being saved. For job queue logic hooks this will be the SchedulersJob bean. Note that for Application Logic Hook this argument is not present.

####= $event (<code>string</code>) ####=

The $event argument contains the logic hook event e.g <code>process_record</code>, <code>before_save</code>,<br />
<code>after_delete</code> etc.

####= $arguments (<code>array</code>) ####=

The $arguments argument contains any additional details of the logic hook event. I.e. in the case of before_relationship_add this will contain details of the related modules.

### Tips ###

{|
|width="50%"| [[File:images/leanpub_info-circle.png|50px|class=sidebar-image|information]]
|width="50%"|
#### Triggering extra logic hooks ####

If you are performing certain actions that may trigger another logic hook (such as saving a bean) then you need to be aware that this will trigger the logic hooks associated with that bean and action. This can be troublesome if this causes a logic hook loop of saves causing further saves. One way around this is to simply be careful of the hooks that you may trigger. If doing so is unavoidable you can usually set an appropriate flag on the bean and then check for that flag in subsequent hooks.
|}

{|
|width="50%"| [[File:images/leanpub_info-circle.png|50px|class=sidebar-image|information]]
|width="50%"|
#### Think of the user ####

Most logic hooks will cause additional code which can degrade the users experience. If you have long running code in the after_save the user will need to wait for that code to run. This can be avoided by either ensuring the code runs quickly or by using the Job Queue (see the Job Queue chapter for more information).
|}


</div>
