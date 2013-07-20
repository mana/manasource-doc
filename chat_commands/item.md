---
title: chat commands/item
layout: wiki
categorylink: chat_commands
category: Chat Commands
---
{% include toc.md %}
#  Synopsis
  @item &lt;character&gt; &lt;item&gt; &lt;amount&gt;
Creates a stack of items in the inventory of a character. The item can be indicated with an item name (case insensitive) or an item ID. An amount of items can be indicated optionally.
#  Examples
Give yourself one candy:
  @item # candy
Alternative with item ID (5 is the item ID of "candy"):
  @item # 5
Give the player "Bob" a stack of 10 candy:
  @item Bob candy 10

Item IDs can be looked up and changed in the config file [items.xml](../items.xml.html). Using an item name should be preferred over using an item ID number because it is much more secure. When you do a typo you will create no item instead of an item you didn't want to create and you are unlikely to mix up id and amount. Using the ID is only required when you have multiple items with the same name, because item IDs are guaranteed to be unique, names are not.

#  Security

**Critical!**

Uncontrolled creation of items can cause a lot of harm to the gameplay of your server. This command should only be available to trustworthy server personnel who know what they are doing and who don't give items to people who are not supposed to have them. This command should be preferred over [@drop](drop.html), because it creates the items in the inventory where they are safe instead of in the game world where they can be picked up by anyone.

#  See also
 * [@drop](drop.html)
