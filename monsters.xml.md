---
title: monsters.xml
layout: wiki
---
{% include toc.md %}
#  monsters.xml file configuration
Data from the `monsters.xml` file are used to set up configuration values about every computered related beings
the players will encounter during the online experience.

The monsters.xml file has to be located in the **data** directory.

Each configuration option in this xml file, is defined using a `&lt;monster&gt;` tag within the `&lt;monster**s**&gt;` main node, which itself has got an `&lt;attributes&gt;` child node, and some others.
Here is an example:

{% highlight xml %}
 <?xml version="1.0"?>
 <monsters>
    <monster id="0" name="Maggot" targetCursor="small">
      <attributes
        hp="20"
        size="4"
        speed="2.0"
        evade="5"
        physical-defence="5"
        magical-defence="0"
        mutation="50"
      />
      <attack id="1"
        priority="1"
        type="physical"
        warmuptime="10"
        cooldowntime="10"
        reusetime="10"
        basedamage="10"
        deltadamage="1"
        chancetohit="1000"
        element="neutral"
        range="32"
        animation="attack"
      />

      <exp>10</exp>
    </monster>
 </monsters>
{% endhighlight %}

**Note:** This file can be used by both the client and the server if the necessary data is provided. That's why we provide options for both applications here for simplification and easier documentation purpose.
But when you should be careful to provide only the client data when dealing with client configuration, or the players will more information about the monsters than they should actually have.


##  General (Client and server) nodes description


###  &lt;monsters&gt; node description

The `&lt;monsters&gt;` node is the monsters.xml file main node and permits to determine monsters definition start and ending.
This node has only one parameter for now, `offset`, which is added to all the monster IDs. It defaults to 1002 for the
TmwAthena protocol, for backwards compatibility with older clients, which did it automatically in the netcode.

This node is **required** by both the client and the server.

{% highlight xml %}
 <?xml version="1.0"?>
 <monsters>
 ...
 </monsters>
{% endhighlight %}



###  &lt;monster&gt; node description

The `&lt;monster&gt;` node is used to define the different values used to bring a specific monster up to life within the game.
Each monster's definition is then defined within its start and ending tags.

This node is **required** by both the client and the server.

{% highlight xml %}
 <?xml version="1.0"?>
 <monsters>
   <monster id="1" name="Monster Name">
   ...
   </monster>
 ...
 </monsters>
{% endhighlight %}

<table class="table table-bordered table-hover" markdown="1">
    <thead>
        <tr>
            <th>Parameter name</th>
            <th>Type</th>
            <th>Mandatory</th>
            <th>Default value</th>
            <th>Description</th>
        </tr>
    </thead>
    <tbody>
        <tr>
            <td>id</td>
            <td>integer</td>
            <td>Yes</td>
            <td>&nbsp;</td>
            <td>It is the id of the monster. This parameter has to be unique for each monster. <br /> The system will use the monster id to refer on it in many ways.</td>
        </tr>
        <tr>
            <td>name</td>
            <td>string</td>
            <td>No</td>
            <td>"unnamed"</td>
            <td>Tells the monster name. Used to ease configuration on server and with the client <br /> but displayed to players on the client side.</td>
        </tr>
        <tr>
            <td>targetCursor</td>
            <td>string  <br /> defined value</td>
            <td>No</td>
            <td>"normal"</td>
            <td>Used by the client only. Tells which circle cursor size should be use when displaying the target cursor around the monster sprite while in game. It mainly depends on the sprite's pixel size. <br /> Acceptable values are: <br /> small <br /> normal <br /> large</td>
        </tr>
    </tbody>
</table>


