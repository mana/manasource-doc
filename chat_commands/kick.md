---
title: chat commands/kick
layout: wiki
categorylink: chat_commands
category: Chat Commands
---
{% include toc.md %}
#  Synopsis
  @kick &lt;character&gt;

Forcefully disconnects a player character from the game. Other characters which are on the same account or connected from the same IP address are unaffected. The user can immediately reconnect with the character unless this is prevented by other means.

#  Examples
Disconnect the character "Bob"
  @kick Bob
Disconnect the character "Bob the Builder" (note the spaces in the name)
  @kick "Bob the Builder"
Disconnect yourself
  @kick #

#  Security

**Critical**

This command is intended to be used by game masters as a disciplinary tool. Although it does not cause any permanent consequences, it has a lot of potential for harassment and does not belong in the hands of an untrusted user.

#  See also
 * [@kill](kill.html)
 * [@ban](ban.html)
