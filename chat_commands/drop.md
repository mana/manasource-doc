---
title: chat commands/drop
layout: wiki
categorylink: chat_commands
category: Chat Commands
---
{% include toc.md %}
#  Synopsis
  @drop &lt;item&gt; &lt;amount&gt;
Creates a stack of items on the ground at your current location. The item can be indicated with an item name (case insensitive) or an item ID. An amount of items can be indicated optionally.

#  Examples

Create a stack of 10 candy:
  @drop Candy 10
Create a stack of 10 candy (with item ID):
  @drop 5 10
Create a single candy:
  @drop Candy

Item IDs can be looked up and changed in the config file [items.xml](../items.xml.html). Using an item name should be preferred over using an item ID number because it is much more secure. When you do a typo you will create no item instead of an item you didn't want to create and you are unlikely to mix up id and amount. Using the ID is only required when you have multiple items with the same name, because item IDs are guaranteed to be unique, names are not.

#  Security

**Dangerous!**

Uncontrolled creation of items can cause a lot of harm to the gameplay of your server. This command should only be available to developers on test servers because it can happen very easily that you mix up the item IDs and inadvertently give your players items they are not supposed to have. **This command should not be made available on a production server.** When you need items for an event, use [@item](item.html) instead and drop the items from your inventory. This is much safer because you can look at what you created before it is put into the game world and picked up by the first player.

#  See also
 * [@item](item.html)
 * [@spawn](spawn.html)
