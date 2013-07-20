---
title: global events.lua
layout: wiki
---
{% include toc.md %}
Server admins might want to modify how certain events which happen frequently in the game on different maps are supposed to be handled. Examples for this could be death penalties and the respawn system. Currently it is only possible to catch such events by local scripts on the map where they happen and this in many cases only with some nasty hacks to make sure that every being gets the appropriate death listener function. For that reason there should be a central file to define the behavior in cases of certain events.

For this purpose we should have the file scripts/global_events.lua. This file is a collection of script functions which are always called when certain events happen, regardless on which map. Script execution is done in the context of the map the event happens on.

# chr_death(chr)
(implemented)

This function is called when the hit points of a character reach zero.

# chr_death_accept(chr)
(implemented)

This function is called when the player clicks on the "OK" button after the death message appeared.

This function should be used to implement the respawn mechanic (for example: warp the character to the respawn location and bring HP above zero in some way)

# chr_death_respawn(chr)
(not implemented yet )

This function is called after chr_death_accept.

The difference is that it is called in the context of the map the character is spawned on after the respawn logic has happened.

# chr_birth(chr)
(not implemented yet )

This function is called when a new character enters the world for the first time. This can, for example, be used to give starting equipment to the character and/or initialize a tutorial quest.

# chr_login(chr)
(not implemented yet )

This function is called when a character logs into the game.

This can, for example, be utilized for a message-of-the-day or for various handlings of offline processing mechanics.

  Bertram - 2010/07/09:
  IMHO, I'd call the chr_login and birth scripts from here:
  http://gitorious.org/mana/manaserv/blobs/master/src/game-server/accountconnection.cpp#line123
  Is the fact that the character has level 1 and mLevelProgress equal to 0 enough to tell if it's a new one?
  
  Philipp "Crush" Sehmisch - 2010/12/09
  No, having no Exp is no clear indication. When the character receives stuff during the birth script, the user
  can immediately disconnect and reconnect to receive the stuff a second time. There are potential counter-
  measures for the script writer, but I don't think that we should implement this feature in a way which can
  easily lead to exploits.

# chr_logout(chr)
(not implemented yet )

This function is called when a character is disconnected.

This could be useful for various handling of offline processing mechanics.

# Comments

  Bertram - 2010/03/31: I'd call chr_death_respawn -&gt; chr_death_after_respawn based on the description. I'm fine with everything else :)
