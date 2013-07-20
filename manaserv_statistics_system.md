---
title: manaserv statistics system
layout: wiki
---
{% include toc.md %}
#  ManaServ statistics system

This page tries to gather latest discussion about the statistic system used in ManaServ, [here](http://forums.themanaworld.org/viewtopic.php?p=86168).
Would the gaps and lacks be filled, the given page would then become a reference for developers and high-level players.

I especially invite the senior developers to make review of this page and/or take part of the forum's thread to make things happen. :)

##  Attributes

Base attributes used to compute many character's statistic:

<table class="table table-bordered table-hover" markdown="1">
    <tbody>
        <tr>
            <td>Strength</td>
            <td>The character's strength. Mainly used to compute physical damage.</td>
        </tr>
        <tr>
            <td>Dexterity</td>
            <td>FIXME</td>
        </tr>
        <tr>
            <td>Agility</td>
            <td>FIXME</td>
        </tr>
        <tr>
            <td>Vitality</td>
            <td>FIXME</td>
        </tr>
        <tr>
            <td>Intelligence</td>
            <td>FIXME</td>
        </tr>
        <tr>
            <td>Willpower</td>
            <td>FIXME</td>
        </tr>
    </tbody>
</table>

A total of 100 base points are given at character's creation. The player has to put at least 1 point in each.
5 points are given to be spread on attributes per level.

**Note: ** This is configurable using the [attributes.xml](attributes.xml.html) file.

FIXME: How many points can be reset per level? What is the max permitted difference between the lowest and the highest attribute?

##  Base statistics

Here are the basic stats to be tested so far:

###  Experience and Skills

Server side, the character level value is defined as a real number (E.g: 46.2389816). The actual level is the integer part of it (Here: 46).
What's left is the progression to the next as a percentage (2389816 * 100 = ~23%).

#####  How it is computed and linked to skills?

The character level depends mostly on the best skills of the character and less on the less good skills.
Each character's skill has got its own experience points, going from 0 to 100.

We multiply the skill level by a factor based on to what extent the skill is one of your top skills, and divide the sum by a given amount. When `n` is the index of the skill in the list sorted on skill level, 0.9&lt;sup&gt;`n`&lt;/sup&gt; could be the factor. An example with 10 skills for a typically average trained character (with skills levels going from 1 to 100):


    n  Factor         Skill
    0  1.0         *   78   = 78.0
    1  0.9         *   65   = 58.5
    2  0.81        *   53   = 42.93
    3  0.729       *   40   = 29.16
    4  0.6561      *   40   = 26.244
    5  0.59049     *   38   = 22.43862
    6  0.531441    *   33   = 17.537553
    7  0.4782969   *   23   = 11.0008287
    8  0.43046721  *   20   =  8.6093442
    9  0.387420489 *   15   =  5.811307335
       -----------            -------------
       6.513215599            300.231653235
    
    Sum of factors: 6.513215599
    Sum of skills * factors: 300.231653235
    
    300.231653235 / 6.513215599 = 46.0957646298544
    
    Character level: 46.0957646298544 (level 46, 10% progression to next level)


When the character level is used in any formula, it is always rounded down to the next lowest integer (floored). Should the character lose skill levels for some reason, the level will never be reduced. That way we don't have to deal with loss and regain of attribute increase points.

The best thing the character can do to work towards the next level is to raise its highest skill. The downside to do this is that this will be the hardest thing to do because it will be exponentially harder to increase in a certain skill.




###  Max HP:
  150 - Level + (Vitality x (Level + 15) / 10)

###  HP regeneration:
**HP regeneration (Per minute):**
  Max HP / 3

**HP regeneration (Each 5 seconds):**
  Max HP / 3 / 60 x 5       or        Max HP x 5 / 180

**Notes:**
<br /> The regeneration is temporarily disabled if the character is taking damage or attacking.

###  Regeneration Scaling:
The regeneration is scaled based on which map the character is in:

A complete HP regeneration should happen in:
- Less than 10 seconds or instant for a sanctuary (or maybe "save points" or the equivalent of rune stones in TmwAthena, maybe).
- 1 minute or so in villages.
- 3 minutes in outer maps and dungeons.
- Something like 10 minutes in places known as "dangerous".
- No regen in very dangerous places.

The `RegenScale` float number map property will tell how the HP regeneration is biased depending on the map type:
The outer maps are taken as reference; Read "RegenScale" map Property equal to 1.0 "technically" speaking.

So the `RegenScale` factor should be:
 * In sanctuaries: About 10.0
 * In villages: About 3.0
 * In outer maps: About 1.0
 * In dangerous places: About 0.3
 * In very dangerous places: 0.0

The HP regen formula taking the `RegenScale` into account would then be: <br />
**HP regeneration (Per minute):**
  Max HP / 3 x RegenScale

**HP regeneration (Each 5 seconds):**
  Max HP / 3 / 60 x 5 x RegenScale        or        Max HP x 5 / 180 x RegenScale

###  Hit Accuracy:
The hit and dodge system is explained [here](http://wiki.themanaworld.org/index.php/Archive:Hitting_and_dodging).
<br /> FIXME: Move it to manasource.

The hit accuracy had to deal with the range of the attack. A postulate formula has been made to fill this purpose:
Higher is the range, less are the chances to hit.
  (Dexterity + Weapon Skill + 50) / 2 x ( (6 - SquareRoot(RangeInTiles)) / 5)

To avoid performance problem when using the SquareRoot function:
I translated the part using the root with a more linear function:
  (Dexterity + Weapon Skill + 50) / 2 x (-0.031 x (2 + 2 * RangeInTiles) + 1.12)
This function gives very similar results than the former one for the first ranges,
and bit less for ranges near to ten tiles and above.

###  Hit per Seconds:
The hit per second formula is used to know how quick a character is to rearm before striking again.
This formula is attributes but also weapon dependant, as some weapon are less heavy or more handy than others.
<br /> The `WeaponSpeedFactor` float value is obtained from the items.xml file for each type of weapon, and is used to scale
the character HitPerSecond's rate.
There are currently two concurrent formulas discussed:
  Hit Per Second (Current): (1 + Agility / 100) x WeaponSpeedFactor
  Hit Per Second (Rotonen): (0.3 + (Agility x 3) / 100) x WeaponSpeedFactor

As the server is working in ticks (number of logic updates per second), the formulas implementation would be done that way:
  Ticks before Hit (Current): 1 / ((1 + Agility / 100) x WeaponSpeedFactor) / TICKS_PER_SECOND)
  Ticks before Hit (Rotonen): 1 / ((0.3 + (Agility x 3) / 100) x WeaponSpeedFactor) / TICKS_PER_SECOND)


###  Useful balancing formulas:
These formulas are used to get a soft way to know if things are balanced against a given player level.
They are not used in the server but only for self-made balancing purposes:

  Balanced Weapon Skill Level: Level + 0.01 x Level

  Balanced Spell Skill Level: Level - Sqrt(Level)

  Average Equipment Max Weight: 12 + Level / 2

  Average Healing (in HP): HP / 5

###  Sheet prototype file

Here is a sheet file used for protoyping different formulas and see their results on an average
character from level 1 to 100.
There are many thing lacking for now, e.g.: character profile (Warriors -&gt; More points on physical attributes and skills, Mage -&gt; More points on spiritual attributes and skills, ...) but it's already a great help.

FIXME: Add an ods file, too.
<br /> ManaServ - Statistics System: {{:wiki:manaserv_-_statistics_system_-_0.1.0.xls|XLS Sheet file}}

#  Discussion


