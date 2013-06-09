---
title: sprite system
layout: wiki
---
{% include toc.md %}
#  The sprite system

The animation system and its related files is the most wide spread engine system working throughout the client. Animation files can indeed be used for animating the characters, the monsters, the maps tiles, the emoticons, and so on...

This chapter will the attempt to provide documentation about sprite files within the mana client. If you want to create particle effects, see the [particle system](particle_system.html) documentation.

##  XML Sprite files

Most of the time, an animation parameter (in [npcs.xml](npcs.xml.html), in [items.xml](items.xml.html) or [monsters.xml](monsters.xml.html) for instance) is linking to an XML file where the actual animation
to play for each action is described.

Here are example of sprite files and how to configure them:

###  Note on the playersets configuration

The playersets animations, corresponding to male and female animations for each races, are currently declared in the [items.xml](items.xml.html) file.

####  Note on the playersets definition

**Note:** The races declaration should be moved to the `races.xml` file, and support for more than one race is to be added. <br />
  QUESTION: Will we allow to have a custom different genders value as it is theoretically possible in the server?

You can find below a working example about how to set up the link to playersets animation files for each available gender:

**Note:** Currently, only the id -100 for the first race is allowed, and only one race is allowed in the client anyway.

{% highlight xml %}
<?xml version="1.0"?>
<items>
  <!-- ... -->
  <item id="-100" type="racesprite" name="Human">
    <sprite gender="male">player_male_base.xml</sprite>
    <sprite gender="female">player_female_base.xml</sprite>
  </item>
  <!-- ... -->
</items>
{% endhighlight %}

For each XML file declared above, a corresponding file in `graphics/sprites`((per default, see [paths.xml](paths.xml.html) to change the default paths.)) will have to exist.

####  Note on the hair sets definition

**Note:** The hairs declaration should be moved to the `races.xml` file, as hairsets should be linked to the playerset, and thus, the race. <br />
  QUESTION: Will we allow to have a custom different genders value for hairs?

You can find below a working example about how to set up the link to hairsets animation files for both server, as TmwAthena has a limitation on the permitted Id:

{% highlight xml %}
    <item id="-1" type="hairsprite" name="Flat ponytail">
        <sprite>hairstyle1.xml</sprite>
    </item>
    <item id="-2" type="hairsprite" name="Bowl cut">
        <sprite>hairstyle2.xml</sprite>
    </item>
    <item id="-3" type="hairsprite" name="Combed back">
        <sprite>hairstyle3.xml</sprite>
    </item>
    <item id="-4" type="hairsprite" name="Emo">
        <sprite>hairstyle4.xml</sprite>
    </item>
    <item id="-5" type="hairsprite" name="Mohawk">
        <sprite>hairstyle5.xml</sprite>
    </item>
    <item id="-6" type="hairsprite" name="Pompadour">
        <sprite>hairstyle6.xml</sprite>
    </item>
    <item id="-7" type="hairsprite" name="Center parting/Short and slick">
        <sprite>hairstyle7.xml</sprite>
    </item>
    <item id="-8" type="hairsprite" name="Long and slick">
        <sprite>hairstyle8.xml</sprite>
    </item>
    <item id="-9" type="hairsprite" name="Short and curly">
        <sprite>hairstyle9.xml</sprite>
    </item>
    <item id="-10" type="hairsprite" name="Pigtails">
        <sprite>hairstyle10.xml</sprite>
    </item>
    <item id="-11" type="hairsprite" name="Long and curly">
        <sprite>hairstyle11.xml</sprite>
    </item>
    <item id="-12" type="hairsprite" name="Parted">
        <sprite>hairstyle12.xml</sprite>
    </item>
    <item id="-13" type="hairsprite" name="Perky ponytail">
        <sprite>hairstyle13.xml</sprite>
    </item>
    <item id="-14" type="hairsprite" name="Wave">
        <sprite>hairstyle14.xml</sprite>
    </item>
    <item id="-15" type="hairsprite" name="Mane">
        <sprite>hairstyle15.xml</sprite>
    </item>
    <item id="-16" type="hairsprite" name="Bun">
        <sprite>hairstyle16.xml</sprite>
    </item>
{% endhighlight %}

For each XML file declared above, a corresponding file in `graphics/sprites`((per default, see [paths.xml](paths.xml.html) to change the default paths.)) will have to exist.

###  Configuration of a sprite file

Here is an example of a playerset XML file:

**Note:** You can also consider that NPCs, monsters, equipment sprites, and so on, can be configured the same way than below.

