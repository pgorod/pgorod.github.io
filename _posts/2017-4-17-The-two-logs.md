---
layout: post
title: The two logs you need to know
categories: [Troubleshooting, Logs, File System]
---

SuiteCRM uses a couple of logs that give you helpful clues as to what is going on in your system. In fact, if you need to troubleshoot a problem, this is always worth checking.

## suitecrm.log ##

You'll find `suitecrm.log` in the base directory of your SuiteCRM installation. It will get rolled into several other files called `suitecrm_1.log`, `suitecrm_2.log`, etc., as the log fills up. 

You can control several logging options in `Admin / System Settings`. These will get saved into config.php, so if you prefer you can edit them from there also (just make sure you get it right!).

An important setting is the log level, which can be `Debug, Info, Warn, Deprecated, Error, Fatal, Security`. These level start from the most verbose to the least verbose. Normally you can keep it at `Error` or even `Fatal`. But if you need to troubleshoot something then raising the verbosity might get you precious information.

An obvious thing that tends to be forgotten by newbies is to concentrate on messages at the time when your problem occurred. You know, press the button that crashes at 8:00 pm, check what the log shows at 8:00 pm!

You can safely ignore messages like "Information" and "Notice", or even "Warnings", if you don't have any noticeable symptoms of that issue. There's a lot of stuff in the logs, and you have to gauge how significant it is; sometimes it's simply not.

## php_errors.log ##

This one is not strictly a SuiteCRM log, it's a web server log. But it's quite useful to troubleshoot PHP errors. Some errors only show on this log, because SuiteCRM might crash with a fatal PHP error without having an error-handler to log a prettier message in `suitecrm.log`.

You might need to turn on this log in your relevant `php.ini` file, by uncommenting or typing the following line:

`error_log = php_errors.log`

Again, for this log, pay attention to `Fatal` and `Error` messages, and ignore the rest, at least on your first approach.

Unlike the other log, this one includes _stack traces_ which help you see the names of the functions that were being called when the error occurred.

## upgradeWizard.log ##

I know I promised only two logs, but here's a third one to surprise you. Also found in the root of your SuiteCRM installation, `upgradeWizard.log` contains the results of the original installation and SuiteCRM upgrades. So if you're troubleshooting an upgrade that didn't complete, or one that completed but left you with a broken system, this is the first place to check.