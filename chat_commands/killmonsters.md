---
title: chat commands/killmonsters
layout: wiki
categorylink: chat_commands
category: Chat Commands
---
{% include toc.md %}
#  Synopsis
  @killmonsters
Kills all monsters on the current map. They will drop their normal loot, their on_death script handlers will be triggered, and experience will be awarded to all characters who damaged them as normally.

#  Security

**Exploitable**

Note that this command does not just remove the monsters but also causes drops and experience to be generated.

#  See also
 * [@kill](kill.html)
 * [@die](die.html)
