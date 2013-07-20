---
title: client events
layout: wiki
---
{% include toc.md %}
The client uses an event system to pass information as needed. Events are triggered on specific channels and have names and optional parameters (integers, double precision floating point, and strings). Events in the client are detailed in this article. Events are organized by channel.


#  Attributes

##  UpdateAttribute
Fired when an attribute of the local player changes.

 * int id: numeric ID of the attribute (emun defined in playerinfo.h)
 * int oldValue: old value of the attribute
 * int newValue: new value of the attribute

##  UpdateStat
Fired when a statistic of the local player changes.

 * int id: numeric ID of the statistic
 * int base: base value of the statistic
 * int mod: modifier value of the statistic
 * int exp: experience for the statistic
 * int expNeeded: experience needed to level the statistic
 * string changed: the value that changed; can be "base", "mod", or "exp" (both experience values changed)
 * int oldValue1: the old value (old exp for "exp" change)
 * int oldValue2: old expNeeded for "exp" change, 0 otherwise


#  Buy/Sell

##  StateChange
Fired when the player enters or leaves a buy, sell, or related interaction.

 * int oldState: previous buy/sell state (enum defined in playerinfo.h)
 * int newState: previous buy/sell state (enum defined in playerinfo.h)


#  Chat

##  Announcement
Fired when a global or other announcement is made. (Also from GMs)

 * string message: the line of text that is to be shown.

##  Being
Fired when a chat message is heard thats not from the local player.

 * int beingId: the id of the being that is sending the message (not always available)
 * string nick: the name of the sender (not always available)
 * string message: the line of text that is to be shown (starts with being name, if provided)
 * int permissions: precomputed permissions for this message (enum defined in playerrelations.h)
 * string text: the extracted content of the message (no being name)

##  Player
Fired when a chat message is heard from the local player.

 * int beingId: the id of the being that is sending the message
 * string nick: the name of the sender
 * string message: the line of text that is to be shown (starts with being name)
 * int permissions: precomputed permissions for this message (enum defined in playerrelations.h)
 * string text: the extracted content of the message (no being name)

##  Whisper
Fired when a whisper is received.

 * string nick: the name of the sender
 * string message: the message they sent

##  WhisperError
Triggered when there was a problem sending a whisper.

 * string nick: the nick the whisper was intended for
 * string error: error message to show to the user

#  Client

##  StateChange
Fired when the client changes state.

 * int oldState: the previous state (enum defined in client.h)
 * int newState: the new state (enum defined in client.h)


#  Item

##  doDrop
Used to request an inventory item be dropped.

 * item item: the item to be dropped
 * int amount: the amount of the item to be dropped

##  doEquip
Used to request an inventory item be equipped.

 * item item: the item to be equipped

##  doMove
Used to request an inventory item be moved.

 * item item: the item to be moved
 * int newIndex: the index where the item should be put

##  doMove
Used to request an inventory item be moved between inventories.

 * item item: the item to be moved
 * int source: the source inventory (enum in inventory.h, may be extended with custom inventories in the future)
 * int destination: the destination inventory (enum in inventory.h, may be extended with custom inventories in the future)
 * int amount: the amount of the item to be moved

##  doSplit
Used to request an inventory item be split. Location where the new pile will be put is up to the handler.

 * item item: the item to be split
 * int amount: the amount of the item to be split

##  doUnequip
Used to request an equpped item be unequipped.

 * item item: the item to be unequipped

##  doUse
Used to request an inventory item be used.

 * item item: the item to be used


#  Game

##  Constructed
Fired at the end of Game::Game.

##  Destructed
Fired at the end of Game::~Game.

##  EnginesInitalized
Fired after the game engines have been created and prepared.

##  EnginesInitalizing
Fired just before the game engines will be created and prepared.

##  GuiWindowsLoaded
Called after the standard GUI windows are loaded and prepared.

##  GuiWindowsLoading
Called just before the standard GUI windows are loaded and prepared.

##  GuiWindowsUnloaded
Called after the standard GUI windows are unloaded.

##  GuiWindowsUnloading
Called just before the standard GUI windows are unloaded.

##  MapLoaded
Fired when the map has finished loading and the old map is unloaded.

 * string mapPath: the path to the new map


#  Notices

##  ServerNotice
Fired when there is a notice from the server.

 * string message: (translated) message


#  NPC

##  doClose
Used to respond to Close in an NPC interaction.

 * int npcId: Being ID of the NPC

##  doIntegerInput
Used to respond to IntegerInput in an NPC interaction.

 * int npcId: Being ID of the NPC
 * int value: The integer the player entered

##  doMenu
Used to respond to Menu an NPC interaction.

 * int npcId: Being ID of the NPC
 * int choice: The index of the menu item the player chose

##  doNext
Used to respond to Next in an NPC interaction.

 * int npcId: Being ID of the NPC

##  doSendLetter
Used to send a player-written letter in an NPC interaction.

 * string recipient: the letter's recipient
 * string text: the letter's content

##  doStringInput
Used to respond to StringInput in an NPC interaction.

 * int npcId: Being ID of the NPC
 * string value: The string the player entered

##  doTalk
Used to start an NPC interaction.

 * int npcId: Being ID of the NPC

##  Close
Fired when the server sends an NPC close (just waits for player response, ends interaction).

 * int id: Being ID of the NPC

##  CloseAll
Fired when all open NPC dialogs should be closed.

##  End
Fired when the server sends an NPC end (immediate window close, no response).

 * int id: Being ID of the NPC

##  IntegerInput
Fired when the server sends an NPC integer request to the player.

 * int id: Being ID of the NPC
 * int min: lowest number the player can choose
 * int max: highest number the player can choose
 * int default: default number

##  Menu
Fired when the server sends an NPC menu to show the player.

 * int id: Being ID of the NPC
 * int choiceCount: number of menu choices
 * string choice1: first menu choice
 * string choice2: second menu choice
 * string choice3: third menu choice
 * ...

##  NPCCount
Fired when the number of open NPC interaction windows changes.

 * int oldCount: previous number of NPC interaction windows
 * int newCount: current number of NPC interaction windows

##  Next
Fired when the server sends an NPC next (just waits for player response).

 * int id: Being ID of the NPC

##  Post
Fired when the server sends an NPC post request (letter writing interface).

 * int id: Being ID of the NPC

##  PostCount
Fired when the number of open NPC interaction windows changes.

 * int oldCount: previous number of NPC post windows
 * int newCount: current number of NPC post windows

##  StringInput
Fired when the server sends an NPC string request to the player.

 * int id: Being ID of the NPC
 * string default: default string (optional)


#  Status

##  Trading
Fired when the trading state of the local player changes.

 * bool trading: true when involved in trading or a trade request, false otherwise


#  Storage

##  StorageCount
Fired when the number of open storage windows changes.

 * int oldCount: previous number of storage windows
 * int newCount: current number of storage windows
