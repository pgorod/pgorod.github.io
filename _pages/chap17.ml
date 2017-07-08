---
permalink: "/chap17.html"
layout: page
title: "Chapter 17"
---
<span id="chap15.xhtml"></span>

<div>

## <span class="section-number">16. </span>API ##

The SuiteCRM API allows third party code to access and edit SuiteCRM data and functionality.

### Using the API ###

SuiteCRM has both a REST and a SOAP API. Which API you want to use will largely come down to personal preference and the support for SOAP/REST libraries in whichever language you will be using.

Both APIs will require a username and password. It is usual to create a user specifically for the API.

#### SOAP ####

The WSDL for the SOAP API can be found at:

<div class="code-block">

Example 16.1: SOAP API WSDL Location


-----

<div class="highlight">

<pre>example.com/suitecrm/service/v4_1/soap.php?wsdl</pre>

</div>

-----


</div>
Where <code>example.com/suitecrm</code> is the address of your SuiteCRM instance. <code>v4_1</code> is the version of the API and can be changed, <code>v4_1</code> is the latest version at the time of writing.

####= SOAP Example ####=

The following PHP example uses the built in SoapClient class.

<div class="code-block">

Example 16.2: Accessing the SOAP API


-----

<div class="highlight">

<pre> 1 &lt;?php
 2 //Create a new SoapClient
 3 $wsdlURL = &quot;http://example.com/suitecrm/service/v4_1/soap.php?wsdl&quot;;
 4 $client = new SoapClient($wsdlURL);
 5 
 6 //Login to the API and get the session id
 7 $userAuth = array(
 8         'user_name' =&gt; '&lt;suitecrmuser&gt;',
 9         'password' =&gt; md5('&lt;suitecrmpassword&gt;'),
10 );
11 $appName = 'My SuiteCRM SOAP Client';
12 $nameValueList = array();
13 $loginResults = $client-&gt;login($userAuth, $appName, $nameValueList);
14 
15 //Get a list of at most 10 accounts with a billing address in Ohio. Along with
16 //The first and last names of any contacts in that Account.
17 $results = $client-&gt;get_entry_list(
18         //Session id - retrieved from login call
19         $loginResults-&gt;id,
20         //Module to get_entry_list for
21         'Accounts',
22         //Filter query - Added to the SQL where clause
23         &quot;accounts.billing_address_city = 'Ohio'&quot;,
24         //Order by - unused
25         '',
26         //Start with the first record
27         0,
28         //Return the id and name fields
29         array('id','name'),
30         //Link to the &quot;contacts&quot; relationship and retrieve the
31         //First and last names.
32         array(
33                 array(
34                         'name' =&gt; 'contacts',
35                         'value' =&gt; array(
36                                 'first_name',
37                                 'last_name',
38                         ),
39                 ),
40         ),
41         //Show 10 max results
42         10,
43         //Do not show deleted
44         0
45 );
46 print_r($results);</pre>

</div>

-----


</div>
<div class="page-break">



</div>
#### REST ####

The SuiteCRM REST API can be found at:

<div class="code-block">

Example 16.3: REST API Endpoint Location


-----

<div class="highlight">

<pre>example.com/suitecrm/service/v4_1/rest.php</pre>

</div>

-----


</div>
Where example.com/suitecrm is the address of your SuiteCRM instance. v4_1 is the version of the API and can be changed, v4_1 is the latest version at the time of writing.

The SuiteCRM REST API is not a true REST API - all calls are performed as POSTs and all calls are to the base URL with the method passed in as a post argument.

