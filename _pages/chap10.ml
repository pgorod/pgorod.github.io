---
permalink: "/chap10.html"
layout: page
title: "Chapter 10"
---
<span id="chap09.xhtml"></span>

<div>

## <span class="section-number">10. </span>Config ##

### The config files ###

There are two main config files in SuiteCRM, both of which are in the root SuiteCRM folder. These are <code>config.php</code> and <code>config_override.php</code>. The definitions in here provide various configuration options for SuiteCRM. All the way from the details used to access the database to how many entries to show per page in the list view. Most of these options are accessible from the SuiteCRM administration page. However some are only definable in the config files.

#### config.php ####

This is the main SuiteCRM config file and includes important information like the database settings and the current SuiteCRM version.

Generally settings in this file wont be changed by hand. An exception to this is if SuiteCRM has been moved or migrated. In which case you may need to change the database settings and the site_url. Let’s look at the database settings first:

<div class="code-block">

Example 10.1: Database config definition


-----

<div class="highlight">

<pre> 1 'dbconfig' =&gt;
 2 array (
 3   'db_host_name' =&gt; 'localhost',
 4   'db_host_instance' =&gt; 'SQLEXPRESS',
 5   'db_user_name' =&gt; 'dbuser',
 6   'db_password' =&gt; 'dbpass',
 7   'db_name' =&gt; 'dbname',
 8   'db_type' =&gt; 'mysql',
 9   'db_port' =&gt; '',
10   'db_manager' =&gt; 'MysqliManager',
11 ),</pre>

</div>

-----


</div>
Here we can see this instance is setup to access a local MySQL instance using the username/password dbuser/dbpass and accessing the database named ‘dbname’.

The site url settings are even simpler:

<div class="code-block">

Example 10.2: Setting the site URL


-----

<div class="highlight">

<pre>  'site_url' =&gt; 'http://example.com/suitecrm',</pre>

</div>

-----


</div>
The site url for the above is simply ‘http://example.com/suitecrm’ if we were moving this instance to, for example, suite.example.org, then we can simply place that value in the file.

These are generally the only two instances where you would directly change <code>config.php</code>. For other changes you would either make the change through SuiteCRM itself or you would use the<br />
<code>config_override.php</code> file.

#### config_override.php ####

<code>config_override.php</code> allows you to make config changes without risking breaking the main config file. This is achieved quite simply by adding, editing or removing items from the $sugar_config variable. The <code>config_override.php</code> file will be merged with the existing config allowing, as the name suggests, overriding the config. For example in config_override.php we can add our own, new, config item:

<div class="code-block">

Example 10.3: Adding a custom config value


-----

<div class="highlight">

<pre>$sugar_config['enable_the_awesome'] = true;</pre>

</div>

-----


</div>
or we can edit an existing config option in a very similar manner by simply overwriting it:

<div class="code-block">

Example 10.4: Overwriting an existing config value


-----

<div class="highlight">

<pre>$sugar_config['logger']['level'] = 'debug';</pre>

</div>

-----


</div>
### Using config options ###

We may want to access config options in custom code (or as detailed above if we have created our own config setting we may want to use that). We can easily get the config using the php global keyword:

<div class="code-block">

Example 10.5: Accessing a config setting within SuiteCRM


-----

<div class="highlight">

<pre>1 function myCustomLogic(){
2   //Get access to config
3   global $sugar_config;
4   //use the config values
5   if(!empty($sugar_config['enable_the_awesome'])){
6     doTheAwesome();
7   }
8 }</pre>

</div>

-----


</div>

</div>
