---
title: chat commands/spawn
layout: wiki
categorylink: chat_commands
category: Chat Commands
---
{% include toc.md %}
#  Synopsis
  @spawn &lt;monster id&gt; &lt;number&gt;
Creates a number of monsters on your current location.

#  Examples

Create 3 scorpions:

  @spawn 1 3

Monster IDs can be looked up and changed in the config file [monsters.xml](../monsters.xml.html)

#  Security

**Dangerous!**

This command can be more dangerous to your game than it seems at first. While excessive spawning of monsters sounds like annoying but harmless shenanigans which can be reverted with a single use of @killmonster, keep in mind that the creation of monsters also means creation of their drops when they are killed. When someone spawns hundreds of monsters which are supposed to be very hard to find and drop very valuable items, the game economy will soon be flooded with these supposedly rare items. So only give this command to trustworthy people who know what they are doing. Yes, I am looking at you, clover patch queen Delasia. Also be careful not to mix up monster ID and amount. There is a difference between spawning one monster of type 1365 and spawning 1365 monsters of type 1.

#  See also
 * [@drop](drop.html)
 * \@killmonster
