---
title: chat commands/craft
layout: wiki
categorylink: chat_commands
category: Chat Commands
---
{% include toc.md %}
#  Synopsis
  @craft &lt;item1&gt; &lt;amount1&gt; { &lt;item2&gt; &lt;amount2&gt; } ...  { &lt;itemN&gt; &lt;amountN&gt; }

This command is a temporary solution for implementing a [crafting](../crafting.html) system until a GUI for crafting is implemented.
#  Examples
  @craft "Iron Bar" 2 Wood 1
This tries to combine two iron bars and a piece of wood into a new item.

When you receive the message "Unknown item X", it means that an item named X doesn't exist in your servers [items.xml](../items.xml.html).

When you receive the message "You have no X in your inventory" or "You don't have enough X in your inventory", your character doesn't own the items you tried to combine. Note that equipped items are not counted and need to be unequipped before they can be used for crafting. When you are a server admin, try giving the necessary items to yourself using the [@item](item.html) command.

When you receive the message "There is no crafting in the game world", it means that the crafting engine works, but you are still using the example crafting script which does nothing except outputting this message. You can read more about how to enable the example crafting systems implement your own crafting system in the [crafting](../crafting.html) article.

#  Security

**Harmless**

The gameplay logic behind this command is handled by the crafting script you write. While you can do very dangerous things there when you want to, the default behavior does nothing except validating that the character owns the items it wants to use for crafting but doesn't give or take any items.

When you don't have a crafting system you should disable this command to avoid confusing users.

#  See also
 * [@item](item.html)
