---
title: manaweb connectors
layout: wiki
---
{% include toc.md %}
#  What is a Manaweb Connector?

The Manaweb Connector is a package of methods provided by Manaweb to allow foreign applications to access data of the running the Mana server server. A common example is a list of online users that are currently connected to the server. Manaweb is able to deliver the data in different formats to be as open as possible for all kinds of applications, e.g. plain text or XML.

##  FAQ

###  How can I connect to the Connector?

There is no public installation of the [Account Manager](account_manager.html) respective the connector. If you set up an installation of your own, just navigate your browser to the main page of Manaweb and add a "index.php/connector/" to the URL. The URL might look like this: `http://localhost/manaweb/index.php/connector/`.

This is the root URL of the connector. Now you have to extend the URL with the name of the connector function you want to execute, e.g. `onlineuser` which will give you this URL: `http://localhost/manaweb/index.php/connector/onlineuser/`

Some methods might need input parameters or support different output formats. All parameters have to be added with a "/" to the URL, like the method name.


##  Method Specification

####  List of online users (onlineuser)

This will give you a list of all users online with a character in the Mana server.

####  Parameters
**Output format:**
 * **plain**
    * (default) a plain text file with one character name per line:
    * name
    * name2
    * ...

 * **XML** an XML file with more detailed information about each online character:

{% highlight xml %}
<users>
  <user name="[string]"
        gender="[number]"
        map="[number]"
        login_timestamp="[number]"
        login_date="[string]" />
  <user ...>
</users>
{% endhighlight %}

 * **CSV** A comma-separated list of character information, one online character per line:

    "name",gender,map,login_timestamp,"login_date"
    "name2",gender2,map2,login_timestamp2,"login_date2"
    ...


    * **name**: Name of the character
    * **gender**: 0 = male, 1 = female
    * **map**: ID of the current location (see [maps.xml](maps.xml.html))
    * **login_timestamp**: Unix time-stamp the character logged in
    * **login_date**: Time-stamp of login in ISO 8601 format (e.g. 2004-02-12T15:19:21+00:00)

##  Usage
The output format of the onlineuser module is specified like so: `connector/onlineuser/[plain|xml|csv]`
