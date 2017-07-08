---
permalink: "/chap08.html"
layout: page
title: "Chapter 08"
---
<span id="chap07.xhtml"></span>

<div>

## <span class="section-number">8. </span>Entry Points ##

Entry points are simply a page which provides access to SuiteCRM. These can be used for a variety of purposes such as allowing an external form simple access to SuiteCRM or, as is the case with the stock Events module, allowing an event invite to be responded to by clicking a link in an email.

### Creating an entry point ###

Let’s create a simple entry point to display the time. First we define this entry point in a new file in:

<div class="code-block">

Example 8.1: Entry point registry location


-----

<div class="highlight">

<pre>custom/Extension/application/Ext/EntryPointRegistry/</pre>

</div>

-----


</div>
For our example we’ll call our new file MyTimeEntryPoint.php

<div class="code-block">

Example 8.2: Example entry point location


-----

<div class="highlight">

<pre>custom/Extension/application/Ext/EntryPointRegistry/MyTimeEntryPoint.php</pre>

</div>

-----


</div>
In this file we will add a new entry to the <code>$entry_point_registry</code>. We supply the file that should be called. Here we are simply placing the file in custom if the entry point is related to a specific module it is usually a good idea to place this somewhere inside <code>custom/&lt;TheModule&gt;/</code>.

In addition we supply an “auth” parameter. If “auth” is true then anyone accessing the entry point will need to be logged into SuiteCRM.

<div class="code-block">

Example 8.3: Adding an entry point entry


-----

<div class="highlight">

<pre>1 &lt;?php
2 	$entry_point_registry['MyTimeEntryPoint'] = array(
3 	    'file' =&gt; 'custom/MyTimeEntryPoint.php',
4 	    'auth' =&gt; true,
5 	);</pre>

</div>

-----


</div>
Finally we add the actual logic itself inside custom/MyTimeEntryPoint.php:

<div class="code-block">

Example 8.4: Example entry point that outputs the current time


-----

<div class="highlight">

<pre>1 &lt;?php
2 if(!defined('sugarEntry') || !sugarEntry) die('Not A Valid Entry Point');
3 $date = new DateTime();
4 echo $date-&gt;format('r');</pre>

</div>

-----


</div>
After a Quick Repair and Rebuild we can access our entry point:

<div class="code-block">

Example 8.5: Custom entry point URL


-----

<div class="highlight">

<pre>example.com/index.php?entryPoint=MyTimeEntryPoint</pre>

</div>

-----


</div>
and we should see something similar to:

<div class="code-block">

Example 8.6: MyTimeEntryPoint


-----

<div class="highlight">

<pre>Sun, 15 Mar 2015 13:03:03 +0000</pre>

</div>

-----


</div>
Obviously this is a contrived example but any logic that can be performed elsewhere in SuiteCRM can be performed in an entry poiny (for example creating or editing [[#chap02.xhtml#working-with-beans-chapter|SugarBeans]]).


</div>
