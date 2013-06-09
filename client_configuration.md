---
title: client configuration
layout: wiki
---
{% include toc.md %}
#  Mana Configuration

**Note:** This article is about setting up your own basic Mana client data, either for testing purposes or because you want to provide an alternative to the official server.

There are several steps to achieve this:

###  Running Mana

 * Create a `data/` folder

 * Prepare the different configuration files as much as you can in it:

**The client requires the following configuration files:** <br />
`data/[attributes.xml](attributes.xml.html)` <br />
`data/[equip.xml](equip.xml.html)` <br />
`data/[items.xml](items.xml.html)` (which is for now also providing hairs, races and playerset definitions for now) <br />
`data/[skills.xml](skills.xml.html)` <br />
`data/[monsters.xml](monsters.xml.html)` <br />
`data/[npcs.xml](npcs.xml.html)` <br />

**The following files are also very important or required to run:** <br />
The [GUI graphics and data](gui_configuration.html), by default in: `graphics/gui` <br />
The tileset graphics, by default in `graphics/tiles` <br />
The maps (\*.tmx files) in `data/[maps/](mapping.html)` <br />


**The following data is optional but yet visible when lacking:**  <br />

__Graphical data:__ <br />
The playerset sprites. <br />
Hair sprites. <br />
Equipment sprites. <br />
The monster sprites. <br />
The item sprites. <br />
The NPCs sprites <br />
Emotes sprites.

**Note:** For each one of them, see the [sprite system](sprite_system.html) to get to know how to configure sprites animation, and the [particle system](particle_system.html) to adding new particles

__Configuration data:__ <br />
data/[hair.xml](hair.xml.html) <br />
data/[colors.xml](hair.xml.html) <br />
data/[emotes.xml](emotes.xml.html) <br />
data/[skills.xml](skills.xml.html) <br />
data/[specials.xml](specials.xml.html) <br />
data/[status-effects.xml](status-effects.xml.html) <br />

 * You can also get the official client data from [Git](git_repository.html). A basic example is even provided [here](http://www.gitorious.org/mana/manaserv/trees/master/example/clientdata).

To start the client when trying your own data, use the given command to avoid auto-update when choosing a server
that is not providing update data yet:
  mana -u -d /path/to/the/data
