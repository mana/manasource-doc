---
title: mana mobile
layout: wiki
---
{% include toc.md %}
#  Mana Mobile

Mana Mobile is basically a Qt 4.7 based version of the client, written from scratch. The "Mobile" suffix is mainly because I believe mobile should be our primary target, but there is nothing stopping anybody from using Mana Mobile on the desktop and it should also be doable to write a customized UI for the desktop eventually.

##  Getting started

You need to:

 * Get Qt 4.7 development libraries. Install `libqt4-dev` and `libqt4-opengl-dev` on Ubuntu 10.10 or install the Qt SDK on any OS.
 * Clone Mana Mobile from: http://gitorious.org/mana/manamobile
 * Run `qmake` and `make` to compile Mana Mobile, or open `manamobile.pro` in Qt Creator.
 * Run `./manamobile` to try it out (Ctrl+R in Qt Creator).

##  The big TODO list, or: How can you help?

Writing a Mana client from scratch is a lot of work, but when a few people help out it doesn't need to take long. Here's some stuff you could work on (most of it can be done independently).

###  Core functionality

 * &lt;del&gt;Download resources directly from http&lt;/del&gt; - thorbjorn
 * &lt;del&gt;Cache resources locally&lt;/del&gt; - thorbjorn
 * Remember last used login

###  Login sequence (this is about QML GUI, the C++ part is done)

 * &lt;del&gt;Logging in&lt;/del&gt; - thorbjorn
 * &lt;del&gt;Choosing character&lt;/del&gt; (still needs better UI) - thorbjorn
 * &lt;del&gt;Registering of new accounts&lt;/del&gt; (still needs captcha support) - thorbjorn
 * Changing email address / password for your account
 * Creating new characters
 * Deleting characters
 * Actually showing the characters (requires sprite support to be written)

###  Game features

 * &lt;del&gt;Showing the map the player is on&lt;/del&gt; - thorbjorn
 * &lt;del&gt;Showing other monsters and players&lt;/del&gt; (very basic at the moment) - thorbjorn
 * Showing items and allowing them to be picked up by clicking them
 * Local chat - thorbjorn
 * General information display like health
 * Minimap
 * NPC interaction
 * Particle effects
 * Sprite and animation support

###  Chat server

 * Private chat
 * Guild system

###  Artwork and Design!

Never before have we had the opportunity to create a visually stunning client so easily! We need graphic artists and UI designers to get involved to get away from programmers' look. With QML, designs are easy to take from GIMP, Inkscape or Photoshop and implement them as fully functional UIs, which can also be tweaked by people who are not really into programming.

##  Answer to a few questions

###  Why a new client for mobile phones?

Because our current client doesn't work on mobile phones, due to a number of problems:

 * It has a very complicated bunch of dependencies that are not generally found on mobile platforms.
 * Most of the UI are unsuitable for use by a touch screen. It's all too small, too configurable and also wants to display too much at the same time.
 * Burns through way too much CPU for a battery-challenged platform.
 * It downloads enormous amounts of material, enormous amounts of material.

The feedback on the N900 port of our existing client was very positive, but I've also tried it first hand. My conclusion is that many people would love this kind of game on their phone, but our current client can't make it happen in a way that will appeal to a lot of players beyond those loving Linux phones with keyboards and a stylus.

###  Why build the new client on Qt?

 * Portable to all major platforms, apart from iPhone. This means the new client could also be used on the desktop.
 * Qt provides everything the client needs. It's a relatively big dependency, but it's a single one and it's widely available.
 * "Qt Quick" and a declarative language QML are very suitable for developing advanced eye-catching UIs.
 * Qt for Android port may not be official, but is quite functional. See http://www.youtube.com/watch?v=xtA_7kaB-0g
