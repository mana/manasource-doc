---
title: server features
layout: wiki
---
{% include toc.md %}
The Mana server has the following features and capabilities:

#  General
 * Consists entirely of free, open source software (GPL v2)
 * Runs on Windows, Linux and several other operating systems((MacOS is officially unsupported for now. We need an OSX developer.))
 * Encrypted communication between the different server engines.
 * Several database supported (SQLite, MySQL, PostGreSQL)

#  Account engine
 * Chat system with slangs and spam filtering
 * Full featured equipment system.
 * Flexible configuration

#  Game Engine
 * Tiles to Pixel-based movement system.
 * Maps with up to 4000*4000 tiles known to work((Larger should work fine on sufficiently capable computers. W*H limited to ~2 billion on most computers.))
 * Real-Time battle handling
 * Lua [scripting system](scripting.html) for the characters, items, and many parts of the system.
 * Trade system
 * Script-based [crafting engine](crafting.html) which allows easy implementation of custom crafting systems
