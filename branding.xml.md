---
title: branding.xml
layout: wiki
---
{% include toc.md %}
#  branding.mana

The `branding.mana` file is to be given to the mana client binary on the command line, and is used to customize it in many ways, explained below:

E.g:
  $./mana my_branding_file.mana

#  Branding parameters

Here is a branding.mana file sample:

{% highlight xml %}
<?xml version="1.0" encoding="utf-8"?>
<configuration>
 <option name="appName" value="Manasource"/>
 <option name="appShort" value="Mana"/>
 <option name="appIcon" value="icons/mana"/>
 <option name="loginMusic" value="login.ogg"/>
 <option name="onlineServerList" value="http://manasource.org/serverlist.xml"/>
 <option name="defaultServer" value="server.themanaworld.org"/>
 <option name="defaultPort" value="9601"/>
 <option name="defaultServerType" value="manaserv"/>
 <option name="defaultUpdateHost" value="http://update.themanaworld.org"/>
 <option name="font" value="fonts/dejavusans.ttf" />
 <option name="boldFont" value="fonts/dejavusans-bold.ttf" />
 <option name="theme" value="wood" />
 <option name="guiThemePath" value="graphics/gui/" />
 <option name="wallpapersPath" value="graphics/images/" />
 <option name="wallpaperFile" value="login_wallpaper.png" />
</configuration>
{% endhighlight %}

<table class="table table-bordered table-hover" markdown="1">
    <thead>
        <tr>
            <th>Parameter</th>
            <th>Default value</th>
            <th>Description</th>
        </tr>
    </thead>
    <tbody>
        <tr>
            <td>appName</td>
            <td>Manasource</td>
            <td>Application full name</td>
        </tr>
        <tr>
            <td>appShort</td>
            <td>Mana</td>
            <td>Application short name</td>
        </tr>
        <tr>
            <td>appIcon</td>
            <td>-</td>
            <td>Client icon file to load at startup. Note that the filename given has no extension. This is because the file loaded depends on the OS: <br /> For instance, with the `icons/mana` value, the `icons/mana.png` file will be loaded on Linux/Unices/BSD systems, and the `icons/mana.ico` will be loaded on Windows systems. <br /> **Windows:** The .ico file must be 64x64 pixels wide. <br /> **Mac:** Currently, mac .icns files can only be loaded through the configuration of the `Info.plist` file present in the source root directory of the client.</td>
        </tr>
        <tr>
            <td>loginMusic</td>
            <td>-</td>
            <td>Music played at client startup</td>
        </tr>
        <tr>
            <td>onlineServerList</td>
            <td>http://manasource.org/serverlist.xml</td>
            <td>The [serverlist.xml](serverlist.xml.html) file downloaded by the client at startup to get the server list.</td>
        </tr>
        <tr>
            <td>defaultServer</td>
            <td>server.themanaworld.org</td>
            <td>Default server name or IP, when not specified in [serverlist.xml](serverlist.xml.html).</td>
        </tr>
        <tr>
            <td>defaultPort</td>
            <td>9601</td>
            <td>Default server port to connect to, when not specified in [serverlist.xml](serverlist.xml.html).</td>
        </tr>
        <tr>
            <td>defaultServerType</td>
            <td>tmwathena</td>
            <td>Default protocol type used by servers, when not specified in [serverlist.xml](serverlist.xml.html).</td>
        </tr>
        <tr>
            <td>defaultUpdateHost</td>
            <td>http://updates.themanaworld.org</td>
            <td>Update hostname or IP where the client should download update data files before entering the selected world.</td>
        </tr>
        <tr>
            <td>font</td>
            <td>fonts/dejavusans.ttf</td>
            <td>Default client font (TTF format).</td>
        </tr>
        <tr>
            <td>boldFont</td>
            <td>fonts/dejavusans-bold.ttf</td>
            <td>Default bold font.</td>
        </tr>
        <tr>
            <td>theme</td>
            <td>normal</td>
            <td>Default theme subfolder used to load the client window skin and font colors. See the [GUI configuration](gui_configuration.html) page for more information.</td>
        </tr>
        <tr>
            <td>guiThemePath</td>
            <td>graphics/gui/</td>
            <td>Default theme folder. See the [GUI configuration](gui_configuration.html) page for more information.</td>
        </tr>
        <tr>
            <td>wallpapersPath</td>
            <td>graphics/images/</td>
            <td>Default wallpaper path. See the [wallpapers page](wallpaper.html) for more information.</td>
        </tr>
        <tr>
            <td>wallpaperFile</td>
            <td>login_wallpaper.png</td>
            <td>Default wallpaper file. See the [wallpapers page](wallpaper.html) for more information.</td>
        </tr>
    </tbody>
</table>

**N.B.:** The branding parameters are overriden by other options given on the command line. For instance:
  $./mana --port 8741 branding.mana
This application call will set the default port to 8741, and not the value given in the branding.mana file.
