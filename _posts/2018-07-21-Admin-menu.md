---
layout: post
title: Making the Admin menu double-column
categories: [Customization]
---

In previous versions of SuiteCRM, the Admin menu was double-column, making it more compact and easier to navigate. This customization helps you get that layout back.

## Creating a custom index.tpl ##

We start by copying `modules/Administration/index.tpl` to `custom/modules/Administration/index.tpl`, and then fill it with this content:

{% highlight html %}
{* <!--
/*********************************************************************************
 * SugarCRM Community Edition is a customer relationship management program developed by
 * SugarCRM, Inc. Copyright (C) 2004-2013 SugarCRM Inc.

 * SuiteCRM is an extension to SugarCRM Community Edition developed by Salesagility Ltd.
 * Copyright (C) 2011 - 2014 Salesagility Ltd.
 *
 * This program is free software; you can redistribute it and/or modify it under
 * the terms of the GNU Affero General Public License version 3 as published by the
 * Free Software Foundation with the addition of the following permission added
 * to Section 15 as permitted in Section 7(a): FOR ANY PART OF THE COVERED WORK
 * IN WHICH THE COPYRIGHT IS OWNED BY SUGARCRM, SUGARCRM DISCLAIMS THE WARRANTY
 * OF NON INFRINGEMENT OF THIRD PARTY RIGHTS.
 *
 * This program is distributed in the hope that it will be useful, but WITHOUT
 * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS
 * FOR A PARTICULAR PURPOSE.  See the GNU Affero General Public License for more
 * details.
 *
 * You should have received a copy of the GNU Affero General Public License along with
 * this program; if not, see http://www.gnu.org/licenses or write to the Free
 * Software Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA
 * 02110-1301 USA.
 *
 * You can contact SugarCRM, Inc. headquarters at 10050 North Wolfe Road,
 * SW2-130, Cupertino, CA 95014, USA. or at email address contact@sugarcrm.com.
 *
 * The interactive user interfaces in modified source and object code versions
 * of this program must display Appropriate Legal Notices, as required under
 * Section 5 of the GNU Affero General Public License version 3.
 *
 * In accordance with Section 7(b) of the GNU Affero General Public License version 3,
 * these Appropriate Legal Notices must retain the display of the "Powered by
 * SugarCRM" logo and "Supercharged by SuiteCRM" logo. If the display of the logos is not
 * reasonably feasible for  technical reasons, the Appropriate Legal Notices must
 * display the words  "Powered by SugarCRM" and "Supercharged by SuiteCRM".
 ********************************************************************************/

-->


*}


<div class="dashletPanelMenu wizard">
<div class="bd">

                <div class="screen admin-panel">

{if isset($MY_FRAME)}
    {$MY_FRAME}
{else}
    {log msg="MY_FRAME is not set"}
{/if}

{foreach  from=$ADMIN_GROUP_HEADER key=j item=val1}

   {if isset($GROUP_HEADER[$j][1])}
   <p>{$GROUP_HEADER[$j][0]}{$GROUP_HEADER[$j][1]}
   <div class="row other view forheader">

   {else}
   <p>{$GROUP_HEADER[$j][0]}{$GROUP_HEADER[$j][2]}
   <div class="row other view forheader">
   {/if}

    {assign var='i' value=0}
    {foreach  from=$VALUES_3_TAB[$j] key=link_idx item=admin_option}
        <div class="col-sm-6">
          <div class="row forrows{$j}">

            {if isset($COLNUM[$j][$i])}
                <div class="col-sm-4">
                    <span class="suitepicon suitepicon-admin-{$ICONS[$j][$i]}"></span>
                    <a id='{$ID_TAB[$j][$i]}' href='{$ITEM_URL[$j][$i]}' class="tabDetailViewDL2Link">{$ITEM_HEADER_LABEL[$j][$i]}</a>
                </div>
                <div class="col-sm-8">{$ITEM_DESCRIPTION[$j][$i]}</div>
            {else}
                <div class="col-sm-4">&nbsp;</div>
                <div class="col-sm-8">&nbsp;</div>
            {/if}
            </div>
       </div>
    {assign var='i' value=$i+1}
    {/foreach}

</div>
<p/>
{/foreach}

</div>
</div>

</div>


{% endhighlight %}

There is no need for a Quick Repair and Rebuild, this should work immediately.

## Things that need improvement ##

1. Some alignment issues aren't looking very good. I suck with CSS, if you have a suggestion to improve it, please say so in the comments. 

2. I am also not familiar with bootstrap, I just had a look at a tutorial and started using it. The responsive variations when the screen size changes could probably be very improved.