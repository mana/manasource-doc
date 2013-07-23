---
title: client data handling
layout: wiki
---
{% include toc.md %}
A MMORPG client such as the Mana client needs manage a lot of data. Mana tries to remain flexible, but easy to use, for server maintainers to make and maintain client data.

#  Data locations

Mana will load data from several places. Each has it's own purpose. Depending on the operating system, the Mana client won't locate its data in the same place, here is where each data type is stored, depending on the main supported OSes. '%appShort%' is a branding value (of the same name, taken from the [branding file](branding.xml.html), if provided) used to provide branding-specific locations for certain settings.

<table class="table table-bordered table-hover" markdown="1">
    <thead>
        <tr>
            <th>Path type</th>
            <th colspan="3">Operating System</th>
        </tr>
    </thead>
    <tbody>
        <tr>
            <th>:::</th>
            <th>Linux and Posix</th>
            <th>Mac</th>
            <th>Windows</th>
        </tr>
        <tr>
        </tr>
        <tr>
        </tr>
        <tr>
        </tr>
        <tr>
        </tr>
    </tbody>
</table>

#  Loading order

Client data is loaded from several sources into [PhysFS](physfs.html). When the client is started, the following folders are added in order (later takes precedence):
  - application installation path
  - run/working directory
  - -d/--data from 'command line' options

After the client logs in to a server and [updates](update_system.html) are loaded, the following data sources are loaded:
  - [updates files](update_system.html)
  - custom data in the config/%appShort%/customData folder (zip files only; order undetermined)

#  Required data
The client requires that several pieces of data are in specific locations. Some is distributed with the client, others need to be provided by branding or updates. Data included with the client sources:

<table class="table table-bordered table-hover" markdown="1">
    <thead>
        <tr>
            <th>Folder</th>
            <th>Description</th>
        </tr>
    </thead>
    <tbody>
        <tr>
            <td>fonts</td>
            <td>Font files.</td>
        </tr>
        <tr>
            <td>graphics/gui</td>
            <td>Default [GUI theme](gui_configuration.html) (gray).</td>
        </tr>
        <tr>
            <td>graphics/images</td>
            <td>error.png and [wallpaper](wallpaper.html).</td>
        </tr>
        <tr>
            <td>help</td>
            <td>Help files.</td>
        </tr>
        <tr>
            <td>icons</td>
            <td>Icons files. Different formats are provided for different OSes.</td>
        </tr>
    </tbody>
</table>

The following files and folders are required by the client but not included with the client sources (as they are world-specific). Subfolders for files not listed are usable and recommended. The file types given are the types that need to go in the folders (ex: images for sprites can be anywhere, but their XML needs to be in graphics/sprites). The table:

<table class="table table-bordered table-hover" markdown="1">
    <thead>
        <tr>
            <th>Item</th>
            <th>Description</th>
        </tr>
    </thead>
    <tbody>
        <tr>
            <td colspan="2">**graphics/**</td>
        </tr>
        <tr>
            <td>graphics/items</td>
            <td>Item icons (images).</td>
        </tr>
        <tr>
            <td>graphics/minimaps</td>
            <td>Minimap backup folder (images). Used when a map doesn't specify a minimap. File names taken from full map names (maps/a/b/c.tmx becomes graphics/minimaps/a/b/c.png).</td>
        </tr>
        <tr>
            <td>graphics/particles</td>
            <td>Particle effects (xml).</td>
        </tr>
        <tr>
            <td>graphics/particles/levelup.particle.xml</td>
            <td>Level up effect for the Mana server.</td>
        </tr>
        <tr>
            <td>graphics/particles/warparea.particle.xml</td>
            <td>Warp/portal effect. Only used for warps in the TMX file.</td>
        </tr>
        <tr>
            <td>graphics/sprites</td>
            <td>Sprites, status effect icons, emotes (all xml).</td>
        </tr>
        <tr>
            <td>graphics/sprites/error.xml</td>
            <td>Loaded for missing sprite data.</td>
        </tr>
        <tr>
            <td>maps</td>
            <td>Maps (tmx).</td>
        </tr>
        <tr>
            <td>sfx</td>
            <td>Sound effects (ogg).</td>
        </tr>
        <tr>
            <td>sfx/fist-swish.ogg</td>
            <td>Player unarmed attack sound effect.</td>
        </tr>
        <tr>
            <td>music/system/Magick - Real.ogg</td>
            <td>Default system login music.</td>
        </tr>
        <tr>
            <td>[colors.xml](hair.xml.html)</td>
            <td>Fallback for hair colors.</td>
        </tr>
        <tr>
            <td>[effects.xml](effects.xml.html)</td>
            <td>Effect descriptions.</td>
        </tr>
        <tr>
            <td>[emotes.xml](emotes.xml.html)</td>
            <td>Emote descriptions.</td>
        </tr>
        <tr>
            <td>[hair.xml](hair.xml.html)</td>
            <td>Hair colors.</td>
        </tr>
        <tr>
            <td>[items.xml](items.xml.html)</td>
            <td>Item DB. Hair and race sprites are treated like items for now.</td>
        </tr>
        <tr>
            <td>[monsters.xml](monsters.xml.html)</td>
            <td>Monster DB.</td>
        </tr>
        <tr>
            <td>[npcs.xml](npcs.xml.html)</td>
            <td>NPC view descriptions.</td>
        </tr>
        <tr>
            <td>[status-effects.xml](status-effects.xml.html)</td>
            <td>Status effect descriptions.</td>
        </tr>
        <tr>
            <td>[units.xml](units.xml.html)</td>
            <td>Unit descriptions. At the moment, just weight and currency.</td>
        </tr>
        <tr>
            <td colspan="2">**Files specific to the Mana server support - Specifications in progress**</td>
        </tr>
        <tr>
            <td>[attributes.xml](attributes.xml.html)</td>
            <td>Attribute description. This file is only used by and required for playing with a the Mana server server.</td>
        </tr>
        <tr>
            <td>[specials.xml](specials.xml.html)</td>
            <td>Special attack descriptions.</td>
        </tr>
        <tr>
            <td>[skills.xml](skills.xml.html)</td>
            <td>Skills for manaserv.</td>
        </tr>
        <tr>
            <td>[equip.xml](equip.xml.html)</td>
            <td>Equipment slot definition for manaserv.</td>
        </tr>
    </tbody>
</table>

#  Optional data

<table class="table table-bordered table-hover" markdown="1">
    <thead>
        <tr>
            <th>Item</th>
            <th>Description</th>
        </tr>
    </thead>
    <tbody>
        <tr>
            <td>[branding.xml](branding.xml.html)</td>
            <td>The branding file is used to brand (customize) the Mana client.</td>
        </tr>
        <tr>
            <td>[paths.xml](paths.xml.html)</td>
            <td>The path file is used to override (customize) the default path used for configuration files (base xml files apart.).</td>
        </tr>
        <tr>
            <td>[serverlist.xml](serverlist.xml.html)</td>
            <td>The server list file is downloaded by the client that lists available servers and some of their properties.</td>
        </tr>
        <tr>
            <td>[config.xml](config.xml.html)</td>
            <td>Main configuration file. Generated by the client in the user config directory.</td>
        </tr>
    </tbody>
</table>
