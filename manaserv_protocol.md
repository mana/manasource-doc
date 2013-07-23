---
title: manaserv protocol
layout: wiki
---
{% include toc.md %}
# The Mana server protocol

When playing on a Mana server, the player will interact with different other entities, includinf his/her own character, use item, chat, fight monsters, use skills, ...

In order to deal with all players real-time requests in an efficient way, a Mana server message protocol has been defined to
give the client all the necessary information, in a minimalistic approach, to save bandwidth and server computation cycles.

The protocol has been defined in a way that if the client can compute a data, it will have to do it as the server will try to avoid unnecessary computation for the clients.

This page will then describe what kind of data, in which order, and in which case they are used.

##  Network layer
the Mana server is using Enet (http://enet.bespin.org) as its network layer. Enet is a cross-platform reliable UDP layer, and it's a good compromise between speed and reliability. Thus, to be able to get into communication with a Mana server, you'll have to be aware that Enet encapsulates the data in its own format, first.

##  Message types

Each data object has its own set of properties and things it can do in the
game. A number of messages in the protocol can be grouped on these types. We'll
go through each of them separately.

In the messages described the following data types are being used:

  S - String, char array (null terminated)
  B - Byte (1 byte)
  W - Word (2 bytes)
  D - Double word (4 bytes)

##  Messages naming convention

The message described in the protocol.h file are following a naming convention,
to ease their understanding:

 * Components: **B** Byte, **W** Word, **D** Double word, **S** Variable-size string, **C** Tile-based coordinates (B\*3)
 * Hosts:      **P** (Player's client), **A** (Account server), **C** (Char server), **G** (Game server)

Hence, here are how we prefix the messages:
 * **PA**MSG_\*: from client to account server
 * **AP**MSG_\*: from account server to client
 * **PC**MSG_\*: from client to chat server
 * **CP**MSG_\*: from chat server to client
 * **PG**MSG_\*: from client to game server
 * **GP**MSG_\*: from game server to client
 * **GA**MSG_\*: from game server to account server

and here is an example:
  GPMSG_BEINGS_MOVE  0x0280 { W being id, B flags \[, Wx2 position, B speed\] }

The `GPMSG_BEINGS_MOVE` message is starting with GPMSG, meaning that the message is going from the game server to the client.
The `0x0280` hexadecimal value is the actual message starting value sent to the receiver (here the client).
The wording between brackets is indicating what will be sent next to the message. Here a **W**ord, a **B** flag,
and potentially, hence the \[\] two Word data and a Bit one.

The network message will then be:
  &lt;0x0280&gt;&lt;W&gt;&lt;B&gt;&lt;W&gt;&lt;W&gt;&lt;B&gt;

##  Login-Register messages

<table class="table table-bordered table-hover" markdown="1">
    <thead>
        <tr>
            <th>Message name</th>
            <th>Hex value</th>
            <th>Values sent</th>
        </tr>
    </thead>
    <tbody>
        <tr>
            <td>**PAMSG_REGISTER**</td>
            <td>0x0000</td>
            <td>**D** protocol version, **S** username, **S** password, **S** email, **S** captcha response</td>
        </tr>
        <tr>
            <td>**APMSG_REGISTER_RESPONSE**</td>
            <td>0x0002</td>
            <td>**B** error, **S** updatehost, **S** client data url, **B** number of character slots <br /> __Error return values:__ <br /> **REGISTER_INVALID_VERSION** (0x40): The user is using too old protocol version. (Must be \&amp;gt;= to **`PROTOCOL_VERSION`**)  <br /> **REGISTER_EXISTS_USERNAME** (0x41): There is already a registered account with this username. <br /> **REGISTER_EXISTS_EMAIL** (0x42): There is already an account with this email address. <br /> **REGISTER_CAPTCHA_WRONG** (0x43): The user didn't solve the captcha correctly.</td>
        </tr>
        <tr>
            <td>**GAMSG_REGISTER**</td>
            <td>0x0500</td>
            <td>**S** address, **W** port, **S** password, **D** items db revision, { **W** map id }\*</td>
        </tr>
        <tr>
            <td>**AGMSG_REGISTER_RESPONSE**</td>
            <td>0x0501</td>
            <td>**C** item version, **C** password response <br /> __Item version return values:__ <br /> **DATA_VERSION_OK** (0x00): Item DB version is ok. <br /> **DATA_VERSION_OUTDATED** (0x01): Item DB version is outdated. <br /> __Password return values:__ <br /> **PASSWORD_OK** (0x00): Password accepted. <br /> **PASSWORD_BAD** (0x01): Invalid password. Registering failed.</td>
        </tr>
        <tr>
            <td>**PAMSG_UNREGISTER**</td>
            <td>0x0003</td>
            <td>**S** username, **S** password</td>
        </tr>
        <tr>
            <td>**APMSG_UNREGISTER_RESPONSE**</td>
            <td>0x0004</td>
            <td>**B** error</td>
        </tr>
        <tr>
            <td>**PAMSG_REQUEST_REGISTER_INFO**</td>
            <td>0x0005</td>
            <td>None</td>
        </tr>
        <tr>
            <td>**APMSG_REGISTER_INFO_RESPONSE**</td>
            <td>0x0006</td>
            <td>**B** registration Allowed, **B** min name Length, **B** max name length, **S** captcha URL, **S** captcha instructions</td>
        </tr>
        <tr>
            <td>**PAMSG_LOGIN**</td>
            <td>0x0010</td>
            <td>**D** protocol version, **S** username, **S** password</td>
        </tr>
        <tr>
            <td>**APMSG_LOGIN_RESPONSE**</td>
            <td>0x0012</td>
            <td>**B** error, **S** updatehost, **S** client data url, **B** number of character slots <br /> __Error return values:__ <br /> **LOGIN_INVALID_VERSION** (0x40): The user is using a too old protocol version. (Must be \&amp;gt;= to **`PROTOCOL_VERSION`**) <br /> **LOGIN_INVALID_TIME** (0x50): The user tried logging in too fast. <br /> **LOGIN_BANNED** (0x51) : The user is currently banned.</td>
        </tr>
        <tr>
            <td>**PAMSG_LOGOUT**</td>
            <td>0x0013</td>
            <td>None</td>
        </tr>
        <tr>
            <td>**APMSG_LOGOUT_RESPONSE**</td>
            <td>0x0014</td>
            <td>**B** error</td>
        </tr>
        <tr>
            <td>**PAMSG_CHAR_CREATE**</td>
            <td>0x0020</td>
            <td>**S** name, **B** hair style, **B** hair color, **B** gender, **B** character slot, {**W** statistics}N times (See [attributes.xml](attributes.xml.html)) <br /> __Gender values:__ <br /> **GENDER_MALE** (0): Male gender. <br /> **GENDER_FEMALE** (1): Female gender. <br /> **GENDER_UNSPECIFIED** (2): When not specified yet. Should not happen.</td>
        </tr>
        <tr>
            <td>**APMSG_CHAR_CREATE_RESPONSE**</td>
            <td>0x0021</td>
            <td>**B** error <br /> __Error return values:__ <br /> **CREATE_INVALID_HAIRSTYLE** (0x40): Invalid Hairstyle value. <br /> **CREATE_INVALID_HAIRCOLOR** (0x41): Invalid hair color value. <br /> **CREATE_INVALID_GENDER** (0x42): Invalid Gender value. <br /> **CREATE_ATTRIBUTES_TOO_HIGH** (0x43): Some attributes are too high. <br /> **CREATE_ATTRIBUTES_TOO_LOW** (0x44): Some attributes are too low. <br /> **CREATE_ATTRIBUTES_OUT_OF_RANGE** (0x45): Some attribute are out of the permitted range. <br /> **CREATE_EXISTS_NAME** (0x46): Character name already exists. <br /> **CREATE_TOO_MUCH_CHARACTERS** (0x47): The maximum of characters has already been created. Cannot create a new one. <br /> **CREATE_INVALID_SLOT** (0x48): In invalid or occupied slot was selected.</td>
        </tr>
        <tr>
            <td>**PAMSG_CHAR_DELETE**</td>
            <td>0x0022</td>
            <td>**B** character slot.</td>
        </tr>
        <tr>
            <td>**APMSG_CHAR_DELETE_RESPONSE**</td>
            <td>0x0023</td>
            <td>**B** error</td>
        </tr>
        <tr>
            <td>**APMSG_CHAR_INFO**</td>
            <td>0x0024</td>
            <td>**B** character slot, **S** name, **B** gender, **B** hair style, **B** hair color, **W** level, **W** character points, **W** correction points, **D** money, **W**x6 statistics <br /> __Gender values:__ <br /> **GENDER_MALE** (0): Male gender. <br /> **GENDER_FEMALE** (1): Female gender. <br /> **GENDER_UNSPECIFIED** (2): When not specified yet. Should not happen.</td>
        </tr>
        <tr>
            <td>**PAMSG_CHAR_SELECT**</td>
            <td>0x0026</td>
            <td>**B** index</td>
        </tr>
        <tr>
            <td>**APMSG_CHAR_SELECT_RESPONSE**</td>
            <td>0x0027</td>
            <td>**B** error, **B**x32 token, **S** game address, **W** game port, **S** chat address, **W** chat port</td>
        </tr>
        <tr>
            <td>**PAMSG_EMAIL_CHANGE**</td>
            <td>0x0030</td>
            <td>**S** email</td>
        </tr>
        <tr>
            <td>**APMSG_EMAIL_CHANGE_RESPONSE**</td>
            <td>0x0031</td>
            <td>**B** error <br /> __Error return values:__ <br /> **ERRMSG_OK** (0): Modification done. <br /> **ERRMSG_EMAIL_ALREADY_EXISTS**: New email already exists for another account. Cannot change.</td>
        </tr>
        <tr>
            <td>**PAMSG_PASSWORD_CHANGE**</td>
            <td>0x0034</td>
            <td>**S** old password, **S** new password</td>
        </tr>
        <tr>
            <td>**APMSG_PASSWORD_CHANGE_RESPONSE**</td>
            <td>0x0035</td>
            <td>**B** error</td>
        </tr>
        <tr>
            <td>**PGMSG_CONNECT**</td>
            <td>0x0050</td>
            <td>**B**x32 token</td>
        </tr>
        <tr>
            <td>**GPMSG_CONNECT_RESPONSE**</td>
            <td>0x0051</td>
            <td>**B** error</td>
        </tr>
        <tr>
            <td>**PCMSG_CONNECT**</td>
            <td>0x0053</td>
            <td>**B**x32 token</td>
        </tr>
        <tr>
            <td>**CPMSG_CONNECT_RESPONSE**</td>
            <td>0x0054</td>
            <td>**B** error</td>
        </tr>
        <tr>
            <td>**PGMSG_DISCONNECT**</td>
            <td>0x0060</td>
            <td>**B** reconnect account</td>
        </tr>
        <tr>
            <td>**GPMSG_DISCONNECT_RESPONSE**</td>
            <td>0x0061</td>
            <td>**B** error, **B**x32 token</td>
        </tr>
        <tr>
            <td>**PCMSG_DISCONNECT**</td>
            <td>0x0063</td>
            <td>None</td>
        </tr>
        <tr>
            <td>**CPMSG_DISCONNECT_RESPONSE**</td>
            <td>0x0064</td>
            <td>**B** error</td>
        </tr>
        <tr>
            <td>**PAMSG_RECONNECT**</td>
            <td>0x0065</td>
            <td>**B**x32 token</td>
        </tr>
        <tr>
            <td>**APMSG_RECONNECT_RESPONSE**</td>
            <td>0x0066</td>
            <td>**B** error</td>
        </tr>
    </tbody>
</table>

##  Player related messages
<table class="table table-bordered table-hover" markdown="1">
    <thead>
        <tr>
            <th>Message name</th>
            <th>Hex value</th>
            <th>Values sent</th>
        </tr>
    </thead>
    <tbody>
        <tr>
            <td>**GPMSG_PLAYER_MAP_CHANGE**</td>
            <td>0x0100</td>
            <td>**S** filename, **W** x, **W** y</td>
        </tr>
        <tr>
            <td>**GPMSG_PLAYER_SERVER_CHANGE**</td>
            <td>0x0101</td>
            <td>**B**x32 token, **S** game address, **W** game port</td>
        </tr>
        <tr>
            <td>**GPMSG_PLAYER_ATTRIBUTE_CHANGE**</td>
            <td>0x0130</td>
            <td>**W** attribute, **W** base value, **W** modified value }\*</td>
        </tr>
        <tr>
            <td>**GPMSG_PLAYER_EXP_CHANGE**</td>
            <td>0x0140</td>
            <td>{ **W** skill, **D** exp got, **D** exp needed }\*</td>
        </tr>
        <tr>
            <td>**GPMSG_LEVELUP**</td>
            <td>0x0150</td>
            <td>**W** new level, **W** character points, **W** correction points</td>
        </tr>
        <tr>
            <td>**GPMSG_LEVEL_PROGRESS**</td>
            <td>0x0151</td>
            <td>**B** percent completed to next level up</td>
        </tr>
        <tr>
            <td>**PGMSG_RAISE_ATTRIBUTE**</td>
            <td>0x0160</td>
            <td>**B** attribute</td>
        </tr>
        <tr>
            <td>**GPMSG_RAISE_ATTRIBUTE_RESPONSE**</td>
            <td>0x0161</td>
            <td>**B** error, **B** attribute <br /> __Error return values:__ <br /> **ATTRIBMOD_OK** (ERRMSG_OK \[0\]): Modification done without errors. <br /> **ATTRIBMOD_INVALID_ATTRIBUTE** (0x40): Invalid attribute ID. <br /> **ATTRIBMOD_NO_POINTS_LEFT** (0x41): No point left permitting modification. <br /> **ATTRIBMOD_DENIED** (0x42): Modification not permitted.</td>
        </tr>
        <tr>
            <td>**PGMSG_LOWER_ATTRIBUTE**</td>
            <td>0x0170</td>
            <td>**B** attribute</td>
        </tr>
        <tr>
            <td>**GPMSG_LOWER_ATTRIBUTE_RESPONSE**</td>
            <td>0x0171</td>
            <td>**B** error, **B** attribute <br /> **See __GPMSG_RAISE_ATTRIBUTE_RESPONSE__.**</td>
        </tr>
        <tr>
            <td>**PGMSG_RESPAWN**</td>
            <td>0x0180</td>
            <td>None</td>
        </tr>
        <tr>
            <td>**AGMSG_PLAYER_ENTER**</td>
            <td>0x0510</td>
            <td>**B**x32 token, **D** id, **S** name, serialised character data. FIXME: Explain what is contained into the character's serialized data.</td>
        </tr>
        <tr>
            <td>**GAMSG_PLAYER_DATA**</td>
            <td>0x0520</td>
            <td>**D** id, serialised character data</td>
        </tr>
        <tr>
            <td>**GAMSG_REDIRECT**</td>
            <td>0x0530</td>
            <td>**D** id</td>
        </tr>
        <tr>
            <td>**AGMSG_REDIRECT_RESPONSE**</td>
            <td>0x0531</td>
            <td>**D** id, **B**x32 token, **S** game address, **W** game port</td>
        </tr>
        <tr>
            <td>**GAMSG_PLAYER_RECONNECT**</td>
            <td>0x0532</td>
            <td>**D** id, **B**x32 token</td>
        </tr>
        <tr>
            <td>**GAMSG_PLAYER_SYNC**</td>
            <td>0x0533</td>
            <td>serialised sync data <br /> __Return values:__ <br /> **SYNC_CHARACTER_POINTS** (0x01), **D** Character ID, **D** Character Points, **D** Correction Points, **B** Attribute ID, **D** Attribute value. <br /> **SYNC_CHARACTER_SKILL** (0x02), **D** Character ID, **B** Skill ID, **D** Skill value. <br /> **SYNC_ONLINE_STATUS** (0x03), **D** Character ID, **B** {0x00 = offline, 0x01 = online}. <br /> **SYNC_END_OF_BUFFER** (0xFF) shows, that the buffer ends here.</td>
        </tr>
    </tbody>
</table>

##  Inventory related messages
<table class="table table-bordered table-hover" markdown="1">
    <thead>
        <tr>
            <th>Message name</th>
            <th>Hex value</th>
            <th>Values sent</th>
        </tr>
    </thead>
    <tbody>
        <tr>
            <td>**PGMSG_PICKUP**</td>
            <td>0x0110</td>
            <td>**W**x2 position</td>
        </tr>
        <tr>
            <td>**PGMSG_DROP**</td>
            <td>0x0111</td>
            <td>**W** slot, **W** amount</td>
        </tr>
        <tr>
            <td>**PGMSG_EQUIP**</td>
            <td>0x0112</td>
            <td>**W** inventory slot</td>
        </tr>
        <tr>
            <td>**PGMSG_UNEQUIP**</td>
            <td>0x0113</td>
            <td>**W** item Instance id</td>
        </tr>
        <tr>
            <td>**PGMSG_MOVE_ITEM**</td>
            <td>0x0114</td>
            <td>**W** slot1, **W** slot2, **W** amount</td>
        </tr>
        <tr>
            <td>**GPMSG_INVENTORY**</td>
            <td>0x0120</td>
            <td>{ **W** slot, **W** item id \[, **W** amount\] (if item id is not zero) }\*</td>
        </tr>
        <tr>
            <td>**GPMSG_INVENTORY_FULL**</td>
            <td>0x0121</td>
            <td>**W** inventory slot count { **W** slot, **W** itemId, **W** amount }, { **W** equip slot, **W** item Id, **W** item instance id}</td>
        </tr>
        <tr>
            <td>**GPMSG_EQUIP**</td>
            <td>0x0122</td>
            <td>**W** item Id, **W** equip slot type count, plus the two following possibilities: { **W** equip slot, **W** capacity used}\* \&amp;lt;- When equipping, or { **W** item instance, **W** 0}\* \&amp;lt;- When unequipping.</td>
        </tr>
    </tbody>
</table>

##  Items messages
<table class="table table-bordered table-hover" markdown="1">
    <thead>
        <tr>
            <th>Message name</th>
            <th>Hex value</th>
            <th>Values sent</th>
        </tr>
    </thead>
    <tbody>
        <tr>
            <td>**GPMSG_ITEMS**</td>
            <td>0x0281</td>
            <td>{ **W** item id, **W**x2 position }\*</td>
        </tr>
        <tr>
            <td>**GPMSG_ITEM_APPEAR**</td>
            <td>0x0202</td>
            <td>**W** item id, **W**x2 position</td>
        </tr>
        <tr>
            <td>**PGMSG_USE_ITEM**</td>
            <td>0x0300</td>
            <td>**B** slot</td>
        </tr>
        <tr>
            <td>**GPMSG_USE_RESPONSE**</td>
            <td>0x0301</td>
            <td>**B** error</td>
        </tr>
    </tbody>
</table>

##  Beings messages
<table class="table table-bordered table-hover" markdown="1">
    <thead>
        <tr>
            <th>Message name</th>
            <th>Hex value</th>
            <th>Values sent</th>
        </tr>
    </thead>
    <tbody>
        <tr>
            <td>**GPMSG_BEING_ENTER**</td>
            <td>0x0200</td>
            <td>**B** type, **W** being id, **B** action, **W**x2 position, **B** direction <br /> **Characters:** **S** name, **B** hair style, **B** hair color, **B** gender, **B** item bitmask, { **W** item id }\* <br /> **Monsters:** **W** type id  <br /> **Npcs:** **W** type id <br /> __Being type values:__ <br /> **OBJECT_ITEM** (0): A simple item. <br /> **OBJECT_ACTOR** (1): An item that toggle map/quest actions (doors, switchs, ...) and can speak (map panels). <br /> **OBJECT_NPC** (2): Non-Playable-Character is an actor capable of movement and maybe actions. <br /> **OBJECT_MONSTER** (3): A monster (moving actor with AI. Should be able to toggle map/quest actions, too). <br /> **OBJECT_CHARACTER** (4): A normal being. <br /> **OBJECT_EFFECT** (5): A effect to be shown. <br /> **OBJECT_OTHER** (6): Server-only object.</td>
        </tr>
        <tr>
            <td>**GPMSG_BEING_LEAVE**</td>
            <td>0x0201</td>
            <td>**W** being id</td>
        </tr>
        <tr>
            <td>**GPMSG_BEING_LOOKS_CHANGE**</td>
            <td>0x0210</td>
            <td>**W** weapon, **W** hat, **W** top clothes, **W** bottom clothes <br /> __Sprite layer values (used in clothes messages):__ <br /> **SPRITE_BASE** (0): the sprite representing the character. <br /> **SPRITE_SHOE** (1): The character feet sprite layer. <br /> **SPRITE_BOTTOMCLOTHES** (2): The bottom-clothes layer <br /> **SPRITE_TOPCLOTHES** (3): The top clothes layer. <br /> **SPRITE_HAIR** (4): The hair layer. <br /> **SPRITE_HAT** (5): The hat layer. <br /> **SPRITE_WEAPON** (6): The weapon layer.</td>
        </tr>
        <tr>
            <td>**PGMSG_WALK**</td>
            <td>0x0260</td>
            <td>**W**x2 destination</td>
        </tr>
        <tr>
            <td>**PGMSG_ACTION_CHANGE**</td>
            <td>0x0270</td>
            <td>**B** Action <br /> __Action type values:__ <br /> **STAND** (0): Simply stand. <br /> **WALK** (1): Simply walks. <br /> **ATTACK** (2): A normal attack action. <br /> **SIT** (3): Sit on the ground. <br /> **DEAD** (4): Is on the ground unconscious. <br /> **HURT** (5): Is being hurt.</td>
        </tr>
        <tr>
            <td>**GPMSG_BEING_ACTION_CHANGE**</td>
            <td>0x0271</td>
            <td>**W** being id, **B** action</td>
        </tr>
        <tr>
            <td>**PGMSG_DIRECTION_CHANGE**</td>
            <td>0x0272</td>
            <td>**B** Direction <br /> __Direction type values (Bitmask):__ <br /> **DOWN** (1): Looks down (bottom of screen). <br /> **LEFT** (2): Looks to the left. <br /> **UP** (4): Looks to the north. <br /> **RIGHT** (8): Looks to the right. <br /> (Opposite concatenated directions are obviously unaccepted.)</td>
        </tr>
        <tr>
            <td>**GPMSG_BEING_DIR_CHANGE**</td>
            <td>0x0273</td>
            <td>**W** being id, **B** direction</td>
        </tr>
        <tr>
            <td>**GPMSG_BEING_HEALTH_CHANGE**</td>
            <td>0x0274</td>
            <td>**W** being id, **W** health</td>
        </tr>
        <tr>
            <td>**GPMSG_BEINGS_MOVE**</td>
            <td>0x0280</td>
            <td>{ **W** being id, **B** flags \[, **W**x2 position, **B** speed\] }\* <br /> __Flag values:__ <br /> **MOVING_POSITION** (1): The next Wx2 values will contain the current being position. <br /> **MOVING_DESTINATION** (2): The next Wx2 values will contain the being destination.</td>
        </tr>
        <tr>
            <td>**GPMSG_BEINGS_DAMAGE**</td>
            <td>0x0310</td>
            <td>{ **W** being id, **W** amount }\*</td>
        </tr>
        <tr>
            <td>**PGMSG_ATTACK**</td>
            <td>0x0290</td>
            <td>**W** being id</td>
        </tr>
        <tr>
            <td>**GPMSG_BEING_ATTACK**</td>
            <td>0x0291</td>
            <td>**W** being id, **B** direction, **B** attack type <br /> __Attack type values:__ <br /> **HIT** (0x00): Simple physical hit. <br /> **CRITICAL** (0x0a): Critical hit. <br /> **MULTI** (0x08): A multi-hit attack. <br /> **REFLECT** (0x04): A counter-attack. <br /> **FLEE** (0x0b): A missed attack.</td>
        </tr>
        <tr>
            <td>**PGMSG_USE_SPECIAL**</td>
            <td>0x0292</td>
            <td>**B** special ID</td>
        </tr>
        <tr>
            <td>**GPMSG_SPECIAL_STATUS**</td>
            <td>0x0293</td>
            <td>{ **B** special ID, **D** current, **D** max, **D** recharge }</td>
        </tr>
    </tbody>
</table>

##  Effects spawning messages
<table class="table table-bordered table-hover" markdown="1">
    <thead>
        <tr>
            <th>Message name</th>
            <th>Hex value</th>
            <th>Values sent</th>
        </tr>
    </thead>
    <tbody>
        <tr>
            <td>**GPMSG_CREATE_EFFECT_POS**</td>
            <td>0x0320</td>
            <td>**W** effect id, **W**x2 position</td>
        </tr>
        <tr>
            <td>**GPMSG_CREATE_EFFECT_BEING**</td>
            <td>0x0321</td>
            <td>**W** effect id, **W** BeingID</td>
        </tr>
    </tbody>
</table>

##  Npc messages
<table class="table table-bordered table-hover" markdown="1">
    <thead>
        <tr>
            <th>Message name</th>
            <th>Hex value</th>
            <th>Values sent</th>
        </tr>
    </thead>
    <tbody>
        <tr>
            <td>**GPMSG_NPC_CHOICE**</td>
            <td>0x02B0</td>
            <td>**W** being id, { **S** text }\*</td>
        </tr>
        <tr>
            <td>**GPMSG_NPC_MESSAGE**</td>
            <td>0x02B1</td>
            <td>**W** being id, **B** \* text</td>
        </tr>
        <tr>
            <td>**PGMSG_NPC_TALK**</td>
            <td>0x02B2</td>
            <td>**W** being id</td>
        </tr>
        <tr>
            <td>**PGMSG_NPC_TALK_NEXT**</td>
            <td>0x02B3</td>
            <td>**W** being id</td>
        </tr>
        <tr>
            <td>**PGMSG_NPC_SELECT**</td>
            <td>0x02B4</td>
            <td>**W** being id, **B** choice</td>
        </tr>
        <tr>
            <td>**GPMSG_NPC_BUY**</td>
            <td>0x02B5</td>
            <td>**W** being id, { **W** item id, **W** amount, **W** cost }\*</td>
        </tr>
        <tr>
            <td>**GPMSG_NPC_SELL**</td>
            <td>0x02B6</td>
            <td>**W** being id, { **W** item id, **W** amount, **W** cost }\*</td>
        </tr>
        <tr>
            <td>**PGMSG_NPC_BUYSELL**</td>
            <td>0x02B7</td>
            <td>**W** item id, **W** amount</td>
        </tr>
        <tr>
            <td>**GPMSG_NPC_ERROR**</td>
            <td>0x02B8</td>
            <td>**B** error</td>
        </tr>
        <tr>
            <td>**GPMSG_NPC_CLOSE**</td>
            <td>0x02B9</td>
            <td>**W** being id</td>
        </tr>
        <tr>
            <td>**GPMSG_NPC_POST**</td>
            <td>0x02D0</td>
            <td>**W** being id</td>
        </tr>
        <tr>
            <td>**PGMSG_NPC_POST_SEND**</td>
            <td>0x02D1</td>
            <td>**W** being id, { **S** name, **S** text, **W** item id }</td>
        </tr>
        <tr>
            <td>**GPMSG_NPC_POST_GET**</td>
            <td>0x02D2</td>
            <td>**W** being id, { **S** name, **S** text, **W** item id }</td>
        </tr>
        <tr>
            <td>**PGMSG_NPC_NUMBER**</td>
            <td>0x02D3</td>
            <td>**W** being id, **D** number</td>
        </tr>
        <tr>
            <td>**PGMSG_NPC_STRING**</td>
            <td>0x02D4</td>
            <td>**W** being id, **S** string</td>
        </tr>
        <tr>
            <td>**GPMSG_NPC_NUMBER**</td>
            <td>0x02D5</td>
            <td>**W** being id, **D** max, **D** min, **D** default</td>
        </tr>
        <tr>
            <td>**GPMSG_NPC_STRING**</td>
            <td>0x02D6</td>
            <td>**W** being id</td>
        </tr>
    </tbody>
</table>

##  Chat messages

###  General chat messages
<table class="table table-bordered table-hover" markdown="1">
    <thead>
        <tr>
            <th>Message name</th>
            <th>Hex value</th>
            <th>Values sent</th>
        </tr>
    </thead>
    <tbody>
        <tr>
            <td>**PGMSG_SAY**</td>
            <td>0x02A0</td>
            <td>**S** text</td>
        </tr>
        <tr>
            <td>**GPMSG_SAY**</td>
            <td>0x02A1</td>
            <td>**W** being id, **S** text</td>
        </tr>
        <tr>
            <td>**CPMSG_ERROR**</td>
            <td>0x0401</td>
            <td>**B** error <br /> __Error return values:__ <br /> **CHAT_USING_BAD_WORDS** (0x40): Detected pre-configured slangs in the chat sentence. <br /> **CHAT_UNHANDLED_COMMAND** (0x41): Not handled command entered in chat prompt.</td>
        </tr>
        <tr>
            <td>**CPMSG_ANNOUNCEMENT**</td>
            <td>0x0402</td>
            <td>**S** text</td>
        </tr>
        <tr>
            <td>**CPMSG_PRIVMSG**</td>
            <td>0x0403</td>
            <td>**S** user, **S** text</td>
        </tr>
        <tr>
            <td>**CPMSG_PUBMSG**</td>
            <td>0x0404</td>
            <td>**W** channel, **S** user, **S** text</td>
        </tr>
        <tr>
            <td>**PCMSG_CHAT**</td>
            <td>0x0410</td>
            <td>**S** text, **W** channel</td>
        </tr>
        <tr>
            <td>**PCMSG_ANNOUNCE**</td>
            <td>0x0411</td>
            <td>**S** text</td>
        </tr>
        <tr>
            <td>**PCMSG_PRIVMSG**</td>
            <td>0x0412</td>
            <td>**S** user, **S** text</td>
        </tr>
        <tr>
            <td>**PCMSG_WHO**</td>
            <td>0x0415</td>
            <td>None</td>
        </tr>
        <tr>
            <td>**CPMSG_WHO_RESPONSE**</td>
            <td>0x0416</td>
            <td>{ **S** user }</td>
        </tr>
    </tbody>
</table>

###  Chat channeling messages
<table class="table table-bordered table-hover" markdown="1">
    <thead>
        <tr>
            <th>Message name</th>
            <th>Hex value</th>
            <th>Values sent</th>
        </tr>
    </thead>
    <tbody>
        <tr>
            <td>**CPMSG_CHANNEL_EVENT**</td>
            <td>0x0430</td>
            <td>**W** channel, **B** event, **S** info <br /> __Event values:__ <br /> **CHAT_EVENT_NEW_PLAYER** (0): A new player entered the channel. <br /> **CHAT_EVENT_LEAVING_PLAYER** (1): A player left the channel. <br /> **CHAT_EVENT_TOPIC_CHANGE** (2): Channel topic changed. <br /> **CHAT_EVENT_MODE_CHANGE** (3): Channel mode changed. <br /> **CHAT_EVENT_KICKED_PLAYER** (4): A player was kicked from the channel. <br /> FIXME: Document info values.</td>
        </tr>
        <tr>
            <td>**PCMSG_ENTER_CHANNEL**</td>
            <td>0x0440</td>
            <td>**S** channel, **S** password</td>
        </tr>
        <tr>
            <td>**CPMSG_ENTER_CHANNEL_RESPONSE**</td>
            <td>0x0441</td>
            <td>**B** error, **W** id, **S** name, **S** topic, **S** userlist</td>
        </tr>
        <tr>
            <td>**PCMSG_QUIT_CHANNEL**</td>
            <td>0x0443</td>
            <td>**W** channel id</td>
        </tr>
        <tr>
            <td>**CPMSG_QUIT_CHANNEL_RESPONSE**</td>
            <td>0x0444</td>
            <td>**B** error, **W** channel id</td>
        </tr>
        <tr>
            <td>**PCMSG_LIST_CHANNELS**</td>
            <td>0x0445</td>
            <td>None</td>
        </tr>
        <tr>
            <td>**CPMSG_LIST_CHANNELS_RESPONSE**</td>
            <td>0x0446</td>
            <td>**S** names, **W** number of users</td>
        </tr>
        <tr>
            <td>**PCMSG_LIST_CHANNELUSERS**</td>
            <td>0x0460</td>
            <td>**S** channel</td>
        </tr>
        <tr>
            <td>**CPMSG_LIST_CHANNELUSERS_RESPONSE**</td>
            <td>0x0461</td>
            <td>**S** channel, { **S** user, **B** mode }</td>
        </tr>
        <tr>
            <td>**PCMSG_TOPIC_CHANGE**</td>
            <td>0x0462</td>
            <td>**W** channel id, **S** topic</td>
        </tr>
    </tbody>
</table>

##  Trade protocol messages
<table class="table table-bordered table-hover" markdown="1">
    <thead>
        <tr>
            <th>Message name</th>
            <th>Hex value</th>
            <th>Values sent</th>
        </tr>
    </thead>
    <tbody>
        <tr>
            <td>**PGMSG_TRADE_REQUEST**</td>
            <td>0x02C0</td>
            <td>**W** being id</td>
        </tr>
        <tr>
            <td>**GPMSG_TRADE_REQUEST**</td>
            <td>0x02C1</td>
            <td>**W** being id</td>
        </tr>
        <tr>
            <td>**GPMSG_TRADE_START**</td>
            <td>0x02C2</td>
            <td>None</td>
        </tr>
        <tr>
            <td>**GPMSG_TRADE_COMPLETE**</td>
            <td>0x02C3</td>
            <td>None</td>
        </tr>
        <tr>
            <td>**PGMSG_TRADE_CANCEL**</td>
            <td>0x02C4</td>
            <td>None</td>
        </tr>
        <tr>
            <td>**GPMSG_TRADE_CANCEL**</td>
            <td>0x02C5</td>
            <td>None</td>
        </tr>
        <tr>
            <td>**PGMSG_TRADE_AGREED**</td>
            <td>0x02C6</td>
            <td>None</td>
        </tr>
        <tr>
            <td>**GPMSG_TRADE_AGREED**</td>
            <td>0x02C7</td>
            <td>None</td>
        </tr>
        <tr>
            <td>**PGMSG_TRADE_CONFIRM**</td>
            <td>0x02C8</td>
            <td>None</td>
        </tr>
        <tr>
            <td>**GPMSG_TRADE_CONFIRM**</td>
            <td>0x02C9</td>
            <td>None</td>
        </tr>
        <tr>
            <td>**PGMSG_TRADE_ADD_ITEM**</td>
            <td>0x02CA</td>
            <td>**B** slot, **B** amount</td>
        </tr>
        <tr>
            <td>**GPMSG_TRADE_ADD_ITEM**</td>
            <td>0x02CB</td>
            <td>**W** item id, **B** amount</td>
        </tr>
        <tr>
            <td>**PGMSG_TRADE_SET_MONEY**</td>
            <td>0x02CC</td>
            <td>**D** amount</td>
        </tr>
        <tr>
            <td>**GPMSG_TRADE_SET_MONEY**</td>
            <td>0x02CD</td>
            <td>**D** amount</td>
        </tr>
        <tr>
            <td>**GPMSG_TRADE_BOTH_CONFIRM**</td>
            <td>0x02CE</td>
            <td>None</td>
        </tr>
    </tbody>
</table>

##  Party messages
<table class="table table-bordered table-hover" markdown="1">
    <thead>
        <tr>
            <th>Message name</th>
            <th>Hex value</th>
            <th>Values sent</th>
        </tr>
    </thead>
    <tbody>
        <tr>
            <td>**PCMSG_PARTY_INVITE**</td>
            <td>0x03A0</td>
            <td>**S** name</td>
        </tr>
        <tr>
            <td>**CPMSG_PARTY_INVITE_RESPONSE**</td>
            <td>0x03A1</td>
            <td>**B** error, **S** name</td>
        </tr>
        <tr>
            <td>**CPMSG_PARTY_INVITED**</td>
            <td>0x03A2</td>
            <td>**S** name</td>
        </tr>
        <tr>
            <td>**PCMSG_PARTY_ACCEPT_INVITE**</td>
            <td>0x03A5</td>
            <td>**S** name</td>
        </tr>
        <tr>
            <td>**CPMSG_PARTY_ACCEPT_INVITE_RESPONSE**</td>
            <td>0x03A6</td>
            <td>**B** error, { **S** name }</td>
        </tr>
        <tr>
            <td>**PCMSG_PARTY_REJECT_INVITE**</td>
            <td>0x03A7</td>
            <td>**S** name</td>
        </tr>
        <tr>
            <td>**CPMSG_PARTY_REJECTED**</td>
            <td>0x03A8</td>
            <td>**S** name</td>
        </tr>
        <tr>
            <td>**PCMSG_PARTY_QUIT**</td>
            <td>0x03AA</td>
            <td>None</td>
        </tr>
        <tr>
            <td>**CPMSG_PARTY_QUIT_RESPONSE**</td>
            <td>0x03AB</td>
            <td>**B** error</td>
        </tr>
        <tr>
            <td>**CPMSG_PARTY_NEW_MEMBER**</td>
            <td>0x03B0</td>
            <td>**W** being id, **S** name</td>
        </tr>
        <tr>
            <td>**CPMSG_PARTY_MEMBER_LEFT**</td>
            <td>0x03B1</td>
            <td>**W** being id</td>
        </tr>
        <tr>
            <td>**CGMSG_CHANGED_PARTY**</td>
            <td>0x0590</td>
            <td>**D** character id, **D** party id</td>
        </tr>
    </tbody>
</table>

##  Guild messages
<table class="table table-bordered table-hover" markdown="1">
    <thead>
        <tr>
            <th>Message name</th>
            <th>Hex value</th>
            <th>Values sent</th>
        </tr>
    </thead>
    <tbody>
        <tr>
            <td>**PCMSG_GUILD_CREATE**</td>
            <td>0x0350</td>
            <td>**S** name</td>
        </tr>
        <tr>
            <td>**CPMSG_GUILD_CREATE_RESPONSE**</td>
            <td>0x0351</td>
            <td>**B** error, **W** guild, **B** rights, **W** channel</td>
        </tr>
        <tr>
            <td>**PCMSG_GUILD_INVITE**</td>
            <td>0x0352</td>
            <td>**W** id, **S** name</td>
        </tr>
        <tr>
            <td>**CPMSG_GUILD_INVITE_RESPONSE**</td>
            <td>0x0353</td>
            <td>**B** error</td>
        </tr>
        <tr>
            <td>**PCMSG_GUILD_ACCEPT**</td>
            <td>0x0354</td>
            <td>**W** id</td>
        </tr>
        <tr>
            <td>**CPMSG_GUILD_ACCEPT_RESPONSE**</td>
            <td>0x0355</td>
            <td>**B** error, **W** guild, **B** rights, **W** channel</td>
        </tr>
        <tr>
            <td>**PCMSG_GUILD_GET_MEMBERS**</td>
            <td>0x0356</td>
            <td>**W** id</td>
        </tr>
        <tr>
            <td>**CPMSG_GUILD_GET_MEMBERS_RESPONSE**</td>
            <td>0x0357</td>
            <td>**S** names, **B** online</td>
        </tr>
        <tr>
            <td>**CPMSG_GUILD_UPDATE_LIST**</td>
            <td>0x0358</td>
            <td>**W** id, **S** name, **B** event <br /> __Events values:__ <br /> **GUILD_EVENT_NEW_PLAYER** (0): A new player joinded the guild. <br /> **GUILD_EVENT_LEAVING_PLAYER** (1): A player left the guild. <br /> **GUILD_EVENT_ONLINE_PLAYER** (2): A guild member has joined the game. <br /> **GUILD_EVENT_OFFLINE_PLAYER** (3): A guild member left the game.</td>
        </tr>
        <tr>
            <td>**PCMSG_GUILD_QUIT**</td>
            <td>0x0360</td>
            <td>**W** id</td>
        </tr>
        <tr>
            <td>**CPMSG_GUILD_QUIT_RESPONSE**</td>
            <td>0x0361</td>
            <td>**B** error</td>
        </tr>
        <tr>
            <td>**PCMSG_GUILD_PROMOTE_MEMBER**</td>
            <td>0x0365</td>
            <td>**W** guild, **S** name, **B** rights</td>
        </tr>
        <tr>
            <td>**CPMSG_GUILD_PROMOTE_MEMBER_RESPONSE**</td>
            <td>0x0366</td>
            <td>**B** error</td>
        </tr>
        <tr>
            <td>**PCMSG_GUILD_KICK_MEMBER**</td>
            <td>0x0370</td>
            <td>**W** guild, **S** name</td>
        </tr>
        <tr>
            <td>**CPMSG_GUILD_KICK_MEMBER_RESPONSE**</td>
            <td>0x0371</td>
            <td>**B** error</td>
        </tr>
        <tr>
            <td>**CPMSG_GUILD_INVITED**</td>
            <td>0x0388</td>
            <td>**S** char name, **S** guild name, **W** id</td>
        </tr>
        <tr>
            <td>**CPMSG_GUILD_REJOIN**</td>
            <td>0x0389</td>
            <td>**S** name, **W** guild, **W** rights, **W** channel, **S** announce</td>
        </tr>
    </tbody>
</table>

##  User mode messages
<table class="table table-bordered table-hover" markdown="1">
    <thead>
        <tr>
            <th>Message name</th>
            <th>Hex value</th>
            <th>Values sent</th>
        </tr>
    </thead>
    <tbody>
        <tr>
            <td>**PCMSG_USER_MODE**</td>
            <td>0x0465</td>
            <td>**W** channel id, **S** name, **B** mode</td>
        </tr>
        <tr>
            <td>**PCMSG_KICK_USER**</td>
            <td>0x0466</td>
            <td>**W** channel id, **S** name</td>
        </tr>
        <tr>
            <td>**GAMSG_BAN_PLAYER**</td>
            <td>0x0550</td>
            <td>**D** id, **W** duration</td>
        </tr>
        <tr>
            <td>**GAMSG_CHANGE_PLAYER_LEVEL**</td>
            <td>0x0555</td>
            <td>**D** id, **W** level</td>
        </tr>
        <tr>
            <td>**GAMSG_CHANGE_ACCOUNT_LEVEL**</td>
            <td>0x0556</td>
            <td>**D** id, **W** level</td>
        </tr>
    </tbody>
</table>

##  Quests messages
<table class="table table-bordered table-hover" markdown="1">
    <thead>
        <tr>
            <th>Message name</th>
            <th>Hex value</th>
            <th>Values sent</th>
        </tr>
    </thead>
    <tbody>
        <tr>
            <td>**GAMSG_SET_QUEST**</td>
            <td>0x0540</td>
            <td>**D** id, **S** name, **S** value</td>
        </tr>
        <tr>
            <td>**GAMSG_GET_QUEST**</td>
            <td>0x0541</td>
            <td>**D** id, **S** name</td>
        </tr>
        <tr>
            <td>**AGMSG_GET_QUEST_RESPONSE**</td>
            <td>0x0542</td>
            <td>**D** id, **S** name, **S** value</td>
        </tr>
    </tbody>
</table>

##  Postal system messages
<table class="table table-bordered table-hover" markdown="1">
    <thead>
        <tr>
            <th>Message name</th>
            <th>Hex value</th>
            <th>Values sent</th>
        </tr>
    </thead>
    <tbody>
        <tr>
            <td>**GCMSG_REQUEST_POST**</td>
            <td>0x05A0</td>
            <td>**D** character id</td>
        </tr>
        <tr>
            <td>**CGMSG_POST_RESPONSE**</td>
            <td>0x05A1</td>
            <td>**D** receiver id, { **S** sender name, **S** letter, **W** num attachments { **W** attachment item id, **W** quantity } }</td>
        </tr>
        <tr>
            <td>**GCMSG_STORE_POST**</td>
            <td>0x05A5</td>
            <td>**D** sender id, **S** receiver name, **S** letter, { **W** attachment item id, **W** quantity }</td>
        </tr>
        <tr>
            <td>**CGMSG_STORE_POST_RESPONSE**</td>
            <td>0x05A6</td>
            <td>**D** id, **B** error</td>
        </tr>
    </tbody>
</table>

##  Inter-server messages
<table class="table table-bordered table-hover" markdown="1">
    <thead>
        <tr>
            <th>Message name</th>
            <th>Hex value</th>
            <th>Values sent</th>
        </tr>
    </thead>
    <tbody>
        <tr>
            <td>**AGMSG_ACTIVE_MAP**</td>
            <td>0x0502</td>
            <td>**W** map id</td>
        </tr>
        <tr>
            <td>**GAMSG_STATISTICS**</td>
            <td>0x0560</td>
            <td>{ **W** map id, **W** thing nb, **W** monster nb, **W** player nb, { **D** character id }\* }\*</td>
        </tr>
        <tr>
            <td>**GAMSG_TRANSACTION**</td>
            <td>0x0600</td>
            <td>**D** character id, **D** action, **S** message</td>
        </tr>
    </tbody>
</table>

##  Maximum message value limit (Do not use)
<table class="table table-bordered table-hover" markdown="1">
    <thead>
        <tr>
            <th>Message name</th>
            <th>Hex value</th>
            <th>Values sent</th>
        </tr>
    </thead>
    <tbody>
        <tr>
            <td>**XXMSG_INVALID**</td>
            <td>0x7FFF</td>
            <td>None</td>
        </tr>
    </tbody>
</table>

##  Other values

###  The protocol version

In order to only accept connections from sufficiently up-to-date clients, the server is requesting
a minimal protocol version which must be at least equal to the **`PROTOCOL_VERSION`** value.

###  Generic return values

Here are values returned to sender corresponding to generic events (found in many places.)

<table class="table table-bordered table-hover" markdown="1">
    <thead>
        <tr>
            <th>Return value</th>
            <th>Description</th>
        </tr>
    </thead>
    <tbody>
        <tr>
            <td>**ERRMSG_OK** (0)</td>
            <td>Everything is fine.</td>
        </tr>
        <tr>
            <td>**ERRMSG_FAILURE** (1)</td>
            <td>The action failed.</td>
        </tr>
        <tr>
            <td>**ERRMSG_NO_LOGIN** (2)</td>
            <td>The user is not yet logged.</td>
        </tr>
        <tr>
            <td>**ERRMSG_NO_CHARACTER_SELECTED** (3)</td>
            <td>The user needs a character first.</td>
        </tr>
        <tr>
            <td>**ERRMSG_INSUFFICIENT_RIGHTS** (4)</td>
            <td>The user is not privileged enough to do so.</td>
        </tr>
        <tr>
            <td>**ERRMSG_INVALID_ARGUMENT** (5)</td>
            <td>Part of the received message was invalid.</td>
        </tr>
        <tr>
            <td>**ERRMSG_EMAIL_ALREADY_EXISTS** (6)</td>
            <td>The Email Address already exists.</td>
        </tr>
        <tr>
            <td>**ERRMSG_ALREADY_TAKEN** (7)</td>
            <td>Character or account name used was already taken.</td>
        </tr>
        <tr>
            <td>**ERRMSG_SERVER_FULL** (8)</td>
            <td>The server is overloaded.</td>
        </tr>
        <tr>
            <td>**ERRMSG_TIME_OUT** (9)</td>
            <td>Data failed to arrive in due time.</td>
        </tr>
        <tr>
            <td>**ERRMSG_LIMIT_REACHED** (10)</td>
            <td>Server limit reached.</td>
        </tr>
        <tr>
            <td>**ERRMSG_ADMINISTRATIVE_LOGOFF** (11)</td>
            <td>The connection with the client was closed on purpose. (E.g.: The client was kicked or banned.)</td>
        </tr>
    </tbody>
</table>
