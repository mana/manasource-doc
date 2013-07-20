---
title: physfs
layout: wiki
---
{% include toc.md %}
Mana (and the old TMW clients) uses [PhysFS](http://icculus.org/physfs/) to load data. Any archive format supported by it should be usable. Only zip has been tested as far as we know. The extension of the file doesn't matter (only tested with zip; Custom data archives need to have the zip extension), just needs to be one of the following formats:
 * .ZIP files (PkZip/Info-ZIP/WinZip compatible)
 * .7z files (7zip/lzma) (PhysFS 1.1 and above)
 * Build Engine's GRP
 * Quake 1 and Quake 2's PAK
 * Descent 1 and Descent 2's HOG
 * Descent 1 and Descent 2's MVL
 * Doom WAD files.

Full Unicode filename support was added in PhysFS 1.1.
