---
title: maps.xml
layout: wiki
---
{% include toc.md %}
#  maps.xml configuration

The `maps.xml` file is used to each map files((.tmx - [Tiled map editor](http://www.mapeditor.org) format)) a unique ID, used by both the game and account server.

{% highlight xml %}
<?xml version="1.0" encoding="utf-8"?>
<maps>
    <map id="1" name="tulimshar"/>
    <map id="2" name="eastwoods"/>
    <map id="3" name="greathouse"/>
    ...
</maps>
{% endhighlight %}

The maps xml format is very simple. A `&lt;maps&gt;` node must envelop `&lt;map&gt;` childnodes.
<br /> Each `&lt;map&gt;` node must have two required parameters:

<table class="table table-bordered table-hover" markdown="1">
    <thead>
        <tr>
            <th>Parameter name</th>
            <th>Type</th>
            <th>Description</th>
        </tr>
    </thead>
    <tbody>
        <tr>
            <td>id</td>
            <td>integer</td>
            <td>The map id used by both the account and the game server. Note that the id must be unique, and one of them has to correspond to the `char_startMap` and `respawnMap` id values in the [manaserv.xml](manaserv.xml.html) file.</td>
        </tr>
        <tr>
            <td>name</td>
            <td>string</td>
            <td>The name of the map file to be used when calling data with the corresponding the map ID. The filename is to be given without the file extension (.tmx or .tmx.gz), and is relative to the `data/maps` directory.</td>
        </tr>
    </tbody>
</table>
