---
title: upgrade database
layout: wiki
---
{% include toc.md %}
#  Database Upgrade

When necessary, the database model used by the Mana server will be extended or modified. <br />
To prevent inconsistencies between the database model and the account server, the database model has its own version number which has to match the known version of the account server.

That means, if you upgrade you database model, you also have to update the Mana server and vice versa. If the version of your database is incompatible with you version of the account server, the account server will print out a message like this at startup:

    [FTL] Error opening the database: Database version is not supported. Needed version: '1', current version: '2'

In this case, the version of your database is newer, than the version of the account server. You'll have to get the [latest sources](http://www.manasource.org/downloads.html) of the Mana server.

###  Determine the database version

To find out which version your current database is of, try the following SELECT statement, which should work well independently of your database backend.

    SELECT value FROM mana_world_states WHERE state_name = 'database_version';

This should give you a numeric value which represents your current database version. When using SQLite, try the following statement:
<br /> (In a shell and from the directory where the file mana.db is located.)

    sqlite3 mana.db "SELECT value FROM mana_world_states WHERE state_name = 'database_version'";

###  How to upgrade my database

According to your chosen database backend, you will find a subdirectory called "updates" under `manaserv/src/sql/&lt;db_backend&gt;`. <br />
The update scripts follow a naming scheme like `update_&lt;old_version&gt;_to_&lt;new_version&gt;.sql`. So if your current version is "1" and you want to upgrade to "2", find the script called `update_1_to_2.sql`.

Steps to execute the script depends on your backend. For SQLite just move to the folder where your current database file "mana.db" lies and type:

    sqlite3 mana.db &lt; src/sql/sqlite/updates/update_1_to_2.sql

**Attention:** The scripts don't check what version you are running, so check it before running a script!
