---
layout: post
title: Creating a Custom SuiteP Sub-theme
categories: [Customization, Themes]
---

Since SuiteCRM 7.10, the SuiteP theme started to have 4 Sub-themes called **Dawn**, **Day**, **Dusk** and **Night**. This article teaches how to "fork" one of these and start a new Sub-theme of your own. I will create a new Sub-theme called **Noon**, based on **Day**, and I will make some changes in order to increase the contrast in some parts of the app.

## Forking an existing Sub-theme ##

I start by editing `custom/themes/SuiteP/themedef.php`, and near the end, next to the similar lines, I add this one:

`   'Noon' => $app_strings['LBL_SUBTHEME_OPTIONS_NOON'],`

Now we need add that new label in a couple of places:

`custom/modules/Users/language/en_us.lang.php`:

{% highlight php %}
<?php
$mod_strings = array (
  'LBL_SUBTHEME_OPTIONS_NOON' => 'Noon',
);
{% endhighlight %}

And a slightly different one for `$app_strings` here:

`custom/Extension/application/Ext/Language/en_us.NoonThemeLabel.php`:

{% highlight php %}
<?php
$app_strings = array (
  'LBL_SUBTHEME_OPTIONS_NOON' => 'Noon',
);
{% endhighlight %}

Next, we copy the subdirectory of the sub-theme that looks closest to what we want, giving this command from the root of the SuiteCRM installation:

`cp -R themes/SuiteP/css/Day themes/SuiteP/css/Noon`

At this point, just do a Quick Repair and Rebuild and the Sub-theme is operational and can be selected from the User's profile, `Advanced` tab.

## Compiling the styles ##

In order to be able to compile this CSS, you need to install a SASS compiler. On Ubuntu this can be done from your SuiteCRM directory with:

`composer require leafo/scssphp`

You can then compile using the following command everytime you change any `.scss` file:

`./vendor/bin/pscss -f compressed themes/SuiteP/css/Noon/style.scss >  themes/SuiteP/css/Noon/style.css`

Note that you always use this exact command even if you didn't change `style.scss`, but another `.scss` file, because this is the main file that includes all the others.

## Customizing the styles ##

There are several `.scss` files that can be changed. 

`themes/SuiteP/css/variables.scss`
`themes/SuiteP/css/color-palette.scss`
`themes/SuiteP/css/style.scss`

Here are a few tweaks I tried in `color-palette.scss` to add more contrast:

Top menus
`C2C3C$ > 555555`

Lettering
`817C8D > 111`

Sidebar
`929798 > 626768`
`707d84 > 303d44`



The full `color-palette.scss` looks like this after the changes:

{% highlight css %}
//********************
//* color palette
//********************
$color-1: #000000;
$color-2: #31708F;
$color-3: #333333;
$color-4: #378CBE;
$color-5: #3C763D;
$color-6: #444444;
// See list view
$color-7: #4B97C4;
$fg-color-7: #111;
$color-8: #555556;
$color-9: #555557;
$color-10: #5CB85C;
$color-11: #CCE3F0;
$color-12: #666666;
$color-13: #303D44;
$color-14: #677785;
$color-15: #6A6578;
$color-16: #6EA674;
$color-17: #6A80E6;
$color-18: #757083;
$color-19: #777777;
$color-20: #626768;
$color-21: #79996A;
$color-22: #808F9C;
$color-23: #829EB5;
$color-24: #8499AB;
$color-25: #888888;
$color-26: #8A6D3B;
$color-27: #93A0AB;
$color-28: #303D44;
$color-29: #89b3ac;
$color-30: #99534D;
$color-31: #999999;
$color-32: #A2A5AF;
$color-33: #3E7291;
$color-34: #c4e3f5;
$color-35: #76C1B7;
$color-36: #ABC3D7;
$color-37: #B29EB5;
$color-38: #BBE6A5;
$color-39: #555558;
$color-40: #C4C3C7;
$color-41: #C9D2DA;
$color-42: #CCE8E2;
$color-43: #5FA9D4;
$color-44: #FFFFFF;
$color-45: #E2E7EB;
$color-46: $color-7;
$color-47: #E6D5A5;
$color-48: #E6E6E6;
$color-49: #FF0000;
$color-50: #FFFFFF;
$color-51: #F5F5F5;
$color-52: #F8F8F8;
$color-53: #63AAD4;
$color-54: #FAF7CF;
$color-55: #FAFAFA;
$color-56: #4B97C4;
$color-57: #A5E6E6;
$color-58: #A94442;
$color-59: #AFAABF;
$color-60: #B3C0C7;
$color-61: #C7254E;
$color-62: #CCCCCC;
$color-63: #D9EDF7;
$color-64: #E6E6E6;
$color-65: #DFDFDF;
$color-66: #DFF0D8;
$color-67: #E0DDEB;
$color-68: #E3E3E3;
$color-69: #E5E5E5;
$color-70: #E67C73;
$color-71: #ECE9F5;
$color-72: #EDEBF5;
$color-73: #F2DEDE;
$color-74: #F5F5F5;
$color-75: #F7F7F7;
$color-76: #F8F8F8;
$color-77: #F9F2F4;
$color-78: #F9F9F9;
$color-79: #FCF8E3;
$color-80: #FFFFFF;
$color-81: #F08377;
$color-82: #FFFFFF;
{% endhighlight %}

Note that I just customized some "quick wins", a few colors that I could change and affect a lot of places in the application. There are many other things that need to be tuned after this.