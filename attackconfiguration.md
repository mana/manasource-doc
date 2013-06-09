---
title: attackconfiguration
layout: wiki
---
{% include toc.md %}
**Note:** The attack system will be rewritten to a more action fighting system. This page contains information about the current system. So do not expect this to stay the same for very long.

#  Basics
In Manaserv each being can have a series of attacks. For a character these attacks most likely will come from the items it has equipped. For monsters the attacks are defined in the [monsters.xml](monsters.xml.html).

If a being wants to attack a target it picks the best suitable attack and uses it. To determinate the best attack the being goes through the list of the available attacks and checks if the attack has a sufficient range to hit the target. Then it will pick the attack with the highest priority and uses that. The used attack first goes through a warmup. After the warmup is finished the damage will be dealt. After this the cooldown starts. During warmup start until cooldown end no other attack can be used meanwhile. After the attack a reuse timer starts. However this timer only affects the attack that was used but not any other attack (This can be used to allow fast attack with dual wield weapons for e.g.)

#  XML Attack Node
All configuration files ([items.xml](items.xml.html) and [monsters.xml](monsters.xml.html)) parse `&lt;attack&gt;` nodes the same way. Here you will find what properties you can set and what their effect is.

**Example:**
{% highlight xml %}
        <!-- Stab Spear -->
        <attack id="1"
            priority="2"
            type="physical"
            warmuptime="10"
            cooldowntime="10"
            reusetime="10"
            basedamage="100"
            deltadamage="1"
            chancetohit="1000"
            element="neutral"
            range="32"
            animation="attack"
            skill="102"
            />
        <!-- Throw Spear -->
        <attack id="2"
            priority="1"
            type="physical"
            warmuptime="0"
            cooldowntime="100"
            reusetime="100"
            basedamage="10"
            deltadamage="1"
            chancetohit="1000"
            element="neutral"
            range="256"
            animation="attackspear"
            skill="103"
            />

{% endhighlight %}

This two example nodes define two attacks. For the example these attacks are part of a spear attack. The spear can be either used for a short range stab attack or a long range throw attack.

Here is a documentation about the possible parameters for the attack node:
<table class="table table-bordered table-hover" markdown="1">
    <thead>
        <tr>
            <th>Parameter Name</th>
            <th>Type</th>
            <th>Mandatory</th>
            <th>Default value</th>
            <th>Client</th>
            <th>Server</th>
            <th>Description</th>
        </tr>
    </thead>
    <tbody>
        <tr>
            <td>id</td>
            <td>integer</td>
            <td>only for multiple attacks</td>
            <td>0</td>
            <td>X</td>
            <td>X</td>
            <td>The id is only used for telling the client which animation to play.</td>
        </tr>
        <tr>
            <td>priority</td>
            <td>integer</td>
            <td>no</td>
            <td>0</td>
            <td>&nbsp;</td>
            <td>X</td>
            <td>A attack with a higher priority will be preferred if two attacks are usable.</td>
        </tr>
        <tr>
            <td>warmuptime</td>
            <td>integer</td>
            <td>no</td>
            <td>0</td>
            <td>&nbsp;</td>
            <td>X</td>
            <td>The time between the start of the attack and the actual dealing of damage in game ticks (one tick equals 100ms).</td>
        </tr>
        <tr>
            <td>cooldowntime</td>
            <td>integer</td>
            <td>no</td>
            <td>0</td>
            <td>&nbsp;</td>
            <td>X</td>
            <td>The time between the dealing of damage and the end of the current attack in game ticks (one tick equals 100ms). Only after the cooldown finished any other attack can be used again.</td>
        </tr>
        <tr>
            <td>reusetime</td>
            <td>integer</td>
            <td>no</td>
            <td>0</td>
            <td>&nbsp;</td>
            <td>X</td>
            <td>The time after which the *current* attack can be used again *after* the cooldown finished in game ticks (one tick equals 100ms). This can be used to allow fast attack with dual wielding.</td>
        </tr>
        <tr>
            <td>basedamage</td>
            <td>integer</td>
            <td>no</td>
            <td>0</td>
            <td>&nbsp;</td>
            <td>X</td>
            <td>The minimum of damage the attack can cause (given that the target has no defence).</td>
        </tr>
        <tr>
            <td>deltadamage</td>
            <td>integer</td>
            <td>no</td>
            <td>0</td>
            <td>&nbsp;</td>
            <td>X</td>
            <td>The delta of the damage the attack can cause. The actual damage will be a random number between basedamage and basedamage + deltadamage</td>
        </tr>
        <tr>
            <td>chancetohit</td>
            <td>integer</td>
            <td>no</td>
            <td>0</td>
            <td>&nbsp;</td>
            <td>X</td>
            <td>The chance to land a hit. This number is not percent value but a factor that is compared against the dodge chance of the target with some randomness. FIXME Document how this calculation happens.</td>
        </tr>
        <tr>
            <td>type</td>
            <td>string</td>
            <td>no</td>
            <td>"other"</td>
            <td>&nbsp;</td>
            <td>X</td>
            <td>The type of the damage dealt by the attack. Possible values are: <br /> "physical" <br /> "magical" <br /> "direct" <br /> "other"</td>
        </tr>
        <tr>
            <td>element</td>
            <td>string</td>
            <td>no</td>
            <td>"neutral"</td>
            <td>&nbsp;</td>
            <td>X</td>
            <td>The element of the damage dealt by the attack. Possible values are: <br /> "neutral" <br /> "fire" <br /> "water" <br /> "earth" <br /> "air" <br /> "lightning" <br /> "metal" <br /> "wood" <br /> "ice"</td>
        </tr>
        <tr>
            <td>range</td>
            <td>integer</td>
            <td>no</td>
            <td>0</td>
            <td>&nbsp;</td>
            <td>X</td>
            <td>The range of the attack in pixels.</td>
        </tr>
        <tr>
            <td>animation</td>
            <td>string</td>
            <td>no</td>
            <td>"attack"</td>
            <td>X</td>
            <td>&nbsp;</td>
            <td>The name of the animation which the attacker will play.</td>
        </tr>
    </tbody>
</table>







