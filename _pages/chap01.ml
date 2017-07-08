---
permalink: "/chap01.html"
layout: page
title: "Chapter 01"
---
<span id="chap00.xhtml"></span>

<div>

## <span class="section-number">1. </span>Introduction ##

### What is SuiteCRM ###

The story of [https://www.suitecrm.com SuiteCRM] starts with SugarCRM. SugarCRM was founded in 2004 and consisted of an open source version (called Community Edition) and various paid for versions. However trouble started brewing when it appeared that SugarCRM would not be releasing a Community Edition of SugarCRM 7 and would be providing limited, if any, updates to the Community Edition.

Enter SuiteCRM. SalesAgility forked Community Edition to create SuiteCRM and also added various open source plugins to add improved functionality.

### This book ###

This book is intended for developers who are familiar (or at least acquainted) with using SuiteCRM but want to perform their own customisations. SuiteCRM is a large and mature piece of software so it is impractical for a book to cover all aspects of the software. I’ve tried to add the most important parts which should allow you to make the changes you need in 99% of situations. There is a further resources chapter at the end of this book to help out in those 1% of cases. With that being said if you feel there is anything important I have left out (or worse, anything incorrect in the book) please let me know. I can be contacted at [http://www.jsmackin.co.uk JSMackin.co.uk].

### Reading this book ###

Each chapter in this book is intended to be self contained so the reader can jump to interesting chapters. Where there is some overlap this is usually indicated with links to the relevant chapters.

Some parts of this book may refer to file paths or other parts of code that can have a variable value, for example controller names contain the module name or a file with an arbitrary name. In this case these will be marked in the form <code>&lt;TheModuleName&gt;</code>, <code>&lt;TheFileName&gt;</code> or something else suitable. In these cases you can substitute something appropriate (such as <code>Accounts</code> or <code>MyNewFile</code>).

### Setting up SuiteCRM ###

In this book we’ll be using SuiteCRM v7.1.5 which is the latest at time of writing. For up to date versions of the installation instructions see the SuiteCRM wiki at [https://suitecrm.com/wiki/index.php/Installation suitecrm.com/wiki/index.php/Installation].

#### Website ####

The SuiteCRM installer can be found at [https://suitecrm.com/ SuiteCRM.com]. I would recommend SuiteCRM MAX as I prefer to start with a full interface and customise it as needed.

#### GitHub ####

SuiteCRM is also available on [http://github.com GitHub] at [https://github.com/salesagility/SuiteCRM github.com/salesagility/SuiteCRM]. Each SuiteCRM version is tagged so you can easily grab the version you need.

### Initial Tweaks ###

After the initial install there are a few tweaks you may want to make on an instance you are developing on. These changes should improve your development flow and productivity as well as help identify issues if they occur.

#### Developer Mode ####

SuiteCRM will cache various files that it processes, such as Smarty templates. Developer mode will turn off some of the caching so that changes to files will be seen immediately (though this isn’t always the case - as is the case with [[#chap13.xhtml#extensions-chapter|extensions]]). This can be enabled either through the config file or via the General settings page inside admin.

#### Log Level ####

The default log level of SuiteCRM is <code>fatal</code>. This is a good default for production instances but you may want to increase the log level to <code>info</code> or <code>debug</code>. This will make the log output more verbose so, should anything go wrong, you’ll have something to refer to. See the [[#chap10.xhtml#logging-chapter|chapter on logging]] for more information.

#### Display errors ####

You’ll also want to turn off display errors. Unfortunately at the moment SuiteCRM has various notices and warnings out of the box. With <code>display_errors</code> on this can sometimes cause AJAX pages and the link to break.

With this being said you should be checking the PHP error logs or selectively enabling<br />
<code>display_errors</code> to ensure that the code you are creating is not creating additional notices, warnings or errors.

#### XDebug ####

[http://xdebug.org XDebug] is a PHP extension which provides profiling and debugging capabilities to PHP. This can massively improve developer productivity by simplifying development and, particularly, tracking down any issues. See the XDebug site for information on XDebug.


</div>
