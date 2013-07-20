---
title: Scripting Reference
layout: wiki
---
{% include toc.md %}

The Mana server uses the scripting language LUA for scripting. This is a list
of the script commands currently implemented in addition to the
[standard lua statements and functions](http://www.lua.org/manual/5.1/).

Also, if you want to look at actual working samples, you can have a look at the
`example/scripts` folder in the
[Manaserv's source](https://github.com/mana/manaserv/tree/master/example/scripts)
which has always the latest working set.

# Available script bindings

## Area of Effect
In order to easily use area of effects in your items or in your scripts,
the following functions are available:
### get_beings_in_circle
{% highlight lua %}
get_beings_in_circle(int x, int y, int radius)
get_beings_in_circle(handle actor, int radius)
{% endhighlight %}
**Return value:** This function returns a lua table of all beings in a
circle of radius (in pixels) `radius` centered either at the pixel at
(`x`, `y`) or at the position of `being`.
### get_beings_in_rectangle
{% highlight lua %}
get_beings_in_rectangle(int x, int y, int width, int height)
{% endhighlight %}
**Return value:** An table of being entities within the rectangle.
All parameters have to be passed as pixels.
### get_distance
{% highlight lua %}
get_distance(handle being1, handle being2)
get_distance(int x1, int y1, int x2, int y2)
{% endhighlight %}
**Return value:** The distance between the two beings or the two points
in pixels.
## AttackInfo class
The AttackInfo class reveals info about attacks and provides functions to
register callbacks on attacks. See the
[Attack Configuration](attackconfiguration.html) for more info.
To get an AttackInfo use
[monsterclass:attacks](scripting.html#monsterclassattacks) or
[itemclass:attacks](scripting.html#itemclassattacks)
### attackinfo:cooldowntime
{% highlight lua %}
attackinfo:cooldowntime()
{% endhighlight %}
**Return value:** This function returns the cooldowntime (time after dealing
damage after which a new attack can be used) of the attack.
### attackinfo:damage
{% highlight lua %}
attackinfo:damage()
{% endhighlight %}
**Return value:** This function returns the damage info of the attack.

**See also:** [Damage Class](scripting.html#damage_class)
### attackinfo:on_attack
{% highlight lua %}
attackinfo:on_attack(function callback)
{% endhighlight %}
Assigns a callback to the attack that will be called as soon the attack is
used. The callback will get called with the following parameters:
being user, being target, int damage_dealt.
### attackinfo:priority
{% highlight lua %}
attackinfo:priority()
{% endhighlight %}
**Return value:** This function returns the priority of the attack.
### attackinfo:reusetime
{% highlight lua %}
attackinfo:reusetime()
{% endhighlight %}
**Return value:** This function returns the reusetime (time after which the
same attack can be used again) of the attack.
### attackinfo:warmuptime
{% highlight lua %}
attackinfo:warmuptime()
{% endhighlight %}
**Return value:** This function returns the warmuptime (time before a attack
triggers damage after being used) of the attack.
## Callbacks
**Note:** You can only assign a **single** function as callback.
When setting a new function the old one will not be called anymore.
Some of this callbacks are already used for the libmana.lua. Be careful when
using those since they will most likely break your code in other places.
### on_being_death
{% highlight lua %}
on_being_death(function ref)
{% endhighlight %}
Will make sure that the function `ref` gets called with the being
as argument as soon a being dies.
### on_character_death
{% highlight lua %}
on_character_death(function ref)
{% endhighlight %}
Sets a listener function to the character death event.
### on_character_death_accept
{% highlight lua %}
on_character_death_accept(function ref)
{% endhighlight %}
Will make sure that the function `ref` gets called with the character
as argument as soon a character either pressed the ok dialouge in the death
message or left the game while being dead.
### on_character_login
{% highlight lua %}
on_character_login(function ref)
{% endhighlight %}
Will make sure that function `ref` gets called with the character
as argument as soon a character logged in.
### on_craft
{% highlight lua %}
on_craft(function ref)
{% endhighlight %}
Will make sure that the function `ref` gets called with the the crafting
character and a table with the recipes {(id, amount}) when a character
performs crafting.
### on_create_npc_delayed
{% highlight lua %}
on_create_npc_delayed(function ref)
{% endhighlight %}
Will make sure that the function `ref` gets called with the
name, id, gender, x and y values as arguments of the npc when a npc should
be created at map init (Npcs defined directly in the map files use this).
### on_entity_remove
{% highlight lua %}
on_entity_remove(function ref)
{% endhighlight %}
Will make sure that the function `ref` gets called with the being
as argument as soon a being gets removed from a map.
### on_map_initialize
{% highlight lua %}
on_map_initialize(function ref)
{% endhighlight %}
Will make sure that the function `ref` gets called with the initialized
map as current map when the map is initialized.
### on_mapupdate
{% highlight lua %}
on_mapupdate(function ref)
{% endhighlight %}
Will make sure that the function `ref` gets called with the the map id
as argument for each game tick and map.
### on_recalculate_base_attribute
{% highlight lua %}
on_recalculate_base_attribute(function ref)
{% endhighlight %}
Will call the function `ref` when an attribute base needs to be recalculated.
The function is expected to do this recalculation then. The engine only
triggers this for characters. However you can use the same function for
recalculating derived attributes in the
[on_update_derived_attribute](scripting.html#on_update_derived_attribute) callback.

**See:** [attributes.xml](attributes.xml.html) for more info.
### on_update
{% highlight lua %}
on_update(function ref)
{% endhighlight %}
Will make sure that the function `ref` gets called every game tick.
### on_update_derived_attribute
{% highlight lua %}
on_update_derived_attribute(function ref)
{% endhighlight %}
Will call the function `ref` when an attribute changed and other attributes
need recalculation. The function is expected to recalculate those then.

**See:** [attributes.xml](attributes.xml.html) for more info.

## Character and being interaction

### chr_get_post
{% highlight lua %}
chr_get_post(handle character)
{% endhighlight %}
Gets the post for the character.
### chr_get_quest
{% highlight lua %}
chr_get_quest(handle character, string name)
{% endhighlight %}
**Return value:** The quest variable named `name` for the given character.

**Warning:** May only be called from an NPC talk function.

### chr_request_quest
{% highlight lua %}
chr_request_quest(handle character, string questvariable, Ref function)
{% endhighlight %}
Requests the questvar from the account server. This will make it available in
the quest cache after some time. The passed function will be called back as
soon the quest var is available.
### chr_set_quest
{% highlight lua %}
chr_set_quest(handle character, string name, string value)
{% endhighlight %}
Sets the quest variable named `name` for the given  character to the value
`value`.
### chr_try_get_quest
{% highlight lua %}
chr_try_get_quest(handle character, string questvariable)
{% endhighlight %}
Callback for checking if a quest variable is available in cache.

**Return value:** It will return the variable if it is or nil
if it is not in cache.
### entity:action
{% highlight lua %}
entity:action()
{% endhighlight %}
Valid only for being entities.

**Return value:** Current action of the being. These action constants are
defined in libmana-constants.lua:

| 0 | ACTION_STAND  |
| 1 | ACTION_WALK   |
| 2 | ACTION_ATTACK |
| 3 | ACTION_SIT    |
| 4 | ACTION_DEAD   |
| 5 | ACTION_HURT   |
### entity:apply_attribute_modifier
{% highlight lua %}
entity:apply_attribute_modifier(int attribute_id, double value,
                                unsigned int layer, [unsigned short duration,
                                [unsigned int effect_id]])
{% endhighlight %}
Valid only for being entities.

**Parameters description:** \\
  * **value** (double): The modifier value (can be negative).
  * **layer** (unsigned int): The layer or level of the modifier.
    As modifiers are stacked on an attribute, the layer determines
    where the modifier will be inserted. Also, when adding a modifier,
    all the modifiers with an higher ayer value will also be recalculated.
  * **duration** (unsigned short): The modifier duration in ticks((A tick is
    equal to 100ms.)). If set to 0, the modifier is permanent.
  * **effect_id** (unsigned int): Set and keep that parameter when you want
    to retrieve the exact layer later. (FIXME: Check this.)
### entity:base_attribute
{% highlight lua %}
entity:base_attribute(int attribute_id)
{% endhighlight %}
Valid only for being entities.

**Return value:** Returns the value of the being's `base attribute`.
### entity:damage
{% highlight lua %}
entity:damage(int damage, int delta,
              int accuracy, int type, int element)
entity:damage(int damage, int delta, int accuracy,
              int type, int element, handle source)
entity:damage(int damage, int delta, int accuracy,
              int type, int element, handle source, int skill)
entity:damage(int damage, int delta, int accuracy,
              int type, int element, handle source, string skillname)
{% endhighlight %}
Valid only for being entities.

Inflicts damage to the being. The severity of the attack is between
`damage` and (`damage` + `delta`) and is calculated using the normal
damage calculation rules. The being has a chance to
dodge the attack with its
[agility attribute](attributes.xml.html). The `accuracy` decides how hard this is.

If `source` is provided the attack is handled as if the `source`
triggered the damage.

If `skill` is given the `owner` can also recieve XP for the attack. The
`skill` should be defined in the [skills.xml](skills.xml.html). If the skill
is provided as string (`skillname`) you have to use this format:
&lt;setname&gt;_&lt;skillname&gt;. So for example: "Weapons_Unarmed"

`type` affects which kind of armor and character attributes reduce the
damage. It can be one of the following values:
<table class="table table-bordered table-hover">
    <thead>
        <tr>
            <th>Id</th>
            <th>Name</th>
        </tr>
    </thead>
    <tbody>
        <tr>
            <td>0</td>
            <td>DAMAGE_PHYSICAL</td>
        </tr>
        <tr>
            <td>1</td>
            <td>DAMAGE_MAGICAL</td>
        </tr>
        <tr>
            <td>0</td>
            <td>DAMAGE_OTHER</td>
        </tr>
    </tbody>
</table>

`element` decides how the element system changes the damage. The
following values are possible:
<table class="table table-bordered table-hover">
    <thead>
        <tr>
            <th>Id</th>
            <th>Name</th>
        </tr>
    </thead>
    <tbody>
        <tr>
            <td>0</td>
            <td>ELEMENT_NEUTRAL</td>
        </tr>
        <tr>
            <td>1</td>
            <td>ELEMENT_FIRE</td>
        </tr>
        <tr>
            <td>2</td>
            <td>ELEMENT_WATER</td>
        </tr>
        <tr>
            <td>3</td>
            <td>ELEMENT_EARTH</td>
        </tr>
        <tr>
            <td>4</td>
            <td>ELEMENT_AIR</td>
        </tr>
        <tr>
            <td>5</td>
            <td>ELEMENT_LIGHTNING</td>
        </tr>
        <tr>
            <td>6</td>
            <td>ELEMENT_METAL</td>
        </tr>
        <tr>
            <td>7</td>
            <td>ELEMENT_WOOD</td>
        </tr>
        <tr>
            <td>8</td>
            <td>ELEMENT_ICE</td>
        </tr>
    </tbody>
</table>

**Return Value**: Actual HP reduction resulting from the attack.
### entity:direction
{% highlight lua %}
entity:direction()
{% endhighlight %}
Valid only for being entities.

**Return value:** Current direction of the being. These direction constants
are defined in libmana-constants.lua:

| 0 | DIRECTION_DEFAULT |
| 1 | DIRECTION_UP      |
| 2 | DIRECTION_DOWN    |
| 3 | DIRECTION_LEFT    |
| 4 | DIRECTION_RIGHT   |
| 5 | DIRECTION_INVALID |
### entity:gender
{% highlight lua %}
entity:gender()
{% endhighlight %}
Valid only for being entities.

**Return value:** The gender of the being. These gender constants are
defined in libmana-constants.lua:

| 0 | GENDER_MALE        |
| 1 | GENDER_FEMALE      |
| 2 | GENDER_UNSPECIFIED |
### entity:give_special
{% highlight lua %}
entity:give_special(int special)
{% endhighlight %}
Valid only for character entities.

Enables a special for a character.
### entity:give_xp
{% highlight lua %}
entity:give_xp(int skill, int amount [, int optimalLevel])
entity:give_xp(string skillname, int amount [, int optimalLevel])
{% endhighlight %}
Valid only for character entities.

Gives the character `amount` experience in skill `skill`. When an
optimal level is set (over 0), the experience is reduced when the characters
skill level is beyond this. If the skill is provided as string
(`skillname`) you have to use this format: &lt;setname&gt;_&lt;skillname&gt;.
So for example: "Weapons_Unarmed".
### entity:hair_color
{% highlight lua %}
entity:hair_color()
{% endhighlight %}
Valid only for character entities.

**Return value:** The hair color ID of the character.
### entity:hair_style
{% highlight lua %}
entity:hair_style()
{% endhighlight %}
Valid only for character entities.

**Return value:** The hair style ID of the character.
### entity:has_special
{% highlight lua %}
entity:has_special(int special)
{% endhighlight %}
Valid only for character entities.

**Return value:** True if the character has the special, false otherwise.
### entity:heal
{% highlight lua %}
entity:heal([int value])
{% endhighlight %}
Valid only for being entities.

Restores `value` lost hit points to the being. Value can be omitted to
restore the being to full hit points.

While you can (ab)use this function to hurt a being by using a negative
value you should rather use entity:damage for this purpose.
### entity:kick
{% highlight lua %}
entity:kick()
{% endhighlight %}
Valid only for character entities.

Kicks the character.
### entity:kill_count
{% highlight lua %}
entity:kill_count(int monsterId)
entity:kill_count(string monsterName)
entity:kill_count(MonsterClass monsterClass)
{% endhighlight %}
Valid only for character entities.

**Return value:** The total number of monsters of the specy (passed either
as monster id, monster name or monster class) the character has killed
during its career.
### entity:level
{% highlight lua %}
entity:level()
entity:level(int skill_id)
entity:level(string skill_name)
{% endhighlight %}
Valid only for character entities.

**Return value:** Returns the level of the character. If a skill is passed
(either by name or id) the level of this skill is returned.

**Note:** If the skill is provided as string (`skill_name`) you have to
use this format: &lt;setname&gt;_&lt;skillname&gt;. So for example: "Weapons_Unarmed".
### entity:mapid
{% highlight lua %}
entity:mapid()
{% endhighlight %}
**Return value:** the id of the map where the entity is located or nil if
there is none.
### entity:name
{% highlight lua %}
entity:name()
{% endhighlight %}
Valid only for being entities.

**Return value:** Name of the being.
### entity:position
{% highlight lua %}
entity:position()
{% endhighlight %}
Valid only for actor entities.

**Return value:** The x and y position of the actor in pixels, measured from
the top-left corner of the map it is currently on.
### entity:register
{% highlight lua %}
entity:register()
{% endhighlight %}
Makes the server call the on_being_death and on_entity_remove callbacks
when the being dies or the entity is removed from the map.

**Note:** You should never need to call this in most situations. It is
handeled by the libmana.lua
### entity:remove_attribute_modifier
{% highlight lua %}
entity:remove_attribute_modifier(int attribute_id,
                                 double value, unsigned int layer)
{% endhighlight %}
Valid only for being entities.

Permits to remove an attribute modifier by giving its value and its layer.
### entity:rights
{% highlight lua %}
entity:rights()
{% endhighlight %}
Valid only for character entities.

**Return value:** The access level of the account of the character.
### entity:set_action
{% highlight lua %}
entity:set_action(int action)
{% endhighlight %}
Valid only for being entities.

Sets the current action for the being.
### entity:set_base_attribute
{% highlight lua %}
entity:set_base_attribute(int attribute_id, double new_value)
{% endhighlight %}
Valid only for being entities.

Set the value of the being's `base attribute` to the 'new_value' parameter
given. (It can be negative).
### entity:set_direction
{% highlight lua %}
entity:set_direction(int direction)
{% endhighlight %}
Valid only for being entities.

Sets the current direction of the given being. Directions are same as in
`entity:direction`.
### entity:set_gender
{% highlight lua %}
entity:set_gender(int gender)
{% endhighlight %}
Valid only for being entities.

Sets the gender of the being.

The gender constants are defined in libmana-constants.lua:

| 0 | GENDER_MALE        |
| 1 | GENDER_FEMALE      |
| 2 | GENDER_UNSPECIFIED |
### entity:set_hair_color
{% highlight lua %}
entity:set_hair_color(int color)
{% endhighlight %}
Valid only for character entities.

Sets the hair color ID of the character to `color`.
### entity:set_hair_style
{% highlight lua %}
entity:set_hair_style(int style)
{% endhighlight %}
Valid only for character entities.

Sets the hair style ID of the character to `style`.
### entity:set_special_mana
{% highlight lua %}
entity:set_special_mana(int specialid, int new_mana)
entity:set_special_mana(string specialname, int new_mana)
{% endhighlight %}
Valid only for character entities.

Sets the mana (recharge status) of the special to a new value for the
character.

**Note:** When passing the `specialname` as parameter make sure that it is
formatted in this way: &lt;setname&gt;_&lt;specialname&gt; (for eg. "Magic_Healingspell").
### entity:set_special_recharge_speed
{% highlight lua %}
entity:set_special_recharge_speed(int specialid, int new_speed)
entity:set_special_recharge_speed(string specialname, int new_speed)
{% endhighlight %}
Valid only for character entities.

Sets the recharge speed of the special to a new value for the character.

**Note:** When passing the `specialname` as parameter make sure that it is
formatted in this way: &lt;setname&gt;_&lt;specialname&gt; (for eg. "Magic_Healingspell").
### entity:set_walkmask
{% highlight lua %}
entity:set_walkmask(string mask)
{% endhighlight %}
Valid only for actor entities.

Sets the walkmasks of an actor. The mask is a set of characters which stand
for different collision types.

| w | Wall      |
| c | Character |
| m | Monster   |

This means entity:set_walkmask("wm") will prevent the being from walking
over walls and monsters.
### entity:shake_screen
{% highlight lua %}
entity:shake_screen(int x, int y[, float strength, int radius])
{% endhighlight %}
Valid only for character entities.

Shakes the screen for a given character.
### entity:show_text_particle
{% highlight lua %}
entity:show_text_particle(string text)
{% endhighlight %}
Valid only for character entities.

Shows a text particle on a client. This effect is only visible for the
character.
### entity:special_mana
{% highlight lua %}
entity:special_mana(int specialid)
entity:special_mana(string specialname)
{% endhighlight %}
**Return value:** The mana (recharge status) of the special that is owned by
the character.

**Note:** When passing the `specialname` as parameter make sure that it is
formatted in this way: &lt;setname&gt;_&lt;specialname&gt; (for eg. "Magic_Healingspell").
### entity:special_recharge_speed
{% highlight lua %}
entity:special_recharge_speed(int specialid)
entity:special_recharge_speed(string specialname)
{% endhighlight %}
Valid only for character entities.

**Return value:** The current recharge speed of the special that is owned by
the character.

**Note:** When passing the `specialname` as parameter make sure that it is
formatted in this way: &lt;setname&gt;_&lt;specialname&gt; (for eg. "Magic_Healingspell").
### entity:take_special
{% highlight lua %}
entity:take_special(int special)
{% endhighlight %}
Valid only for character entities.

Removes a special from a character.

**Return value:** True if removal was successful, false otherwise (in case
the character did not have the special).
### entity:type
{% highlight lua %}
entity:type()
{% endhighlight %}
**Return value:** Type of the given entity. These type constants are defined
in libmana-constants.lua:

| 0 | TYPE_ITEM      |
| 1 | TYPE_ACTOR     |
| 2 | TYPE_NPC       |
| 3 | TYPE_MONSTER   |
| 4 | TYPE_CHARACTER |
| 5 | TYPE_EFFECT    |
| 6 | TYPE_OTHER     |
### entity:walk
{% highlight lua %}
entity:walk(int pixelX, int pixelY [, int walkSpeed])
{% endhighlight %}
Valid only for being entities.

Set the desired destination in pixels for the being.

The optional **'WalkSpeed'** is to be given in tiles per second. The average
speed is 6.0 tiles per second. If no speed is given the default speed of the
being is used.
### entity:walkmask
{% highlight lua %}
entity:walkmask()
{% endhighlight %}
Valid only for actor entities.

**Return value:** The walkmask of the actor formatted as string. (See
[entity:set_walkmask](scripting.html#entityset_walkmask))
### entity:warp
{% highlight lua %}
entity:warp(int mapID, int posX, int posY)
entity:warp(string mapName, int posX, int posY)
{% endhighlight %}
Valid only for character entities.

Teleports the character to the position `posX`:`posY` on the map
with the ID number `mapID` or name `mapName`. The `mapID` can be
substituted by `nil` to warp the character to a new position on the
current map.
### entity:x
{% highlight lua %}
entity:x()
{% endhighlight %}
Valid only for actor entities.

**Return value:** The x position of the actor in pixels, measured from
the left border of the map it is currently on.
### entity:xp
{% highlight lua %}
entity:xp(int skill_id)
entity:xp(string skill_name)
{% endhighlight %}
Valid only for character entities.

**Return value:** The total experience collected by the character in
`skill`.

If the skill is provided as string (`skillname`) you have to use this
format: &lt;setname&gt;_&lt;skillname&gt;. So for example: "Weapons_Unarmed".
### entity:y
{% highlight lua %}
entity:y()
{% endhighlight %}
Valid only for actor entities.

**Return value:** The y position of the actor in pixels, measured from
the top border of the map it is currently on.
### get_character_by_name
{% highlight lua %}
get_character_by_name(string name)
{% endhighlight %}
Tries to find an online character by name.

**Return value** the character handle or nil if there is none.
### xp_for_level
{% highlight lua %}
xp_for_level(int level)
{% endhighlight %}
**Return value:** Returns the total experience necessary (counted from
level 0) for reaching `level` in any skill.
## Creation and removal of stuff

### drop_item
{% highlight lua %}
drop_item(int x, int y, int id [, int number])
drop_item(int x, int y, string name[, int number])
{% endhighlight %}
Creates an item stack on the floor.
### effect_create
{% highlight lua %}
effect_create(int id, int x, int y)
effect_create(int id, being b)
{% endhighlight %}
Triggers the effect `id` from the clients effects.xml
(particle and/or sound) at map location `x`:`y` or on being `b`.
This has no effect on gameplay.

**Warning:** Remember that clients might switch off particle effects for
performance reasons. Thus you should not use this for important visual
input.
### entity:remove
{% highlight lua %}
entity:remove()
{% endhighlight %}
Removes the entity from its current map.
### monster_create
{% highlight lua %}
monster_create(int monsterID, int x, int y)
monster_create(string monstername, int x, int y)
{% endhighlight %}
**Return value:** A handle to the created monster.

Spawns a new monster of type `monsterID` or `monstername` on the current
map on the pixel coordinates `x`:`y`.
### npc_create
{% highlight lua %}
npc_create(string name, int spriteID, int gender, int x, int y,
           function talkfunct, function updatefunct)
{% endhighlight %}
**Return value:** A handle to the created NPC.

Creates a new NPC with the name `name` at the coordinates `x`:`y`
which appears to the players with the appearence listed in their npcs.xml
under `spriteID` and the gender `gender`. Every game tick the function
`updatefunct` is called with the handle of the NPC. When a character talks
to the NPC the function `talkfunct` is called with the NPC handle and the
character handle.

For setting the gender you can use the constants defined in the
libmana-constants.lua:

| 0 | GENDER_MALE         |
| 1 | GENDER_FEMALE       |
| 2 | GENDER_UNSPECIFIED  |
### npc_disable
{% highlight lua %}
npc_disable(handle npc)
{% endhighlight %}
Disable an NPC.
### npc_enable
{% highlight lua %}
npc_disable(handle npc)
{% endhighlight %}
Re-enables an NPC that got disabled before.
### trigger_create
{% highlight lua %}
trigger_create(int x, int y, int width, int height,
               function trigger_function, int arg, bool once)
{% endhighlight %}
Creates a new trigger area with the given `height` and `width` in pixels
at the map position `x`:`y` in pixels. When a being steps into this area
the function  `trigger_function` is called with the being handle and
`arg` as arguments. When `once` is false the function is called every
game tick the being is inside the    area. When `once` is true it is only
called again when the being leaves and reenters the area.
## Damage Class
The Damage class provides info about the kind of damage attack deals.
### damage:base
{% highlight lua %}
damage:base()
{% endhighlight %}
**Return value:** This function returns the base damage of the attack.
It is the minimum of damage dealt.
### damage:cth
{% highlight lua %}
damage:cth()
{% endhighlight %}
**Return value:** This function returns the chance to hit of the attack.
This number is not a percent value but some factor. Higher means a better
chance to hit. FIXME: Add info about the factor.
### damage:delta
{% highlight lua %}
damage:delta()
{% endhighlight %}
**Return value:** This function returns the damage delta of the attack.
base damage + delta damage is the maximum of damage the attack can cause.
A number in between will be picked by random.
### damage:element
{% highlight lua %}
damage:element()
{% endhighlight %}
**Return value:** This function returns the element of the attack.

**See:** [entity:damage](scripting.html#entitydamage) for possible values.
### damage:id
{% highlight lua %}
damage:id()
{% endhighlight %}
**Return value:** This function returns the id of the attack.
### damage:is_truestrike
{% highlight lua %}
damage:is_truestrike()
{% endhighlight %}
**Return value:** This function returns whether the attack is a true strike.
A true strike is not effected by chance of hit or anything that could
prevent the hit.
### damage:range
{% highlight lua %}
damage:range()
{% endhighlight %}
**Return value:** This function returns the range of the attack in pixels.
### damage:skill
{% highlight lua %}
damage:skill()
{% endhighlight %}
**Return value:** This function returns the skill id of the attack. If the
damage dealer is a character is a character this skill will recieve exp.
### damage:type
{% highlight lua %}
damage:type()
{% endhighlight %}
**Return value:** This function returns the type of the attack.

**See:** [entity:damage](scripting.html#entitydamage) for possible values.
## Input and output

### announce
{% highlight lua %}
announce(string message [, string sender])
{% endhighlight %}
Sends a global announce with the given `message` and `sender`. If no
`sender` is passed "Server" will be used as sender.
### ask
{% highlight lua %}
ask(item1, item2, ... itemN)
{% endhighlight %}
**Return value:** Number of the option the player selected (starting with 1).

**Warning:** May only be called from an NPC talk function.

Shows an NPC dialog box on the users screen with a number of dialog options
to choose from. Idles the current thread until the user selects one or
aborts the current thread when the user clicks "cancel".

Items are either strings or tables of strings (indices are ignored,
but presumed to be taken in order). So,
`ask("A", {"B", "C", "D"}, "E")` is the same as
`ask("A", "B", "C", "D", "E")`.
### ask_number
{% highlight lua %}
ask_number(min_num, max_num, [default_num])
{% endhighlight %}
**Return value:** The number the player entered into the field.

**Warning:** May only be called from an NPC talk function.

Shows a dialog box to the user which allows him to choose a number between
`min_num` and `max_num`. If `default_num` is set this number will be
uses as default.  Otherwise `min_num` will be the default.
### ask_string
{% highlight lua %}
ask_string()
{% endhighlight %}
**Return value:** The string the player entered.

**Warning:** May only be called from an NPC talk function.

Shows a dialog box to a user which allows him to enter a text.
### entity:message
{% highlight lua %}
entity:message(string message)
{% endhighlight %}
Delivers the string `message` to this entity (which needs to be a
character). It will appear in the chatlog as a private message from
"Server".
### entity:say
{% highlight lua %}
entity:say(string message)
{% endhighlight %}
Makes this entity (which can be a character, monster or NPC), speak the
string `message` as if it was entered by a player in the chat bar.
### npc_post
{% highlight lua %}
npc_post()
{% endhighlight %}
Starts retrieving post. Better not try to use it so far.
### say
{% highlight lua %}
say(string message)
{% endhighlight %}
**Warning:** May only be called from an NPC talk function.

Shows an NPC dialog box on the screen of displaying the string `message`.
Idles the current thread until the user click "OK".
## Inventory interaction

### entity:change_money
{% highlight lua %}
entity:change_money(int amount)
{% endhighlight %}
Valid only for character entities.

Changes the money currently owned by this character by ''amount''.

**Warning:** Before reducing the money make sure to check if the character
owns enough money using entity:money.
### entity:equip_item
{% highlight lua %}
entity:equip_item(int item_id)
entity:equip_item(string item_name)
{% endhighlight %}
Valid only for character entities.

Makes the character equip the item id when it exists in the player's
inventory.

**Return value:** true if equipping suceeded. false otherwise.
### entity:equip_slot
{% highlight lua %}
entity:equip_slot(int slot)
{% endhighlight %}
Valid only for character entities.

Makes the character equip the item in the given inventory slot.
### entity:equipment
{% highlight lua %}
entity:equipment(): table[](slot, item id, name)}
{% endhighlight %}
Valid only for character entities.

Used to get a full view of a character's equipment.
This is not the preferred way to know whether an item is equipped:
Use entity:inv_count for simple cases.

**Return value:** A table containing all the info about the character's
equipment. Empty slots are not listed.

**Example of use:**
{% highlight lua %}
local equipment_table = ch:equipment()
for i = 1, #equipment_table do
    item_message = item_message.."\n"..equipment_table[i].slot..", "
        ..equipment_table[i].id..", "..equipment_table[i].name
end
{% endhighlight %}
### entity:inv_change
{% highlight lua %}
entity:inv_change(int id1, int number1, ..., int idN, numberN)
entity:inv_change(string name1, int number1, ..., string nameN, numberN)
{% endhighlight %}
Valid only for character entities.

Changes the number of items with the item ID `id` or `name` owned by
this character by `number`. You can change any number of items with this
function by passing multiple `id` or `name` and `number` pairs.
A failure can be caused by trying to take items the character doesn't possess.

**Return value:** Boolean true on success, boolean false on failure.

**Warning:** When one of the operations fails the following operations are
ignored but these before are executed. For that reason you should always
check if the character possesses items you are taking away using
entity:inv_count.
### entity:inv_count
{% highlight lua %}
entity:inv_count(bool inInventory, bool inEquipment,
                 int id1, ..., int idN)
entity:inv_count(bool inInventory, bool inEquipment,
                 string name1, ..., string nameN)
{% endhighlight %}
Valid only for character entities.

The boolean values `inInventory` and `inEquipment` make possible to
select whether equipped or carried items must be counted.

**Return values:** A number of integers with the amount of items `id` or
`name` carried or equipped by the character.
### entity:inventory
{% highlight lua %}
entity:inventory(): table[]{slot, item id, name, amount}
{% endhighlight %}
Valid only for character entities.

Used to get a full view of a character's inventory.
This is not the preferred way to know whether an item is in the character's
inventory:
Use entity:inv_count for simple cases.

**Return value:** A table containing all the info about the character's
inventory. Empty slots are not listed.

**Example of use:**
{% highlight lua %}
local inventory_table = ch:inventory()
for i = 1, #inventory_table do
    item_message = item_message.."\n"..inventory_table[i].slot..", "
        ..inventory_table[i].id..", "..inventory_table[i].name..", "
        ..inventory_table[i].amount
end
{% endhighlight %}
### entity:money
{% highlight lua %}
entity:money()
{% endhighlight %}
Valid only for character entities.

Returns the money currently owned by this character.
### entity:unequip_item
{% highlight lua %}
entity:unequip_item(int item_id)
entity:unequip_item(string item_name)
{% endhighlight %}
Valid only for character entities.

Makes the character unequip the item(s) corresponding to the id when it
exists in the player's equipment.

**Return value:** true when every item were unequipped from equipment.
### entity:unequip_slot
{% highlight lua %}
entity:unequip_slot(int slot)
{% endhighlight %}
Valid only for character entities.

Makes the character unequip the item in the given equipment slot.

**Return value:** true upon success. false otherwise.
### trade
{% highlight lua %}
trade(bool mode,
      { int item1id, int item1amount, int item1cost }, ...,
      { int itemNid, int itemNamount, int itemNcost })
trade(bool mode,
      { string item1name, int item1amount, int item1cost }, ...,
      { string itemNname, int itemNamount, int itemNcost })
{% endhighlight %}
FIXME: Move into a seperate file
Opens a trade window from an NPC conversation. `mode`
is true for selling and false for buying. You have to set each items the NPC
is buying/selling,    the cost and the maximum amount in {}.

**Note:** If the fourth parameters (table type) is omitted or invalid, and
the mode set to sell (true),
the whole player inventory is then sellable.

**N.B.:** Be sure to put a `value` (item cost) parameter in your items.xml
to permit the player to sell it when using this option.

**Return values:**
  * **0** when a trade has been started
  * **1** when there is no buy/sellable items
  * **2** in case of errors.

**Examples:**
{% highlight lua %}
    -- "A buy sample."
    local buycase = trade(false, {
        {"Sword", 10, 20},
        {"Bow", 10, 30},
        {"Dagger", 10, 50}
    })
    if buycase == 0 then
      say("What do you want to buy?")
    elseif buycase == 1 then
      say("I've got no items to sell.")
    else
      say("Hmm, something went wrong... Ask a scripter to
      fix the buying mode!")
    end

-- ...

   -- "Example: Let the player sell only pre-determined items."
   local sellcase = trade(true, {
                     {"Sword", 10, 20},
                     {"Bow", 10, 30},
                     {"Dagger", 10, 200},
                     {"Knife", 10, 300},
                     {"Arrow", 10, 500},
                     {"Cactus Drink", 10, 25}
    })
    if sellcase == 0 then
      say("Here we go:")
    elseif sellcase == 1 then
      say("I'm not interested by your items.")
    else
      say("Hmm, something went wrong...")
      say("Ask a scripter to fix me!")
    end

-- ...

    -- "Example: Let the player sell every item with a 'value' parameter in
    the server's items.xml file
    local sellcase = trade(true)
    if sellcase == 0 then
      say("Ok, what do you want to sell:")
    elseif sellcase == 1 then
      say("I'm not interested by any of your items.")
    else
      say("Hmm, something went wrong...")
      say("Ask a scripter to fix me!")
    end
{% endhighlight %}
## Item class

### get_item_class
{% highlight lua %}
get_item_class(int itemid)
get_item_class(string itemname)
{% endhighlight %}
**Return value:** This function returns a object of the item class.
See below for usage of that object.
### itemclass:attacks
{% highlight lua %}
itemclass:attacks()
{% endhighlight %}
**Return value:** Returns a list of all attacks the item offers.

**See:** the [AttackInfo class](scripting.html#attackinfo_class) for more info
about how to use the values in the list.
### itemclass:name
{% highlight lua %}
itemclass:name()
{% endhighlight %}
**Return value:** The name of the item class.
### itemclass:on
{% highlight lua %}
itemclass:on(string event, function callback)
{% endhighlight %}
Assigns `callback` as callback for the `event` event.

**Note:** See [get_item_class](scripting.html#get_item_class) for getting
a itemclass object.
## Logging

### DEBUG
{% highlight lua %}
DEBUG(string message)
{% endhighlight %}
Will log the ''message'' using the log level LOG_DEBUG.

**Note:** When passing multiple arguments these arguments will get connected
using a " ".
### ERROR
{% highlight lua %}
ERROR(string message)
{% endhighlight %}
Will log the ''message'' using the log level LOG_ERROR.

**Note:** When passing multiple arguments these arguments will get connected
using a " ".
### INFO
{% highlight lua %}
INFO(string message)
{% endhighlight %}
Will log the ''message'' using the log level LOG_INFO.

**Note:** When passing multiple arguments these arguments will get connected
using a " ".
### WARN
{% highlight lua %}
WARN(string message)
{% endhighlight %}
Will log the ''message'' using the log level LOG_WARNING.

**Note:** When passing multiple arguments these arguments will get connected
using a " ".
### log
{% highlight lua %}
log(int log_level, string message)
{% endhighlight %}
Log something at the specified log level. The available log levels are:
| 0 | LOG_FATAL    |
| 1 | LOG_ERROR    |
| 2 | LOG_WARNING  |
| 3 | LOG_INFO     |
| 4 | LOG_DEBUG    |
## Map information

### get_map_id
{% highlight lua %}
get_map_id()
{% endhighlight %}
**Return value:** The ID number of the map the script runs on.
### get_map_property
{% highlight lua %}
get_map_property(string key)
{% endhighlight %}
**Return value:** The value of the property `key` of the current map. The
string is empty if the property `key` does not exist.
### is_walkable
{% highlight lua %}
is_walkable(int x, int y)
{% endhighlight %}
**Return value:** True if `x`:`y` is a walkable pixel
on the current map.
### map_get_pvp
{% highlight lua %}
map_get_pvp()
{% endhighlight %}
**Return value:** The pvp situation of the map.

There are constants for the different pvp situations in the libmana-constants.lua:

| 0 | PVP_NONE  |
| 1 | PVP_FREE  |
## Map object class

### map_get_objects
{% highlight lua %}
map_get_objects()
map_get_objects(string type)
{% endhighlight %}
**Return value:** A table of all objects or a table of all objects of the
given `type`. See below for usage of these objects.
### mapobject:bounds
{% highlight lua %}
mapobject:bounds()
{% endhighlight %}
**Return value:** x, y position and height, width of the `mapobject`.

**Example use:**
{% highlight lua %}
local x, y, width, height = my_mapobject:bounds()
{% endhighlight %}

**Note:** See [map_get_objects](scripting.html#map_get_objects) for getting a
mapobject object.
### mapobject:name
{% highlight lua %}
mapobject:name()
{% endhighlight %}
**Return value:** Name as set in the mapeditor of the `mapobject`.

**Note:** See [map_get_objects](scripting.html#map_get_objects) for getting
a mapobject object.
### mapobject:property
{% highlight lua %}
mapobject:property(string key)
{% endhighlight %}
**Return value:** The value of the property of the key `key` or nil if
the property does not exists.

**Note:** See [map_get_objects](scripting.html#map_get_objects) for getting a
monsterclass object.
### mapobject:type
{% highlight lua %}
mapobject:type()
{% endhighlight %}
**Return value:** Type as set in the mapeditor of the `mapobject`.

**Note:** See [map_get_objects](scripting.html#map_get_objects) for getting
a mapobject object.
## Monster

### entity:change_anger
{% highlight lua %}
entity:change_anger(handle being, int anger)
{% endhighlight %}
Valid only for monster entities.

Makes the monster more angry about the `being` by adding `anger` to the
being.
### entity:drop_anger
{% highlight lua %}
entity:drop_anger(handle target)
{% endhighlight %}
Valid only for monster entities.

Will drop all anger against the `target`.
### entity:get_angerlist
{% highlight lua %}
entity:get_angerlist()
{% endhighlight %}
Valid only for monster entities.

**Return value:** A table with the beings as key and the anger against them
as values.
### entity:monster_id
{% highlight lua %}
entity:monster_id()
{% endhighlight %}
Valid only for monster entities.

**Return value:** The id of the monster class.
## Monster class

### get_monster_class
{% highlight lua %}
get_monster_class(int monsterid)
get_monster_class(string monstername)
{% endhighlight %}
**Return value:** This function returns a object of the monster class.
See below for usage of that object.
### monsterclass:attacks
{% highlight lua %}
monsterclass:attacks()
{% endhighlight %}
**Return value:** This function returns a table with all attacks of the
monster. See the [Attack Info](scripting.html#attackinfo_class) section.
### monsterclass:name
{% highlight lua %}
monsterclass:name()
{% endhighlight %}
**Return value:** The name of the monster class.
### monsterclass:on_damage
{% highlight lua %}
monsterclass:on_damage(function callback)
{% endhighlight %}
Assigns the `callback` as callback for the monster damage event.
This callback will be called every time when a monster takes damage.
The damage can be either invoked from scripts or from other beings such
as players. The parameters of the callback are: the attacked monster,
the being dealing the damage and the hp loss

**Note:** See [get_monster_class](scripting.html#get_monster_class) for getting
a monsterclass object.

**Example:**
{% highlight lua %}
local function damage(mob, aggressor, hploss)
    mob:say("I took damage -.- ".. hploss)
    if aggressor then
        mob:say("Curse you, ".. aggressor:name())
    end
end
local maggot = get_monster_class("maggot")
maggot:on_damage(damage)
{% endhighlight %}
### monsterclass:on_update
{% highlight lua %}
monsterclass:on_update(function callback)
{% endhighlight %}
Assigns the `callback` as callback for the monster update event. This
callback will be called every tick for each monster of that class.

**Note:** See [get_monster_class](scripting.html#get_monster_class) for getting
a monsterclass object.
## Persistent variables

### getvar_map
{% highlight lua %}
getvar_map(string variablename)
{% endhighlight %}
**Return value:** the value of a persistent map variable.

**See:** [map\[\]](scripting.html#map) for an easier way to get a map variable.
### getvar_world
{% highlight lua %}
getvar_world(string variablename)
{% endhighlight %}
Gets the value of a persistent global variable.

**See:** [world\[\]](scripting.html#world) for an easier way to get a map variable.
### map
{% highlight lua %}
local value = map[string key]
map[string key] = value
{% endhighlight %}
Sets or gets a persistent map variable. The scope of the variable is the
map the script runs on. The value is stored in the database and thus will
survive a server reboot.

**Example:**
{% highlight lua %}
local value = map["a key"]
if value == "some value" then
    map["a key"] = "other value"
end
{% endhighlight %}
### on_mapvar_changed
{% highlight lua %}
on_mapvar_changed(string key, function func)
{% endhighlight %}
Registers a callback to the key. This callback will be called with the key
and value of the changed variable.

**Example:**
{% highlight lua %}
on_mapvar_changed(key, function(key, value)
    log(LOG_DEBUG, "mapvar " .. key .. " has new value " .. value)
end)
{% endhighlight %}
### on_worldvar_changed
{% highlight lua %}
on_worldvar_changed(string key, function func)
{% endhighlight %}
Registers a callback to the key. This callback will be called with the key
and value of the changed variable.

**Example:**
{% highlight lua %}
on_worldvar_changed(key, function(key, value)
    log(LOG_DEBUG, "worldvar " .. key .. " has new value " .. value)
end)
{% endhighlight %}
### remove_mapvar_listener
{% highlight lua %}
remove_mapvar_listener(string key, function func)
{% endhighlight %}
Unassigns a function from getting notified from mapvar changes.
### remove_worldvar_listener
{% highlight lua %}
remove_worldvar_listener(string key, function func)
{% endhighlight %}
Unassigns a function from getting notified from worldvar changes.
### setvar_map
{% highlight lua %}
setvar_map(string variablename, string value)
{% endhighlight %}
Sets the value of a persistent map variable.

**See:** [map\[\]](scripting.html#map) for an easier way to get a map variable.
### setvar_world
{% highlight lua %}
setvar_world(string variablename, string value)
{% endhighlight %}
Sets the value of a persistent global variable.

**See:** [world\[\]](scripting.html#world) for an easier way to get a map variable.
### world
{% highlight lua %}
local value = world[string key]
world[string key] = value
{% endhighlight %}
Sets or gets a persistent world variable. The value is stored in the
database and thus will survive a server reboot.

**Important:** When you are using this function, be aware of race
conditions: It is impossible to prevent that another map changes the value
of a variable between you requesting to old value and setting a new value.

**Example:**
{% highlight lua %}
local value = world["a key"]
if value == "some value" then
    world["a key"] = "other value"
end
{% endhighlight %}
## Scheduling

### atinit
{% highlight lua %}
atinit(function() [function body] end)
{% endhighlight %}
Adds a function which is executed when the gameserver loads the map this
script belongs to. Usually used for placing NPCs or trigger areas and for
setting up cronjobs with schedule_every. Any number of functions can be
added this way.
### on_death
{% highlight lua %}
on_death(handle being, function() [function body] end)
{% endhighlight %}
Executes the ''function body'' when ''being'' is killed. Note that this
doesn't happen anymore after the being left the map. 
### on_remove
{% highlight lua %}
on_remove(handle being, function() [function body] end)
{% endhighlight %}
Executes the ''function body'' when ''being'' is no longer on the map for
some reason (leaves the map voluntarily, is warped away, logs out, cleaned
up after getting killed or whatever).
### schedule_every
{% highlight lua %}
schedule_every(seconds, function() [function body] end)
{% endhighlight %}
Executes the ''function body'' every ''seconds'' seconds from now on.
### schedule_in
{% highlight lua %}
schedule_in(seconds, function() [function body] end)
{% endhighlight %}
Executes the ''function body'' in ''seconds'' seconds.
### schedule_per_date
{% highlight lua %}
schedule_per_date(year, month, day, hour, minute, function() [function body] end)
{% endhighlight %}
Executes the ''function body'' at the given date and time.
## Special info class
See the [specials Documentation](specials.xml.html#a_script_example) for a
script example
### get_special_info
{% highlight lua %}
get_special_info(int specialId)
get_special_info(string specialName)
{% endhighlight %}
**Return value:** This function returns a object of the specialinfo class.
See below for usage of that object.

**Note:** When passing the `specialName` as parameter make sure that it is
formatted in this way: &lt;setname&gt;_&lt;specialname&gt; (for eg. "Magic_Healingspell").
### specialinfo:category
{% highlight lua %}
specialinfo:category(function callback)
{% endhighlight %}
**Return value:** The set-name of the special as defined in the
[specials.xml](specials.xml.html)

**Note:** See [get_special_info](scripting.html#get_special_info) for getting
a specialinfo object.
### specialinfo:name
{% highlight lua %}
specialinfo:name()
{% endhighlight %}
** Return value:** The name of the specialinfo object.

**Note:** See [get_special_info](scripting.html#get_special_info) for getting a
specialinfo object.
### specialinfo:needed_mana
{% highlight lua %}
specialinfo:needed_mana()
{% endhighlight %}
** Return value:** The mana that is needed to use the special

**Note:** See [get_special_info](scripting.html#get_special_info) for getting a
specialinfo object.
### specialinfo:on_recharged
{% highlight lua %}
specialinfo:on_recharged(function callback)
{% endhighlight %}
Assigns the `callback` as callback for the recharged event. This function
will be called everytime when the special is fully recharged.

**Note:** See [get_special_info](scripting.html#get_special_info) for getting
a specialinfo object.
### specialinfo:on_use
{% highlight lua %}
specialinfo:on_use(function callback)
{% endhighlight %}
Assigns the `callback` as callback for the use event. This function will
be called everytime a character uses a special.

**Note:** See [get_special_info](scripting.html#get_special_info) for getting
a specialinfo object.
### specialinfo:rechargeable
{% highlight lua %}
specialinfo:rechargeable()
{% endhighlight %}
** Return value:** A boolean value that indicates whether the special is
rechargeable or usuable without recharge.

**Note:** See [get_special_info](scripting.html#get_special_info) for getting
a specialinfo object.
## Status effect class

### get_status_effect
{% highlight lua %}
get_status_effect(string name)
{% endhighlight %}
**Return value:** This function returns a object of the statuseffect class.
See below for usage of that object.
### statuseffect:on_tick
{% highlight lua %}
statuseffect:on_tick(function callback)
{% endhighlight %}
Sets the callback that gets called for every tick when the status effect
is active.

**Note:** See [get_status_effect](scripting.html#get_status_effect) for getting
a statuseffect object.
## Status effects

### entity:apply_status
{% highlight lua %}
entity:apply_status(int status_id, int time)
{% endhighlight %}
Valid only for being entities.

Gives a being a status effect `status_id`, status effects don't work on
NPCs. `time` is in game ticks.
### entity:has_status
{% highlight lua %}
entity:has_status(int status_id)
{% endhighlight %}
Valid only for being entities.

**Return value:** True if the being has a given status effect.
### entity:remove_status
{% highlight lua %}
entity:remove_status(int status_id)
{% endhighlight %}
Valid only for being entities.

Removes a given status effect from a being.
### entity:set_status_time
{% highlight lua %}
entity:set_status_time(int status_id, int time)
{% endhighlight %}
Valid only for being entities.

Sets the time on a status effect a target being already has.
### entity:status_time
{% highlight lua %}
entity:status_time(int status_id)
{% endhighlight %}
Valid only for being entities.

**Return Value:** Number of ticks remaining on a status effect.

# Needed script bindings

## Area of Effect
Possible missing area of effect functions:

 * get_beings_in_cone
 * get_beings_in_line
