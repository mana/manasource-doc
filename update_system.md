---
title: update system
layout: wiki
---
{% include toc.md %}
Mana supports a full world data automatic update system. This makes it easy to update a game world without players having to manually download the updates. Updates to World data are checked for after login/account registration. The update system can be blocked on the command-line with -u/--skip-update.

#  Resources files

At the core of the update system is the resource file. Two forms are currently supported, resources.xml and resources2.txt. The former has more options and flexibility. The latter one is simpler and required for backwards compatibility with older TMW clients. The resource file needs to be placed in the root of the update directory. For example, with an update server of http:*updates.manasource.org/ , the resources file should be at this address: http:*updates.manasource.org/resources.xml .

The resources file lists the update archives that the client needs to have (as well as optional ones the user can opt for to get optional functionality, like music). Only one of the two formats is needed for Mana clients. Both can be provided. If both are provided, resources.xml takes precedence.

{% highlight xml %}
  <updates>
   <update type="data" file="sounds-3795.zip" hash="890b723c"/>
   <update type="data" file="database-db36251.zip" hash="d912d42f"/>
   <update type="data" file="sfx-db36251.zip" hash="a19498e2"/>
   <update type="data" file="sprites-db36251.zip" hash="70bf3914"/>
   <update type="data" file="update-0df921c..db36251.zip" hash="e117f3c7"/>
   <update type="data" file="maps-db36251.zip" hash="e228efb4"/>
   <update type="music" required="no" file="music-af9f8a2a.zip" hash="21dbb805" description="Music data v01"/>
  </updates>
{% endhighlight %}

Update parameters:
 * *type* - Describes what kind of data is in the archive. Only the "music" value is used by 1.0.
 * *file* - The name of the file to be downloaded (if needed) and loaded.
 * *hash* - The Alder32 hash of the file. Optional?
 * *required* - Whether the file is required or not. Defaults to required.
 * *description* - A description of what the archive contains.


    update-56e38b1..35e1613.zip 4ae0388b
    update-35e1613..1949f03.zip 7ff55981
    update-1949f03..3fe8481.zip 1540ae54
    update-3fe8481..eed9407.zip 4c5ade27


In this simpler file, you just have the filename and Adler32 hash (required).

The files listed are loaded in order. Later files take precedence over earlier ones.

#  Archive details

The internal folder structure of the archives needs to match other [client data](client_data_handling.html). There should be no extra root folders. Example:
 * a.zip
    * items.xml
    * graphics/sprites/test.png
    * graphics/sprites/text.xml
    * monsters.xml

The name of the archive is up to you. The file extension doesn't even matter (see [PhysFS](physfs.html) for format details). You should then use the Adler32 tool from the [tools](tools.html) section to generate the file hash.

Just add an entry for the archive in the resources file(s) and you're done. Clients will grab the update when they next login to your server.
