---
title: chat commands/die
layout: wiki
categorylink: chat_commands
category: Chat Commands
---
{% include toc.md %}
#  Synopsis
  @die
Kills your own character by setting its hit points to 0. This will trigger the normal `on_chr_death handler` and `on_chr_death_accept handler`.
#  Security

**Exploitable**

Making this command available to everyone can be very useful during the public beta testing stage of your game, because it allows players to free themself when they are stuck (which can happen very easily through a misconfigured map warp or teleport script).

But don't forget that the ability to commit suicide and teleport to respawn at will could break various puzzles you design. It will also allow players to break out of a [jail map](../jail_map.html) unless you create an explicit exception in your `on_chr_death_accept` handler for this map.

It's your decision if you want to enable this command for normal players, but when you do, never forget that you did so while designing game features.

#  See also
 * [@kill](kill.html)
 * [@warp](warp.html)
