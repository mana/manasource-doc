---
title: chat commands/givepermission
layout: wiki
categorylink: chat_commands
category: Chat Commands
---
{% include toc.md %}
#  Synopsis
  @givepermission &lt;charactername&gt; &lt;permissiongroup&gt;
Adds a permission group to the account of a player. This command can be used to appoint game masters, administrators or other privileged users. Note that permissions are handled on account level, not character level, although you have to specify a character name from the account when using this command. This means that all characters from the same account will gain the permission group. The character must be online for this command to work.

#  Examples
  @givepermission "Mr. Trustworthy" gm
This command will give the account of the character "Mr. Trustworthy" the permission to use commands from the permission group "gm".
  @givepermission # dev
This will give your own account the permission to use commands from the permission group "dev".

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
            <td>Server administrator. Includes commands which affect technical aspects of the server as well as permission handling commands (including the @givepermission command described here). This permission group contains the most "dangerous" commands. It should only be assigned to the owner of the server and technical administrators who are 100% trustworthy and 100% know what they are doing. For maximum security, accounts with this permission group should never be used for playing or socializing and only be used to perform administrative tasks.</td>
        </tr>
#  Alternative method to set permissions
    </tbody>
</table>
When you create a new server with the default configuration, you won't have any account with the necessary permission group to use @givepermission and thus no way to use it to give yourself any permissions. To solve this chicken/egg problem you have to promote an existing account manually by running an SQL query on the database. The tool to do this depends on the used database backend. When your account name is "admin", the following SQL query will give all permission groups to your account.
  UPDATE tmw_accounts SET level=255 WHERE username="admin";

#  Security

**Critical**

This command allows the user to give any permission to any person, including permissions the user hasn't got herself. This command should only be given to a trusted administrator account. For maximum security don't assign this command to anyone and use the database method explained above to manage permissions.

#  See also
 * [@help](help.html)
 * [@rights](rights.html)
 * [@takepermission](takepermission.html)
