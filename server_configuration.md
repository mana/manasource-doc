---
title: server configuration
layout: wiki
---
{% include toc.md %}
#  the Mana server Configuration

**Note:** This article is about setting up your own the Mana server, either for testing purposes or because you want to provide an alternative to the official server. <br />
To get support about setting up a **TmwAthena server**, please have a look at [The Mana World wiki](http://wiki.themanaworld.org/index.php/Main_Page).

There are several steps to achieve this:

###  Running the Mana server

 * [Install](database_installation.html) or [upgrade](upgrade_database.html) your database backend.

 * Prepare the different configuration files as much as you can, starting by the manaserv.xml file:
The server uses the following configuration files: <br />
[manaserv.xml](manaserv.xml.html) <br />
data/[attributes.xml](attributes.xml.html) <br />
data/[equip.xml](equip.xml.html) <br />
data/[items.xml](items.xml.html) <br />
data/[skills.xml](skills.xml.html) <br />
data/[maps.xml](maps.xml.html) <br />
data/[monsters.xml](monsters.xml.html) <br />
data/[permissions.xml](permissions.xml.html) <br />

 * Get the client data from [Git](git_repository.html) and put it into a `client-data` directory where you will be running the game server from.
 * Get the server data, also from git, and put it into a `server-data` directory.
 * Copy the `docs/manaserv.xml.example` file to your favourite directory with the name `manaserv.xml`, for instance and change the following configuration values to your corresponding client-data and server-data paths:
      * `serverPath` to the default path.
      * `clientDataPath` to the path of your client data.
      * `serverDataPath` to the path of your server data.
 * Note that you can use the data given in the `example/` folder to start with a proper base.
 * Start the account server and the game server (The starting sequence doesn't matter.).

**Note:** you can use the `--config` option to set where your manaserv.xml file is located. E.g.:
  manaserv-game --config /path/to/my/manaserv.xml
  
**Tip:** Type `manaserv-account --help` and `manaserv-game --help` to get the list of available options.

###  Making yourself a GM

This assumes that you are using sqlite as database backend (default) and that your accountname is "MyAccount". When you use another database backend you should be able to use the same SQL statements but you will need different tools to run them. Giving GM rights to an account with a name different from "MyAccount" is an exercise left to the reader :)

####  For SQLite database users (default)

 * Get sqlite3 from http://www.sqlite.org/download.html
 * Put it into the manaserv directory
 * Open a command prompt inside the Mana server directory
 * Enter `sqlite3 mana.db "UPDATE mana_accounts SET level=255 WHERE username='MyAccount';"`
 * You can check if you were successful by entering `sqlite3 mana.db "SELECT username, level FROM mana_accounts;"` (lists all accounts and their userlevels) or `sqlite3 mana.db "SELECT username FROM mana_accounts WHERE level &gt; 1;"` (lists all GM accounts)

####  For MySQL database users

 * The SQL requests are the same, except that you'll have to logon the mySQL server, using a shell command for instance:
  mysql --user=&lt;user&gt; --password=&lt;password&gt; --hostname=&lt;hostname&gt; --port=&lt;port&gt;
 * Choose the database: `use &lt;my-database-name&gt;;`
 * Then, you can enter the SQL requests: `"UPDATE mana_accounts SET level=255 WHERE username='MyAccount';"`
 * You can check if you were successful by entering `"SELECT username, level FROM mana_accounts;"` (lists all accounts and their userlevels) or `"SELECT username FROM mana_accounts WHERE level &gt; 1;"` (lists all GM accounts)

####  For PostgreSQL database users

FIXME: This is to be done.


**Note:** The level 255 means maximum rights. When you want to give selected people limited rights, refer to the [permissions.xml](permissions.xml.html) file configuration.

Basic knowledge of [SQL](http://en.wikipedia.org/wiki/SQL) and [how to use it](http://sqlzoo.net/) is an important skill for a the Mana server administrator.
