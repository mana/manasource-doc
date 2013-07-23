---
title: rights.xml
layout: wiki
---
{% include toc.md %}
#  Account Permission File permissions.xml

##  Current state
Currently the Mana server knows 8 permission classes (player, tester, gm, developer, administrator and 3 reserved for future use). The permissions of every class are hardcoded.

##  Target state
To allow server administrators to decide their server management policy it should be possible to freely name the 8 available classes and define the extent of their permissions. The limitation of 8 classes should stay because it allows the economic and performant method of storing it in an 8 bit bitfield.

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

##  Comments

