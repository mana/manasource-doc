---
title: chat commands/takepermission
layout: wiki
categorylink: chat_commands
category: Chat Commands
---
{% include toc.md %}
#  Synopsis
  @takepermission &lt;charactername&gt; &lt;permissiongroup&gt;
Removes a permission group from the account of a player. This command can be used to demote game masters, administrators or other privileged users. Note that permissions are handled on account level, not character level, although you have to specify a character name from the account when using this command. This means that all characters from the same account will lose the permission group. The character must be online for this command to work.

#  Examples
  @takepermission "Mr. Untrustworthy" gm
This command will remove the permission to use commands from the permission group "gm" from the account of the character "Mr. Untrustworthy"
  @takepermission # dev
This will remove the permission to use commands from the permission group "dev" from your own account.

Permission groups and the permissions they include can be customized in [permissions.xml](../permissions.xml.html). The example configuration defines the following permission groups:

<table class="table table-bordered table-hover" markdown="1">
    <thead>
        <tr>
            <th>Group</th>
            <th>Meaning</th>
        </tr>
    </thead>
    <tbody>
        <tr>
            <td>player</td>
            <td>The default group assigned to every new account. Includes some harmless information commands.</td>
        </tr>
        <tr>
            <td>tester</td>
            <td>Includes some convenience commands useful for beta-testing new content, namely [@die](die.html) and [@warp](warp.html)</td>
        </tr>
        <tr>
            <td>dev</td>
            <td>Suggested group for content developers and event masters. Includes various "cheat" commands like [@item](item.html) and @attribute, so be careful not to give this command to anyone who would use it to give themself or other people an unfair advantage.</td>
        </tr>
        <tr>
            <td>gm</td>
            <td>Game master group. Includes commands for punishing other users, like [@kick](kick.html) or [@ban](ban.html), but no commands which give the user a gameplay advantage (unless you count "being able to get rid of annoying people" as one).</td>
        </tr>
        <tr>
            <td>admin</td>
            <td>Server administrator. Includes commands which affect technical aspects of the server as well as permission handling commands. This permission group contains the most "dangerous" commands. It should only be assigned to the owner of the server and technical administrators who are 100% trustworthy and 100% know what they are doing. For maximum security, accounts with this permission group should never be used for playing or socializing and only be used to perform administrative tasks.</td>
        </tr>
    </tbody>
</table>

#  Security

**Critical**

This command allows the user to remove any permission from any person, including permissions the user hasn't got herself. This command should only be given to a trusted administrator account.

#  See also
 * [@help](help.html)
 * [@rights](rights.html)
 * [@givepermission](givepermission.html)
