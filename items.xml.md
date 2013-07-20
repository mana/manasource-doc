---
title: items.xml
layout: wiki
---
{% include toc.md %}
#  items.xml file configuration
Data from the `items.xml` file are used to set up configuration values about every items
the players will be able to carry during his/her online experience.

The items.xml file has to be located in the **data** directory.

Each configuration option in this xml file, is defined using a `&lt;item&gt;` tag within the `&lt;item**s**&gt;` main node.
Here is an example:

{% highlight xml %}
 <?xml version="1.0"?>
 <items>
   <item id="501" name="Cactus Drink"
    image="use-potion-a.png|G:#22ff22"
    description="A fresh drink."
    effect="+15 HP"
    type="usable"
    hp="15"
    weight="4"
    max-per-slot="10"/>
    ...
 </items>
{% endhighlight %}

**Note:** This file can be used by both the client and the server if the necessary data is provided. That's why we provide options for both applications here for simplification and easier documentation purpose.
But when you should be careful to provide only the client data when dealing with client configuration, or the players will have more information about the items than they should.

##  General (Client and server) parameters description

<table class="table table-bordered table-hover" markdown="1">
    <thead>
        <tr>
            <th>Parameter name</th>
            <th>Type</th>
            <th>Mandatory</th>
            <th>Default value</th>
            <th colspan="2">Manaserv</th>
            <th colspan="2">TMW-Athena</th>
            <th>Description</th>
        </tr>
    </thead>
    <tbody>
        <tr>
            <th>:::</th>
            <th>:::</th>
            <th>:::</th>
            <th>:::</th>
            <th>Client</th>
            <th>Server</th>
            <th>Client</th>
            <th>Server</th>
            <th>:::</th>
        </tr>
        <tr>
            <td>id</td>
            <td>integer</td>
            <td>Yes</td>
            <td>&nbsp;</td>
            <td>0.0.2x <br /> 1.x</td>
            <td>v0 <br /> v1((Protocol version))</td>
            <td>0.0.2x <br /> 0.5.x <br /> 1.x</td>
            <td>&nbsp;</td>
            <td>It is the item id. This parameter has to be unique for each item. <br /> The system will use the item id to refer on it in many ways.</td>
        </tr>
        <tr>
            <td>name</td>
            <td>string</td>
            <td>No</td>
            <td>"unnamed"</td>
            <td>0.0.2x <br /> 1.x</td>
            <td>v0 <br /> v1</td>
            <td>0.0.2x <br /> 0.5.x <br /> 1.x</td>
            <td>&nbsp;</td>
            <td>Tells the item name. Used to ease configuration on server and with the client <br /> but displayed to players on the client side.</td>
        </tr>
        <tr>
            <td>description</td>
            <td>string</td>
            <td>No</td>
            <td>""</td>
            <td>0.0.2x <br /> 1.x</td>
            <td>&nbsp;</td>
            <td>0.0.2x <br /> 0.5.x <br /> 1.x</td>
            <td>&nbsp;</td>
            <td>Gives a short description of the item. Used to ease configuration on server and with the client. <br /> This is displayed to players on client side.</td>
        </tr>
        <tr>
            <td>type</td>
            <td>string <br /> (defined values)</td>
            <td>No</td>
            <td>"other" <br /> (="generic")</td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
            <td>0.0.2x <br /> 0.5.x <br /> 1.x</td>
            <td>&nbsp;</td>
            <td>Indicates the item's type. The available types are: <br /> - `generic`: A generic item can only be used for quest or be sold in most cases. This is not usable by itself. <br /> - `usable`: An usable item gives something to the character when used. (E.g: A potion gives 20HP when used.) <br /> - `equip-1hand`: A one-handed weapon. <br /> - `equip-2hand:` A two-handed weapon, meaning that a shield cannot be equipped at the same time.  <br /> - `equip-torso:` The torso piece of equipment. <br /> - `equip-arms:` Equipment for both arms. <br /> - `equip-head:` E.g.: An helmet. <br /> - `equip-legs:` Equipment for both legs. <br /> - `equip-shield:` A extra defensive piece of equipment that can be equipped with a one-handed weapon.  <br /> - `equip-ring:` A ring is equipped on hands. For game usability, characters can equip only one ring at a time. <br /> - `equip-charm:` A charm is magic artefact in the character's inventory, considered active when equipped.  <br /> - `equip-necklace:` Only one necklace can be equipped at a time. <br /> - `equip-feet:` Equipment for both feet. <br /> - `equip-ammo:` Need by weapon requiring ammo, like A bow needs arrows. <br /> - `racesprite:` Special type used to tell the system that the sprite file is used as an available race. <br /> - `hairsprite:` Special type used to tell the system that the sprite file is used as an available hairstyle.</td>
        </tr>
        <tr>
            <td>weapon-type</td>
            <td>string</td>
            <td>No</td>
            <td>""</td>
            <td>0.0.2x <br /> 1.x</td>
            <td>v0 <br /> v1</td>
            <td>0.0.2x <br /> 0.5.x <br /> 1.x</td>
            <td>&nbsp;</td>
            <td>Indicates the skill name the item is triggering when used for attacking (for weapon items only). The skill name set in [skills.xml](skills.xml.html) and the value given here must match (case-insensitively). FIXME: Is it used for tA?</td>
        </tr>
        <tr>
            <td>attack-action</td>
            <td>string</td>
            <td>No</td>
            <td>""</td>
            <td>1.x</td>
            <td>&nbsp;</td>
            <td>0.5.x <br /> 1.x</td>
            <td>&nbsp;</td>
            <td>Indicates the attack action name used to animate the character using the weapon. The value given here must match exactly the `action` value of the character's corresponding playerset file. See the [sprite system](sprite_system.html).</td>
        </tr>
        <tr>
            <td>weight</td>
            <td>integer</td>
            <td>No</td>
            <td>0</td>
            <td>0.0.2x <br /> 1.x</td>
            <td>v0 <br /> v1</td>
            <td>0.0.2x <br /> 0.5.x <br /> 1.x</td>
            <td>&nbsp;</td>
            <td>Indicates the item's weight.</td>
        </tr>
        <tr>
            <td>view</td>
            <td>integer</td>
            <td>No</td>
            <td>0</td>
            <td>0.0.2x <br /> 1.x</td>
            <td>&nbsp;</td>
            <td>0.0.2x <br /> 0.5.x <br /> 1.x</td>
            <td>&nbsp;</td>
            <td>Indicates another item whose view to use instead.</td>
        </tr>
        <tr>
            <td>attack-range</td>
            <td>integer</td>
            <td>No</td>
            <td>0</td>
            <td>0.0.2x <br /> 1.x</td>
            <td>v0 <br /> v1</td>
            <td>0.0.2x <br /> 0.5.x <br /> 1.x</td>
            <td>&nbsp;</td>
            <td>Indicates the weapon's attack range in pixels. (The range is in tiles for the v0.)</td>
        </tr>
        <tr>
            <td>hp</td>
            <td>integer</td>
            <td>No</td>
            <td>0</td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
            <td>0.0.2x <br /> 0.5.x <br /> 1.x</td>
            <td>&nbsp;</td>
            <td>Indicates what happens to the character's HP((Hit Points)) when he/she uses it. E.g: A value of 25 means healing of 25 HP.</td>
        </tr>
        <tr>
            <td>defense</td>
            <td>integer</td>
            <td>No</td>
            <td>0</td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
            <td>0.0.2x <br /> 0.5.x <br /> 1.x</td>
            <td>&nbsp;</td>
            <td>Indicates the defense bonus when using the given weapon.</td>
        </tr>
    </tbody>
