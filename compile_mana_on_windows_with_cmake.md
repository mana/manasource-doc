---
title: compile mana on windows with cmake
layout: wiki
---
{% include toc.md %}
#  Compiling Mana on Windows using CMake

 * Get the Mana sources either from git or download the latest release. We'll assume they are at `C:\mana`
 * Get the [mana_libs.zip](http://forums.themanaworld.org/viewtopic.php?f=6&t=5356) package
 * Extract `mana_libs.zip` somewhere (current version creates a `tmw_libs` directory). For this howto we'll assume `C:\tmw_libs`
 * Install [CMake](http://www.cmake.org/). Be sure to tell it to add itself to the system PATH during the installation (unless you know wat you're doing), either for current or all users.
 * Install [MinGW](http://www.mingw.org/). Take the latest [Automated MinGW Installer](http://sourceforge.net/projects/mingw/files/Automated%20MinGW%20Installer/mingw-get-inst/) and be sure to check C++ from the MinGW Compiler Suite. Install location is assumed to be `C:\MinGW`.\
 * Add the MinGW bin directory `C:\MinGW\bin` to your `PATH` (My Computer -&gt; Properties -&gt; Advanced -&gt; Environment Variables -&gt; Edit PATH -&gt; Append `;C:\MinGW\bin`, including the semicolon unless the variable didn't exist yet).

Now that was the whole installation procedure. Now let's start on the actual compiling.

 * Open a command prompt (Start -&gt; Run -&gt; `cmd`)
 * Verify that `cmake` and `g++` are available (otherwise something went wrong in the install procedure above, and it makes no sense to continue without fixing that)
 * Go to `C:\mana` (type `c:` and then `cd \mana`)
 * Generate Makefiles with CMake by doing:

  cmake -G "MinGW Makefiles" -DCMAKE_INCLUDE_PATH=C:\tmw_libs\include -DCMAKE_LIBRARY_PATH=C:\tmw_libs\lib -DSDL_INCLUDE_DIR=C:\tmw_libs\include\SDL -DSDLIMAGE_INCLUDE_DIR=C:\tmw_libs\include\SDL -DSDLMIXER_INCLUDE_DIR=C:\tmw_libs\include\SDL -DSDLNET_INCLUDE_DIR=C:\tmw_libs\include\SDL -DSDLTTF_INCLUDE_DIR=C:\tmw_libs\include\SDL -DMINGW_INCLUDE_DIR=C:\MinGW\include

(Yes, this command is insane, we should look into shortening that up a bit...)

 * Check that it went alright (it should say "`-- Build files have been written to: C:/mana`" at the end)
 * Start compiling by typing `mingw32-make`
