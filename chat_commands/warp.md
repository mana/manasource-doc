---
title: chat commands/warp
layout: wiki
categorylink: chat_commands
category: Chat Commands
---
{% include toc.md %}
#  Synopsis
  @warp &lt;map&gt; &lt;x&gt; &lt;y&gt;

Warps your character to a different location in the game world. The command doesn't check if the target location is actually walkable. When it isn't, your character won't be able to move. You should be able to fix this by using the command again with different target coordinates.

#  Examples
  @warp # 800 900
Warps your character to the location 800 pixels from the left map border and 900 pixels from the upper map border on the same map you are already on.
  @warp 1 1000 1000
  @warp #1 1000 1000
Warps your character to the location 1000:1000 on the map with the ID 1
  @warp castle 1000 1000
  @warp "castle" 1000 1000
Warps your character to the location 1000:1000 on the map which uses the map file "castle.tmx" (or "castle.tmx.gz").

#  Security

**Exploitable**

This command can be used to give the user an unfair advantage and to go to areas which are supposed to be inaccessible. It should only be given to selected users.

#  See also
 * [@where](where.html)
 * [@goto](goto.html)
 * [@recall](recall.html)
