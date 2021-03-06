---
title: wallpaper
layout: wiki
---
{% include toc.md %}
#  Wallpapers handling

The background wallpapers are shown at client startup and are handled by the client in a specific way.

##  Default Paths and files

The different usable wallpaper paths will be searched in that order:
  - From the `wallpapersPath` in the [branding.xml](branding.xml.html) file if there is one and if some fitting files are found there,
  - From the `wallpapers` options isn't set in the [paths.xml](paths.xml.html) file if there is one and if some fitting files are found there,
  - In the `graphics/images/` otherwise.

The default wallpaper file will be searched in that order:
  - From the `wallpaperFile` in the [branding.xml](branding.xml.html) file if there is a fitting file found at the path+file location,
  - From the `wallpaperFile` options isn't set in the [paths.xml](paths.xml.html) file if there is a fitting file found at the path+file location,
  - As `graphics/images/login_wallpaper.png` otherwise.

##  Wallpapers options

###  Link a wallpaper to a minimum resolution

In order to get a nice wallpaper whatever the resolution the users will use, the wallpapers' filename endings
can use the given pattern:
  myWallpaper_&lt;Screen Width&gt;x&lt;Screen Height&gt;.png

E.g.: A wallpaper to be used **at the minimum** 800x600 screen resolution will end with `_800x600.png`.
This means that the given wallpaper file will be used at 800x600 and higher resolutions, but not when starting the client with a resolution of 640x480, for instance.

###  Display wallpapers randomly

More than this, if more than one wallpaper file fitting a given minimum resolution is found. One of them will be loaded randomly when starting the client.

E.g.: With the given files:
  myWallpaper1_800x600.png
  myWallpaper2_800x600.png
  myWallpaper1_1024x768.png
  myWallpaper1_1440x900.png

 * The client have only the default `login_wallpaper.png` file available for a resolution of 640x480,
 * 2 files ending with `_800x600.png` for the resolution of 800x600,
 * 3 files for the resolution of 1024x768, ...
