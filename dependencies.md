---
title: dependencies
layout: wiki
---
{% include toc.md %}
#  Dependency list

###  Mana Client

Here is the list of libraries currently used by the Mana client:

 * **SDL** -  [http://www.libsdl.org/](http://www.libsdl.org/)
 * **SDL_mixer** -  [http://www.libsdl.org/tmp/SDL_mixer/](http://www.libsdl.org/tmp/SDL_mixer/)
 * **SDL_image** -  [http://www.libsdl.org/tmp/SDL_image/](http://www.libsdl.org/tmp/SDL_image/)
 * **SDL_net** - [http://www.libsdl.org/tmp/SDL_net/](http://www.libsdl.org/tmp/SDL_net/)
 * **SDL_ttf** -  [http://www.libsdl.org/tmp/SDL_ttf/](http://www.libsdl.org/tmp/SDL_ttf/)
 * **SDL_gfx** -  [http://www.ferzkopp.net/joomla/software-mainmenu-14/4-ferzkopps-linux-software/19-sdlgfx](http://www.ferzkopp.net/joomla/software-mainmenu-14/4-ferzkopps-linux-software/19-sdlgfx)
 * **Guichan 0.8.x** - [http://code.google.com/p/guichan/](http://code.google.com/p/guichan/)
 * **libxml2** - [http://www.xmlsoft.org/](http://www.xmlsoft.org/)
 * **physfs** - [http://icculus.org/physfs](http://icculus.org/physfs) (both 1.0.x or 2.x should work)
 * **zlib 1.2.x** - [http://www.gzip.org/zlib/](http://www.gzip.org/zlib/)
 * **libcurl** - [http://curl.haxx.se/libcurl/](http://curl.haxx.se/libcurl/)
 * **enet 1.3** - [http://enet.bespin.org/](http://enet.bespin.org/)
 * **gettext** - [http://www.gnu.org/software/gettext/](http://www.gnu.org/software/gettext/)

###  Mana Server

These are the libraries that are needed for compiling the Mana server:

 * **libsigc++ 2.0** - [http://libsigc.sourceforge.net/](http://libsigc.sourceforge.net/)
 * **libxml2** - [http://www.xmlsoft.org](http://www.xmlsoft.org)
 * **physfs 1.0.x / 2.0.x** - [http://icculus.org/physfs](http://icculus.org/physfs) (not the unstable 1.1.0 release!)
 * **zlib 1.2.x** - [http://www.gzip.org/zlib/](http://www.gzip.org/zlib/)
 * **enet 1.3** - [http://enet.bespin.org/](http://enet.bespin.org/)
 * **pThread** - Usually included in POSIX compatible operating systems. Windows users need to download it from [http://sourceware.org/pthreads-win32/](http://sourceware.org/pthreads-win32/)
 * **SQLite 3** - [http://www.sqlite.org/](http://www.sqlite.org/)
 * **Lua 5** - [http://www.lua.org](http://www.lua.org)

You'll need to install these dependencies when you want to compile Mana yourself. The most convenient way to install them varies per operating system, below you'll find instructions for a few popular choices.

#  Installation instructions

##  Debian, Ubuntu, Mint

To install all or most of the packages needed for compiling Mana, just paste the code given below into a terminal, type your root password and wait for it to finish!

`sudo apt-get install build-essential libcurl4-openssl-dev libguichan-dev libphysfs-dev libpng12-dev libpthread-stubs0-dev libsdl-image1.2-dev libsdl-mixer1.2-dev libsdl-net1.2-dev libsdl-ttf2.0-dev libxml2-dev zlib1g-dev libsdl-gfx1.2-dev`

##  Maemo 5 (N900)

Mana depends on some things that only exist in the `extras` and `extras-devel` repositories. Enable those repositories by adding these lines to `/etc/apt/sources.list`:


    deb http://repository.maemo.org/extras/ fremantle-1.3 free non-free
    deb http://repository.maemo.org/extras-devel/ fremantle-1.3 free non-free


Then install the additional dependencies:


    apt-get update
    fakeroot apt-get install cmake libphysfs-dev libsdl-image1.2-dev libsdl-mixer1.2-dev libsdl-net1.2-dev libsdl-ttf2.0-dev libsdl-gfx1.2-dev libguichan-dev


Finally, run `cmake`. Currently OpenGL is not supported and GCC 4.2.1 did not support C++0x, so turn those features off:


    cmake -DWITH_OPENGL=OFF -DENABLE_CPP0X=OFF .


###  Getting the client source directly from Git

If you checked out the source from the [Git repository](git_repository.html), you will need to install some additional packages to those mentioned above:
`sudo apt-get install cmake gettext git-core`

##  Installing the dependencies on Windows

When you just want to play the game you should just download the installer that includes all the dependencies as DLL files. But when you want to check out the latest developer version from the [Git repository](git_repository.html) or when you want to tinker with the source code you will need some libraries to compile it from source.

When you are using an IDE that uses MinGW as a compiler (like Code::Blocks, Dev-Cpp or Eclipse with CDT) you can find a zip file with all needed libraries on:
 * [http://forums.themanaworld.org/viewtopic.php?f=6&t=5356](http://forums.themanaworld.org/viewtopic.php?f=6&t=5356)
 * Or current direct link: [https://github.com/mana/mana-mingw-libs/archive/master.zip](https://github.com/mana/mana-mingw-libs/archive/master.zip)

Extract the individual files to a location where your IDE finds them.

When you want to use a different compiler (like Microsoft Visual Studio or Borland C++ Builder) you have to get the libraries from the home pages listed above in the library format for your compiler. When they aren't offered for download in binary form you have to compile the libraries yourself from the source code.

Then you should be able to [compile the Mana client.](compile_mana_from_source.html)
