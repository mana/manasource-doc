---
title: permissions.xml
layout: wiki
---
{% include toc.md %}
#  Account Permission File permissions.xml

This file is for managing the permission model of the server.

the Mana server supports up to 8 permission classes which can include different permissions. Every player account can have any combination of permission classes, so it is rarely neccessary to put the same permission into different classes. Every newly created account has the class 1 automatically, so permissions of a normal player should be placed here.

##  permissions.xml
{% highlight xml %}
<permissions>
 <class level="1">
  <alias>Player</alias>
  <allow>!login</allow>
  <allow>!chat</allow>
  <allow>!fight</allow>
  <allow>!level</allow>
  <allow>!createcharacter</allow>
  <allow>@where</allow>
 </class>
 <class level="2">
  <alias>GM</alias>
  <alias>Game Master</alias>
  <allow>@ban</allow>
  <allow>@kick</allow>
  <allow>@kill</allow>
  <allow>@warp</allow>
  <deny>!createcharacter</deny>
 </class>
 <class level="3">
  <alias>Dev</alias>
  <alias>Developer</alias>
  <allow>@spawn</allow>
  <allow>@item</allow>
  <allow>@warp</allow>
 </class>
[...]
 <class level="8">
  <alias>Admin</alias>
  <allow>@giverightclass</allow>
  <allow>@takerightclass</allow>
 </class>
</permissions>

{% endhighlight %}

###  &lt;allow&gt;
User with this class may perform this action. Action names starting with "@" are the corresponding @commands, those starting with "!" are other actions which are not performed with a command.

###  &lt;deny&gt;
A user with this class may `'not`' perform this action, even when it has other classes which allow it.

###  &lt;alias&gt;
Alternative name for a class which can be used in the @giverightclass or @takerightclass

##  Implementation status
###  supported
 * controlling @commands
 * giving and taking permission classes using @commands
 * &lt;allow&gt; tag
 * &lt;alias&gt; tag
###  unsupported
 * any !actions
 * checking permissions on account server
 * reading permissions from scripts
 * &lt;deny&gt; tag