</table>


##  Server only parameters

Used only by the server to handle inventory limitations.

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
            <td>max-per-slot</td>
            <td>integer</td>
            <td>No</td>
            <td>1</td>
            <td>Indicates the maximum of a given item the character can stack in the same inventory slot. Note that items with equip/unequip effect become equippable. I.e: Tey have a max-per-slot parameter set to 1 whatever the current parameter tells.</td>
        </tr>
        <tr>
            <td>sprite_id</td>
            <td>integer</td>
            <td>No</td>
            <td>0</td>
            <td>The item ID sent by the server when another character is wearing the item. This can be used to avoid revealing the real item type when you have look-alike items with different properties.</td>
        </tr>
        <tr>
            <td>value</td>
            <td>integer</td>
            <td>No</td>
            <td>0</td>
            <td>Tells how much does the item cost with the default currency. See [units.xml](units.xml.html) for more details about how to set up the World currency (and weight) name. FIXME: This doesn't handle multiple currencies and will be removed once a new way to define that has been added.</td>
        </tr>
    </tbody>
</table>

##  Client-only parameters

###  Common parameters (used by ManaServ and TmwAthena clients)

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
            <td>image</td>
            <td>string</td>
            <td>No</td>
            <td>"" <br /> (PNG file)</td>
            <td>The PNG filename must be relative to the `data/graphics/sprites` folder. <br /> The corresponding image is used to be displayed in the inventory and in the equipment window. Additional values can be added after the filename, starting with a `|` are used to dye the image corresponding to the need. <br /> See the [Image dyeing system](image_dyeing_system.html) to get more details about how to add such useful color scheme to your inventory.</td>
        </tr>
        <tr>
            <td>effect</td>
            <td>string</td>
            <td>No</td>
            <td>""</td>
            <td>Used to display very a short effects list of the item.</td>
        </tr>
        <tr>
            <td>missile-particle</td>
            <td>string <br /> (xml file)</td>
            <td>No</td>
            <td>""</td>
            <td>Gives the xml file used to display the corresponding particle effect when the weapon is used. The filename must be relative to the `data/graphics/particles` folder. <br /> See the [particle system](particle_system.html) for more details about how to configure nice particle effects.</td>
        </tr>
        <tr>
            <td>hit-effect-id</td>
            <td>integer</td>
            <td>No</td>
            <td>-1</td>
            <td>Gives the effect id to trigger when doing a successful hit with the given weapon. (The item must indeed be used as a weapon for this work.) The effect id must correspond to an existing effect id in the [effects.xml](effects.xml.html) file. Note that this effect is triggered on the victim.</td>
        </tr>
        <tr>
            <td>critical-hit-effect-id</td>
            <td>integer</td>
            <td>No</td>
            <td>-1</td>
            <td>Gives the effect id to trigger when doing a successful critical hit with the given weapon. (The item must indeed be used as a weapon for this work.) The effect id must correspond to an existing effect id in the [effects.xml](effects.xml.html) file. Note that this effect is triggered on the victim.</td>
        </tr>
    </tbody>
