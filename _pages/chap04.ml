---
permalink: "/chap04.html"
layout: page
title: "Chapter 04"
---
<span id="chap03.xhtml"></span>

<div>

## <span class="section-number">4. </span>Vardefs ##

### What are Vardefs ###

The Vardefs are used to supply information to SuiteCRM about a particular bean. These generally specify the fields, relationships and indexes in a given module as well as additional information such as whether it is audited, the table name etc.

### Defining Vardefs ###

#### Module ####

Vardefs are initially defined in their respective modules folder. For the Accounts module this will be in modules/Accounts/vardefs.php. The information is stored in an array named $dictionary using the module name as the key. For Accounts this will be <code>$dictionary['Account']</code>. Let’s look at the Account vardefs (which have been edited for brevity):

<div class="code-block">

Example 4.1: Account Vardefs


-----

<div class="highlight">

<pre> 1 $dictionary['Account'] =
 2 array(
 3 	'table' =&gt; 'accounts',
 4 	'audited'=&gt;true,
 5 	'unified_search' =&gt; true,
 6 	'unified_search_default_enabled' =&gt; true,
 7 	'duplicate_merge'=&gt;true,
 8 	'comment' =&gt; 'Accounts are organizations or entities that ...',
 9 	'fields' =&gt; array (
10 	  //Snipped for brevity. See the fields section.
11 	),
12 	'indices' =&gt; array (
13 	  //Snipped for brevity. See the indices section.
14 	),
15 	'relationships' =&gt; array (
16 	  //Snipped for brevity. See the relationship section.
17 	),
18 	//This enables optimistic locking for Saves From EditView
19 	'optimistic_locking'=&gt;true,
20 );
21 
22 VardefManager::createVardef(
23 	'Accounts',
24 	'Account',
25 	array('default', 'assignable','company',)
26 );</pre>

</div>

-----


</div>
####= Keys ####=

The following are some of the keys that can be specified for the vardefs. Fields, indices and relationships are covered in their own sections.

; <code>table</code>
: The database table name for this module.
; <code>audited</code>
: Whether or not this module should be audited. Note that <code>audited</code> must also be set at the fields level for a field to be audited.
; <code>unified_search</code>
: Whether this module can be searchable via the global search.
; <code>unified_search_default_enabled</code>
: Whether this module is searchable via the global search by default.
; <code>duplicate_merge</code>
: Whether or not duplicate merging functionality is enabled for this module.
; <code>comment</code>
: A description of this module.
; <code>optimistic_locking</code>
: Whether optimistic should be enabled for this module. Optimistic locking locks concurrent edits on a record by assuming that there will be no conflict. On save the last modified timestamp on the record will be checked. If it is different then an edit has occurred since this record was loaded. If this is the case then the user will be prompted with a page showing the differences in the two edits and asked to choose which edits are to be used.

####= Fields ####=

The field defines the behaviour and attributes of each field in the module.

; <code>name</code>
: The name of the field.
; <code>vname</code>
: The name of the language label to be used for this field.
; <code>type</code>
: The type of the field. See the field types section.
; <code>isnull</code>
: Whether null values are allowed
; <code>len</code>
: If the field is a string type, the max number of characters allowed.
; <code>options</code>
: For enum fields the language label for the dropdown values for this field
; <code>dbtype</code>
: The type to be used by the database to store this field. This is not required as the appropriate type is usually chosen.
; <code>default</code>
: The default value of this field.
; <code>massupdate</code>
: Whether or not this field should be mass updatable. Note that some field types are always restricted from mass updates.
; <code>rname</code>
: For related fields only. The name of the field to be taken from the related module.
; <code>id_name</code>
: For related fields only. The field in this bean which contains the related id.
; <code>source</code>
: The source of this field. Can be set to ‘non-db’ if the field is not stored in the database - for example for link fields, fields populated by logic hooks or by other means.
; <code>sort_on</code>
: For concatenated fields (i.e. name fields) the field which should be used to sort.
; <code>fields</code>
: For concatenated fields (i.e. name fields) an array of the fields which should be concatenated.
; <code>db_concat_fields</code>
: For concatenated fields (i.e. name fields) an array of the fields which should be concatenated in the database. Usually this is the same as fields.
; <code>unified_search</code>
: True if this field should be searchable via the global search.
; <code>enable_range_search</code>
: Whether the list view search should allow a range search of this field. This is used for date and numeric fields.
; <code>studio</code>
: Whether the field should display in studio.
; <code>audited</code>
: Whether or not changes to this field should be audited.

####= Field types ####=

The following are common field types used:

; <code>id</code>
: An id field.
; <code>name</code>
: A name field. This is usually a concatenation of other fields.
; <code>bool</code>
: A boolean field.
; <code>varchar</code>
: A variable length string field.
; <code>char</code>
: A character field.
; <code>text</code>
: A text area field.
; <code>decimal</code>
: A decimal field.
; <code>date</code>
: A date field.
; <code>datetime</code>
: A date and time field.
; <code>enum</code>
: A dropdown field.
; <code>phone</code>
: A phone number field.
; <code>link</code>
: A link to another module via a relationship.
; <code>relate</code>
: A related bean field.

