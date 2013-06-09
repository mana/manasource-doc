---
title: chat commands
layout: wiki
---
{% include toc.md %}
#  Chat commands

The Manasource server reacts on the following chat commands when a player enters them. The commands which are available to different user groups can be set in [permissions.xml](permissions.xml.html).

##  Implemented and working

<table class="table table-bordered table-hover" markdown="1">
    <thead>
        <tr>
            <th>Command</th>
        </tr>
    </thead>
    <tbody>
        <tr>
            <td>@announce</td>
            <td>Sends a chat message to all characters in the game</td>
        </tr>
        <tr>
            <td>@attribute</td>
            <td>Changes the character attributes of a character</td>
        </tr>
        <tr>
            <td>[@ban](chat_commands/ban.html)</td>
            <td>Bans the character and all characters on the same account from the game</td>
        </tr>
        <tr>
            <td>@charwarp</td>
            <td>Warps a character</td>
        </tr>
        <tr>
            <td>[@craft](chat_commands/craft.html)</td>
            <td>Attempts to craft something</td>
        </tr>
        <tr>
            <td>[@die](chat_commands/die.html)</td>
            <td>Kills the own character</td>
        </tr>
        <tr>
            <td>[@drop](chat_commands/drop.html)</td>
            <td>Drops a stack of items on the ground at your current location</td>
        </tr>
        <tr>
            <td>@effect</td>
            <td>Spawns an effect defined inside of [effects.xml](effects.xml.html) on the map</td>
        </tr>
        <tr>
            <td>@getpos</td>
            <td>Gets the position of a character</td>
        </tr>
        <tr>
            <td>[@givepermission](chat_commands/givepermission.html)</td>
            <td>Gives a permission class to the account a character belongs to</td>
        </tr>
        <tr>
            <td>[@goto](chat_commands/goto.html)</td>
            <td>Teleports you to the location of another character</td>
        </tr>
        <tr>
            <td>[@help](chat_commands/help.html)</td>
            <td>Lists all available commands or a detailed help for a command</td>
        </tr>
        <tr>
            <td>[@item](chat_commands/item.html)</td>
            <td>Creates a number of items in the inventory of a character</td>
        </tr>
        <tr>
            <td>[@kick](chat_commands/kick.html)</td>
            <td>Disconnects the client of a character from the game</td>
        </tr>
        <tr>
            <td>[@kill](chat_commands/kill.html)</td>
            <td>Kills a character</td>
        </tr>
        <tr>
            <td>[@killmonsters](chat_commands/killmonsters.html)</td>
            <td>Kills all monsters on the map</td>
        </tr>
        <tr>
            <td>@log</td>
            <td>Logs a message to the GM log</td>
        </tr>
        <tr>
            <td>@logsay</td>
            <td>Says something in public chat and logs it to the GM log at the same time (analogue to @t on tmwAthena)</td>
        </tr>
        <tr>
            <td>@money</td>
            <td>Changes the money a character possesses</td>
        </tr>
        <tr>
            <td>@mute</td>
            <td>Makes it impossible for a character to chat for a while</td>
        </tr>
        <tr>
            <td>[@recall](chat_commands/recall.html)</td>
            <td>Teleports another character to your location</td>
        </tr>
        <tr>
            <td>@reload</td>
            <td>Makes the server reload all configuration files</td>
        </tr>
        <tr>
            <td>[@rights](chat_commands/rights.html)</td>
            <td>Tells you your current permissions</td>
        </tr>
        <tr>
            <td>[@spawn](chat_commands/spawn.html)</td>
            <td>Creates a number of monsters near your location</td>
        </tr>
        <tr>
            <td>@skills</td>
            <td>Lists all skills of a character and their values</td>
        </tr>
        <tr>
            <td>[@takepermission](chat_commands/takepermission.html)</td>
            <td>Takes a permission class from the account a character belongs to</td>
        </tr>
        <tr>
            <td>[@warp](chat_commands/warp.html)</td>
            <td>Teleports your character to a different location in the game world</td>
        </tr>
        <tr>
            <td>[@where](chat_commands/where.html)</td>
            <td>Tells you your location in the game world</td>
        </tr>
    </tbody>
