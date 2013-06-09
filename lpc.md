---
title: lpc
layout: wiki
---
{% include toc.md %}
This page contains some basic information about the [Liberated Pixel Cup](http://lpc.opengameart.org/) project based on the Mana client and server.

#  Set in Stone

Here are some decisions that have been discussed and decided.

 * **Inventory and equipment will be slot based.**<br /> *Rationale:* this is the way the Mana server currently implements them, and it's not something we want to spend a lot of time on right now.<br /> *Implications:* Inventory will be displayed in a grid and will not mention equipped items. Equipment slots will be displayed separately. Drag & drop support would be nice.

#  Client-side ToDo list


 * **UI skinning**<br /> Windows are skinned now but additional adaptions are still needed for buttons, progress bars, sliders and other things.
 * **UI layout**<br /> With the resolution kept between 640x360 - 1280x720, the rough goal of our main GUI is as follows:<br /> {{http://img339.imageshack.us/img339/852/goali.png}}<br /> Other parts of the UI like character status, inventory, equipment, etc. will need to be adapted and are planned to get a fixed position as opposed to windows that you can drag around. Changes include:
    * Merge inventory and equipment into a single panel on the right
    * Merge character status and skills into a single panel on the left
    * Merge the social window into the chat panel (which will be placed in the top-left)
    * Merge the mini status into the mini map and move it to the top-right
    * Make the shortcuts panel always visible at the bottom, and add entries for primary/secondary action
 * **NPC interaction**<br /> We should redesign the NPC interaction to made it easier and more fun to talk with NPCs. Suggestions:
    * Instead of opening a window, we darken an area above the shortcuts in which the text of the NPC is written, with his name prepended.
    * When you get to say something, you just click on the text you want to say, rather than choosing it and then pressing Next. To make sure this is intuitive the text should highlight on hover.
    * We should make the NPC face the player while he's talking to him (maybe only client-local so it works for multiple players).

#  Server-side ToDo list

 * Implement on_character_birth hook, meant to initialize new characters.