</table>


###  TmwAthena specific parameters

The Mana server isn't concerned by the given parameters and will ignore them.


These "items" are purely virtual ones. They are used to configure the available hairstyle, races, and weapon type within
an TmwAthena session. The client use them to get in sync with server when dealing with such information.


####  Hair Styles

**Note:** FIXME: The ManaServ client is using this hairstyle system for now. This should be fixed by adding the available hairstyle in a specific xml file, why not along with TmwAthena configuration. See the [playerset handling improvement](playerset_handling_improvement.html) where a hairstyle node should be added.

{% highlight xml %}
 <?xml version="1.0"?>
   <items>
    ...
    <item id="-9" type="hairsprite" name="Short and curly">
        <sprite>hairstyle9.xml</sprite>
    </item>
    ...
   </items>
{% endhighlight %}


<table class="table table-bordered table-hover" markdown="1">
    <thead>
        <tr>
            <th>Parameter name</th>
            <th>Type &amp; Range</th>
            <th>Description</th>
        </tr>
    </thead>
    <tbody>
        <tr>
            <td>id (for hairstyles)</td>
            <td>integer <br /> From -1 to -16?? <br /> FIXME: What is the higher negative available value?</td>
            <td>The id used by both the client and the TmwAthena server to cope with this hairstyle.</td>
        </tr>
        <tr>
            <td>name (for hairstyles)</td>
            <td>string</td>
            <td>The Hair Style name.</td>
        </tr>
    </tbody>
</table>

