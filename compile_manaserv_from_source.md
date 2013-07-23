---
title: compile manaserv from source
layout: wiki
---
{% include toc.md %}
#  Compilation of the Mana server

##  Linux
Here is how to set up a Mana server on a Linux/Unix system.

Be sure to get all the needed [dependencies](dependencies.html) and corresponding headers((Headers are files used by developers ending with .h. They're obtained by installing the corresponding &lt;package-name&gt;-dev or -devel package files.)) before trying to compile.

###  Cloning and compiling

Start with cloning the Mana server from the [Git repository](git_repository.html) and compile it. We're using the cmake build system:

  $ git clone git://github.com/mana/manaserv.git manaserv
  $ cd manaserv
  $ cmake .
  $ make

**N.B.:** By default, the Mana server is compiled with Sqlite support, when willing to set it up with MySQL support, you'll have to
replace the following command:
  $ cmake .
with:
  $ cmake -DWITH_MYSQL=1 .

**Note:** The PostGreSQL support is planned for later but cannot be compiled at the moment.

Once this step is successful, you'll have to configure the server, or use the Mana server data given in the `example/` folder
provided along with the source code.
#  Windows

##  What you need
 * Code::Blocks with MinGW: http://www.codeblocks.org/
 * The library pack for Windows: https://github.com/mana/mana-mingw-libs/archive/master/mana-mingw-libs-master.zip
 * Git for Windows: http://code.google.com/p/msysgit/

##  Compilation Instructions with Sqlite support
  - Install Code::Blocks and Msysgit
  - Download the library pack and unzip its contents into the MinGW directory of your Code::Blocks installation so that the so that everything is in the current directory.
  - Create a directory for your manaserv installation
  - Right-click on it and select "Git Bash"
  - enter the following command to download the sourcecode:   **git clone git://github.com/mana/manaserv.git manaserv**
  - open accountserver.cbp and gameserver.cbp with Code::Blocks and compile them by selecting Project-&gt;Build from the build menu.
  - When you get errors about "Undefined references to *something*" verify that you performed step 2 correctly. When you did join our [IRC Channel](irc.html) and complain that someone forgot to update the code::blocks project files again. Hey, it's work in progress!
  - Copy all the DLL files from the library pack into the same folder where accountserver.exe and gameserver.exe where created during compilation (when you want to set up multiple independent server installations you might prefer to put them into windows\system32 instead so that you don't have to do this for every instance)

The accountserver.exe should now start, but complain about a database problem.  Proceed to the "Configuration" section below to set up your database. After you created your database you can start the Mana server by starting both the account- and the gameserver.

##  Compilation with MySQL support

###  What you need in that case

 * All what is in 'What you need' above.
 * MySQL Community Server: http://dev.mysql.com/downloads/mysql/#downloads

###  Compilation Instructions

  - Install Code::Blocks with MinGW, Git for Windows and MySQL Community Server.
  - Download the library pack and unzip its contents into the MinGW directory of your Code::Blocks installation.
  - Create a directory for your manaserv installation.
  - Right-click the directory created and select `Git Bash Here`
  - Enter the following command to obtain the source files: git clone `git://github.com/mana/manaserv.git manaserv`
  - Navigate to the MySQL Community Server directory and copy the folders `include & lib` and paste them inside the `manaserv` folder created in step 5.
  - Open the `manaserv` directory, go into the `include` folder and copy the `mysql.h` file into the folder `mysql`.
  - Open the `accountserver.cbp` with Code::Blocks and in the `Build` menu, select the target `Windows (MySQL Support)`.
  - Select `Project &gt; Build Options...` Then click on `Windows (MySQL Support)`.
  - In the `Linker settings`, Under `Link libraries`, press `Add`, click `Browse...` and navigate to the `manaserv &gt; lib` folder and select `libmysql.lib`,   press `Open`, then `Yes`, `Ok` and `Ok`.
  - Press the Build Icon or Right click the Mana server Accountserver project and select `Build`.


##  Configuration

Once this is done, you may consider [configuring your new server](server_configuration.html).
