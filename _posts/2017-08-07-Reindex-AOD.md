---
layout: post
title: 'Reindexing AOD Search'
categories: [Database, File System, Search, Troubleshooting]
---
SuiteCRM relies on an indexing service called Lucene to handle the Advanced Search (accessible from every screen, on the top right corner). Sometimes this can stop working and a full-reindexing might be needed to get it working again.

## Lock files

Under directory `modules/AOD_Index/Index/Index`, lock files (with extension `.lock` are safe to delete if their timestamps are old. They are left-overs from a process that might be stalled for days or weeks. Sometimes this can be enough.

## Provoking a full reindexing process

Please do a full backup of the affected directories and tables before running these procedures.

Try to make steps 1 and 2 in quick succession so that no indexing cron jobs run betweem them (or if you prefer, disable cron jobs temporarily).

1. From your SuiteCRM root, rename the Index folder (later, you can delete it):

`mv modules/AOD_Index/Index/Index modules/AOD_Index/Index/Index.BACKUP`

If you're using a different command (like `rm`), note that you must delete also that final Index directory, not just the files within it.

2. In your database, backup (by exporting) and then delete all rows from SQL tables `aod_index` and `aod_indexevent`. Don't delete the tables themselves, just the rows in them.

3. In SuiteCRM Schedulers, make sure that "Optimise AOD Index" and "Perform Lucene Index" are running at their appointed times.

4. If you want to track the reindexing (may take a LONG time) you can use this neat command:

`watch du -h modules/AOD_Index/Index/Index`

This shows the directory size. As the indexer progresses, it seems to create and delete many temporary files, so the size will both increase and decrease, that's normal. Of course eventually the final size will be bigger than the initial. 
