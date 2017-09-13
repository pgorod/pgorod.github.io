---
layout: post
title: Size of Tables and Indexes in Database
categories: [Database, Troubleshooting]
---

SuiteCRM's Database can grow to a considerable size, depending on your use of the system. Having lots of data can be a good thing, but sometimes while investigating some error or performance problem, you will find an overgrown table. This post helps you track down those issues.

> Be careful when handling data directly in the database. A single badly written DELETE query can ruin your database. Be sure to Backup first and do things at your own risk.

## A view of table and index sizes ##

Here's a fancy query I picked up from somewhere on the web to get a view of your database sizes:

{% highlight sql %}
SELECT CONCAT(table_schema, '.', table_name),
       CONCAT(ROUND(table_rows / 1000000, 2), 'M')                                    rows,
       CONCAT(ROUND(data_length / ( 1024 * 1024 * 1024 ), 2), 'G')                    DATA,
       CONCAT(ROUND(index_length / ( 1024 * 1024 * 1024 ), 2), 'G')                   idx,
       CONCAT(ROUND(( data_length + index_length ) / ( 1024 * 1024 * 1024 ), 2), 'G') total_size,
       ROUND(index_length / data_length, 2)                                           idxfrac
FROM   information_schema.TABLES
ORDER  BY data_length + index_length DESC
LIMIT  10;
{% endhighlight %}

You can run this query from `phpMyAdmin` or `MySQL`, or the equivalent for your database.

Don't jump into conclusions when seeing the results. You need to think whether the numbers make sense for you, knowing your data and your company's activity. If something stands out as unjustified, then you might have found a problem.

## Deleted records ##

SuiteCRM doesn't really delete records when you delete them from the user interface. It simply marks them by setting a field called `deleted` to 1. Then all the other queries in the app ignore these records, so they don't appear anywhere in the app. But if you really need to recover them, you can do so by accessing the database directly.

If you have too many of those, normally you can safely purge them from the database. There is a Scheduler Job that does that maintenance, it's called `Prune Database`. Note that it is **not** enabled by default, you have to enable it deliberately, after considering the pros and cons of keeping deleted records in your case.

## Workflow left-overs ##

Other tables that frequently need manual pruning are `aow_processed` and `aow_processed_aow_actions`. These are related to Workflows and depend on your use of `repeated runs`. See this discussion for some interesting [comments](https://github.com/salesagility/SuiteCRM/issues/3328#issuecomment-290490251). Be careful and backup before touching this.

