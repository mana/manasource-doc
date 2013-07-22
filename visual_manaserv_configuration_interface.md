---
title: visual manaserv configuration interface
layout: wiki
---
{% include toc.md %}
#  Visual configuration interface

##  Current Situation

Setting up and administrating a the Mana server server is currently a task which requires to learn a lot of knowledge. To create a server with really basic gameplay, a server administrator has to know how to edit various XML files, learn the LUA scripting language and some basic SQL. To make the learning curve mre newbie-friendly and also allow seasoned system administrators to perform simple changes more quickly, we should start a new project to create a configuration tool for the Mana server with a graphical user interface as soon as the configuration files have reached a stable state.

The goal is that an inexperienced user is able to set up a basic game world without having to edit any XML or LUA code by hand.

##  Features

 * GUI-Based
 * Remote-capable (run the GUI on a client machine)
 * Capable of handling user with reduced privileges so that server admins can delegate tasks
 * Platform-independent
 * Can auto-generate updates on an update server


###  System administration
 * Overview of server network and its status
 * Basic Server, Network and database settings
 * Remote starting, stopping and restarting of servers

###  Database administration

GUI for viewing and manipulating the most important data in the database. Should hide the used database backend from the user.
 * User accounts
 * Characters
 * Global variables
 * ...

###  Gameplay
 * Viewing and manipulating gameplay-related settings in manaserv.xml
 * Visual editor for configuration files like attributes.xml, equipment.xml, runes.xml and other gameplay configuration files.

###  Community
 * Edit News.txt file
 * Edit MotD
 * Make global announcements
 * Schedule global announcements to be made at a later date or at regular intervals
 * Create and administrate public chat channels
 * Edit permission groups and their members
 * Assign permission groups to players (promoting and demoting game masters)
 * View GM transaction log

###  Items
 * Viewing, editing, creating and removing items from items.xml
 * When removing an item, offer to also delete it from the inventory of every character in the database
 * Cross-integration with monster and NPC components to control drops and shop prices.

###  Monsters
 * Viewing, editing, creating and removing monster types
 * When removing a monster, offer to also remove any spawn areas with this monster on maps

###  Maps
 * Assign maps to game servers
 * Add, deactivate and remove maps
 * Graphical "World Viewer" which auto-generates a world map from the warp connections defined in the map files.
 * Show active and inactive player population in the world viewer (maybe even allow statistical analysis of map population?)
 * Edit monster population and map properties
 * Integration of Tiled for opening and editing map files

###  NPCs
 * Visual editor for simple shop NPCs
 * Visual editor for NPC dialog trees which auto-generates LUA code
 * Edit sourcecode of NPC scripts in an embedded text editor with syntax highlighting, syntax checking and auto completion for LUA (is there a usable 3rd party solution?)

###  Discussion