See the [#&lt;sprite&gt; childnode description](#sprite_childnode_description.html) to get more information about the &lt;sprite&gt;&lt;/sprite&gt; part.

####  Races

**Note:** FIXME: The ManaServ client is using this hairstyle system for now and the server doesn't support more than one race. See the [playerset handling improvement](playerset_handling_improvement.html) where a race parameter should be added for both.

{% highlight xml %}
 <?xml version="1.0"?>
   <items>
    ...
    <item id="-100" type="racesprite" name="Human">
      <sprite gender="male">player_male_base.xml</sprite>
      <sprite gender="female">player_female_base.xml</sprite>
    </item>
    ...
   </items>
{% endhighlight %}


<table class="table table-bordered table-hover" markdown="1">
    <thead>
        <tr>
            <th>Parameter name</th>
            <th>Type &amp; Range</th>
            <th>Description</th>
        </tr>
    </thead>
    <tbody>
        <tr>
            <td>id (for racesprites)</td>
            <td>integer <br /> From -100 to ?? <br /> FIXME: What is the higher negative available value?</td>
            <td>The id used by both the client and the TmwAthena server to cope with this race.</td>
        </tr>
        <tr>
            <td>name (for hairstyles)</td>
            <td>string</td>
            <td>The race name.</td>
        </tr>
    </tbody>
</table>

See the [#&lt;sprite&gt; childnode description](#sprite_childnode_description.html) to get more information about the &lt;sprite&gt;&lt;/sprite&gt; part.


####  Weapons

These *low-id* weapon are used to set which animation goes with which weapon for TmwAthena clients only.

{% highlight xml %}
 <?xml version="1.0"?>
   <items>
    ...
    <item id="33" weapon_type="1">
        <sprite>weapon-dagger.xml</sprite>
        <sound event="strike">weapons/swords/short-sword-miss1.ogg</sound>
        <sound event="hit">weapons/swords/short-sword-hit1.ogg</sound>
    </item>
    ...
   </items>
{% endhighlight %}


<table class="table table-bordered table-hover" markdown="1">
    <thead>
        <tr>
            <th>Parameter name</th>
            <th>Type &amp; Range</th>
            <th>Description</th>
        </tr>
    </thead>
    <tbody>
        <tr>
            <td>id (for weapons)</td>
            <td>integer <br /> From 1 to 255</td>
            <td>The id used by both the client and the TmwAthena server to cope with this weapon.</td>
        </tr>
        <tr>
            <td>weapon_type (for weapons)</td>
            <td>integer</td>
            <td>Used to get in synchronization with the server when using this weapon-type. <br /> **Do not be confused with the `weapon-type` parameter.**</td>
        </tr>
    </tbody>
</table>

See the [#&lt;sprite&gt; childnode description](#sprite_childnode_description.html) and the [#&lt;sound&gt; childnode description](#sound_childnode_description.html) to get more information about the &lt;sprite&gt;&lt;/sprite&gt; and the &lt;sound&gt;&lt;/sound&gt; part.


####  Miscellaneous

Those &lt;item&gt; parameters are used only by TmwAthena clients.

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
            <td>attack</td>
            <td>integer</td>
            <td>No</td>
            <td>0</td>
            <td>Indicates the attack bonus when using the given weapon.</td>
        </tr>
        <tr>
            <td>mp</td>
            <td>integer</td>
            <td>No</td>
            <td>0</td>
            <td>Indicates what happens to the character's MP((Magic Points)) when he/she uses it. E.g: A value of 25 means healing of 25 MP.</td>
        </tr>
    </tbody>
</table>


##  &lt;sprite&gt; childnode description

This childnode is used to provide information about how to display the item's sprite by the client. This node is used by the client only and is very recommended.

{% highlight xml %}
 <?xml version="1.0"?>
   <items>
    ...
    <item id="523" image="armor-chest-leathershirt.png" name="Leather Shirt">
        <sprite gender="male">chest-leather-male.xml|#573a26,9e7654,d3b79e,ffffff;#b96b3d,fbf5f1</sprite>
        <sprite gender="female">chest-leather-female.xml|#412300,603100,8d4900;#ffff00</sprite>
    </item>
    ...
 </items>
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
            <td>sprite inner value</td>
            <td>string</td>
            <td>No</td>
            <td>"error.xml" <br /> (xml file)</td>
            <td>This parameter can be either an xml filename or a PNG filename. The filename must be relative to the `data/graphics/sprites` folder. <br /> The client will load the corresponding XML file to get the images used for each cases. See the [sprite system](sprite_system.html) for more details.<br /> Additional values can be added after the filename, starting with a `|` are used to dye the image corresponding to the need. <br /> See the [Image dyeing system](image_dyeing_system.html) to get more details about how to add such useful color scheme to your inventory.</td>
        </tr>
        <tr>
            <td>gender</td>
            <td>string <br /> (defined values)</td>
            <td>No</td>
            <td>""</td>
            <td>This parameter indicates for which gender the xml file should be used. "male" and "female" are available values, but if no values are specified, the same file is used for both.</td>
        </tr>
    </tbody>
</table>


##  &lt;sound&gt; childnode description

This childnode is used to provide information about which sound are to be played by the client, based on the actions made with the given the item. This node is used by the client only.

{% highlight xml %}
 <?xml version="1.0"?>
   <items>
    ...
     <item id="521"
      image="weapon-dagger-dagger.png"
      name="Dagger">
        <sprite>weapon-dagger.xml</sprite>
        <sound event="strike">weapons/swords/short-sword-miss1.ogg</sound>
        <sound event="hit">weapons/swords/short-sword-hit1.ogg</sound>
    </item>
    ...
 </items>
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
            <td>sprite inner value</td>
            <td>string</td>
            <td>No</td>
            <td>"" <br /> (WAV or OGG file)</td>
            <td>This parameter can be either an OGG filename or a WAV one. The filename must be relative to the `data/sfx` folder. <br /> The client will load the corresponding file to get the sounds played for each cases.</td>
        </tr>
        <tr>
            <td>event</td>
            <td>string <br /> (defined values)</td>
            <td>No</td>
            <td>""</td>
            <td>This parameter indicates for which action the sound file should be played. "strike" and "hit" are available values. <br /> You can provide more than one file a sound event: In that case, the given sounds will be played randomly.</td>
        </tr>
    </tbody>
</table>

##  &lt;effect&gt; childnode description

This childnode is used to provide information about what the server should do when dealing with an item. This node is used by the client and manaserv v1 to define advanced items behaviour, and replace old hp, mp, script parameters, ...

Note that an item can have more than one effect, and more than one effect per type.

{% highlight xml %}
 <?xml version="1.0"?>
   <items>
    ...
     <item id="1"
      image="candy.png"
      name="Dagger">
       <effect trigger="activation">
            <script src="candy.lua" function="use" />
            <consumes />
        </effect>
     </item>
     ...
     <item id="521"
      image="weapon-dagger-dagger.png"
      name="Dagger">
        <sprite>weapon-dagger.xml</sprite>
        <effect trigger="in-inventory">
             <modifier attribute="cap1" value="-2000" />
        </effect>
        <effect trigger="equip">
            <attack skill="102" warmuptime="1" cooldowntime="5" reusetime="1"
                basedamage="1" deltadamage="10" chancetohit="200" range="320"
                element="fire" type="physical" />
            <modifier attribute="acc1" value="1.5" />
        </effect>
    </item>
    ...
 </items>
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
            <td>trigger</td>
            <td>string</td>
            <td>Yes</td>
            <td>"" <br /> Must be one of the predefined parameters.</td>
            <td>This parameter is used to tell when the effect should be triggered. The folloing events can be triggered: <br /> `in-inventory`: This event is triggered when the item is in the player inventory. <br /> `activation`: This event is triggered when the item is used/activated. <br /> `leave-inventory`: Triggered when leaving the inventory. (Dropped, consumed after use, sold, traded, ...)  <br /> `equip`: Triggered when the player equips the item. (Note: When the item is equippable, it isn't stackable anymore. i.e.: The max-per-slot parameter it reset to 1.) <br /> `unequip`: Triggered when the player unequips the item. <br /> `equip-change`: Triggered when an equipped item is replace by another. Note that this item will also trigger the equip event of the newly equipped item, and the unequip trigger of the current item. FIXME: This is redundant in 99% of the cases and may be removed in near future.</td>
        </tr>
        <tr>
            <th colspan="5">`\&amp;lt;consumes /\&amp;gt;` sub-childnode</th>
        </tr>
        <tr>
            <td colspan="5">The only presence of this tag is sufficient to tell the server that the item must be removed after triggering that event. Hence, it will be used mostly for use-once item like simple potions, etc... but it may technically be used for any event, leading to surprising effects.</td>
        </tr>
        <tr>
            <th colspan="5">`\&amp;lt;script\&amp;gt;` sub-childnode</th>
        </tr>
        <tr>
            <th>Parameter name</th>
            <th>Type</th>
            <th>Mandatory</th>
            <th>Default value</th>
            <th>Description</th>
        </tr>
        <tr>
            <td>src</td>
            <td>string</td>
            <td>Yes</td>
            <td>""</td>
            <td>The script filename to use when activating/deactivating the item. The file is relative to the `data/scripts/items/` folder.</td>
        </tr>
        <tr>
            <td>function</td>
            <td>string</td>
            <td>Yes</td>
            <td>""</td>
            <td>The script function called in the script file when activating the item.  Note that two parameters are pushed to this function: The item user being pointer, and the item Id. Your function can have the following form: function activate_function_name(user, item_id), for instance.</td>
        </tr>
        <tr>
            <td>dispell-function</td>
            <td>string</td>
            <td>Yes</td>
            <td>""</td>
            <td>The script function called in the script file when deactivating the item.  Note that two parameters are pushed to this function: The item user being pointer, and the item Id. Your function can have the following form: function activate_function_name(user, item_id), for instance.</td>
        </tr>
        <tr>
            <td colspan="5">**Note:** Item can't use the built-in schedule functions at the moment!</td>
        </tr>
        <tr>
            <th colspan="5">`\&amp;lt;modifier\&amp;gt;` sub-childnode</th>
        </tr>
        <tr>
            <td colspan="5">Modifiers are here to modify attributes when an event is triggered. An item can have 0 to many modifiers for each event.</td>
        </tr>
        <tr>
            <th>Parameter name</th>
            <th>Type</th>
            <th>Mandatory</th>
            <th>Default value</th>
            <th>Description</th>
        </tr>
        <tr>
            <td>attribute</td>
            <td>string</td>
            <td>Yes</td>
            <td>""</td>
            <td>This value must correspond to one of the `tag` parameter present in the \&amp;lt;modifier\&amp;gt; node of the [attributes.xml](attributes.xml.html) file. They are used to trigger an effect on the player's attributes. I.e.: Increasing or decreasing strength when equipped, raise speed when activated, ect...</td>
        </tr>
        <tr>
            <td>value</td>
            <td>integer</td>
            <td>Yes</td>
            <td>0</td>
            <td>This value indicates of how much the effect on the attribute tag is applied. The actual effect is depending on how you've configured the attribute's modifier.</td>
        </tr>
        <tr>
            <th colspan="5">`\&amp;lt;attack\&amp;gt;` \&amp;lt;effect\&amp;gt; childnode</th>
        </tr>
        <tr>
            <td colspan="5">See [Attack Node Configuration](attackconfiguration.html#xml_attack_node)</td>
        </tr>
    </tbody>
</table>

##  &lt;floor&gt; childnode description

This childnode is used to provide sprite and particle information for the item when it is on the floor. This can contain &lt;sprite&gt; and &lt;particlefx&gt; tags, which function as above.

{% highlight xml %}
 <?xml version="1.0"?>
   <items>
    ...
     <item id="1"
      image="candy.png"
      name="Candy">
       <floor>
            <sprite>candy-floor.xml</sprite>
            <particlefx>fresh-food.xml</particlefx>
        </floor>
     </item>
    ...
 </items>
{% endhighlight %}


