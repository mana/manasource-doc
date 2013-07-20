---
title: equip.xml
layout: wiki
---
{% include toc.md %}
#  equip.xml

The equip.xml file is used to set up the different equipment slots for the player's characters in the game world.

Here is an example of the currently default [equip.xml](https://github.com/mana/manaserv/blob/master/example/equip.xml) file:

{% highlight xml %}
<?xml version="1.0" encoding="utf-8"?>
<equip-slots>
    <slot id="1" name="Hand" capacity="2" visible="true" weapon="true">
        <box x="8" y="123" background="equip-box-hands.png" />
        <box x="129" y="123" background="equip-box-shield.png" />
    </slot>
    <slot id="2" name="Torso" capacity="1" visible="true">
        <box x="50" y="40" background="equip-box-chest.png" />
    </slot>
    <slot id="3" name="Arms" capacity="1">
        <box x="8" y="78" background="equip-box-hands.png" />
    </slot>
    <slot id="4" name="Head" capacity="1" visible="true">
        <box x="70" y="0" background="equip-box-head.png" />
    </slot>
    <slot id="5" name="Legs" capacity="1" visible="true">
        <box x="50" y="208" background="equip-box-legs.png" />
    </slot>
    <slot id="6" name="Ring" capacity="1">
        <box x="129" y="78" background="equip-box-ring.png" />
    </slot>
    <slot id="7" name="Necklace" capacity="1">
        <box x="90" y="40" background="equip-box-neck.png" />
    </slot>
    <slot id="8" name="Feet" capacity="1" visible="true">
        <box x="90" y="208" background="equip-box-feet.png" />
    </slot>
    <slot id="9" name="Ammo" capacity="1" ammo="true">
        <box x="8" y="168" background="equip-box-ammo.png" />
    </slot>
</equip-slots>
{% endhighlight %}

<table class="table table-bordered table-hover" markdown="1">
    <thead>
        <tr>
            <th colspan="7">`equip-slots` node</th>
        </tr>
    </thead>
    <tbody>
        <tr>
            <th colspan="7">`slot` child node</th>
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
            <td>The equipment slot's id. This is internally used as a reference and must be unique and be \&amp;gt; 0.</td>
        </tr>
        <tr>
            <td>name</td>
            <td>**string**</td>
            <td>yes</td>
            <td>yes</td>
            <td>yes</td>
            <td>""</td>
            <td>The equipment slot's name. This is internally used as a reference and **should really** be unique.</td>
        </tr>
        <tr>
            <td>capacity</td>
            <td>**integer**</td>
            <td>yes</td>
            <td>yes</td>
            <td>yes</td>
            <td>0</td>
            <td>The number of available space in the slot. Especially useful for the hands slot for two-handed weapons for instance.</td>
        </tr>
        <tr>
            <td>visible</td>
            <td>**boolean**</td>
            <td>yes</td>
            <td>yes</td>
            <td>yes</td>
            <td>true</td>
            <td>Whether the slot is visible on the player sprite. Invisible slots do not make the being look updates.</td>
        </tr>
        <tr>
            <td>weapon</td>
            <td>**boolean**</td>
            <td>yes</td>
            <td>yes</td>
            <td>yes</td>
            <td>false</td>
            <td>Whether the slot is the weapon slot. This is used so that the engine knows which slots handle weapons. The 'weapon' slot should not be omitted.</td>
        </tr>
        <tr>
            <td>ammo</td>
            <td>**boolean**</td>
            <td>yes</td>
            <td>yes</td>
            <td>yes</td>
            <td>false</td>
            <td>Whether the slot is the ammo slot. This is used so that the engine knows which slots handle ammo. The 'ammo' slot should not be omitted.</td>
        </tr>
        <tr>
            <th colspan="7">`box` child node</th>
        </tr>
        <tr>
            <td colspan="7">Box nodes are used to tell the client where to place the icon boxes indicating the actual equipment of the character in the equipment window, so you can tweak the display of your equipment to your need. There must be one `box` node per capacity value. The nodes are taken in the order they are written when loading the window.</td>
        </tr>
        <tr>
            <td>x</td>
            <td>**integer**</td>
            <td>yes</td>
            <td>no</td>
            <td>no</td>
            <td>0</td>
            <td>The equipment box x pixel value, relative to the left of the equipment window.</td>
        </tr>
        <tr>
            <td>y</td>
            <td>**integer**</td>
            <td>yes</td>
            <td>no</td>
            <td>no</td>
            <td>0</td>
            <td>The equipment box y pixel value, relative to the top of the equipment window.</td>
        </tr>
        <tr>
            <td>background</td>
            <td>**string**</td>
            <td>yes</td>
            <td>no</td>
            <td>no</td>
            <td>""</td>
            <td>The equipment box background image filename. The filename must be relative to the theme root path, or `the data/graphics/gui` when none. The image size shouldn't be larger than 36x36 pixels.</td>
        </tr>
    </tbody>
</table>
