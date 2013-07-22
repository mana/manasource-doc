---
title: tools
layout: wiki
---
{% include toc.md %}
#  Tools

In order to ease the work of the Mana server's maintainers, several tools have been created and are in a continuous progress to lower the time and energy needed to do daily tasks, and such.

##  Tools for managing the client data

Here is a list of useful tools used to deal with client data, which is most visible thing you'll do for your players!

###  Tiled

the Mana server and the Mana client are currently following the tmx format from [Tiled](http://www.mapeditor.org): A generic 2D map editor.

Grab the latest release, and have a look at our [mapping tutorial](mapping.html) if you're new about how to create new maps.

###  TMX copy

TMX copy is a simple but efficient tool permitting to copy a map border to a another map. So, when you need a map well fitting the former one's border, use this tool and here you are!
The tool can be downloaded [here](http://gitorious.org/mana/mana/trees/master/tools).

Have a look at our [mapping tutorial](mapping.html#making_two_maps_with_a_fluent_transition) if you're new about how to use it.

###  Dyecmd

The dyecmd tool is a simple command-line based tool permitting to apply a dye channel to a dyeable image, and see immediately the result.
Dyeable images are (roughly speaking) dynamic recolorations of gray-scale images, thus permitting to reuse the same sprite with different tons.
This tool is located [here](https://github.com/mana/mana/tree/master/tools) and is compilable using Cmake.

Have a look at the [dyeing system](image_dyeing_system.html) if you're new about it.

###  Particled

Particled is an attempt at bringing a particle editor while reusing the SDL particle engine used in the Mana client.

The source can be downloaded [here](http://gitorious.org/fairy-glow/particled-igneus), and a useful [README](http://gitorious.org/fairy-glow/particled-igneus/blobs/master/README) on how to use it can be found here.

This editor is to be replaced sooner or later by Fairy Glow, a QT-based application alla Tiled.

##  Tools for managing updates data

###  adler32

adler32 is the simplest possible c implementation of the same-named algorithm. It is currently used to compute the checksum of the update files.
This tool is located [here](http://github.com/mana/mana/tree/master/tools) and can be compiled using this command with gcc, for instance:
  gcc -o adler32 -c adler32.c -lz
  
Then, type `adler32 myZipFile.zip` to get the corresponding adler checksum.

###  upalyser

This php page is used to dynamically analyse what files are contained the zip files of your update folder, and also which are obsolete.

This tool is located [here](http://github.com/mana/mana/tree/master/tools).

FIXME: Precise how to use it.

##  Tools to manage the servers

###  monitor

The monitor application a simple Qt-based monitor for the Mana server.

This tool is located [here](http://github.com/mana/manaserv/tree/master/tools).

FIXME: Precise how to use it.
