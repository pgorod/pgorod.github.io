---
permalink: "/chap18.html"
layout: page
title: "Chapter 18"
---
<span id="chap16.xhtml"></span>

<div>

## <span class="section-number">17. </span>Best Practices ##

### Development instances ###

When making changes you should always use a development or test instance first. This allows you to fully and safely test any changes.

### Version control ###

When developing customisations it is prudent to use some form of version control. Version control allows tracking changes to your codebase in addition to rolling back changes. There are many version control systems available. SuiteCRM uses [http://git-scm.com/ Git] although I also like [http://mercurial.selenic.com/ Mercurial].

If you are using a development instance (as mentioned above) then Version Control usually allows you to push changes to other versions or to tag releases. This provides a way of pushing changes to live or test instances safely. Crucially it also means that, should there be major problems with a version then this can be easily rolled back.

### Backup ###

SuiteCRM has been developed to be customisable. However, mistakes, bugs and other unpleasantness can (and thanks to Murphy’s law, will) happen. You should always ensure, before making any changes, that you have a backup of all files and of the database.

In order to back up files you can simply create a zip of the SuiteCRM directory and copy it to a safe place. On Linux systems this can be performed using the following:

<div class="code-block">

Example 17.1: File backup


-----

<div class="highlight">

<pre>tar -czvf suitecrmfilebackup.tar.gz /path/to/suitecrm</pre>

</div>

-----


</div>
Backing up the SuiteCRM database will vary depending on which database you are using. However MySQL backups can be performed using the <code>mysqldump</code> command on Linux as seen here:

<div class="code-block">

Example 17.2: MySQL Database backup


-----

<div class="highlight">

<pre>mysqldump suitecrmdatabase -u databaseuser -p | gzip -c | cat &gt; suitecrm.sql.gz</pre>

</div>

-----


</div>
### Be upgrade safe ###

Unless you are making changes to a custom module you should strive in all cases to use the custom framework and make changes in the custom folder. This ensures that, should you make a mistake, rectifying the mistake is as simple as removing the customisation.

However the main advantage to using <code>custom</code> is that, when you upgrade SuiteCRM in the future you will not have your changes overwritten by the updated SuiteCRM files. See the [[#chap13.xhtml#extensions-chapter|Extensions]] chapter for more information.

### Use appropriate log levels ###

Using appropriate log levels (See the chapter on [[#chap10.xhtml#logging-chapter|Logging]]) makes it easier to track down issues. You do not want very important messages to be logged as <code>debug</code> since this will make them difficult to find. Likewise you don’t want unimportant log messages cluttering up the <code>fatal</code> log output.

### Long running logic hooks ###

If a logic hook task is long running then you should place it into the job queue (see the [[#chap11.xhtml#logic-hooks-chapter|Logic Hook]] and [[#chap12.xhtml#scheduled-tasks-chapter|Scheduled Tasks]] chapters).

### Minimise SQL ###

Where possible you should strive to use the SuiteCRM supplied methods of accessing data. This includes using beans and the BeanFactory where possible (see the chapter on [[#chap02.xhtml#working-with-beans-chapter|Working with beans]]). There are a few reasons for this. The first is that SQL is usually either hardcoded or has to be dynamically built. In the case where the SQL is hardcoded this means that changes to fields will not be reflected thereby making your code more brittle.

Dynamic SQL is better because it can react to field changes and generally be tailored to fit the situation. However this requires adding extra, often complex, code. It can be hard to account for all situations (this can be especially problematic when attempting to traverse relationships dynamically).

Another issue is that, usually SQL will end up being Database specific (see the next point for mitigating this however).

Finally any custom logic (such as Logic Hooks) which would usually be fired for saving beans or relationships will not be fired for SQL queries.

### SQL Use ###

In some cases using raw SQL is unavoidable. If that is the case then you should strive to use standard compliant SQL. If database engine specific features need to be used, and you wish to target other database engines, you can check for the DB type. For example:

<div class="code-block">

Example 17.1: Checking for the database engine


-----

<div class="highlight">

<pre> 1 function getSomeSQLQuery(){
 2     global $sugar_config;
 3     switch($sugar_config['dbconfig']['db_type']){
 4         case 'mssql':
 5             $sql = 'MSSQL specific SQL';
 6             break;
 7         case 'mysql':
 8         default:
 9             $sql = 'MySQL specific SQL';
10             break;
11     }
12     return $sql;
13 }</pre>

</div>

-----


</div>
### Entry check ###

The majority of SuiteCRM files will start with some variation of the following line:

<div class="code-block">

Example 17.2: Entry check


-----

<div class="highlight">

<pre>if(!defined('sugarEntry') || !sugarEntry) die('Not A Valid Entry Point');</pre>

</div>

-----


</div>
This prevents direct access to the file by ensuring that SuiteCRM has been loaded through a valid entry point (i.e. it has been loaded through index.php, cron.php or a custom entry point).

### Redirect after post ###

Sometimes you may have custom controller actions (see the controller section) or custom entry points (see the [[#chap07.xhtml#entry-point-chapter|Entry Points]] chapter). These actions and entry points or other pages are usually accessed using POST. After a POST request it is a web best practice to redirect to a different page, especially if your page makes any changes. This prevents the user from refreshing the page and causing a duplicate action. Within SuiteCRM it is best to use the <code>SugarApplication::redirect</code> method to redirect. This simply accepts a URL. As follows:

<div class="code-block">

Example 17.3: Redirecting within SuiteCRM


-----

<div class="highlight">

<pre>SugarApplication::redirect('index.php?module=&lt;TheModule&gt;');</pre>

</div>

-----


</div>

</div>
