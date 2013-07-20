---
title: status-effects.xml
layout: wiki
---
{% include toc.md %}
#  status-effects.xml

The `status-effects.xml` file is used to define positive and negative status effects seen around the character.

Here is a description of the different parameters of this file:

#  Status-effects parameters

Here is a status-effects.xml file sample:

{% highlight xml %}
<?xml version="1.0" encoding="utf-8"?>
<status-effects>
    <status-effect name="item-healing" id="70" block-id="24"
		   persistent-particle-effect="true"
		   start-particle="graphics/particles/circle.particle.xml"
		 />

    <status-effect name="speed" id="37" block-id="21"
                   icon="icon-haste-potion.xml"
		   persistent-particle-effect="true"
		   start-particle="graphics/particles/pink-violent-glow.particle.xml"
		 />
    <status-effect name="strength" id="185" block-id="23"
                   icon="icon-iron-potion.xml"
		   persistent-particle-effect="true"
		   start-particle="graphics/particles/orange-violent-glow.particle.xml"
		 />
    <status-effect name="invisibility" id="4096" block-id="12"
                   icon="icon-invisible.xml"
                   start-message="You are now invisible."
                   end-message="You are no longer invisible."
		   persistent-particle-effect="true"
		   start-particle="graphics/particles/sphere-white.particle.xml"
		 />
</status-effects>
{% endhighlight %}

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
            <td>integer</td>
            <td>The status effect id used to store and call the effect internally. Must be unique.</td>
        </tr>
        <tr>
            <td>name</td>
            <td>string</td>
            <td>The status effect name.</td>
        </tr>
        <tr>
            <td>block-id</td>
            <td>integer</td>
            <td>FIXME: Review this one in case it's wrong and document it better for maintainers. <br /> Indicate the effect family. Used to tell at which offset to store the effect in the character's status-effect bitmask.</td>
        </tr>
        <tr>
            <td>icon</td>
            <td>string</td>
            <td>XML filename used set up a small icon animation of the status-effect.</td>
        </tr>
        <tr>
            <td>start-message</td>
            <td>string</td>
            <td>Sentence displayed in the chat window when the effect is starting.</td>
        </tr>
        <tr>
            <td>end-message</td>
            <td>string</td>
            <td>Sentence displayed in the chat window when the effect is ending.</td>
        </tr>
        <tr>
            <td>start-audio</td>
            <td>string</td>
            <td>SFX file played when the effect is starting.</td>
        </tr>
        <tr>
            <td>end-audio</td>
            <td>string</td>
            <td>SFX file played when the effect is ending.</td>
        </tr>
        <tr>
            <td>persistent-particle-effect</td>
            <td>boolean <br /> (true/false)</td>
            <td>Tells whether the effect is played once or looped.</td>
        </tr>
        <tr>
            <td>start-particle</td>
            <td>string</td>
            <td>XML filename used to set up the particle effect displayed around the character when the effect is activated (and looped if the persistent-particle-effect is set to true).</td>
        </tr>
        <tr>
            <td>end-particle</td>
            <td>string</td>
            <td>XML filename used to set up the particle effect displayed around the character when the effect is deactivated.</td>
        </tr>
    </tbody>
</table>
