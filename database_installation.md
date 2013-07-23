---
title: database installation
layout: wiki
---
{% include toc.md %}
#  Database installation

Before you can set up your own server you have to decide wich database backend you want to use. Currently, the server supports three different types of database backends:
 * mySQL
 * SQLite
 * PostgreSQL

###  Settings up SQLite (Default database)

####  Requirements

So far, the Mana Server has been tested with SQLite version 3.6.23.1

####  Preparation of database file

The creation of a new database file is very easy. Just go to the directory where you want to create it and type:

  sqlite3 mana.db &lt; ${the Mana server-dir}/src/sql/sqlite/createTables.sql

This will create the `mana.db` file and execute the SQL statements in `createTables.sql`. To verify if the installation was successful, you could do in a shell prompt:

  $ sqlite3 mana.db
  sqlite&gt; .tables

This should give you a list of mana_* tables.

####  Configuring the Mana server to use the database

Before starting the Mana server, you'll have to configure the account server where your database file is located. <br />
The Mana server engines use a XML file called `[manaserv.xml](manaserv.xml.html)` with an easy to read *key = value* structure.

Locate the option `sqlite_database` and modify the value attribute according to your environment. You can use a relative path starting at the location of your the Mana server executable.

{% highlight xml %}
 <option name="sqlite_database" value="./mana.db"/>
{% endhighlight %}


###  Settings up MySQL

####  Requirements

To run the Mana server with MySQL you should use a MySQL version &gt;= 5.0.*. It was tested successfully with 5.0.51a. <br />
**Note:** You need to compile the Mana server with MySQL support to be able to use MySQL: See [Compilation of the Mana server](compile_manaserv_from_source.html) for more information

####  Creating a database and a user

This chapter assumes, that you still have little experience working with mysql, so it does not describe how to install MySQL itself. <br />
The first step to get the Mana server running under MySQL would be the creation of a database and a user.

As you can easily do this with graphical frontends like [phpMyAdmin](http://www.phpmyadmin.net), we will give you a handy script for doing that from command line. <br />
Don't forget to replace the placeholders with appropriate values for your environment.

For the following commands you have to be logged in as a database administrator, preferably `root`.

 * Create a system user used for the Mana server connection, manasys for instance. <br /> The MySQL server should say that our new user is only allowed from our local machine:

  CREATE USER 'manasys'@'localhost' IDENTIFIED BY '&lt;insert your favorite password here&gt;';

 * Allow the user to connect to the server without any resource limitations, in that case: <br /> (You may want to review the allowed resources on your own.)

  GRANT USAGE ON * . * TO 'manasys'@'localhost' IDENTIFIED BY '&lt;the chosen password&gt;' WITH MAX_QUERIES_PER_HOUR 0 MAX_CONNECTIONS_PER_HOUR 0 MAX_UPDATES_PER_HOUR 0 MAX_USER_CONNECTIONS 0;

 * Create a new database called 'mana', for instance:

  CREATE DATABASE IF NOT EXISTS `mana`;

 * Give our new user full privileges on our new created database:

  GRANT ALL PRIVILEGES ON `mana` . * TO 'manasys'@'localhost';

In short, we have now a new database called `mana`, a new database user `manasys` that has full rights in its database, and the restriction that it is only able to connect from localhost.

####  Create database tables

If our new database user is ready for use, we have to create all necessary tables. The installation of the Mana server is providing you a ready to use database script.

You can find this script in the following folder: `./src/sql/mysql/createTables.sql` <br />
To run this script connect as user manasys to your database from a shell prompt, fro instance:

  mysql --host=localhost --user=manasys --password=&lt;password&gt; --database=&lt;mana&gt;

After typing your password you should be connected to the database. The command `\.` runs a database script:

  \. &lt;path to the script&gt;/createTables.sql
  -- e.g.
  \. ~/manaserv/src/sql/mysql/createTables.sql

####  Configuring the Mana server to use the database

The following options need to be set in your [manaserv.xml](manaserv.xml.html) (change them to your actual used settings):

  &lt;option name="mysql_hostname" value="127.0.0.1"/&gt;
  &lt;option name="mysql_port" value="3306"/&gt;
  &lt;option name="mysql_database" value="mana"/&gt;
  &lt;option name="mysql_username" value="mana"/&gt;
  &lt;option name="mysql_password" value="password"/&gt;


###  Settings up PostgreSQL

`'TODO`'
