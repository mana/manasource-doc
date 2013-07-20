---
title: crafting
layout: wiki
---
{% include toc.md %}
#  Crafting engine

Manaserv includes a fully scripted crafting system which allows a server administrator to script an own crafting logic in LUA.

##  Client side
Currently crafting is done through the [@craft](chat_commands/craft.html) command. Replacing this workaround with a GUI is planned ([http://bugs.manasource.org/view.php?id=335](http://bugs.manasource.org/view.php?id=335))

##  Server side

The logic for handling crafting is done in the LUA script file scripting/crafting.lua.

When a user attempts to craft something, it sends a list of items and amounts to the gameserver. The gameserver verifies that the character has these items and when this is the case, forwards the list to the script function on_craft in said script file to handle the crafting logic.

###  What does the on_craft function need to do?

The responsibilities of the on_craft function are:

  - Check if the item list is a valid combination to craft something
  - Check if there is a reason why the character is not supposed to perform this craft action besides lack of items (lack of character skill, lack of in-character knowledge or whatever crafting restrictions come to your mind)
  - Remove items from the character which are supposed to be consumed in the reaction
  - Give the new items to the character
  - Provide feedback to the user about failure or success of the crafting operation

###  The example crafting systems

The example file example/serverdata/scripting/crafting.lua includes two example crafting systems which are disabled by default but can be enabled by commenting out line 30 and uncommenting line 31 or 32. Both enable the characters to create a sword (item ID 5) from two iron (item ID 8) and one wood (item ID 9).

The first crafting system (craft_strict) enforces the correct order and the exact amounts, while the second crafting system (craft_lax) allows to put the items in any order and allows to put unnecessary additional items into the crafting recipe which are then ignored.

With some basic LUA programming knowledge you should be able to add additional combinations to these scripts.

###  Handling many crafting recipes
While the software architecture of the example scripts is sufficient to demonstrate how the crafting engine of Manaserv works, it will become very messy and hard to maintain when adding a large number of recipes.

A good way to make your crafting system easier to maintain, especially for non-programmers on your team, is to move the crafting formulas and all their necessary meta information to a global LUA table and check the users recipe against it. When you want the deluxe solution, you could opt to export these information to an external text file or even a database to separate program logic and content properly.

###  Handling multiple reactions with the same ingredients
The only way for the player to communicate its intention to your crafting script is through the ingredient list. But maybe you want your players to be able to craft multiple items from the same raw material combination. Maybe you want 5 pieces of iron to be usable to create a sword, a shield, a breastplate or something else based on what the player wants to create.

A good way to handle this is by adding a tool or blueprint item to the recipe for differing between these actions. Remember that it is your choice which items are removed from the users inventory. Nothing forces you to remove all used ingredients. So you can choose to remove the raw materials but let the character keep the used tool and/or blueprint item.

You can also remove items the user didn't even specify for the crafting action. This means a blueprint-based crafting system where the user specifies just the blueprint item as the only ingredient and the required raw materials are removed automatically from its inventory is also a possible alternative. But when you do this your script is responsible for checking that the character possesses the required items.

###  What else can the crafting script do?
The crafting script has access to the whole [scripting](scripting.html) library and can do a lot of things with the character through it. The possibilities include but are not limited to:
 * Check the attributes or skills of the character
 * Check the characters [permission level](permissions.xml.html)
 * Give experience points to the character
 * Have scripting formulas with random outcome
 * Teleport the character
 * Hurt or heal the character
 * Apply temporary status effects to the character
 * Create [special effects](specials.xml.html) on or around the character which others can see

###  Future plans
A long-term goal of the Mana platform is the ability to create truly unique items (items with names, stats and look which are not determined by an entry in items.xml but generated procedurally at runtime and exist only once in your game world). When this becomes possible, it will of course be possible to create such items with the crafting script and maybe also to use these unique items as ingredients.

Another long-term goal is to allow scripts to [permanently alter maps](runtime_map_modification.html). When this becomes available the crafting system could be utilized to allow players to create persistent constructions in the game world.
