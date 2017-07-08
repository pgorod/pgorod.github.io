---
permalink: "/chap07.html"
layout: page
title: "Chapter 07"
---
<span id="chap06.xhtml"></span>

<div>

## <span class="section-number">7. </span>Controllers ##

SuiteCRM follows the MVC (Model-View-Controller) pattern and as such has the concept of controllers. The controller is responsible for making changes to the Model as well as passing control to the view as appropriate. SuiteCRM has the concept of actions which are actions that will be taken by the controller. Let’s take a look at a SuiteCRM URL:

<div class="code-block">

Example 7.1: Example SuiteCRM URL


-----

<div class="highlight">

<pre>example.com/index.php?module=Accounts&amp;action=index</pre>

</div>

-----


</div>
In this (rather boring) example we see that the module is Accounts. This will determine which controller to use and then call the index action on that controller.

SuiteCRM will first look for the controller in <code>custom/module/&lt;TheModule&gt;/controller.php</code>. If this is not found then next <code>module/&lt;TheModule&gt;/controller.php</code> will be checked. Finally if neither of these controllers exist then the default controller will be used. The default controller can be found in <code>include/MVC/Controller/SugarController.php</code>.

### Customising controllers ###

Ordinarily the default controller handles the request and delegates to the appropriate views etc. However custom controllers can be used to add or alter functionality. Let’s look at adding a new action.

In the first instance we will have to add our custom controller. This will vary slightly depending on the nature of the module.

#### Custom module ####

In this case we can place the file directly into our module. You should create a new file (if it doesn’t exist) at <code>modules/&lt;TheModule&gt;/controller.php</code>. The contents will look similar to:

<div class="code-block">

Example 7.2: Creating a custom controller for a custom module


-----

<div class="highlight">

<pre>1 &lt;?php
2 if(!defined('sugarEntry') || !sugarEntry) die('Not A Valid Entry Point');
3 class &lt;TheModule&gt;Controller extends SugarController
4 {
5 
6 }</pre>

</div>

-----


</div>
#### Pre-existing modules ####

For pre-existing modules you should add the controller to<br />
<code>custom/modules/&lt;TheModule&gt;/controller.php</code>.

The contents of this file will vary depending on whether you wish to extend the existing controller (if it exists) or create your own version completely. It is usually best to extend the existing controller since this will retain important logic. You should note the naming convention here. We name the class<br />
<code>Custom&lt;TheModule&gt;Controller</code>.

Here we don’t extend the existing controller or no such controller exists:

<div class="code-block">

Example 7.3: Creating a custom controller for an existing module


-----

<div class="highlight">

<pre>1 &lt;?php
2 if(!defined('sugarEntry') || !sugarEntry) die('Not A Valid Entry Point');
3 class Custom&lt;TheModule&gt;Controller extends SugarController
4 {
5 
6 }</pre>

</div>

-----


</div>
Alternatively we extend the existing controller. Note that we are requiring the existing controller:

<div class="code-block">

Example 7.4: Creating a custom controller for an existing module with an existing controller


-----

<div class="highlight">

<pre>1 &lt;?php
2 if(!defined('sugarEntry') || !sugarEntry) die('Not A Valid Entry Point');
3 
4 require_once 'modules/&lt;TheModule&gt;/controller.php';
5 
6 class Custom&lt;TheModule&gt;Controller extends &lt;TheModule&gt;Controller
7 {
8 
9 }</pre>

</div>

-----


</div>
#### Adding the action ####

Now we can add a new action to our controller. Actions are created as methods on the controller with the name <code>action_&lt;actionName&gt;</code>. For example, to create a new action called ‘echo’ we could create the following method in one of the controllers we have created above. This can then perform whatever logic that is needed. In our example we will log the REQUEST and simply redirect:

<div class="code-block">

Example 7.5: Adding a custom controller action method


-----

<div class="highlight">

<pre>1 public function action_echo(){
2   $GLOBALS['log']-&gt;debug(&quot;Echo called with request: &quot;.print_r($_REQUEST,1));
3   SugarApplication::redirect('index.php');
4 }</pre>

</div>

-----


</div>
#### Legacy Style ####

In previous versions of SugarCRM a new action was added by creating a file in either <code>modules/&lt;TheModule&gt;/&lt;actionname&gt;.php</code> or <code>custom/modules/&lt;TheModule&gt;/&lt;actionname&gt;.php</code>. Although this still works it is not recommended.


</div>