</table>

##  Implemented but not doing anything

<table class="table table-bordered table-hover" markdown="1">
    <thead>
        <tr>
            <th>Command</th>
        </tr>
    </thead>
    <tbody>
        <tr>
            <td>@history</td>
            <td>Shows the last transactions</td>
        </tr>
        <tr>
            <td>@report</td>
            <td>Sends a bug or abuse reports to the server administration</td>
        </tr>
    </tbody>
</table>

##  Planned

<table class="table table-bordered table-hover" markdown="1">
    <thead>
        <tr>
            <th>Command</th>
            <th>Planned function</th>
        </tr>
    </thead>
    <tbody>
        <tr>
            <td>@exp</td>
            <td>Gives or takes experience from a skill of a character</td>
        </tr>
        <tr>
            <td>@invisible</td>
            <td>Toggles visibility of a character to others</td>
        </tr>
        <tr>
            <td>@combat</td>
            <td>Toggles no-combat mode (character can not attack or be attacked and is ignored by monsters)</td>
        </tr>
        <tr>
            <td>@whogm</td>
            <td>Returns a list of people online with GM rights</td>
        </tr>
        <tr>
            <td>@wgm</td>
            <td>Sends a private message to all people with GM rights</td>
        </tr>
        <tr>
            <td>@localannounce</td>
            <td>Sends a chat message to all characters in the game</td>
        </tr>
        <tr>
            <td>@kiiill</td>
            <td>Kills a character accompanied by a very satisfying special effect</td>
        </tr>
        <tr>
            <td>@fx</td>
            <td>Triggers a special effect</td>
        </tr>
        <tr>
            <td>@reportchat</td>
            <td>saves the chat history of the character on the server and returns an ID number for finding it later</td>
        </tr>
        <tr>
            <td>@viewreportchat</td>
            <td>displays a saved chat history with an ID number</td>
        </tr>
        <tr>
            <td>@removemonsters</td>
            <td>removes all monsters around the character without killing them (meaning that no exp will be rewarded and no loot will be dropped).</td>
        </tr>
        <tr>
            <td>@gonext</td>
            <td>Warps the character to the next character who is online. (analogue to @hugo on tmwAthena)</td>
        </tr>
        <tr>
            <td>@goprev</td>
            <td>Warps the character to the previous character who is online. (analogue for @linus on tmwAthena)</td>
        </tr>
        <tr>
            <td>@ipcheck</td>
            <td>Returns a list of characters which were online with the same IP since last server restart.</td>
        </tr>
        <tr>
            <td>@ipban</td>
            <td>Kicks every client connected from the specified IP address or subnet and refuses connection from it for a specified amount of time.</td>
        </tr>
        <tr>
            <td>@wipe_items</td>
            <td>Removes all items and money from a character except quest-specific items (currently there is no way to define items as quest-specific). Should be possible when character is offline.</td>
        </tr>
        <tr>
            <td>@wipe_level</td>
            <td>Sets all skill levels of a character to 0 (also affecting the base level) and resets the attributes to the starting configuration. Should be possible when character is offline.</td>
        </tr>
        <tr>
            <td>@shutdown_this</td>
            <td>Shuts the current gameserver down</td>
        </tr>
        <tr>
            <td>@shutdown_all</td>
            <td>Shuts the whole server complex down</td>
        </tr>
        <tr>
            <td>@restart_this</td>
            <td>Restarts the current gameserver</td>
        </tr>
        <tr>
            <td>@restart_all</td>
            <td>Restarts the whole server complex</td>
        </tr>
        <tr>
            <td>@unban</td>
            <td>Remove a ban from the account of a character</td>
        </tr>
        <tr>
            <td>@event</td>
            <td>Calls the on_event script function (which can be implemented by server administrator to do anything they want) with arbitary parameters</td>
        </tr>
    </tbody>
</table>
