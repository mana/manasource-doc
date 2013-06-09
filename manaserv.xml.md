---
title: manaserv.xml
layout: wiki
---
{% include toc.md %}
#  manaserv.xml file configuration
Data from the `manaserv.xml` file or `.manaserv.xml` store central configuration values for the account and the game servers.
Each configuration option is defined using an &lt;option&gt; tag within the &lt;configuration&gt; main node, for instance:

{% highlight xml %}
 <?xml version="1.0"?>
 <configuration>
    <option name="net_accountServerAddress" value="localhost"/>
    <option name="net_accountServerPort" value="9601"/>
 </configuration>
{% endhighlight %}

**Important Note:** Each and every option names are **__case-sensitive__** in the server!! (This is linked to computation-saving and simplification purpose.)

##  Database backends configuration

###  SQLite

The SQLite database system uses only one parameter, defining where the database (.db) file is to be found. Note that the file automatically created if not found.

<table class="table table-bordered table-hover" markdown="1">
    <thead>
        <tr>
            <th>Option name</th>
            <th>Mandatory</th>
            <th>Default value</th>
            <th>Description</th>
        </tr>
    </thead>
    <tbody>
        <tr>
            <td>sqlite_database</td>
            <td>No</td>
            <td>./mana.db</td>
            <td>Database filename including absolute or relative path.</td>
        </tr>
    </tbody>
</table>

###  mySQL

<table class="table table-bordered table-hover" markdown="1">
    <thead>
        <tr>
            <th>Option name</th>
            <th>Mandatory</th>
            <th>Default value</th>
            <th>Description</th>
        </tr>
    </thead>
    <tbody>
        <tr>
            <td>mysql_hostname</td>
            <td>No</td>
            <td>localhost</td>
            <td>IP or Database Hostname</td>
        </tr>
        <tr>
            <td>mysql_port</td>
            <td>No</td>
            <td>3306</td>
            <td>MySQL server Port</td>
        </tr>
        <tr>
            <td>mysql_database</td>
            <td>No</td>
            <td>mana</td>
            <td>Database name</td>
        </tr>
        <tr>
            <td>mysql_username</td>
            <td>No</td>
            <td>mana</td>
            <td>Username used for the database credentials</td>
        </tr>
        <tr>
            <td>mysql_password</td>
            <td>No</td>
            <td>""</td>
            <td>Password used for the database credentials</td>
        </tr>
    </tbody>
</table>

###  PostgreSQL

FIXME: Add PostgreSQL.
##  Account server configuration


###  Data localisation
<table class="table table-bordered table-hover" markdown="1">
    <thead>
        <tr>
            <th>Option name</th>
            <th>Mandatory</th>
            <th>Default value</th>
            <th>Description</th>
        </tr>
    </thead>
    <tbody>
        <tr>
            <td>serverPath</td>
            <td>No</td>
            <td>"."</td>
            <td>The location of manaserv. Used mainly to find the Lua libraries provided by manaserv.</td>
        </tr>
        <tr>
            <td>worldDataPath</td>
            <td>No</td>
            <td>"example"</td>
            <td>The data folder used for world data.</td>
        </tr>
        <tr>
            <td>\&amp;lt;del\&amp;gt;clientDataPath\&amp;lt;/del\&amp;gt;</td>
            <td>No</td>
            <td>"example/clientdata"</td>
            <td>The data folder used for client data shared with the server. In many case, you'll still want to keep the server data as a whole and not share those with the client. You can set this value to "" in that case.</td>
        </tr>
        <tr>
            <td>\&amp;lt;del\&amp;gt;serverDataPath\&amp;lt;/del\&amp;gt;</td>
            <td>No</td>
            <td>"example/serverdata"</td>
            <td>The server data folder. Previously hard-coded to "data". <br /> Note: The server data and client data are merged to get the server running, using PhysFS. If the same file is provided by both folders, the server data will prevail.</td>
        </tr>
    </tbody>