; The arguments to the REST API calls are:<br />
method
: The method which will be called, i.e. <code>login</code> or <code>get_entry_list</code>. See [[#chap20.xhtml#appendix-b|Appendix B]] for a list of API methods.
; input_type
: The input type of the rest_data. This is usually <code>JSON</code> but can also be <code>Serialize</code>.
; response_type
: How the response will be encoded. This is usually <code>JSON</code> but can also be <code>Serialize</code>.
; rest_data
: Any other arguments that are required by this method. This is passed as an encoded array. The encoding is determined by input_type.

{|
|width="50%"| [[File:images/leanpub_warning.png|50px|class=sidebar-image|warning]]
|width="50%"| Note that, for REST requests it is the order of the arguments that matter in <code>rest_data</code> and not the name.
|}

<div class="page-break">



</div>
####= Examples ####=

<div class="code-block">

Example 16.4: Accessing the REST API


-----

<div class="highlight">

<pre> 1 &lt;?php
 2 
 3 $url = &quot;http://example.com/suitecrm/service/v4_1/rest.php&quot;;
 4 
 5 function restRequest($method, $arguments){
 6 	global $url;
 7 	$curl = curl_init($url);
 8 	curl_setopt($curl, CURLOPT_RETURNTRANSFER, 1);
 9 	$post = array(
10 			&quot;method&quot; =&gt; $method,
11 			&quot;input_type&quot; =&gt; &quot;JSON&quot;,
12 			&quot;response_type&quot; =&gt; &quot;JSON&quot;,
13 			&quot;rest_data&quot; =&gt; json_encode($arguments),
14 	);
15 
16 	curl_setopt($curl, CURLOPT_POSTFIELDS, $post);
17 
18 	$result = curl_exec($curl);
19 	curl_close($curl);
20 	return json_decode($result,1);
21 }
22 
23 
24 $userAuth = array(
25         'user_name' =&gt; 'suitecrmuser',
26         'password' =&gt; md5('suitecrmpassword'),
27 );
28 $appName = 'My SuiteCRM REST Client';
29 $nameValueList = array();
30 
31 $args = array(
32             'user_auth' =&gt; $userAuth,
33             'application_name' =&gt; $appName,
34             'name_value_list' =&gt; $nameValueList);
35 
36 $result = restRequest('login',$args);
37 $sessId = $result['id'];
38 
39 $entryArgs = array(
40   //Session id - retrieved from login call
41 	'session' =&gt; $sessId,
42   //Module to get_entry_list for
43 	'module_name' =&gt; 'Accounts',
44   //Filter query - Added to the SQL where clause,
45 	'query' =&gt; &quot;accounts.billing_address_city = 'Ohio'&quot;,
46   //Order by - unused
47 	'order_by' =&gt; '',
48   //Start with the first record
49 	'offset' =&gt; 0,
50   //Return the id and name fields
51 	'select_fields' =&gt; array('id','name',),
52 	//Link to the &quot;contacts&quot; relationship and retrieve the
53 	//First and last names.
54 	'link_name_to_fields_array' =&gt; array(
55 			array(
56 					'name' =&gt; 'contacts',
57 					'value' =&gt; array(
58 							'first_name',
59 							'last_name',
60 					),
61 			),
62 	),
63   //Show 10 max results
64 	'max_results' =&gt; 10,
65   //Do not show deleted
66 	'deleted' =&gt; 0,
67 );
68 $result = restRequest('get_entry_list',$entryArgs);
69 
70 print_r($result);</pre>

</div>

-----


</div>
For a full list of API methods and their arguments see [[#chap20.xhtml#appendix-b|Appendix B]].

### Adding custom API methods ###

Sometimes the existing API methods are not sufficient or using them for a task would be overly complex. SuiteCRM allows the web services to be extended with additional methods or overriding existing methods.

The recommended path for custom entry points is the following<br />
<code>custom/service/&lt;version&gt;_custom/</code>. At the time of writing the latest web service version is <code>v4_1</code> so this would be <code>custom/service/v4_1_custom/</code>.

Next we create the implementing class. This will create our new method. In our example we will simply create a new method which writes to the SuiteCRM log We will call this method<br />
<code>write_log_message</code>.

<div class="code-block">

Example 16.5: Custom v4_1 Web Service Implementation


-----

<div class="highlight">

<pre> 1 &lt;?php
 2 if(!defined('sugarEntry')){
 3   define('sugarEntry', true);
 4 }
 5 require_once 'service/v4_1/SugarWebServiceImplv4_1.php';
 6 class SugarWebServiceImplv4_1_custom extends SugarWebServiceImplv4_1
 7 {
 8 
 9   function write_log_message($session, $message)
10   {
11     $GLOBALS['log']-&gt;info('Begin: write_log_message');
12 
13     //Here we check that $session represents a valid session
14     if (!self::$helperObject-&gt;checkSessionAndModuleAccess(
15                                                     $session, 
16                                                     'invalid_session', 
17                                                     '', 
18                                                     '', 
19                                                     '',  
20                                                     new SoapError()))
21     {
22       $GLOBALS['log']-&gt;info('End: write_log_message.');
23       return false;
24     }
25     $GLOBALS['log']-&gt;info($message);
26     return true;
27   }
28 }</pre>

</div>

-----


</div>
Next we create the registry file which will register our new method.

<div class="code-block">

Example 16.6: Custom v4_1 web service registry


-----

<div class="highlight">

<pre> 1 &lt;?php
 2     require_once 'service/v4_1/registry.php';
 3     class registry_v4_1_custom extends registry_v4_1
 4     {
 5         protected function registerFunction()
 6         {
 7             parent::registerFunction();
 8             $this-&gt;serviceClass-&gt;registerFunction('write_log_message', 
 9                                                   array(
10                                                     'session'=&gt;'xsd:string',
11                                                     'message'=&gt;'xsd:string'), 
12                                                   array(
13                                                     'return'=&gt;'xsd:boolean')
14                                                   );
15         }
16     }</pre>

</div>

-----


</div>
Finally we create the entry point. This is the actual file that will be called by our API clients. This will reference the two files which we have created and will call the webservice implementation with our files.

<div class="code-block">

Example 16.7: Custom v4_1 REST Entry point


-----

<div class="highlight">

<pre> 1 &lt;?php
 2 chdir('../../..');
 3 
 4 require_once 'SugarWebServiceImplv4_1_custom.php';
 5 
 6 $webservice_path = 'service/core/SugarRestService.php';
 7 $webservice_class = 'SugarRestService';
 8 $webservice_impl_class = 'SugarWebServiceImplv4_1_custom';
 9 $registry_path = 'custom/service/v4_1_custom/registry.php';
10 $registry_class = 'registry_v4_1_custom';
11 $location = 'custom/service/v4_1_custom/rest.php';
12 
13 require_once 'service/core/webservice.php';</pre>

</div>

-----


</div>
<div class="code-block">

Example 16.8: Custom v4_1 SOAP Entry point


-----

<div class="highlight">

<pre> 1 &lt;?php
 2 chdir('../../..');
 3 require_once('SugarWebServiceImplv4_1_custom.php');
 4 $webservice_class = 'SugarSoapService2';
 5 $webservice_path = 'service/v2/SugarSoapService2.php';
 6 $webservice_impl_class = 'SugarWebServiceImplv4_1_custom';
 7 $registry_class = 'registry_v4_1_custom';
 8 $registry_path = 'custom/service/v4_1_custom/registry.php';
 9 $location = 'custom/service/v4_1_custom/soap.php';
10 require_once('service/core/webservice.php');</pre>

</div>

-----


</div>
#### Usage ####

We can now use our custom endpoint. This is identical to using the API as detailed above, except that we use our custom entry point for either the SOAP WSDL or REST URL. For example using the same SuiteCRM location (<code>example.com/suitecrm</code>) as the above examples and using <code>v4_1</code>, we would use the following

<div class="code-block">

Example 16.9: Custom v4_1 URLS


-----

<div class="highlight">

<pre>1 //SOAP WSDL
2 example.com/suitecrm/custom/service/v4_1_custom/soap.php?wsdl
3 //REST URL
4 example.com/suitecrm/custom/service/v4_1_custom/rest.php</pre>

</div>

-----


</div>

</div>
