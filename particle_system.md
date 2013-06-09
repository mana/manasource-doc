---
title: particle system
layout: wiki
---
{% include toc.md %}
#  The particle system

The particle system and its related files is a key-feature engine working throughout the client. particle files can indeed be used for animating smoothly any visual eye-candy, from the surrounding glow seen around a player casting a spell, to emote effects for NPCs, for instance...

This chapter will the attempt to provide documentation about particle files within the mana client. If you want to create sprite files, see the [sprite system](sprite_system.html) documentation.

##  What is a particle system?

The particle system allows to create beautiful dynamic special effects based on creating and managing a large number of small, independent, moving sprites. For more information about particle engines see [the Wikipedia article about particle systems](http://en.wikipedia.org/wiki/Particle_system).

The particle engine allows us to create a large variety of beautiful special effects with minimal effort that could outclass those of most other sprite based RPGs. The areas where particle effects could be used include but are not limited to:
 * Environmental effects like waterfalls, fires, fountains or smoke coming out of chimneys,
 * Visualisation of mystical phenomenons like teleporters or other points of interest,
 * Graphic effects for spells,
 * Visualisation of status effects, ...

##  XML Particle files

Most of the time, a `particlefx` tag (in [npcs.xml](npcs.xml.html), in [items.xml](items.xml.html) or `attack` [monsters.xml](monsters.xml.html) for instance) is linking to an XML file where the actual particle effect to play is described.

Here are example of a particle files working configuration, followed by their parameters list and description:

###  Note on the particle file inclusion in main configuration

For instance, in the [npcs.xml](npcs.xml.html) file, in order to include a particle effect surrounding the NPCs, you may do something like this:

{% highlight xml %}
<?xml version="1.0"?>
<npcs>
  <!-- ... -->
  <npc id="200">
   <sprite>npcs/npc-test.xml</sprite>
   <particlefx>graphics/particles/circle.particle.xml</particlefx>
  </npc>
  <!-- ... -->
</npcs>
{% endhighlight %}

For each particle XML file declared above, a corresponding file relative to the `data` folder will have to exist.

###  Configuration of a particle file

Here is an example of a particle XML file:

{% highlight xml %}
<?xml version="1.0"?>
<effect>
  <particle position-x="0" position-y="0" position-z="16" lifetime="1">
    <emitter>
      <property name="position-x" min="-8" max="8"/>
      <property name="position-y" min="-8" max="8"/>
      <property name="vertical-angle" min="0" max="45"/>
      <property name="horizontal-angle" min="45" max="135"/>
      <property name="power" min="0" max="6"/>
      <property name="gravity" value="100"/>
      <property name="image" value="graphics/particles/orb-small.png|W:#ff0000"/>
      <property name="lifetime" min="0" max="80"/>
      <property name="output" min="6" max="12"/>
    </emitter>
    <emitter>
      <property name="position-x" min="-8" max="8"/>
      <property name="position-y" min="-8" max="8"/>
      <property name="vertical-angle" min="0" max="45"/>
      <property name="horizontal-angle" min="45" max="135"/>
      <property name="power" min="0" max="6"/>
      <property name="gravity" value="0.1"/>
      <property name="image" value="graphics/particles/star-small.png|W:#ff0000,ffffff"/>
      <property name="lifetime" min="0" max="80"/>
      <property name="output" min="6" max="12"/>
    </emitter>
    <animation imageset="graphics/particles/arrowh.png" width="16" height="16">
      <sequence start="0" end="7" />
    </animation>
    <rotation imageset="graphics/particles/arrowh.png" width="16" height="16">
      <sequence start="0" end="7" />
    </rotation>
    <deatheffect on-timeout="false" on-floor="true" on-sky="false" on-impact="true" on-other="false">
        graphics/particles/arrowimpact.particle.xml
    </deatheffect>
    <image>graphics/particles/arrowh.png</image>
    <emitter>
      <property name="position-z" min="16" max="48" />
      <property name="vertical-angle" min="0" max="90"/>
      <property name="horizontal-angle" min="0" max="360"/>
      <property name="power" min="10" max="25"/>
      <property name="lifetime" value="1"/>
      <property name="output" value="1"/>
      <emitter>
        <property name="gravity" value="-0.2"/>
        <property name="momentum" value="0.9"/>
        <property name="image" value="graphics/particles/gloworb-medium.png|W:#000000"/>
        <property name="lifetime" value="35"/>
        <property name="fade-in" value="5"/>
        <property name="fade-out" value="20"/>
        <property name="output" min="0" max="1"/>
        <property name="output-pause" min="30" max="80"/>
        <property name="randomnes" value="200"/>
      </emitter>
    <emitter>
  </particle>
</effect>
{% endhighlight %}

Here is a description of each available nodes and their parameters:

<table class="table table-bordered table-hover" markdown="1">
    <thead>
        <tr>
            <th colspan="5">`effect` node</th>
        </tr>
    </thead>
    <tbody>
        <tr>
            <td colspan="5">The parent node. Must be declared exactly once. FIXME: Should be renamed to `particles`.</td>
        </tr>
        <tr>
            <th colspan="5">`particle` node (childnode of `effect`)</th>
        </tr>
        <tr>
            <td colspan="5">There can be several `particle` childnodes, each ones describing a new particle effect set. Usually one suffice to handle what's needed. <br /> In addition they can have any number of `emitter`s and a visual representation in form of an `\&amp;lt;animation\&amp;gt;` or an `\&amp;lt;image\&amp;gt;`.</td>
        </tr>
        <tr>
            <th>Parameter</th>
            <th>Value Type</th>
            <th>Required</th>
            <th>Default Value</th>
            <th>Description</th>
        </tr>
        <tr>
            <td>position-x</td>
            <td>integer</td>
            <td>yes</td>
            <td>-</td>
            <td>The particle effect horizontal start position.</td>
        </tr>
        <tr>
            <td>position-y</td>
            <td>integer</td>
            <td>yes</td>
            <td>-</td>
            <td>The particle effect vertical start position.</td>
        </tr>
        <tr>
            <td>position-z</td>
            <td>integer</td>
            <td>yes</td>
            <td>-</td>
            <td>The particle effect height start position.</td>
        </tr>
        <tr>
            <td>lifetime</td>
            <td>integer</td>
            <td>no</td>
            <td>1</td>
            <td>The particle set lifetime, or how many times it is played before dying.</td>
        </tr>
        <tr>
            <th colspan="5">`emitter` node (childnode of `particle` or `emitter`)</th>
        </tr>
        <tr>
            <td colspan="5">Emitters are always child-elements of a `particle` or another `emitter`. They create new particles themselves which can also include emitters and so on.</td>
        </tr>
        <tr>
            <th colspan="5">`deatheffect` node (childnode of `particle` or `emitter`)</th>
        </tr>
        <tr>
            <td colspan="5">Path to a particle effect definition which is created on the particles location when it dies.</td>
        </tr>
        <tr>
            <th>Parameter</th>
            <th>Value Type</th>
            <th>Required</th>
            <th>Default Value</th>
            <th>Description</th>
        </tr>
        <tr>
            <td>on-timeout</td>
            <td>boolean</td>
            <td>no</td>
            <td>true</td>
            <td>Triggered when the lifetime of the particle has ended.</td>
        </tr>
        <tr>
            <td>on-floor</td>
            <td>boolean</td>
            <td>no</td>
            <td>true</td>
            <td>Triggered when the particle touched the floor and stopped bouncing.</td>
        </tr>
        <tr>
            <td>on-sky</td>
            <td>boolean</td>
            <td>no</td>
            <td>true</td>
            <td>Triggered when the particle touches the particle sky (at 300 px).</td>
        </tr>
        <tr>
            <td>on-impact</td>
            <td>boolean</td>
            <td>no</td>
            <td>true</td>
            <td>Triggered when the particle comes within die-distance of its acceleration target.</td>
        </tr>
        <tr>
            <td>on-other</td>
            <td>boolean</td>
            <td>no</td>
            <td>false</td>
            <td>Triggered when the particle is removed for any other reason.</td>
        </tr>
        <tr>
            <th colspan="5">`property` node (childnode of `emitter`)</th>
        </tr>
        <tr>
            <td colspan="5">`\&amp;lt;property\&amp;gt;` child elements that define the initial properties of the created particles. When one of the following property elements is missing, the default value from the particle tag or the system is used. The `property` elements must have either `name` and `value` or `name`, `min` and `max`. In addition they can also have some change-`X` options which control their change over time. <br /> They can also have any number of `\&amp;lt;emitter\&amp;gt;` childtags (when these exist all child-particles will be equipped with these emitters) and an `\&amp;lt;animation\&amp;gt;` childtag that replaces the image with an animation.</td>
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
            <td>The property controlled by this tag. See property name values below.</td>
        </tr>
        <tr>
            <td>value</td>
            <td>variant</td>
            <td>yes</td>
            <td>-</td>
            <td>Value assigned to the created particles. This will set a fxed value for the given property.</td>
        </tr>
        <tr>
            <td>min, max</td>
            <td>integers</td>
            <td>yes</td>
            <td>-</td>
            <td>Set the range of random values assigned to the created particles for the given property. Not taken into account if the `value` parameter is set.</td>
        </tr>
        <tr>
            <td>change-function</td>
            <td>string</td>
            <td>no</td>
            <td>-</td>
            <td>Shape of the change-over-time function. Possible values are: "sinus", "saw", "triangle" and "square".</td>
        </tr>
        <tr>
            <td>change-period</td>
            <td>integer</td>
            <td>no</td>
            <td>-</td>
            <td>Time in ticks((A tick is equal to 10 milliseconds in the Mana client.)) until the function is repeated.</td>
        </tr>
        <tr>
            <td>change-amplitude</td>
            <td>integer</td>
            <td>no</td>
            <td>-</td>
            <td>Maximum change applied to `min` and `max` values.</td>
        </tr>
        <tr>
            <td>change-phase</td>
            <td>integer</td>
            <td>no</td>
            <td>-</td>
            <td>Phase offset of the function in ticks.</td>
        </tr>
        <tr>
            <td colspan="5">**Property `name` values:** <br /> Here are the property name usable values that set specific particle behaviour and so on.</td>
        </tr>
        <tr>
            <td>position-x</td>
            <td>integer</td>
            <td>no</td>
            <td>0</td>
            <td>The particle effect horizontal start position, relative to the position-x of the `particle` parent node.</td>
        </tr>
        <tr>
            <td>position-y</td>
            <td>integer</td>
            <td>no</td>
            <td>0</td>
            <td>The particle effect vertical start position, relative to the position-y of the `particle` parent node.</td>
        </tr>
        <tr>
            <td>position-z</td>
            <td>integer</td>
            <td>no</td>
            <td>0</td>
            <td>The particle effect height start position, relative to the position-z of the `particle` parent node.</td>
        </tr>
        <tr>
            <td>image</td>
            <td>string</td>
            <td>no</td>
            <td>""</td>
            <td>Path to the image that should be drawn at the position of the particles.</td>
        </tr>
        <tr>
            <td>horizontal-angle</td>
            <td>integer</td>
            <td>no</td>
            <td>0</td>
            <td>Clockwise angle of initial vector on horizontal plane in degree. 0° means straight right.</td>
        </tr>
        <tr>
            <td>vertical-angle</td>
            <td>integer</td>
            <td>no</td>
            <td>0</td>
            <td>Angle between ground and initial vector in degree. 0° means parallel to the ground. Positive values are upwards, negative downwards.</td>
        </tr>
        <tr>
            <td>power</td>
            <td>integer</td>
            <td>no</td>
            <td>0</td>
            <td>Initial speed of the particles in pixels per tick.</td>
        </tr>
        <tr>
            <td>gravity</td>
            <td>integer</td>
            <td>no</td>
            <td>0</td>
            <td>Downward acceleration of particles in pixels / tick².</td>
        </tr>
        <tr>
            <td>randomness</td>
            <td>integer</td>
            <td>no</td>
            <td>0</td>
            <td>Random changes in the X, Y and Z vector. The unit is maximum pixels/tick/1000..</td>
        </tr>
        <tr>
            <td>lifetime</td>
            <td>integer</td>
            <td>no</td>
            <td>-1</td>
            <td>lifetime in game ticks. (-1 = unlimited).</td>
        </tr>
        <tr>
            <td>fade-out</td>
            <td>integer</td>
            <td>no</td>
            <td>0</td>
            <td>Number of game ticks of lifetime left when the particle starts to disappear by fading into alpha. (0 = disabled).</td>
        </tr>
        <tr>
            <td>fade-in</td>
            <td>integer</td>
            <td>no</td>
            <td>0</td>
            <td>Number of game ticks while the particles fade in to their full opacity. (0 = spawned with full opacity).</td>
        </tr>
        <tr>
            <td>alpha</td>
            <td>integer</td>
            <td>no</td>
            <td>1</td>
            <td>Opacity of the created particles after fade-in and before fade-out. (1 = full opacity).</td>
        </tr>
        <tr>
            <td>output</td>
            <td>integer</td>
            <td>no</td>
            <td>infinite (0)</td>
            <td>Numbers of particles created per output. (0 means infinite particles will be created (until lifetime is up)</td>
        </tr>
        <tr>
            <td>output-pause</td>
            <td>integer</td>
            <td>no</td>
            <td>0</td>
            <td>Pause in ticks between two particle outputs.</td>
        </tr>
        <tr>
            <td>acceleration</td>
            <td>integer</td>
            <td>no</td>
            <td>0</td>
            <td>Acceleration of particles towards the target in pixels/tick².</td>
        </tr>
        <tr>
            <td>momentum</td>
            <td>integer</td>
            <td>no</td>
            <td>1</td>
            <td>Momentum of the particles. Before adding the acceleration the old vectors are multiplied by this. A momentum of 1 creates a perfect newtonian object. A slightly lower momentum gives the impression that the particles are breaked. A higher momentum makes the particles accelerate forward. This looks rather weird but could be useful for some effects. A negative momentum looks really ugly.</td>
        </tr>
        <tr>
            <td>die-distance</td>
            <td>integer</td>
            <td>no</td>
            <td>0</td>
            <td>Only used together with acceleration. Distance in pixels to the target that causes the destruction of the particles when reached.</td>
        </tr>
        <tr>
            <td>bounce</td>
            <td>integer</td>
            <td>no</td>
            <td>0</td>
            <td>When higher than 0 particles don't disappear when they touch the ground. Instead they bounce off with a vector equal to their old vector multiplied with this property. It is recommended to add a limited lifetime to bouncing particles because otherwise they are immortal.</td>
        </tr>
        <tr>
            <td>follow-parent</td>
            <td>boolean</td>
            <td>no</td>
            <td>false</td>
            <td>When this property is there the particles are moved when the parent particle is moved. This is especially useful for avoiding distortion of being-based particle effects when the being moves. This property has no value - its existence alone creates this behaviour.</td>
        </tr>
        <tr>
            <th colspan="5">`image` node (childnode of `particle`)</th>
        </tr>
        <tr>
            <td colspan="5">Root particles can have an `\&amp;lt;image\&amp;gt;` childtag that contains the path to an image in its content. In that case this image is used as the visual representation of the root particle. There is no parameter as the value taken between the start and end tags is taken the image path, relative to the `data/` folder.</td>
        </tr>
        <tr>
            <th colspan="5">`animation` node (childnode of `particle` or `emitter`)</th>
        </tr>
        <tr>
            <td colspan="5">The animation tag can be used as a childtag of the `\&amp;lt;particle\&amp;gt;` tag to make the root particle appear as an animated image or it can be used as a childtag for an `emitter`. In that case the emitter spawns animated particles instead of a static ones. <br /> The usage is similar to the the `animation` tag described in the [sprite system](sprite_system.html). You can use the same child elements with the same syntax. The only difference are the properties of the animation tag itself. There is no direction property. Instead the used imageset is described in the animation tag with the properties `imageset`, `width` and `height`. All three properties are required.</td>
        </tr>
    </tbody>
</table>

##  Particle system related config setting

Several configuration options can alter the particle behaviour while in-game, defined in the [config.xml](config.xml.html) file

###  particleFastPhysics
Replaces the cpu intense squareroot calculations for calculating the vectors of target-based particles by less intense but less accurate calculations. 0 uses the slow but accurate and reliable function from the C standard library. Setting it to 1 uses a squareroot approximation function that is much faster while being only slightly less accurate but doesn't work on some architectures. 2 is an even faster method that shouldn't have any portability problems but it is very inaccurate.
`'Default: 0`'

###  particleMaxCount
Maximum number of particles in the game world. When this limit is reached no new particles will be spawned by emitters until some particles disappeared. This limit is only respected by emitters and not when spawning new effects to make sure that they are spawned when the particle limit is maxed out.

When the limit is maxed out the result is a quite unregular output of the particle emitters that looks quite ugly. So this situation should be avoided. The main reason this setting exists is to encourage the particle effect creators to keep the particle output of their emitters on a reasonable level and to keep the game playable in unusual particle-intense situations by accepting a glitchy appearance of the particle effects in this cases.

Please note that a few very large particles can reduce the framerate more than a lot of very small particles.

`'Default: 3000`'

###  particleEmitterSkip
The number of game ticks each emitter is inactive between two particle spawns. Setting this to a higher value keeps the numbers of particles down by reducing the output of the emitters.

This is a more useful way for the user to reduce the particle count than reducing particleMaxCount because it doesn't change the look of particle effects that much.

`'Default: 0`'


##  Putting particle effects on maps

An important application of particle effects are map-based effects. For that reason particle effects can be placed on maps in form of map objects. The current version of our map editor [Tiled](http://www.mapeditor.org) does only support map objects partially. So the best way to place particle effects on maps is by editing the map files with a text editor((Don't ever dare to use MS NotePad!!)).

This is done by adding an `&lt;objectgroup&gt;` tag as a child tag of the `&lt;map&gt;` tag (when the map has't got an objectgroup tag yet). Then you'll add an `&lt;object&gt;` childtag for each particle effect you want to add to the map. The object tag has 4 required properties:
<table class="table table-bordered table-hover" markdown="1">
    <thead>
        <tr>
            <th>Name</th>
            <th>Type</th>
            <th>Description</th>
        </tr>
    </thead>
    <tbody>
        <tr>
            <td>type</td>
            <td>string</td>
            <td>Must be equal to "PARTICLE_EFFECT" in that case.</td>
        </tr>
        <tr>
            <td>name</td>
            <td>string</td>
            <td>The filename of the effect definition file of the effect, relative to the `data/` folder.</td>
        </tr>
        <tr>
            <td>x</td>
            <td>integer</td>
            <td>Distance from the left border of the map in pixels.</td>
        </tr>
        <tr>
            <td>y</td>
            <td>integer</td>
            <td>Distance from the upper border of the map in pixels.</td>
        </tr>
    </tbody>
</table>

As an example here the `objectgroup` block:

{% highlight xml %}
 <!-- ... -->
 <objectgroup name="Object Group 1" width="0" height="0">
  <object name="graphics/particles/flame.particle.xml" type="PARTICLE_EFFECT" x="928" y="960" width="32" height="32">
   <properties/>
  </object>
  <object name="graphics/particles/flame.particle.xml" type="PARTICLE_EFFECT" x="992" y="960" width="32" height="32">
   <properties/>
  </object>
 </objectgroup>
 <!--
 Note that this example includes a lot of unnecessary meta-information added by Tiled.
 The minimal version that can be parsed by the Mana client would be the following:
 -->
 <objectgroup>
  <object name="graphics/particles/flame.particle.xml" type="PARTICLE_EFFECT" x="928" y="960" />
  <object name="graphics/particles/flame.particle.xml" type="PARTICLE_EFFECT" x="992" y="960" />
 </objectgroup>
 <!-- ... -->
{% endhighlight %}

Map-based particle effects are initialized when the player enters the map and are also calculated when the effect isn't on the screen of the player. For that reason you should not put too many effects with a lot of particles on one map. Otherwise you could hit the `particleMaxCount` limit.


##  Using the particle engine for programmers

The basic element of the particle engine is a special particle named "particleEngine". It maintains a tree of particle effects. Each particle has a position in three dimensional space (in this case the two dimensional game world is treated as a flat plane in a three dimensional space). Based on the type of particle it might or might not have:
 * Movement based on physical properties
 * A visual representation (a single image or an animation)
 * A list of emitters that create additional particles.

The Particles are derived class from the "Sprite" class so that they can be added to the maps sprite list to be drawn together with the other sprites by the "map" class.

###  Creation of effects
Effects are created by calling `particleEngine-&gt;addEffect()`. The arguments are a particle effect definition file, the map coordinates (pixel-based) and the map on which the effect should be created. This creates a host particle that can have any number of emitters. The host particle is returned so it can be manipulated further. It is possible to create multiple host particles in one particle effect file. In that case only the last particle is returned.

###  Effects that follow beings
Beings can gain control of a particle. This happens by calling the `controlParticle()` member function of the Being class.

The usual method to create a particle that follows a being is by calling `particleEngine-&gt;addEffect()` and pass the returned particle to `controlParticle()`.

Note that when a Being takes control of a particle it disables the automatic deletion of the particle. The being is now responsible for requesting the deletion of the particle by calling `Particle::kill()`. When it does the particle will be deleted after its next update.

###  Homing particles
A particle will be attracted by another particle when its acceleration is greater than 0. When a particle is created by an emitter the attracting particle is the host particle of the effect but it can be changed by calling `Particle::setDestination()`. I would always recommend to use a parent particle of the particle as a target because a segmentation fault will occur when the target particle is deleted.

##  Possible Additions

Below is a list of proposed additions to the Particle System:

###  Random animation
Random animation entry points/cel choices  Right now, animation cels are looped through sequentially.  For some effects, randomly picking one element each interval, or at least starting out at a random entry, may be preferable.

###  Orbiting particle improvement
Orbiting particles need a reference point; right now this is fixed to be the `base` particle.  We need an option to choose the parent, grandparent, ... instead.
