---
title: client installation
layout: wiki
---
{% include toc.md %}
#  Installation of Client
This page contains information about how to install the client on your system.

##  Windows
For latest release get the installer from [http://www.manasource.org/downloads.html](http://www.manasource.org/downloads.html) and install it.

For daily builds check out [http://nightlies.manasource.org/](http://nightlies.manasource.org/)

##  Ubuntu, Mint and other Ubuntu based distros
###  Using synaptic
 * Open Synaptic
 * Go to Settings -&gt; Repositories
 * Select the Other Software tab
 * Click Add and insert this line: `ppa:mana-developers/ppa`
 * Close the window and press the Reload button
 * Search and install the package (either mana or mana-daily)


###  Using a terminal
Add the PPA `[https://launchpad.net/~mana-developers/+archive/ppa|ppa:mana-developers/ppa](https://launchpad.net/~mana-developers/+archive/ppa|ppa:mana-developers/ppa)` to your system. You can do this by running this in your terminal:
`sudo apt-add-repository ppa:mana-developers/ppa`

Update your package database:
`sudo apt-get update`

Then install either the latest stable:
`sudo apt-get install mana`
Or nightlies that are always at latest development status:
`sudo apt-get install mana-daily`

##  Fedora, OpenSUSE
Follow [these](http://software.opensuse.org/download/package?project=games&package=mana) instructions.

##  Other systems
See [Compilation from Source](compile_mana_from_source.html)
