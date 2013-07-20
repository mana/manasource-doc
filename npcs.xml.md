---
title: npcs.xml
layout: wiki
---
{% include toc.md %}
The npcs.xml files is used to display and animates the non-playable-characters (NPC) the player will interact with while in-game.

Here is an example of the npcs.xml file:
{% highlight xml %}
<npcs>
  <npc id="180"><sprite>npcs/npc-savannahman.xml</sprite></npc><!-- Blue Savannah Man with idle animation -->
  <npc id="181"><sprite variant="81">npcs/npc.xml</sprite></npc><!-- Green Savannah Man -->
  <npc id="182"><sprite variant="82">npcs/npc.xml</sprite></npc><!-- Young archer -->
  <npc id="183"><sprite variant="83">npcs/npc.xml</sprite></npc><!-- Skeleton man -->
  <npc id="184"><sprite variant="84">npcs/npc.xml</sprite></npc><!-- Doctor (10) -->
  <npc id="185"><!-- Evil Obelisk -->
    <sprite variant="44">npcs/npc.xml</sprite>
    <particlefx>graphics/particles/evilobelisk.particle.xml</particlefx>
    </npc>
  <npc id="200">
    <sprite>npcs/npc-test.xml</sprite>
    <particlefx>graphics/particles/circle.particle.xml</particlefx>
  </npc>
</npcs>
{% endhighlight %}

The **id** parameter is mapping the NPCs to the client system.

The **sprite** and **particlfx** childnodes are following the [sprite system](sprite_system.html) and the [particle system](particle_system.html) specifications. <br />
**Note:** The variant parameter to the `sprite` tag is equally in function as the index parameter.

See this section for more information.
