---
title: compile mana from source
layout: wiki
---
{% include toc.md %}
#  Mana client compilation

This page will try to help compiling the latest mana version corresponding to your platform and development tools used.

First of all, be sure to download all the [dependencies](dependencies.html) needed by the client and to install them where appropriate.

##  Linux

###  Getting the sources

In order to be able to download the client sources, you can either [download](http://www.manasource.org/downloads.html) the latest stable version,
of install [GIT](http://git-scm.com/).
If you opted for the latest git version of the client, you'll then be able to run this on the command-line:

  $((The '$' symbol represents the shell prompt)) git clone git://github.com/mana/mana.git

This command will create a `mana` folder in the current shell folder and will download the latest source in it.

###  Compiling

Move into the given directory and you're ready to compile:
  $ cd mana

To compile and install into your home directory, you can use these commands (We're using the cmake building system):
  $ cmake .
  $ make

From this point, if you encounter no errors, you should be able to run the client using:

  $ src/mana

If you want to install it, just do:
  $ make install


###  Updating the client source
To update the client source, go to the folder create by the git command (Here: mana)
  $ cd (path to source)

And run this to update the client sources:
  $ git pull

Don't forget to recompile:
  make

##  Windows

###  Preparing the sources
The windows compilation is made easy using the [Code::Blocks](http://www.codeblocks.org) C++ IDE((Integrated Development Editor)) (which is using MingW as a compiler). You should then download it and install it.

If you're lazy, don't forget that Windows nightlies are auto-compiled every night, hence the name, and can be easily installed in a few clicks. See also the download section about them.

If not, then, you'll need the sources obtained from the [download](http://www.manasource.org/downloads.html) section, and the [devpak](https://github.com/mana/mana-mingw-libs/archive/master.zip) given in the [dependencies](dependencies.html) page.

Decompress the sources files and the devpak files, and copy the `include` folder in the source directory's root folder.

###  Compiling

Run Code::Blocks and open the **`mana.cbp`** file.
Then, click on the `build` button and pray...

###  Run the client

If not errors happened, you'll then want to run the client.
In order to do that, there are two ways in doing so:
The DLL files in the dll folder of the devpak have to copied in your **`&lt;Windows drive letter&gt;:\Windows\System32`** folder
if you want to keep them and don't worry about missing dlls or in a specific directory present in your **`%PATH`** environment variable.

If you just want to make temporary tests with no dll potential pollution in your system. You can copy the **`mana.exe`** file from the source root folder to the devpak dll folder along with all the dll files.

Again, if you installed a nighly, or a previous version of the client, some dll may have been already installed on your system, and you may not have to handle some or all of them. If you're unsure, try running the client, and see about what missing dll it is complaining.

You'll then be able to double-click on the `mana.exe` file and ... Enjoy!

##  OS X

###  Preparing your environment

Download and install [macports](http://www.macports.org). You will need Xcode and it's command-line tools.

Download SDL, SDL_mixer, SDL_image, SDL_net and SDL_ttf frameworks (you can google these).
Copy the frameworks to /Library/Frameworks.

In your terminal:
  $((The '$' symbol represents the shell prompt)) sudo port selfupdate
  $ sudo port install cmake libxml2 libguichan libsdl_gfx physfs libpng freetype libiconv gettext

Go to your desired directory (using the 'cd' command).
  $ git clone https://github.com/mana/mana.git
  $ cd mana
  $ export CC=/usr/bin/clang

*Do not run this next line if you are on 10.6, Snow Leopard*
  $ export CXX=/usr/bin/clang++

###  Compiling

  $ cmake -DENABLE_CPP0X=OFF
  $ make

All you need to do now is,
  $ src/mana
to run the game. Have fun!
