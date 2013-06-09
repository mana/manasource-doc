---
title: chat commands/kill
layout: wiki
categorylink: chat_commands
category: Chat Commands
---
{% include toc.md %}
#  Synopsis
  @kill &lt;character&gt;

Kills a player character by setting its hit points to 0. This will trigger the on_chr_death handler and on_chr_death_accept handler like any "natural" death.

#  Examples
Kill the character "Bob"
  @kill Bob
Kill the character "Bob the Builder" (note the spaces in the name)
  @kill "Bob the Builder"
Kill yourself (alternative to [@die](die.html))
  @kill #

#  Security

**Critical**

This command is intended to be used by game master as a disciplinary tool. It can also be useful from time to time to free players who are stuck in various situations. Needless to say that it has a lot of potential for harassment and does not belong in the hands of an untrusted user.

#  See also
 * [@die](die.html)
 * [@kick](kick.html)
 * [@ban](ban.html)
