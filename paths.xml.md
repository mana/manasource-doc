---
title: paths.xml
layout: wiki
---
{% include toc.md %}
#  paths.xml

The `paths.xml` file is used by the client to override default data paths and some default filenames not already handled by the [branding](branding.xml.html) file.

Here is a description of the currently available options:

#  Paths parameters

Here is a paths.xml file sample:

{% highlight xml %}
<?xml version="1.0"? encoding="utf-8">
<configuration>
    <option name="itemIcons" value="graphics/items/" />
    <option name="unknownItemFile" value="unknown-item.png" />
    <option name="sprites" value="graphics/sprites/" />
    <option name="spriteErrorFile" value="error.xml" />

    <option name="particles" value="graphics/particles/" />
    <option name="levelUpEffectFile" value="levelup.particle.xml" />
    <option name="portalEffectFile" value="warparea.particle.xml" />
    <option name="hitEffectId" value="26" />
    <option name="criticalHitEffectId" value="28" />

    <option name="minimaps" value="graphics/minimaps/" />
    <option name="maps" value="maps/" />

    <option name="sfx" value="sfx/" />
    <option name="attackSfxFile" value="fist-swish.ogg" />
    <option name="music" value="music/" />

    <option name="wallpapers" value="graphics/images/" />
    <option name="wallpaperFile" value="login_wallpaper.png" />
</configuration>
{% endhighlight %}

**Note:** The parameter names ending with 'File' are obviously for setting filenames. Other parameters are setting up paths.
Also, note that folder parameters are ending with a '/'.

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
            <td>itemIcons</td>
            <td>graphics/items/</td>
            <td>Item icon path folder name.</td>
        </tr>
        <tr>
            <td>unknownItemFile</td>
            <td>unknown-item.png</td>
            <td>Item image used for unknown items.</td>
        </tr>
        <tr>
            <td>sprites</td>
            <td>graphics/sprites/</td>
            <td>Sprite files path.</td>
        </tr>
        <tr>
            <td>spriteErrorFile</td>
            <td>error.xml</td>
            <td>XML file used when a sprite file isn't found.</td>
        </tr>
        <tr>
            <td>particles</td>
            <td>graphics/particles/</td>
            <td>Particles files path.</td>
        </tr>
        <tr>
            <td>levelUpEffectFile</td>
            <td>levelup.particle.xml</td>
            <td>XML file used for the level-up particle effect.</td>
        </tr>
        <tr>
            <td>portalEffectFile</td>
            <td>warparea.particle.xml</td>
            <td>XML file used to show warp area particle effects.</td>
        </tr>
        <tr>
            <td>hitEffectid</td>
            <td>26</td>
            <td>Default effect id to trigger when doing a successful hit with a weapon. This is an integer value, but it must refer to an effect having itself an actual path. See [effects.xml](effects.xml.html).</td>
        </tr>
        <tr>
            <td>criticalHitEffectId</td>
            <td>28</td>
            <td>Default effect id to trigger when doing a successful critical hit with a weapon. This is an integer value, but it must refer to an effect having itself an actual path. See [effects.xml](effects.xml.html).</td>
        </tr>
        <tr>
            <td>minimaps</td>
            <td>graphics/minimaps/</td>
            <td>Minimap files path.</td>
        </tr>
        <tr>
            <td>maps</td>
            <td>maps/</td>
            <td>Map files path.</td>
        </tr>
        <tr>
            <td>sfx</td>
            <td>sfx/</td>
            <td>sfx files path.</td>
        </tr>
        <tr>
            <td>attackSfxFile</td>
            <td>fist-swish.ogg</td>
            <td>Default attack filename.</td>
        </tr>
        <tr>
            <td>music</td>
            <td>music/</td>
            <td>Music files path.</td>
        </tr>
        <tr>
            <td>wallpapers</td>
            <td>graphics/images/</td>
            <td>Wallpaper files path.</td>
        </tr>
        <tr>
            <td>wallpaperFile</td>
            <td>login_wallpaper.png</td>
            <td>Default wallpaper filename.</td>
        </tr>
    </tbody>
</table>

