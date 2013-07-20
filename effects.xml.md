---
title: effects.xml
layout: wiki
---
{% include toc.md %}
#  effects.xml

The `effects.xml` file is used to define status and magic particle effects seen around the character.

Here is a description of the different parameters of this file:

#  Effects parameters

Here is a effects.xml file sample:

{% highlight xml %}
<?xml version="1.0" encoding="utf-8"?>
<effects>
  <effect id="0" audio="sfx/system/levelup.ogg" particle="graphics/particles/levelup.particle.xml" />
  <effect id="1" audio="sfx/system/levelup.ogg" particle="graphics/particles/skillup.particle.xml" />
  <effect id="2" particle="graphics/particles/magic.generic.xml"/>
  <effect id="3" particle="graphics/particles/magic.white.xml"/> <!-- life -->
  <effect id="4" particle="graphics/particles/magic.black.xml"/> <!-- war -->
  <effect id="5" particle="graphics/particles/magic.red.xml"/> <!-- transmute -->
  <effect id="6" particle="graphics/particles/magic.green.xml"/> <!-- nature -->
  <effect id="7" particle="graphics/particles/magic.blue.xml"/> <!-- astral -->
</effects>
{% endhighlight %}

**Note:** The client version &lt; 0.6 are using the &lt;being-effects&gt; root node instead of the &lt;effects&gt; one. 0.6 clients are supporting the &lt;being-effects&gt; for backward compatibility.

<table class="table table-bordered table-hover" markdown="1">
    <thead>
        <tr>
            <th>Parameter</th>
            <th>Value type</th>
            <th>Description</th>
        </tr>
    </thead>
    <tbody>
        <tr>
            <td>id</td>
            <td>Integer</td>
            <td>Effect ID used by the client for internally store the effect.</td>
        </tr>
        <tr>
            <td>audio</td>
            <td>string</td>
            <td>audio filename to be played when triggering the effect.</td>
        </tr>
        <tr>
            <td>particle</td>
            <td>string</td>
            <td>[Particle](particle_system.html) definition filename used to define how to play the particle effect when triggering it.</td>
        </tr>
    </tbody>
</table>