####= Indices ####=

The indices array allows defining any database indexes that should be in place on the database table for this module. Let’s look at an example:

<div class="code-block">

Example 4.2: Example indices definition


-----

<div class="highlight">

<pre> 1 'indices' =&gt; array (
 2 	array(
 3 		'name' =&gt;'idx_mymod_id_del',
 4 		'type' =&gt;'index',
 5 		'fields'=&gt;array('id', 'deleted')),
 6 	array(
 7 		'name' =&gt;'idx_mymod_parent_id',
 8 		'type' =&gt;'index',
 9 		'fields'=&gt;array( 'parent_id')),
10 	array(
11 		'name' =&gt;'idx_mymod_parent_id',
12 		'type' =&gt;'unique',
13 		'fields'=&gt;array( 'third_party_id')),
14 	),</pre>

</div>

-----


</div>
Each array entry should have, at least, the following entries:

; name
: The name of the index. This is usually used by the database to reference the index. Most databases require that these are unique.
; type
: The type of the index to create. <code>index</code> will simply add an index on the fields, <code>unique</code> will add a unique constraint on the fields, <code>primary</code> will add the fields as a primary key.
; fields
: An array of the fields to be indexed. The order of this array will be used as the order of the fields in the index.

####= Relationships ####=

The Vardefs also specify the relationships within this module. Here’s an edited example from the Accounts module:

<div class="code-block">

Example 4.3: Example relationships definition


-----

<div class="highlight">

<pre> 1 'relationships' =&gt; array (
 2 	'account_cases' =&gt; array(
 3 		'lhs_module'=&gt; 'Accounts',
 4 		'lhs_table'=&gt; 'accounts',
 5 		'lhs_key' =&gt; 'id',
 6 		'rhs_module'=&gt; 'Cases',
 7 		'rhs_table'=&gt; 'cases',
 8 		'rhs_key' =&gt; 'account_id',
 9 		'relationship_type' =&gt; 'one-to-many'),
10 ),</pre>

</div>

-----


</div>
Here we see the link between accounts and cases. This is specified with the following keys:

; <code>lhs_module</code>
: The module on the left hand side of this relationship. For a one to many relationship this will be the “One” side.
; <code>lhs_table</code>
: The table for the left hand side module. If you are unsure the table for a module can be found in it’s vardefs.
; <code>lhs_key</code>
: The field to use for the left hand side of this link. In this case it is the <code>id</code> of the account.
; <code>rhs_module</code>
: The right hand side module. In this case the “many” side of the relationship.
; <code>rhs_table</code>
: The table for the right hand side module. As stated previously you can find the table for a module can be found in it’s vardefs.
; <code>rhs_key</code>
: The field to use on the right hand side. In this case the <code>account_id</code> field on cases.
; <code>relationship_type</code>
: The type of relationship - “one-to-many” or “many-to-many”. Since this is a one to many relationship it means a case is related to a single account but a single account can have multiple cases.

For many to many relationship fields the following keys are also available:

; <code>join_table</code>
: The name of the join table for this relationship.
; <code>join_key_lhs</code>
: The name of the field on the join table for the left hand side.
; <code>join_key_rhs</code>
: The name of the field on the join table for the right hand side.

#### Vardef templates ####

Vardef templates provide a shortcut for defining common vardefs. This is done by calling <code>VardefManager::createVardef</code> and passing the module name, object name and an array of templates to be assigned. The following is an example from the accounts vardefs:

<div class="code-block">

Example 4.4: Example vardef template


-----

<div class="highlight">

<pre>22 VardefManager::createVardef(
23 		'Accounts',
24 		'Account',
25 		array('default', 'assignable','company',)
26 		);</pre>

</div>

-----


</div>
In this example the <code>default</code>, <code>assignable</code> and <code>company</code> templates are used. The following are some of the available templates:

; <code>basic</code><br />
<code>default</code>
: Adds the common base fields such as <code>id</code>, <code>name</code>, <code>date_entered</code>, etc.
; <code>assignable</code>
: Adds the fields and relationships necessary to assign a record to a user.
; <code>person</code>
: Adds fields common to people records such as <code>first_name</code>, <code>last_name</code>, address, etc.
; <code>company</code>
: Adds fields common to companies such as an industry dropdown, address, etc.

#### Customising vardefs ####

Vardefs can be customised by adding a file into

<div class="code-block">

Example 4.5: Custom vardef location


-----

<div class="highlight">

<pre>custom/Extension/modules/&lt;TheModule&gt;/Ext/SomeFile.php</pre>

</div>

-----


</div>
This file can then be used to add a new field definition or customise an existing one e.g changing a field type:

<div class="code-block">

Example 4.6: Example overriding an existing vardef


-----

<div class="highlight">

<pre>$dictionary[&quot;TheModule&quot;][&quot;fields&quot;][&quot;some_field&quot;]['type'] = 'int';</pre>

</div>

-----


</div>

</div>
