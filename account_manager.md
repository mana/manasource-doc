---
title: account manager
layout: wiki
---
{% include toc.md %}
#  The Mana World Account Manager

The Account Manager also known as ManaWeb is the web interface for users and administrators to manage their accounts from outside the game. Users can reset their password, see their character stats, and change the email associated with the account.

##  Installation

To install you need to clone ManaWeb from our sourcecode repository. See: [Git repository](git_repository.html).

You will need a web server running PHP 5.1 or later. If your accountserver uses SQLite as backend you have to enable pdo_sqlite for php.
On FreeBSD you will need to install ports databases/php5-pdo_sqlite and security/pecl-hash along with lang/php5.

##  Configuration

To get ManaWeb up and running there are several configuration steps to do. After uploading all scripts to your wwwroot, navigate with your browser to the root of the scripts ending with `setup.php`. This script will guide you through the setup progress and will tell you what to do next and why. If a task is red, fix it and reload the page until everything is in status green.

###  Single tasks

There are several config files that have to be prepared for your specific environment. You can find all config files under ./system/application/config

ManaWeb comes with a default configuration file called "config.default.php" You should use this file as template to set up your individual configuration. Make a copy of this file and name rename it to "config.php". In general you have to modify the following settings:

    set the "base_url" to the URL of your installation.
    define the desired "log_threshold" to your needs

Do the same with the file "database.default.php" and "email.default.php". Rename them to "database.php" and "email.php" configure the options inside for your needs.

The following configuration files are shipped with defaults that may or may not be suitable for you.

    menu.php
    tmw_config.php

Instead of modifying the files directly you should make a copy of them and rename them to `&lt;prefix&gt;.user.php`, so "menu.php" gets "menu.user.php". Tmwweb first loads menu.php, afterwards menu.user.php (if it exists) and overrides the default values with your custom settings. The advantage of this method is, that upgrading ManaWeb won't break your configuration.

`Warning: You should only keep the configuration settings you want to change in the \*.user.php files. Anything you don't want to change should be removed.`

`None of the other files in the config directory should be altered by you!`

After proper configuration of all files you have to ensure that the webserver has write access to the ./system/logs, the ./images/items and ./data directory.

    chmod 777 ./system/logs
    chmod 777 ./data
    chmod 777 ./images/items

TMWWeb tries to store cached data read from other modules like ManaServ in the data directory for faster access. Therefore you should allow the web server to create files there. The logs directory is used for logging as you can think.

##  Troubleshooting

After uploading and configuring ManaWeb, every page might show up white and blank. Lets set loglevel in config.php to 4 and after refreshing your site in the browser have a look at the logfiles under ./system/logs
If there is no file except index.html please recheck your directory permissions. Again, the web server needs write permissions to ./system/logs. If you cannot find a file that is named "config.php", please go back to the [Configuration](#configuration) chapter and read it more carefully!

##  Translations

TMWWeb has a simple multilingual support integrated. During login into your account you can choose one of the currently translated languages. If your native language is not available yet, feel free to support the dev team and translate ManaWeb.

###  How-to translate into your language
To start with a new language there are two simple steps to do:


Copy the directoy `./system/application/language/english` as it is the shipped language with ManaWeb and should contain all necessary strings. Also you have to copy ./system/language/english to your new language. This directory contains strings coming from CodeIgniter, the used PHP framework.

Each php file ending with `*_lang.php` needs to be translated.

       $lang['character'] = '&lt;put your translation here&gt;';

Make sure that you double quote inside of your strings, if necessary.


Lastly you have to add your new language to the configuration file `manaweb/system/application/config/mana_config.php`. Just add your language to the array `$_tmw_languages` like shown below. The parameter 'dir' has to be the name of your added directory, e.g. 'german'. The parameter 'name' is the displayed string during login. This should be the native name of the language, like 'deutsch'.

Don't forget a comma to separate language arrays.

       $_tmw_languages = array(
          array('dir'=&gt;'english', 'name'=&gt;'English'),
          array('dir'=&gt;'german', 'name'=&gt;'deutsch')
       );

##  Maintenance

The intention of ManaWeb is to be a slim, administrative front-end for ManaServ. Therefore it is natural to use as much as data, information and configuration we can get from ManaServ. Because ManaServ makes extensive use of XML configuration files, which would be too expensive to parse on every page request, ManaWeb uses different methods to cache those informations for faster access.

From time to time, if the data in ManaServ was modified, an administrator has to refresh the caches of ManaWeb. Therefore you can find a menu option "maintenance" when logged in with an administrative account. This page shows you all caches and allows you to refresh them with a single click.

###  items.xml

Refreshing the items database is a bit special, thats why it is mentioned here additionally.
To show the inventory of a character, the images of those items have to be available for a web browser. Therefore they have to reside somewhere under the DOCUMENT_ROOT of your web server. To keep all things together, we decided to store them under ./images/items. When refreshing the items database, ManaWeb looks in that directory and compares the images located there to all items in the database. If a image is missing, ManaWeb tries to copy this image from your ManaData path, you can configure in mana_config.php (see [Configuration](#configuration)).

To copy those images, the web server needs write permission to the images/items directory. If ManaWeb can't find the image in the ManaData directory or it is not allowed to write to the ./images/items directory, the refresh procedure will show you a list with all missing images. Then you will have to copy those images yourself.


##  ManaWeb Connector

The ManaWeb Connector is a package of methods provided by ManaWeb to allow foreign applications to access data of the running ManaServ server. A common example is a list of online users that are currently connected to the server. See [ManaWeb Connectors](manaweb_connectors.html) for a detailed description of available methods.
