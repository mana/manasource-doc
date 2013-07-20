---
title: chat commands/rights
layout: wiki
categorylink: chat_commands
category: Chat Commands
---
{% include toc.md %}
#  Synopsis
  @rights
Shows a list of the permission groups the account of the character is a part of. Permission groups determine which [chat commands](../chat_commands.html) are available to the user (the exact list of commands can be obtained with the [@help](help.html) command). Permission groups can be customized in the server configuration file [permissions.xml](../permissions.xml.html) and be assigned to accounts using [@givepermission](givepermission.html) and [@takepermission](takepermission.html).

#  Examples
Entering @rights might return something like the following:
  Your rights level is 7 (player gm dev)
This means that the account of the user is in the permission groups "player", "game master" and "developer".

The number 7 is the bitmask value of this specific combination of permission groups. This is how permission groups are stored in the database. Knowing how to calculate them is usually unnecessary, but when you really want to know: Every permission group has a value of 2^n where n is the ID of the group in [permissions.xml](../permissions.xml.html). Add the values of all permission groups of an account and you get its permission level.

#  Security

**Harmless**

This command is very useful for troubleshooting any permission problems, so every permission group should include this command.

#  See also
 * [@help](help.html)
 * [@givepermission](givepermission.html)
 * [@takepermission](takepermission.html)
