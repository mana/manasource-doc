---
title: serverlist.xml
layout: wiki
---
{% include toc.md %}
#  serverlist.xml

The serverlist.xml file is used to advertised available servers, giving information about them like their name, type, address, port, and minimum client version supported.

The server list is specified in the [branding file](branding.xml.html). If a server isn't given on the command-line, the file is downloaded (or used from disk if it can't be) and the user presented with the servers it lists, along with the X most recent servers the client has connected (identical type, address, and port are shown as a single entry instead of multiple, with the latest name, minimum version, etc, used). The last used servers are listed first, with the most recent on top, then the remaining servers from the downloaded list.

Here is an example, taken from [http://manasource.org/serverlist.xml](http://manasource.org/serverlist.xml).

{% highlight xml %}
<serverlist version="1">
 <server name="The Mana World" type="eathena">
  <connection hostname="server.themanaworld.org" port="6901" protocol="TCP"/>
  <state>PRODUCTION</state>
  <support>http://themanaworld.org/</support>
 </server>

 <server name="The Mana World (German)" type="eathena">
  <connection hostname="germantmw.ath.cx" port="6901" protocol="TCP"/>
  <state>DEVELOPMENT</state>
  <support>http://germantmw.ath.cx/</support>
 </server>

 <server name="The Mana World (Brazil)" type="eathena">
  <connection hostname="server.themanaworld.com.br" port="6901" protocol="TCP"/>
  <state>PRODUCTION</state>
  <support>http://www.themanaworld.com.br/</support>
 </server>

 <server name="Invertika" type="manaserv">
  <connection hostname="server.invertika.org" port="9601" protocol="UDP"/>
  <state>TEST</state>
  <support>http://www.invertika.org/</support>
 </server>

 <server name="Mana Testing" type="manaserv">
  <connection hostname="testing.manasource.org" port="9601" protocol="UDP"/>
  <description>This is the Mana test server.</description>
  <state>TEST</state>
  <support>http://manasource.org/</support>
 </server>
</serverlist>
{% endhighlight %}

<table class="table table-bordered table-hover" markdown="1">
    <thead>
        <tr>
            <th colspan="2">`serverlist` node</th>
        </tr>
    </thead>
    <tbody>
        <tr>
            <th>Parameter name</th>
            <th>Description</th>
        </tr>
        <tr>
            <td>version</td>
            <td>Tells the XML format version, used by the client to handle potential backward compatibility and/or feedback in case of errors.</td>
        </tr>
        <tr>
            <th colspan="2">`server` child node</th>
        </tr>
        <tr>
            <th>Parameter name</th>
            <th>Description</th>
        </tr>
        <tr>
            <td>name</td>
            <td>The server name is displayed as the first element in the client server selection list.</td>
        </tr>
        <tr>
            <td>type</td>
            <td>The server protocol type supported by the server. Currently, tmwAthena (and eAthena for backwards compatibility) and the Mana server are supported. If the type is unknown (or not specified), the client will ignore the entry.</td>
        </tr>
        <tr>
            <td>minimumVersion</td>
            <td>The minimum support client version. Clients older than the minimum will show "requires v*X*" (where *X* is the minimum version specified) in red with the entry.</td>
        </tr>
        <tr>
            <th colspan="2">`connection` child node</th>
        </tr>
        <tr>
            <th>Parameter name</th>
            <th>Description</th>
        </tr>
        <tr>
            <td>hostname</td>
            <td>The server hostname or IP used to connect to.</td>
        </tr>
        <tr>
            <td>port</td>
            <td>The server port used to connect to.</td>
        </tr>
        <tr>
            <td>protocol</td>
            <td>The base protocol used to handle connection. Should be TCP for tmwAthena, and UDP for the Mana server.</td>
        </tr>
        <tr>
            <th colspan="2">`description` child node</th>
        </tr>
        <tr>
            <td colspan="2">Gives a short description of the given server.</td>
        </tr>
        <tr>
            <th colspan="2">`state` child node</th>
        </tr>
        <tr>
            <td colspan="2">Gives one of the three defined values: PRODUCTION, TEST, DEVELOPMENT. These values determine the server use and state the quality and bug-free content the user will find there. Currently not used.</td>
        </tr>
        <tr>
            <th colspan="2">`support` child node</th>
        </tr>
        <tr>
            <td colspan="2">Gives the main website supporting the given server.</td>
        </tr>
    </tbody>
</table>
