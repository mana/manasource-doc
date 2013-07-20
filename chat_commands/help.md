---
title: chat commands/help
layout: wiki
categorylink: chat_commands
category: Chat Commands
---
{% include toc.md %}
#  Synopsis
  @help &lt;command&gt;
Shows a list of chat commands available to the user or the detailed usage syntax and synopsis of a specific chat command.

The list of available commands is generated from the [permission level](../permissions.xml.html) of the users account. The help texts are hardcoded in the sourcecode file game-server/commandhandler.cpp and can currently not be localized.

#  Examples

View list of chat commands which are available:
  @help

View information about the @item chat command (when available to the user)
  @help item

#  Security

**Harmless**

This command is very useful for your normal players and also comes in handy for troubleshooting permission problems of privileged users. It should be made available to anyone. This command only informs the user about the commands he/she can use. When trying to get detailed information about a command which exists but which can can not be used by the user (for example @help ban), the server will respond with "Why do you want to know? You can't use it anyway". This gives the user the ability to use this command to guess which other commands exist. But the user can also obtain this information here on the wiki, so why bother.

#  See also
 * [@rights](rights.html)
 * [@where](where.html)
