---
title: client release how-to
layout: wiki
---
{% include toc.md %}
#  How to release a new client version

**WIP: ** This page is currently under heavy work in progress. Use what's written below with caution.

This page will describe how-to bring a new mana (unbranded) client version Windows Installer, but also how to make a new TMW release (The branded mana version).
This page was made for developers, and for people willing to try to brand their own flavour of the mana client. We'll assume here that
you have knowledge with the Linux shell (or CLI) and are familiar with the Bash, Git, Cmake, and NSIS syntax.

Note that the Linux and Mac packaging aren't described yet.
See the porting page to get relevant information from each person responsible of the requested port. You can also try to make a new port and make contact with us
on IRC to make it officially supported!

##  Steps to to take in preparation of the release

###  Update the version and release data

The program version and release date are mentioned in several places. Some other places are also important to check before making a release.

    * `CMakeLists.txt` (version)
    * `INSTALL` (dependencies and their versions)
    * `NEWS` (version, release date and changes)
    * `README` (version and release date)
    * `data/help/changes.txt` (version, release date and changes)
    * `data/help/header.txt` (version and release date)
    * `src/main.h` (version)
    * `src/winver.h` (version)
    * `packaging/windows/setup.nsi` (version)


##  Windows Installer from a GNU/Linux environment
Here is how to set up a Mana Windows installer on a Linux/Unix system.

