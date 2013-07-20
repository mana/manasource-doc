---
title: persistent variables for lua script engine
layout: wiki
---
{% include toc.md %}
#  Persistent variables for LUA script engine

##  Current situation
Currently the LUA script engine has two ways to save variables. Internal LUA variables and quest variables. LUA variables are very fast but unfortunately not persistent. This means that they are lost when the server is restarted. Quest variables, on the other hand, are saved in the database, but they have several issues:
 * They are bound to a character. This means that there is no good way to share them
 * Getting them is an asynchronous operation (because a database query might be needed) which means that it can only be used from script functions which were called in multithreaded mode. This only applies to NPC dialogs, at the moment.
 * The name "Quest var" is misleading, because there is a lot more which can be done with them than just implementing quests. Also, the names for the getter and setter functions are inconsistent.

##  Proposal

My proposal is to create four different kinds of persistent variables:

<table class="table table-bordered table-hover" markdown="1">
    <thead>
        <tr>
            <th>Type</th>
            <th>Scope</th>
            <th>Gameserver caching</th>
            <th>Synchronisation</th>
            <th>synchronous access</th>
        </tr>
    </thead>
    <tbody>
        <tr>
            <td>char</td>
            <td>character</td>
            <td>partial</td>
            <td>immediately</td>
            <td>no</td>
        </tr>
        <tr>
            <td>acc</td>
            <td>account</td>
            <td>partial</td>
            <td>immediately</td>
            <td>no</td>
        </tr>
        <tr>
            <td>map</td>
            <td>current map</td>
            <td>completely</td>
            <td>occasionally</td>
            <td>yes</td>
        </tr>
        <tr>
            <td>global</td>
            <td>whole game world</td>
            <td>completely</td>
            <td>immediately</td>
            <td>yes</td>
        </tr>
    </tbody>
</table>

###  Char

I propose to rename quest variables to character variables because this name is more intuitive. The old script bindings should stay as an alias for backward compatibility.

The behavior stays the same:
 * The scope is each character
 * The variables are stored on the accountserver and queried from it when requested by the script engine for the first time
 * The game servers cache the recently requested character variables for each character which is currently active on it

Script bindings:
 * mana.getvar_char( handle character, string key)
 * mana.setvar_char( handle character, string key, string value)
 * \[DEPRECIATED\] mana.get_quest_var(handle character, string name)
 * \[DEPRECIATED\] mana.chr_set_quest(handle character, string name, string value)

###  Acc

Account-bound variables have proven to be very useful in eAthena for various purposes. So I would suggest that we implement this feature too. Their API from the scripting engines view should be identical to the one for char variables. This means that they are get and set through the character handle, but the gameserver and accountserver handle them by the account ID of the character internally.

The behavior stays the same:
 * The scope is all characters of the same account
 * The variables are stored on the accountserver and queried from it when requested by the script engine for the first time
 * The game servers cache the recently requested character variables for each character which is currently active on it

Script bindings:
 * mana.getvar_acc( handle character, string key)
 * mana.setvar_acc( handle character, string key, string value)

###  Map

The advantage of map-bound variables is that there is no need to propagate them between gameservers. This allows for a much more performant implementation. The advantage over character variables is that they can be stored and queried with synchronous calls (enabling to use them from synchronous script functions). The advantage over global variables are that the number of variables which need to be stored by each gameserver is reduced and that every map uses its own namespace. I believe that map-bound variables are sufficient for most purposes where it is necessary to share persistent data between characters.
 * The scope is the map the script runs on
 * The variables are stored on the accountserver, but the gameserver receives them all when registering a map
 * Updated values are sent to the accountserver periodically for backup purposes or completely when the gameserver shuts down.
 * Because the gameserver has all map variables for each of its maps in memory, getting and setting them is a very quick operation

Script bindings:
 * mana.getvar_map( string key)
 * mana.setvar_map( string key, string value)

###  Global

Map variables will cover a lot of cases where persistance of LUA values is needed. But for communication between different maps a global variable type is needed. I would also suggest to cache them completely by each gameserver.

 * The scope is the whole game world
 * The variables are stored on the accountserver, but the gameserver receives them all when connecting. Because a lot of applications can be covered by map- and character variables, I believe that the number of global variables will be small enough on most servers to make this behavior feasible.
 * When a script changes a variable, the gameserver immediately sends the new value to the accountserver which propagates it to the other gameservers.
 * Because the gameserver has all global variables for each of its maps in memory, getting and setting them is a very quick operation

Script bindings:
 * mana.getvar_global( string key)
 * mana.setvar_global( string key, string value)

##  Related Mantis tickets
 * [Global variables for LUA scripting](http://bugs.manasource.org/view.php?id=77)
 * [Add the possibility to add custom variables in Manaserv](http://bugs.manasource.org/view.php?id=173)

##  Discussion