{% highlight xml %}
<?xml version="1.0"?>
<sprite name="player" action="stand">
  <imageset name="base" src="graphics/sprites/player_male_base.png"
            width="64" height="64" />

  <action name="stand" imageset="base">
    <animation direction="down">
      <frame index="0" />
    </animation>
    <animation direction="left">
      <frame index="18" />
    </animation>
    <animation direction="up">
      <frame index="36" />
    </animation>
    <animation direction="right">
      <frame index="54" />
    </animation>
  </action>
  <!-- ... -->
  <action name="attack_bow" imageset="base">
    <animation direction="down">
      <sequence start="13" end="17" delay="75" />
      <end />
    </animation>
    <animation direction="left">
      <sequence start="31" end="32" delay="75" />
      <sequence start="33" end="35" delay="90" />
      <end />
    </animation>
    <animation direction="up">
      <sequence start="49" end="53" delay="75" />
      <end />
    </animation>
    <animation direction="right">
      <sequence start="67" end="71" delay="75" />
      <end />
    </animation>
  </action>

</sprite>
{% endhighlight %}

Here is a description of each available nodes and their parameters:

<table class="table table-bordered table-hover" markdown="1">
    <thead>
        <tr>
            <th colspan="5">`sprite` node</th>
        </tr>
    </thead>
    <tbody>
        <tr>
            <th>Parameter</th>
            <th>Value Type</th>
            <th>Required</th>
            <th>Default Value</th>
            <th>Description</th>
        </tr>
        <tr>
            <td>name</td>
            <td>string</td>
            <td>no</td>
            <td>""</td>
            <td>The sprite name. Only used for self-documentation. FIXME: Can we remove that? Or will it be used later?</td>
        </tr>
        <tr>
            <td>action</td>
            <td>string</td>
            <td>yes</td>
            <td>""</td>
            <td>The default action name used when the system doesn't find the requested one for the given animation.</td>
        </tr>
        <tr>
            <th colspan="5">`imageset` node (childnode of `sprite`)</th>
        </tr>
        <tr>
            <td colspan="5">There can be several `imageset` childnodes, as long as they have different `name` values.</td>
        </tr>
        <tr>
            <th>Parameter</th>
            <th>Value Type</th>
            <th>Required</th>
            <th>Default Value</th>
            <th>Description</th>
        </tr>
        <tr>
            <td>name</td>
            <td>string</td>
            <td>yes</td>
            <td>-</td>
            <td>The imageset internal name. This name is used as a reference later in an `animation` node. Must be unique.</td>
        </tr>
        <tr>
            <td>src</td>
            <td>string</td>
            <td>yes</td>
            <td>-</td>
            <td>The file path of a PNG file used when invoking the imageset. The file path must be relative to the `data/` folder.</td>
        </tr>
        <tr>
            <td>width</td>
            <td>integer</td>
            <td>yes</td>
            <td>-</td>
            <td>The sprites' width used when tiling the PNG file to obtain the animation frames. See notes about that below.</td>
        </tr>
        <tr>
            <td>height</td>
            <td>integer</td>
            <td>yes</td>
            <td>-</td>
            <td>The sprites' height used when tiling the PNG file to obtain the animation frames. See notes about that below.</td>
        </tr>
        <tr>
            <td>offsetX</td>
            <td>integet</td>
            <td>no</td>
            <td>0</td>
            <td>The image horizontal (from left to right) offset to used when displaying the frames. Can be negative.</td>
        </tr>
        <tr>
            <td>offsetY</td>
            <td>integer</td>
            <td>no</td>
            <td>0</td>
            <td>The image vertical (from top to bottom) offset to used when displaying the frames. Can be negative.</td>
        </tr>
        <tr>
            <th colspan="5">`action` node (childnode of `sprite`)</th>
        </tr>
        <tr>
            <td colspan="5">There can be several `action` childnodes, as long as they have different `name` values.</td>
        </tr>
        <tr>
            <th>Parameter</th>
            <th>Value Type</th>
            <th>Required</th>
            <th>Default Value</th>
            <th>Description</th>
        </tr>
        <tr>
            <td>name</td>
            <td>string <br /> Defined values: <br /> ("default", "stand", "walk", "sit", "dead", attack")</td>
            <td>yes</td>
            <td>-</td>
            <td>The action name. The core actions (walk, sit, ...) must be defined using the predefined values described in the 'Value type' column. Attack actions are freely named using the `attack-action` parameter in the [items.xml](items.xml.html) and thus, have to be named accordingly. Only the default "attack" action has to be specifically set. <br /> E.g.: If the "attack_bow" action name value is corresponding to the `attack-action` parameter value in [items.xml](items.xml.html) for a bow. Then, this action will be used when using this weapon instead of the default "attack" action. <br /> Also, the "default" action will be played when the default given in the sprite action parameter isn't found.</td>
        </tr>
        <tr>
            <td>imageset</td>
            <td>string</td>
            <td>yes</td>
            <td>-</td>
            <td>The imageset reference name. It must correspond to one of the imageset name values.</td>
        </tr>
        <tr>
            <th colspan="5">`animation` node (childnode of `action`)</th>
        </tr>
        <tr>
            <td colspan="5">There can be several `animation` childnodes, as long as they have different `direction` values.</td>
        </tr>
        <tr>
            <th>Parameter</th>
            <th>Value Type</th>
            <th>Required</th>
            <th>Default Value</th>
            <th>Description</th>
        </tr>
        <tr>
            <td>direction</td>
            <td>string <br /> Defined values: <br /> ("up", "down", "left", "right")</td>
            <td>yes</td>
            <td>-</td>
            <td>The animation direction. Its value must be unique per animation node. Also, the first animation declared is the default one when the requested direction isn't found.</td>
        </tr>
        <tr>
            <th colspan="5">`frame` node (childnode of `animation`)</th>
        </tr>
        <tr>
            <td colspan="5">There can be several `frame` childnodes within an `animation` node, even mixed with `sequence` ones, but the animation will stop loading once it has reached an `end` childnode.</td>
        </tr>
        <tr>
            <td>index</td>
            <td>integer</td>
            <td>yes</td>
            <td>-</td>
            <td>The frame index to display. When the imageset file is loaded, it is tiled into pieces of the size given in its `imageset` node, from left ot right, and from top to the bottom of the PNG file. The index is representing the tile number to display. Note that the first tile index value (representing top-left part of the image) is 0.</td>
        </tr>
        <tr>
            <td>delay</td>
            <td>integer</td>
            <td>no</td>
            <td>75</td>
            <td>The time the frame is displayed in milliseconds. Must be positive.</td>
        </tr>
        <tr>
            <td>offsetX</td>
            <td>integer</td>
            <td>no</td>
            <td>0</td>
            <td>The image horizontal (from left to right) offset to used when displaying the frames. Can be negative.</td>
        </tr>
        <tr>
            <td>offsetY</td>
            <td>integer</td>
            <td>no</td>
            <td>0</td>
            <td>The image vertical (from top to bottom) offset to used when displaying it. Can be negative.</td>
        </tr>
        <tr>
            <th colspan="5">`sequence` node (childnode of `animation`)</th>
        </tr>
        <tr>
            <td colspan="5">There can be several `sequence` childnodes within an `animation` node, even mixed with `frame` ones, but the animation will stop loading once it has reached an `end` childnode.</td>
        </tr>
        <tr>
            <td>start</td>
            <td>integer</td>
            <td>yes</td>
            <td>-</td>
            <td>The first frame index to display. See index parameter of the `frame` node.</td>
        </tr>
        <tr>
            <td>end</td>
            <td>integer</td>
            <td>yes</td>
            <td>-</td>
            <td>The last frame index to display. Note that every frames with indexes between start and end parameter values will be played.</td>
        </tr>
        <tr>
            <td>delay</td>
            <td>integer</td>
            <td>no</td>
            <td>75</td>
            <td>The time the frames are displayed in milliseconds. Must be positive.</td>
        </tr>
        <tr>
            <td>offsetX</td>
            <td>integer</td>
            <td>no</td>
            <td>0</td>
            <td>The image horizontal (from left to right) offset to used when displaying the frames. Can be negative.</td>
        </tr>
        <tr>
            <td>offsetY</td>
            <td>integer</td>
            <td>no</td>
            <td>0</td>
            <td>The image vertical (from top to bottom) offset to used when displaying the frames. Can be negative.</td>
        </tr>
        <tr>
            <th colspan="5">`end` node (childnode of `animation`)</th>
        </tr>
        <tr>
            <td colspan="5">An `end` childnode set the end of the current animation. It doesn't have any parameters. This node is optional.</td>
        </tr>
    </tbody>
</table>


###  XML inclusion support

Another XML sprite file can be included by using the **&lt;include&gt;** tag.

For instance, if you want to override the images, you'll need to specify them before the include element. If you want to override any animations, you have to do so after the include element. Example:

{% highlight xml %}
<sprite>
 <imageset name="base" />
 <!-- ... -->
 <include file="other-sprite-file.xml"/>
 <!-- possibly override or introduce new actions -->
</sprite>
{% endhighlight %}