</table>

###  Logs configuration
<table class="table table-bordered table-hover" markdown="1">
    <thead>
        <tr>
            <th>Option name</th>
            <th>Mandatory</th>
            <th>Default value</th>
            <th>Description</th>
        </tr>
    </thead>
    <tbody>
        <tr>
            <td>log_accountServerFile</td>
            <td>No</td>
            <td>"manaserv-account.log"</td>
            <td>file path to output the account server log, relative to the folders where the servers were ran.</td>
        </tr>
        <tr>
            <td>log_gameServerFile</td>
            <td>No</td>
            <td>"manaserv-game.log"</td>
            <td>file path to output the game server, relative to the folders where the servers were ran.</td>
        </tr>
        <tr>
            <td>log_statisticsFile</td>
            <td>No</td>
            <td>"manaserv.stats"</td>
            <td>file path to output the server's statistics, relative to the folders where the servers were ran.</td>
        </tr>
        <tr>
            <td>log_gameServerLogLevel</td>
            <td>No</td>
            <td>2 (Warning level)</td>
            <td>Set the the game server's log verbosity level.</td>
        </tr>
        <tr>
            <td>log_accountServerLogLevel</td>
            <td>No</td>
            <td>2 (Warning level)</td>
            <td>Set the the account server's log verbosity level.</td>
        </tr>
        <tr>
            <td>log_toStandardOutput</td>
            <td>No</td>
            <td>true</td>
            <td>Tells whether the servers will also log to standard output.</td>
        </tr>
        <tr>
            <td>log_enableRotation</td>
            <td>No</td>
            <td>false</td>
            <td>Enable the log rotation for both servers. The log will then change based on rotation parameters.</td>
        </tr>
        <tr>
            <td>log_maxFileSize</td>
            <td>No</td>
            <td>0</td>
            <td>Set in kilobytes the log files max size. If the rotation is enabled and the max file is \&amp;gt; 0 Kb, the log file will be renamed using the current date, before resuming the logging in the former filename.</td>
        </tr>
        <tr>
            <td>log_perDay</td>
            <td>No</td>
            <td>false</td>
            <td>Rotate the log file each day.</td>
        </tr>
    </tbody>
</table>

**Note:**  Available log verbosity values are:
   0. Fatal Errors only.
   1. All Errors.
   2. Plus warnings.
   3. Plus standard information.
   4. Plus debugging information.


###  Network configuration