Be sure to get all the needed [dependencies](dependencies.html) and corresponding headers((Headers are files used by developers ending with .h. They're obtained by installing the corresponding &lt;package-name&gt;-dev or -devel package files.)) before trying to compile.

And, of course, the CMake compilation toolchain.

At last, we'll assume that you've made a `mana-install/` folder in your `$HOME` directory, that will be the root of every operation listed below.

###  Installer dependencies

You'll also need the following dependencies before being able to cross-compile the mana client for Windows from a GNU Environment:
(I'll give here the corresponding Debian packages needed at the time of writing this topic. Note that those packages may also have their own dependencies)

- MinGW((Minimal GNU for Windows)): binutils-mingw-w64 binutils-mingw-w64-i686 binutils-mingw-w64-x86-64 gcc-mingw-w64 mingw-w64

**Note:** On Debian, the old gcc-mingw32, mingw32, mingw32-binutils, mingw32-runtime package aren't supporting the C++0X paradigm used to compile the client, since the gcc version given is the 4.2.1 at the time of writing. So you will have to remove them first if already installed.

Yet, the package can still be named mingw32 on certain linux distribution, such as Fedora. It's up to you to find package with at least gcc-4.4 support.
See also http://gcc.gnu.org/projects/cxx0x.html for more information about the needed gcc version.


- NSIS((NullSoft Scriptable Installer System)): nsis (+ untgz plugin, see below).


###  Needed repositories

Start with cloning The Mana repository from the [Git repository](git_repository.html):

  $ git clone git://gitorious.org/mana/mana.git mana

If you want to rebrand the Mana client into a TMW one, you'll also need to clone the tmw-branding repository:

  $ git clone git://gitorious.org/tmw/tmw.git tmw-branding

###  Preparing the cross-compilation environment

####  Prepare the Windows headers and dlls

You can obtain the latest 32bits version of the needed headers and dlls at the following location:
(Link gladly provided by Crush)
http://www.crushnet.org/tmw/mana_libs.zip

Unzip the file to the following location:
  $HOME/mana-install/mana/mana_libs

####  Obtain the untgz plugin for NSIS

NSIS will need a special plugin to be able to untar/gzip the optional downloadable music package for TMW.
To get this plugin, you'll need to download it here:
  http://nsis.sourceforge.net/UnTGZ_plug-in

Once downloaded, you can copy the plugin file in your NSIS `Plugins/` folder, usually located in: `/usr/share/nsis/Plugins/`

You should now be done with the installer dependencies.

####  Prepare the toolchain

In the `mana/packging/windows` folder, you'll find the `toolchain.cmake.example` file. Copy it to the `mana/` folder, and remove the `.example` part from the filename.
Open it using a proper text editor (like gedit or alike) and edit this line according to your needs:
  SET(CMAKE_FIND_ROOT_PATH  /build/mingw64 /build/mana_libs )
The /build/mingw64 part must be changed to the path where cmake will be able to find mingw64 install root, which is available in most Linux distribution at the following location, once installed: `/usr/i686-w64-mingw32/`

The `build/mana_libs` part must be changed to the root directory containing the windows dlls and headers for the client dependencies. In our example, the correct location will be: `$HOME/mana-install/mana/mana_libs`

Hence, our example line should look alike something like this:
  SET(CMAKE_FIND_ROOT_PATH  /usr/i686-w64-mingw32/ /home/me/mana-install/mana/mana_libs )

Also, the toolchain part has be checked for your need:
  IF (NOT TOOLCHAIN)
      SET(TOOLCHAIN "i686-w64-mingw32-")
  ENDIF()

Check that the i686-w64-mingw32 part correspond to the mingw libs and includes you're using, and don't forget to let the '-' at the end of of the toochain name.


All that has been done above won't have to be done again and again. Only the part below will be needed for your next tries.

####  Load the helper commands

First of all, you'll have to set the source root repository in the `MANA_BASE` environment variable. This can be done by typing this in our example:
  set $MANA_BASE="`$HOME`/mana"

In the `mana/` folder, you can now type the following command to load the command helpers nicely provided by Aard:
  source packaging/windows/package-helpers

if everything went well, the following sentence should be output:
`Building for version x.y.z((x.y.z will depend on the current client version of course. See `src/winver.h`))`

You should now have access to the following new commands:
 * **mana-configure-win32**: Runs cmake to configure the source tree for a win32 build.
 * **mana-build-win32**: Runs mana-configure-win32, followed by make.
 * **mana-build-translations**: Copies the translations into a dir structure suitable for nsis.
 * **mana-build-nsis**: Builds the nsis installer. (It also runs the scripts above first!)
 * **mana-build-win32-installer**: Runs all steps required to get the windows installer.
 * **mana-nuke-cmake-stuff**: Cleans up all files created by cmake.

####  Build it!!

You can now type: `mana-build-win32-installer` or try it steps by steps to avoid missing any errors. When everything go fine, the new file: `mana-x.y.z-win32.exe` should be present in the `mana/packaging/windows` folder.

Congratulations!!

**Note:** Trying the installation process using wine is also possible. Please be aware that the installer mana 'and tmw) images are not rendered smoothly under wine, so better not worry too much about it.

##  Troubleshooting


**Q:** I've followed the instructions but I've got the following error when doing:
  $ mana-configure-win32
  -- Found mingw headers: /usr/i686-w64-mingw32/include
  CMake Error: The following variables are used in this project, but they are set to NOTFOUND.
  Please set them or make sure they are set and tested correctly in the CMake files:
  SDLIMAGE_INCLUDE_DIR (ADVANCED)
     used as include directory in directory /home/me/mana/src
  SDLMIXER_INCLUDE_DIR (ADVANCED)
     used as include directory in directory /home/me/mana/src
  SDLNET_INCLUDE_DIR (ADVANCED)
     used as include directory in directory /home/me/mana/src
  SDLTTF_INCLUDE_DIR
     used as include directory in directory /home/me/mana/src
  SDL_INCLUDE_DIR (ADVANCED)
     used as include directory in directory /home/me/mana/src

  -- Configuring incomplete, errors occurred!

**A:** You've got the SDL headers in a SDL/ sub-folder. Try copying all the .h files from include/SDL/ to include/
and try again.

**Q:** I've got the following error:

  Linking CXX executable mana.exe
  ../libs/enet/libenet.a: could not read symbols: Archive has no index; run ranlib to add one
  collect2: ld returned 1 exit status

**A:** You'll need to do as told. More precisely, run: `i686-w64-mingw32-ranlib libs/enet/libenet.a`
when you toolchain is 'i686-w64-mingw32-', of course.
And try again to compile.
