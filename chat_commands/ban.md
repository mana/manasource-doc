---
title: chat commands/ban
layout: wiki
categorylink: chat_commands
category: Chat Commands
---
{% include toc.md %}
#  Synopsis
  @ban &lt;character&gt; &lt;duration&gt;(m|h|d|w|y)

Prevents login with the account of the character for a specific duration and [kicks](kick.html) the character from the game.
#  Examples
  @ban Abuser 5m
Bans the account of Abuser for five minutes
  @ban # 1h
Bans your own account for one hour.
  @ban "Mr. Abuser" 2w
Bans the account of Mr. Abuser for two weeks
  @ban "Mr. Abuser" 100y
Bans the account of Mr. Abuser for hundred years which is effectively a permanent ban.

#  Lifting bans

As of writing this article, no "unban" command is implemented. The only way to lift an erroneous ban is through an SQL command on the database. To unban the account "Mr. Atoner" use the following SQL query:
  UPDATE mana_accounts SET banned=0 WHERE username="Mr. Atoner";
The account server checks for unbanned accounts every minute, so you might have to wait a moment until the account can be used again.

Note that you have to use the **account** name, not the **character** name. To get the account name of the character "Mr. Atoner", use the following command:
  SELECT a.username FROM mana_accounts AS a JOIN mana_characters AS c ON (c.user_id = a.id) WHERE c.name = "Mr. Atoner";
#  Security

**Critical**

This command is intended to be used by game masters to remove abusive users from the game. It can be used to ban any account, including administrators.
#  See also
 * [@kick](kick.html)
 * [@kill](kill.html)
 * \@mute
