---
permalink: "/chap16.html"
layout: page
title: "Chapter 16"
---
<span id="chap14.xhtml"></span>

<div>

## <span class="section-number">15. </span>Module Installer ##

As detailed in the other chapters of this book there are many ways to customise SuiteCRM. The module installer allows you to package these changes and install them onto other SuiteCRM instances. This is achieved by creating a package.

At the minimum a package is a zip file that contains a <code>manifest.php</code> file in it’s root. The manifest file is responsible for providing information about the installer as well as providing information on how to install the package.

### manifest.php ###

The <code>manifest.php</code> file contains the definition of three arrays. Let’s look at each of these arrays in turn. See [[#chap19.xhtml#appendix-a|Appendix A]] for the full sample <code>manifest.php</code> file.

{|
|width="50%"| [[File:images/leanpub_info-circle.png|50px|class=sidebar-image|information]]
|width="50%"| Within path in the manifest file you can use <code>&lt;basepath&gt;</code> to refer to the base directory of the installer. For example <code>&lt;basepath&gt;/Foo.txt</code> will refer to the <code>Foo.txt</code> file in the root of the installer package.
|}

#### <code>$manifest</code> ####

The <code>$manifest</code> array provides information on the package itself such as it’s name, readme etc. (it also defines the <code>copy</code> array for <code>patch</code> packages). A sample definition of the manifest array will appear something like this:

<div class="code-block">

Example 15.1: Example <code>$manifest</code> array definition


-----

<div class="highlight">

<pre> 1 $manifest = array(
 2   'name' =&gt; 'My First Package',
 3   'description' =&gt; 'This is a simple package example manifest file',
 4   'version' =&gt; '1.5',
 5   'author' =&gt; 'Jim Mackin',
 6   'readme' =&gt; 'readme.txt',
 7   'acceptable_sugar_flavors' =&gt; array('CE'),
 8   'acceptable_sugar_versions' =&gt; array(
 9     'exact_matches' =&gt; array(),
10     'regex_matches' =&gt; array('6\\.5\\.[0-9]$'),
11   ),
12   'copy_files' =&gt; array (
13     'from_dir' =&gt; '&lt;basepath&gt;/custom/',    
14     'to_dir' =&gt; 'custom',     
15     'force_copy' =&gt; array (),
16   ),
17   'dependencies' =&gt; array(
18     array(
19       'id_name' =&gt; 'example_dependency_package',
20       'version' =&gt; '2.4',
21     ),
22   ),
23 );</pre>

</div>

-----


</div>
; <code>name</code>
: The name of the package. This is how the package will appear to the user during installation and in the Module Loader package list. The package name is required.
; <code>description</code>
: A brief description of the package.
; <code>version</code>
: The version of this package. This can be any string but is usually a traditional version number (such as <code>3.1.4</code>).
; <code>author</code>
: The author of the package.
; <code>readme</code>
: A brief readme string. Note that if a <code>README.txt</code> is found in the root of the package this will be used instead.
; <code>acceptable_sugar_flavors</code>
: A remnant of the SugarCRM packages. This should always be an array with (at least) a <code>CE</code> entry. If you would like the installer to target both SuiteCRM and SugarCRM editions then this can contain one of the other SugarCRM flavours (<code>PRO</code>, <code>CORP</code> , <code>ULT</code> or <code>ENT</code>).
; <code>acceptable_sugar_versions</code>
: An array detailing the matching SugarCRM versions. Note that the SugarCRM version is distinct from the SuiteCRM version. This array has two keys. <code>exact_matches</code> is simply an array of the allowed versions. <code>regex_matches</code> allows specifying regexes to match versions. For SuiteCRM you only need to worry about supporting the <code>6.5.*</code> versions which can be matched with the regex <code>6\\.5\\.[0-9]$</code>. At the time of writing the current SugarCRM version for SuiteCRM is <code>6.5.20</code>.
; <code>copy_files</code>
: This is only used for <code>patch</code> installers and will copy files in the <code>from_dir</code> key to those in the <code>to_dir</code> key. Finally the <code>force_copy</code> key can be used to specify files that should be forcibly copied over.
; <code>dependencies</code>
: An array of other packages that are relied on by this package. Each entry is an array with <code>id_name</code> - the id of the package and <code>version</code> - the required version of the package.
; <code>icon</code>
: The path (within the installer) to an icon to be displayed during installation.
; <code>is_uninstallable</code>
: Whether or not uninstalls should be allowed.
; <code>published_date</code>
: The date that the package was published. There is no fixed format for the date, it is simply a string.
; <code>key</code>
: Specifies a key to ensure that modules do not clash. This will prefix the installed modules and tables with <code>key</code>. This is used by the module builder when creating packages but can be specified if you wish.
; <code>remove_tables</code>
: A string specifying whether module tables should be removed when uninstalling this package. Accepted values are <code>true</code>, <code>false</code> and <code>prompt</code>. The default is <code>true</code>.
; <code>type</code>
: The type of the installer, one of <code>langpack</code>, <code>module</code>, <code>patch</code> or <code>theme</code>. See the types section.

#### <code>$install_defs</code> ####

Provides information on how the package is to be installed, which files go where and any additional information such as logic hooks, custom fields etc.

####= <code>id</code> ####=

A unique identifier for the module.

####= <code>connectors</code> ####=

An array of connectors to be installed. Each entry is an array with the following keys:

{|
! Key
! Description
|-
| <code>name</code>
| The name of the connector.
|-
| <code>connector</code>
| The directory to copy the connector files from.
|-
| <code>formatter</code>
| The directory to copy the connector formatter files from.
|}

####= <code>copy</code> ####=

An array of files and directories to be copied on install. Each entry is an array with the following keys:

{|
! Key
! Description
|-
| <code>from</code>
| The source file/directory in the package.
|-
| <code>to</code>
| The destination file/directory.
|}

{|
|width="50%"| [[File:images/leanpub_info-circle.png|50px|class=sidebar-image|information]]
|width="50%"| In general if a file can be handled by one of the other keys then that key should be used. For example new admin entries should be copied using the <code>administration</code> key rather than using the <code>copy</code> key.
|}

####= <code>dashlets</code> ####=

An array of dashlets to be installed. Each entry is an array with the following keys:

{|
! Key
! Description
|-
| <code>name</code>
| The name of the new dashlet.
|-
| <code>from</code>
| The path in the install package from which the dashlet files will be copied.
|}

####= <code>language</code> ####=

An array of language files to be installed. Each entry is an array with the following keys:

{|
! Key
! Description
|-
| <code>from</code>
| The location of the language file inside the package.
|-
| <code>to_module</code>
| The module this language file is intended for (or ‘application’ for application language strings).
|-
| <code>language</code>
| The language that this file is for (i.e. en_us or es_es).
|}

See the chapter on [[#chap08.xhtml#language-chapter|Language Strings]] for more information.

####= <code>layoutdefs</code> ####=

An array of layoutdef files which are used to add, remove or edit subpanels. Each entry is an array with the following keys:

{|
! Key
! Description
|-
| <code>from</code>
| The path in the package to the file to be installed.
|-
| <code>to_module</code>
| The module that this file will be installed to.
|}

####= <code>vardefs</code> ####=

An array of the vardefs to be added to specific modules. Each entry is an array with the following keys:

{|
! Key
! Description
|-
| <code>from</code>
| The location of the vardef file in the package.
|-
| <code>to_module</code>
| The destination module.
|}

{|
|width="50%"| [[File:images/leanpub_info-circle.png|50px|class=sidebar-image|information]]
|width="50%"| Generally you should install custom fields using the <code>custom_fields</code> key. However this key can be used to alter existing fields or add more complex fields.
|}

####= <code>menu</code> ####=

An array of menus to be installed. Each entry is an array with the following keys:

{|
! Key
! Description
|-
| <code>from</code>
| The location of the menu file in the package.
|-
| <code>to_module</code>
| The destination module for this menu.
|}

####= <code>beans</code> ####=

An array of beans to be installed. Each entry is an array with the following keys:

{|
! Key
! Description
|-
| <code>module</code>
| The name of the module.
|-
| <code>class</code>
| The name of the bean class.
|-
| <code>path</code>
| The path (within the package) to the bean file.
|-
| <code>tab</code>
| Whether or not a tab should be added for this module.
|}

####= <code>relationships</code> ####=

An array detailing any new relationships added (in particular relationships where one side is an existing module). Each entry is an array with the following keys:

{|
! Key
! Description
|-
| <code>module</code>
| The module that this relationship will be attached to.
|-
| <code>meta_data</code>
| The location of the metadata file for this relationship.
|}

####= <code>custom_fields</code> ####=

An array of new custom fields to be installed (See the [[#chap03.xhtml#vardefs-chapter|Vardefs]] chapter for more information on this). Each entry is an array with the following keys:

{|
! Key
! Description
|-
| <code>name</code>
| The name of the new custom field.
|-
| <code>label</code>
| The key for the language string which will act as the label for this custom field.
|-
| <code>type</code>
| The type of this custom field.
|-
| <code>max_size</code>
| For string field types, the maximum number of characters.
|-
| <code>require_option</code>
| Whether or not the field is required.
|-
| <code>default_value</code>
| The default value of this field.
|-
| <code>ext1</code>
| Extended field information. Different field types will use this value differently. For example Enum fields will store the key for the options in this field, decimal and float fields will store the precision.
|-
| <code>ext2</code>
| Extended field information. Different field types will use this value differently. For example, dynamic dropdowns will store the parent dropdown, text areas will store the number of rows.
|-
| <code>ext3</code>
| Extended field information. Different field types will use this value differently. For example, text areas will store the number of columns.
|-
| <code>ext4</code>
| Extended field information. Different field types will use this value differently. For HTML field types this will store the HTML.
|-
| <code>audited</code>
| Whether or not changes to this field should be audited.
|-
| <code>module</code>
| Used to specify the module where the custom field will be added.
|}

####= <code>logic_hooks</code> ####=

An array of logic hooks to be installed. See the [[#chap11.xhtml#logic-hooks-chapter|Logic Hooks]] chapter for more information. Each entry is an array with the following keys:

{|
! Key
! Description
|-
| <code>module</code>
| The module to where this logic hook should be installed. Leaving this empty will install into the top level logic hook.
|-
| <code>hook</code>
| The logic hook type (i.e. <code>after_save</code>, <code>after_login</code>, etc.).
|-
| <code>order</code>
| The sort order for this logic hook.
|-
| <code>description</code>
| A description of the hook.
|-
| <code>file</code>
| The file containing the class for this logic hook, relative to the SuiteCRM root.
|-
| <code>class</code>
| The class that contains the logic hook function that should be called by this hook.
|-
| <code>function</code>
| The function to be invoked when this hook is triggered.
|}

####= <code>image_dir</code> ####=

A path to a directory of images to be included in the install.

####= <code>schedulers</code> ####=

An array of schedulers to be installed. Each entry is an array with a single key:

{|
! Key
! Description
|-
| <code>from</code>
| The file containing the new scheduled task.
|}

####= <code>administration</code> ####=

An array of admin panels to be installed. Each entry is an array with a single key:

{|
! Key
! Description
|-
| <code>from</code>
| The file containing the new admin panel definition.
|}

####= <code>pre_execute</code> ####=

Defines an array of files to be executed before the package is installed. Each entry is a path to a file within the package. Any output will be displayed to the user in the install log.

####= <code>post_execute</code> ####=

Defines an array of files to be executed after the package is installed. Each entry is a path to a file within the package. Any output will be displayed to the user in the install log.

####= <code>pre_uninstall</code> ####=

Defines an array of files to be executed before the package is uninstalled. Each entry is a path to a file within the package. Any output will be displayed to the user in the uninstall log.

####= <code>post_uninstall</code> ####=

Defines an array of files to be executed after the package is uninstalled. Each entry is a path to a file within the package. Any output will be displayed to the user in the uninstall log.

#### <code>$upgrade_manifest</code> ####

Provides a means of upgrading an already installed package by providing different <code>install_defs</code>.

<div class="page-break">



</div>
### Types ###

{|
! Type
! Description
|-
| langpack
| A language installer. This will add an entry to the language dropdown.
|-
| module
| A module installer. Will install new modules and/or functionality.
|-
| patch
| A patch installer. This is used to upgrade SuiteCRM.
|-
| theme
| A theme installer. This will add a new option to the themes.
|}

#### Other files ####

; <code>README.txt</code>
: Contains the readme for this package. If <code>README.txt</code> and a readme entry in the <code>manifest.php</code> is defined then this file will be used.
; <code>LICENSE.txt</code>
: Provides information on the license for this package.
; <code>scripts/pre_install.php</code>
: A PHP script which defines a method <code>pre_install()</code>. This method will be called before the package is installed. Any output will be displayed to the user in the install log.
; <code>scripts/post_install.php</code>
: A PHP script which defines a method <code>post_install()</code>. This method will be called after the package is installed.
; <code>scripts/pre_uninstall.php</code>
: A PHP script which defines a method <code>pre_uninstall()</code>. This method will be called before the package is uninstalled.
; <code>scripts/post_uninstall.php</code>
: A PHP script which defines a method <code>post_uninstall()</code>. This method will be called after the package is uninstalled.


</div>
