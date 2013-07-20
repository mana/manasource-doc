---
title: skills.xml
layout: wiki
---
{% include toc.md %}
#  skills.xml

The skills.xml file is used to set up the different skills used by the player to gain experience while in game.

**Warning: WIP** Currently, the implementation isn't fully tested. Feel free to [report bug in our mantis](mantis_workflow.html).

Here is an example of a [skills.xml](https://github.com/mana/manaserv/blob/master/example/skills.xml ) file:

{% highlight xml %}
<?xml encoding="UTF-8" version="1.0"?>
<skills>
    <set name="Weapons">
        <skill id="100" name="Unarmed" icon="graphics/images/unarmed.png" default="true" />
        <skill id="101" name="Knife" icon="graphics/images/knife.png" />
        <skill id="102" name="Sword" icon="graphics/images/sword.png" />
    </set>
    <set name="Magic">
        <skill id="200" name="Magic Example" />
    </set>
    <set name="Crafts">
        <skill id="300" name="Craft Example" />
    </set>
</skills>
{% endhighlight %}

<table class="table table-bordered table-hover" markdown="1">
    <thead>
        <tr>
            <th colspan="7">`skills` node</th>
        </tr>
    </thead>
    <tbody>
        <tr>
            <th colspan="7">`set` child node</th>
        </tr>
        <tr>
            <th>Parameter name</th>
            <th>Type</th>
            <th>Required in client</th>
            <th>Required in account-server</th>
            <th>Required in game-server</th>
            <th>Default value</th>
            <th>Description</th>
        </tr>
        <tr>
            <td>name</td>
            <td>**string**</td>
            <td>yes</td>
            <td>no</td>
            <td>no</td>
            <td>""</td>
            <td>The skill group name. Sets are used to visually group skills in the same tab in the client's skill window.</td>
        </tr>
        <tr>
            <th colspan="7">`skill` child node</th>
        </tr>
        <tr>
            <th>Parameter name</th>
            <th>Type</th>
            <th>Required in client</th>
            <th>Required in account-server</th>
            <th>Required in game-server</th>
            <th>Default value</th>
            <th>Description</th>
        </tr>
        <tr>
            <td>id</td>
            <td>**integer**</td>
            <td>yes</td>
            <td>yes</td>
            <td>yes</td>
            <td>0</td>
            <td>The skill Id used internally. Must be \&amp;gt; 0 and unique.</td>
        </tr>
        <tr>
            <td>name</td>
            <td>**string**</td>
            <td>yes</td>
            <td>yes</td>
            <td>yes</td>
            <td>-</td>
            <td>The skill name.</td>
        </tr>
        <tr>
            <td>icon</td>
            <td>**string**</td>
            <td>no</td>
            <td>no</td>
            <td>no</td>
            <td>""</td>
            <td>The icon image displayed in the client.</td>
        </tr>
        <tr>
            <td>default</td>
            <td>**boolean**</td>
            <td>no</td>
            <td>yes</td>
            <td>yes</td>
            <td>false</td>
            <td>Whether this skill is the default one used to get XP. Only one skill can be the default.</td>
        </tr>
    </tbody>
</table>