<table class="table table-bordered table-hover" markdown="1">
    <thead>
        <tr>
            <th>Option name</th>
            <th>Mandatory</th>
            <th>Default value</th>
            <th>Description</th>
        </tr>
    </thead>
    <tbody>
        <tr>
            <td>net_accountHost <br /> \&amp;lt;del\&amp;gt;net_accountServerAddress\&amp;lt;/del\&amp;gt; <br /> \&amp;lt;del\&amp;gt;net_listenHost\&amp;lt;/del\&amp;gt;</td>
            <td>No</td>
            <td>"localhost"</td>
            <td>The IP or hostname the account server will listen to. Don't use the 'localhost' value when running a public server, but rather the public name or you won't be able to contact the game server when using MySQL for instance.</td>
        </tr>
        <tr>
            <td>net_accountListenToClientPort <br /> \&amp;lt;del\&amp;gt;net_accountServerPort\&amp;lt;/del\&amp;gt;</td>
            <td>No</td>
            <td>9601</td>
            <td>Port used by the account server.  <br /> 9601 if not set.</td>
        </tr>
        <tr>
            <td>net_accountListenToGamePort</td>
            <td>No</td>
            <td>9602</td>
            <td>Port used by the account server to listen to game servers. Equal to \&amp;lt;net_accountListenToClientPort\&amp;gt; + 1 if not set.</td>
        </tr>
        <tr>
            <td>net_chatListenToClientPort</td>
            <td>No</td>
            <td>9603</td>
            <td>Port used by the chat server to listen to clients. Equal to \&amp;lt;net_accountListenToClientPort\&amp;gt; + 2 if not set.</td>
        </tr>
        <tr>
            <td>net_chatHost</td>
            <td>No</td>
            <td>"localhost"</td>
            <td>IP Address or hostname used by the chat server (even if the account and chat servers are only one binary for now.)</td>
        </tr>
        <tr>
            <td>net_publicChatHost</td>
            <td>No</td>
            <td>Value of option net_chatHost</td>
            <td>The ip or domain for the chatserver that will be sent to the client. Use this when hosting behind a router for example</td>
        </tr>
        <tr>
            <td>net_gameHost <br /> \&amp;lt;del\&amp;gt;net_gameServerAddress\&amp;lt;/del\&amp;gt;</td>
            <td>No</td>
            <td>"localhost"</td>
            <td>IP Address or hostname used by the game server.</td>
        </tr>
        <tr>
            <td>net_gameListenToClientPort <br /> \&amp;lt;del\&amp;gt;net_gameServerPort\&amp;lt;/del\&amp;gt;</td>
            <td>No</td>
            <td>9604</td>
            <td>Port used by the game server to listen to clients. Equal to \&amp;lt;net_accountListenToClientPort\&amp;gt; + 3 if not set.</td>
        </tr>
        <tr>
            <td>net_publicGameHost</td>
            <td>No</td>
            <td>Value of option net_chatHost</td>
            <td>The ip or domain for the gameserver that will be sent to the client. Use this when hosting behind a router for example</td>
        </tr>
        <tr>
            <td>net_maxClients</td>
            <td>No</td>
            <td>1000</td>
            <td>Total simultaneous allowed client connections.</td>
        </tr>
        <tr>
            <td>\&amp;lt;del\&amp;gt;net_clientVersion\&amp;lt;/del\&amp;gt;</td>
            <td>No</td>
            <td>0</td>
            <td>Minimal client version now unused. Set by the **`PROTOCOL_VERSION`** value since it's more a core value.</td>
        </tr>
        <tr>
            <td>net_password</td>
            <td>No</td>
            <td>changeMe</td>
            <td>Password used between the account and the game server to authenticates queries (Very important in order not to get hacked easily.</td>
        </tr>
        <tr>
            <td>net_defaultUpdateHost <br /> \&amp;lt;del\&amp;gt;defaultUpdateHost\&amp;lt;/del\&amp;gt;</td>
            <td>No</td>
            <td>""</td>
            <td>The Update host hostname or IP address given to the client, used to download updates data.</td>
        </tr>
        <tr>
            <td>net_clientDataUrl</td>
            <td>No</td>
            <td>""</td>
            <td>The data URL used by the QML based Mana client, used to download data on-demand.</td>
        </tr>
    </tbody>
</table>


###  Account settings

<table class="table table-bordered table-hover" markdown="1">
    <thead>
        <tr>
            <th>Option name</th>
            <th>Mandatory</th>
            <th>Default value</th>
            <th>Description</th>
        </tr>
    </thead>
    <tbody>
        <tr>
            <td>account_allowRegister</td>
            <td>No</td>
            <td>1</td>
            <td>Tells if the registration can be done via a Manaserv client (1), or not (0).</td>
        </tr>
        <tr>
            <td>account_denyRegisterReason</td>
            <td>No</td>
            <td>""</td>
            <td>Message displayed if the registration is denied. (For instance, the URL to the web interface in which you can actually register.)</td>
        </tr>
        <tr>
            <td>account_minNameLength</td>
            <td>No</td>
            <td>4</td>
            <td>Account names minimal length.</td>
        </tr>
        <tr>
            <td>account_maxNameLength</td>
            <td>No</td>
            <td>16</td>
            <td>Account names maximal length.</td>
        </tr>
        <tr>
            <td>account_minPasswordLength</td>
            <td>No</td>
            <td>6</td>
            <td>Account password minimal length.</td>
        </tr>
        <tr>
            <td>account_maxPasswordLength</td>
            <td>No</td>
            <td>25</td>
            <td>Account password maximal length.</td>
        </tr>
        <tr>
            <td>account_minEmailLength</td>
            <td>No</td>
            <td>7</td>
            <td>Account email minimal length.</td>
        </tr>
        <tr>
            <td>account_maxEmailLength</td>
            <td>No</td>
            <td>128</td>
            <td>Account email maximal length.</td>
        </tr>
        <tr>
            <td>account_maxCharacters <br /> \&amp;lt;del\&amp;gt;char_maxCharacters\&amp;lt;/del\&amp;gt;</td>
            <td>No</td>
            <td>3</td>
            <td>Maximal number of characters per account.</td>
        </tr>
    </tbody>
</table>


###  Avatars settings

<table class="table table-bordered table-hover" markdown="1">
    <thead>
        <tr>
            <th>Option name</th>
            <th>Mandatory</th>
            <th>Default value</th>
            <th>Description</th>
        </tr>
    </thead>
    <tbody>
        <tr>
            <td>char_startMap</td>
            <td>Yes</td>
            <td>&nbsp;</td>
            <td>Map ID used by the account server See: [maps.xml](maps.xml.html)</td>
        </tr>
        <tr>
            <td>char_startX</td>
            <td>Yes</td>
            <td>&nbsp;</td>
            <td>X pixel start coordinate on the start map.</td>
        </tr>
        <tr>
            <td>char_startY</td>
            <td>Yes</td>
            <td>&nbsp;</td>
            <td>Y pixel start coordinate on the start map.</td>
        </tr>
        <tr>
            <td>char_numHairStyles</td>
            <td>No</td>
            <td>15</td>
            <td>Number of available Hairstyles.</td>
        </tr>
        <tr>
            <td>char_numHairColors</td>
            <td>No</td>
            <td>9</td>
            <td>Number of available Hair colors.</td>
        </tr>
        <tr>
            <td>char_numGenders</td>
            <td>No</td>
            <td>2</td>
            <td>Number of available gender types.</td>
        </tr>
        <tr>
            <td>char_minNameLength</td>
            <td>No</td>
            <td>4</td>
            <td>Characters' names minimal length.</td>
        </tr>
        <tr>
            <td>char_maxNameLength</td>
            <td>No</td>
            <td>25</td>
            <td>Characters' names maximal length.</td>
        </tr>
        <tr>
            <td>char_respawnMap <br /> \&amp;lt;del\&amp;gt;respawnMap\&amp;lt;/del\&amp;gt;</td>
            <td>Yes</td>
            <td>&nbsp;</td>
            <td>Map ID where the character will respawn if he/she dies. See: [ maps.xml](maps.xml.html)</td>
        </tr>
        <tr>
            <td>char_respawnX <br /> \&amp;lt;del\&amp;gt;respawnX\&amp;lt;/del\&amp;gt;</td>
            <td>Yes</td>
            <td>&nbsp;</td>
            <td>X coordinate of the spawn point on the respawn map.</td>
        </tr>
        <tr>
            <td>char_respawnY <br /> \&amp;lt;del\&amp;gt;respawnY\&amp;lt;/del\&amp;gt;</td>
            <td>Yes</td>
            <td>&nbsp;</td>
            <td>Y coordinate of the spawn point on the respawn map.</td>
        </tr>
        <tr>
            <td>\&amp;lt;del\&amp;gt;char_startingPoints\&amp;lt;/del\&amp;gt;</td>
            <td>\&amp;lt;del\&amp;gt;No\&amp;lt;/del\&amp;gt;</td>
            <td>\&amp;lt;del\&amp;gt;60\&amp;lt;/del\&amp;gt;</td>
            <td>Number of attribute points available at character creation. Now done through [attributes.xml](attributes.xml.html) configuration.</td>
        </tr>
    </tbody>
</table>


###  Gameplay Options

<table class="table table-bordered table-hover" markdown="1">
    <thead>
        <tr>
            <th>Option name</th>
            <th>Mandatory</th>
            <th>Default value</th>
            <th>Description</th>
        </tr>
    </thead>
    <tbody>
        <tr>
            <td>game_visualRange  <br /> \&amp;lt;del\&amp;gt;visualRange\&amp;lt;/del\&amp;gt;</td>
            <td>No</td>
            <td>448</td>
            <td>Range around the player in pixels for which the game server send state updates to the client. (Defines the client view range.)</td>
        </tr>
        <tr>
            <td>game_defaultPvp <br /> \&amp;lt;del\&amp;gt;defaultPvp\&amp;lt;/del\&amp;gt;</td>
            <td>No</td>
            <td>"none"</td>
            <td>Standard PVP((PVP: Player Versus Player. Defines if a player can deal damage to another one.)) mode on maps which have not set any corresponding properties. <br /> Available options are: <br /> **"none"**: No PVP. <br /> **"free"**: PVP fully enabled.</td>
        </tr>
        <tr>
            <td>game_maxSkillCap <br /> \&amp;lt;del\&amp;gt;maxSkillCap\&amp;lt;/del\&amp;gt;</td>
            <td>No</td>
            <td>&nbsp;</td>
            <td>Option indicating if a configurable hard cap based on the skill level is to be set.</td>
        </tr>
        <tr>
            <td>game_floorItemDecayTime <br /> \&amp;lt;del\&amp;gt;floorItemDecayTime\&amp;lt;/del\&amp;gt;</td>
            <td>No</td>
            <td>0</td>
            <td>Time in seconds until items laying on the floor disappear. Set to 0 to make items lay on the floor indefinitely (while this would be the "realistic" setting keep in mind that it will make your game world look like a garbage dump in the long run).</td>
        </tr>
        <tr>
            <td>game_hpRegenBreakAfterHit <br /> \&amp;lt;del\&amp;gt;hpRegenBreakAfterHit\&amp;lt;/del\&amp;gt;</td>
            <td>No</td>
            <td>0</td>
            <td>Sets the time in ticks((A tick is a server cycle, currently set to 100ms)) before the player HP regeneration starts again when fighting.</td>
        </tr>
    </tbody>
</table>


###  Chat Options

<table class="table table-bordered table-hover" markdown="1">
    <thead>
        <tr>
            <th>Option name</th>
            <th>Mandatory</th>
            <th>Default value</th>
            <th>Description</th>
        </tr>
    </thead>
    <tbody>
        <tr>
            <td>chat_maxChannelNameLength</td>
            <td>No</td>
            <td>15</td>
            <td>User-created chat Channel name maximum length.</td>
        </tr>
    </tbody>
</table>

###  Command Options

<table class="table table-bordered table-hover" markdown="1">
    <thead>
        <tr>
            <th>Option name</th>
            <th>Mandatory</th>
            <th>Default value</th>
            <th>Description</th>
        </tr>
    </thead>
    <tbody>
        <tr>
            <td>command_defaultMuteLength</td>
            <td>No</td>
            <td>60</td>
            <td>Default mute command length (in seconds).</td>
        </tr>
    </tbody>
</table>

###  Mail System Options

<table class="table table-bordered table-hover" markdown="1">
    <thead>
        <tr>
            <th>Option name</th>
            <th>Mandatory</th>
            <th>Default value</th>
            <th>Description</th>
        </tr>
    </thead>
    <tbody>
        <tr>
            <td>mail_maxAttachments</td>
            <td>No</td>
            <td>3</td>
            <td>Mails maximal number of attachments.</td>
        </tr>
        <tr>
            <td>mail_maxLetters</td>
            <td>No</td>
            <td>10</td>
            <td>Mails maximum number of digits (or characters).</td>
        </tr>
    </tbody>
</table>
