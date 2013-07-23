---
title: client features
layout: wiki
---
{% include toc.md %}
The Mana client has the following features and capabilities:

#  General
 * Consists entirely of free, open source software
 * Runs on Windows, Linux and several other operating systems((MacOS is officially unsupported for now. We need an OSX developer.))
 * Can download content updates from the web
 * Support for custom branding
 * Capable of connecting to different game worlds
 * Support for a modified eAthena server (named Tmw-eAthena) and [the Mana server](server_features.html)

#  Graphic engine
 * OpenGL support
 * Variable screen resolution
 * Maps with up to 4000*4000 tiles known to work((Larger should work fine on sufficiently capable computers. W*H limited to ~2 billion on most computers.))
 * Virtually unlimited((over 2 billion on most computers)) map layers
 * Support for extra high tiles for easy mapping of fringe objects
 * Unlimited((over 2 billion on most computers)) number of foreground and background images with configurable parallax, auto, and fixed scrolling.
 * 32 bit colors with alpha transparency
 * [Recoloring of graphics at runtime](image_dyeing_system.html)
 * Support for animated tiles
 * Powerful [particle engine](particle_system.html)
 * Smooth scrolling
 * Very flexible [sprite system](sprite_system.html)
 * Pixel-accurate movement((only on the Mana server, not on eAthena))
 * TrueType Font rendering with Unicode support ((extent of Unicode support depends on the font file used))

#  Input system
 * Nearly all keyboard shortcuts are user-customizable
 * Basic joystick support
 * Move/attack/interact with keyboard or mouse