###  &lt;attack&gt; node description
See [Attack Node Configuration](attackconfiguration.html#xml_attack_node)


##  Server nodes description


###  &lt;attributes&gt; node description

The `&lt;attributes&gt;` node is used to define the current monster main necessary attributes. These shouldn't be left in the client version.

This node is **required** by the server, and will be ignored by the client.

{% highlight xml %}
 <?xml version="1.0"?>
 <monsters>
   <monster id="1" name="Monster Name">
     <attributes
      hp="10"
      attack-min="5"
      hit="10"
      evade="5"
      physical-defence="5"
      ...
     />
   ...
   </monster>
 ...
 </monsters>
{% endhighlight %}

<table class="table table-bordered table-hover" markdown="1">
    <thead>
        <tr>
            <th>Parameter name</th>
            <th>Type</th>
            <th>Mandatory</th>
            <th>Default value</th>
            <th>Description</th>
        </tr>
    </thead>
    <tbody>
        <tr>
            <td>hp</td>
            <td>integer</td>
            <td>Yes</td>
            <td>&nbsp;</td>
            <td>The monster hit points.</td>
        </tr>
        <tr>
            <td>size</td>
            <td>integer</td>
            <td>No</td>
            <td>16</td>
            <td>The monster maximal amplitude in pixels. Used to compute player's hit area.</td>
        </tr>
        <tr>
            <td>speed</td>
            <td>float</td>
            <td>No</td>
            <td>4.0</td>
            <td>The monster's speed in tiles per second. <br /> (A tile is the smallest square map unit: by default, a tile is 32 pixel long.)</td>
        </tr>
        <tr>
            <td>attack-min</td>
            <td>integer</td>
            <td>Yes</td>
            <td>&nbsp;</td>
            <td>The minimal attack strength of the monster. If your character hasn't got any armor, <br /> these are the minimal hit points he/she will lose when hit by the monster.</td>
        </tr>
        <tr>
            <td>attack-delta</td>
            <td>integer</td>
            <td>Yes</td>
            <td>&nbsp;</td>
            <td>The amplitude between minimal and maximal damages the monster can do.</td>
        </tr>
        <tr>
            <td>attack-magic</td>
            <td>integer</td>
            <td>Yes</td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td>mutation</td>
            <td>integer</td>
            <td>No</td>
            <td>0</td>
            <td>The mutation indicates the amplitude in percent where attributes get modified with. <br /> For instance, with a mutation of 50, each attribute can be altered to become 100% to 149% of what they are. A value \&amp;lt; 0 or \&amp;gt; 99 will be ignored.</td>
        </tr>
        <tr>
            <td>gender</td>
            <td>string</td>
            <td>No</td>
            <td>unspecified</td>
            <td>The gender of the monster. Valid values are: "male", "female", "unspecified". This information has no effect on the behaviour of the being. But if a gender is set the client can display this gender.</td>
        </tr>
    </tbody>
</table>


###  &lt;behavior&gt; node description

The `&lt;behavior&gt;` node is used to define the monster's way to move and think when dealing with players interaction.
These values shouldn't be left in the client version.

This node is **required** by the server, and will be ignored by the client.

{% highlight xml %}
 <?xml version="1.0"?>
 <monsters>
   <monster id="1" name="Monster Name">
     <behavior
      aggressive="false"
      cowardly="false"
      track-range="5"
      stroll-range="64"
      attack-distance="32"
     />
   ...
   </monster>
 ...
 </monsters>
{% endhighlight %}

<table class="table table-bordered table-hover" markdown="1">
    <thead>
        <tr>
            <th>Parameter name</th>
            <th>Type</th>
            <th>Mandatory</th>
            <th>Default value</th>
            <th>Description</th>
        </tr>
    </thead>
    <tbody>
        <tr>
            <td>aggressive</td>
            <td>boolean <br /> true/false</td>
            <td>Yes</td>
            <td>&nbsp;</td>
            <td>Defines if the given monster will attack the player as soon as it see them. <br /> If set to "false", the monster only starts to attack its opponent once it received the first damages.</td>
        </tr>
        <tr>
            <td>cowardly</td>
            <td>boolean <br /> true/false</td>
            <td>Yes</td>
            <td>&nbsp;</td>
            <td>Defines if the monster will start to flee the battle once its HP are becoming low. <br /> **Note:** FIXME: Not implemented yet.</td>
        </tr>
        <tr>
            <td>track-range</td>
            <td>integer</td>
            <td>Yes</td>
            <td>&nbsp;</td>
            <td>Distance in tiles the monster tracks enemies in (pathfinding algorithmn is used for calculating distance).</td>
        </tr>
        <tr>
            <td>stroll-range</td>
            <td>integer</td>
            <td>Yes</td>
            <td>&nbsp;</td>
            <td>Distance in pixels the being chooses new destinations in when not fighting (as when wandering).</td>
        </tr>
        <tr>
            <td>attack-distance</td>
            <td>integer</td>
            <td>Yes</td>
            <td>&nbsp;</td>
            <td>Preferred distance in pixels to the enemy the monster tries to reach when in combat (horizontal or vertical). Used for range attackers, for instance. A value of 32 means a close combat range when your tiles side length are 32 pixels wide.</td>
        </tr>
        <tr>
            <td>script</td>
            <td>file name</td>
            <td>No</td>
            <td>""</td>
            <td>Filename of a script that controls the monsters behavior. Should only be used for rare monsters to reduce server load. (Providing this file makes all the other tags unnecessary). The script filename must be relative to the `data/scripts` directory.</td>
        </tr>
    </tbody>
</table>


###  &lt;exp&gt; node description

The `&lt;exp&gt;` node is used to define the reward points for defeating a monster. See the [experience](manaserv_statistics_system.html#experience_and_skills) documentation for further details.
These values shouldn't be left in the client version.

This node is optional but recommended for the server, and will be ignored by the client.

{% highlight xml %}
 <?xml version="1.0"?>
 <monsters>
   <monster id="1" name="Monster Name">
     <exp>150</exp>
   ...
   </monster>
 ...
 </monsters>
{% endhighlight %}

<table class="table table-bordered table-hover" markdown="1">
    <thead>
        <tr>
            <th>Type</th>
            <th>Mandatory</th>
            <th>Default value</th>
            <th>Description</th>
        </tr>
    </thead>
    <tbody>
        <tr>
            <td>integer</td>
            <td>No</td>
            <td>0</td>
            <td>Tells how much experience points a monster is giving upon victory.</td>
        </tr>
    </tbody>
</table>


###  &lt;drop&gt; node description

The `&lt;drop&gt;` node is used to define items dropped after defeating a monster. See the [items.xml](items.xml.html) documentation for further details.
There can be multiple &lt;drop&gt; nodes for one monster.
These values shouldn't be left in the client version.

This node is optional but recommended for the server, and will be ignored by the client.

{% highlight xml %}
 <?xml version="1.0"?>
 <monsters>
   <monster id="1" name="Monster Name">
     <drop item="522" percent="0.1" />
     <drop item="501" percent="15.0" />
   ...
   </monster>
 ...
 </monsters>
{% endhighlight %}

<table class="table table-bordered table-hover" markdown="1">
    <thead>
        <tr>
            <th>Parameter name</th>
            <th>Type</th>
            <th>Mandatory</th>
            <th>Default value</th>
            <th>Description</th>
        </tr>
    </thead>
    <tbody>
        <tr>
            <td>item</td>
            <td>integer</td>
            <td>Yes</td>
            <td>&nbsp;</td>
            <td>Tells the drop item Id taken into your [items.xml](items.xml.html) file.</td>
        </tr>
        <tr>
            <td>percent</td>
            <td>float</td>
            <td>Yes</td>
            <td>&nbsp;</td>
            <td>Tells the chance (8.0 = 8%) to see the drop be spanwed on the map floor after the monster's death.</td>
        </tr>
    </tbody>
</table>


###  &lt;script&gt; node description

The `&lt;script&gt;` node is used to define the monster through a whole script.

This node is optional for the server, and will be ignored by the client.

{% highlight xml %}
 <?xml version="1.0"?>
 <monsters>
   <monster id="1" name="Monster Name">
     <script>mymonster.lua</script>
   ...
   </monster>
 ...
 </monsters>
{% endhighlight %}

<table class="table table-bordered table-hover" markdown="1">
    <thead>
        <tr>
            <th>Type</th>
            <th>Mandatory</th>
            <th>Default value</th>
            <th>Description</th>
        </tr>
    </thead>
    <tbody>
        <tr>
            <td>string <br /> filename</td>
            <td>Yes</td>
            <td>&nbsp;</td>
            <td>The script filename to be used for the given monster. <br /> The script filename must be relative to the `data/scripts` directory.</td>
        </tr>
    </tbody>
</table>


###  &lt;vulnerability&gt; node description

The `&lt;vulnerability&gt;` node is used to define the current monster vulnerabilities, or on the opposite strength against one or several magical elements.
These values shouldn't be left in the client version.

This node is **optional** for the server, and will be ignored by the client.

{% highlight xml %}
 <?xml version="1.0"?>
 <monsters>
   <monster id="1" name="Monster Name">
     <vulnerability element="fire" factor="1.5" />
     <vulnerability element="earth" factor="0.7" />
   ...
   </monster>
 ...
 </monsters>
{% endhighlight %}

<table class="table table-bordered table-hover" markdown="1">
    <thead>
        <tr>
            <th>Parameter name</th>
            <th>Type</th>
            <th>Mandatory</th>
            <th>Default value</th>
            <th>Description</th>
        </tr>
    </thead>
    <tbody>
        <tr>
            <td>element</td>
            <td>string</td>
            <td>Yes</td>
            <td>""</td>
            <td>Tells to which element the weakness or the strength is. ('fire', 'earth', 'ice', 'metal' are some examples.)</td>
        </tr>
        <tr>
            <td>factor</td>
            <td>float</td>
            <td>Yes</td>
            <td>""</td>
            <td>Tells how much the recieved damage is reduced (example values: 0 would mean no damange is dealt at all, 1 means damage is left unchanged, 2 would mean double damage)</td>
        </tr>
    </tbody>
</table>


##  Client nodes description


###  &lt;sprite&gt; node description

The `&lt;sprite&gt;` node is used to define the monster sprite used to be displayed by the client.

This node is unused by the server, optional but very recommended for the client.

{% highlight xml %}
 <?xml version="1.0"?>
 <monsters>
   <monster id="1" name="Monster Name">
     <sprite>monsters/my-monster.xml</sprite>
   ...
   </monster>
 ...
 </monsters>
{% endhighlight %}

<table class="table table-bordered table-hover" markdown="1">
    <thead>
        <tr>
            <th>Type</th>
            <th>Mandatory</th>
            <th>Default value</th>
            <th>Description</th>
        </tr>
    </thead>
    <tbody>
        <tr>
            <td>xml filename</td>
            <td>Yes</td>
            <td>""</td>
            <td>Tells the xml file used to display the monster sprites. (Used by the Mana Client only). <br /> The given file must be relative to the `data/graphics/sprites` directory.</td>
        </tr>
    </tbody>
</table>


###  &lt;sound&gt; node description

The `&lt;sound&gt;` nodes are used to define the monster sounds played on certain monster's events.

This node is unused by the server, and optional for the client.

{% highlight xml %}
 <?xml version="1.0"?>
 <monsters>
   <monster id="1" name="Monster Name">
     <sound event="hit">monsters/maggot/maggot-hit1.ogg</sound>
     <sound event="hit">monsters/maggot/maggot-hit2.ogg</sound>
     <sound event="miss">monsters/maggot/maggot-miss1.ogg</sound>
   ...
   </monster>
 ...
 </monsters>
{% endhighlight %}

<table class="table table-bordered table-hover" markdown="1">
    <thead>
        <tr>
            <th>Parameter name</th>
            <th>Type</th>
            <th>Mandatory</th>
            <th>Default value</th>
            <th>Description</th>
        </tr>
    </thead>
    <tbody>
        <tr>
            <td>event</td>
            <td>string <br /> defined keywords</td>
            <td>Yes</td>
            <td>&nbsp;</td>
            <td>Tells the event at which the corresponding sound should be played. <br /> Available events are: <br /> 'die', 'miss', 'hit', 'strike', 'dodge'. <br /> There can be several sounds nodes and so, events for one monster. The same event can even be set multiple times. The given sounds are played randomly in this case.</td>
        </tr>
    </tbody>
</table>

