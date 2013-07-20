---
title: attributes.xml
layout: wiki
---
{% include toc.md %}
#  Description
Attributes are basically variables of beings. They can determinate things like HP, Movement speed, ...

An attribute consists of two values. A base value and a modified value.

##  base - value

Each attribute has a *base value*. This value for example determines the current HP of a being.

##  modifier - value(s)
Then every attribute can have multiple *modifiers*. Modifiers are a bit more complex. They are basically **layers** that define how bonuses are added to the base value. The layers themselves contain the actual modifications like item bonuses, status effect bonuses, and so on. So if you have an item that changes an attribute you likely want to make it modify one of the modifier layers.

Modifiers can either be `additive` or `multiplicative`. Additive modifiers simply add up like this:
`previousLayers + currentLayer`

Multiplicative modifiers work analogous to the additive ones:
`previousLayers * currentLayer`

There are three different kinds of modifiers:
#####  stackable - modifier
The stackable modifier is really simple. It simply sums (or multiplies) all modifications in this layer and adds (or multiplies) to the value of the previous layer.

#####  non stackable - modifier
From all modifications inside of a non stackable modifier layer only the best (highest) modification is picked. If this modification is higher then the previous layers it will replace the previous layers with this value. Otherwise nothing happens and the previous layers stay untouched. Of course using `multiplicative` makes no sense since it only replaces previous values.

#####  non stackable bonus - modifier
The non stackable bonus works similar to the non stackable one. It will pick the best modification within the layer too. But it won't replace the previous layers but add (or multiply) to them. However it will **also** add if the modification would lower the value of the previous layers (**unlike** the non stackable modifier)!

###  Example calculation
Lets assume the following situation:

The base of the attribute is

There are 3 modifiers:
<table class="table table-bordered table-hover" markdown="1">
    <thead>
        <tr>
            <th>Name (tag)</th>
            <th>Stacktype</th>
            <th>Effecttype</th>
            <th>Active modifications withing the layer</th>
        </tr>
    </thead>
    <tbody>
        <tr>
            <td>example1</td>
            <td>stackable</td>
            <td>multiplicative</td>
            <td>`{1.3; 0.9; 1.1}`</td>
        </tr>
        <tr>
            <td>example2</td>
            <td>non stackable</td>
            <td>additive</td>
            <td>`{10.0; 3.0; 1.0}`</td>
        </tr>
        <tr>
            <td>example3</td>
            <td>non stackable bonus</td>
            <td>additive</td>
            <td>`{2.0; 3.4; 5.1}`</td>
        </tr>
    </tbody>
</table>

And lets assume the base as `9.0`:

    current = 9.0
    
    apply example1:
        # Since the layer is stackable and multiplicative all will be simply multiplied:
        mod_example1 = 1.3 * 0.9 * 1.1
        current = current * mod_example
    
    # current is 11.583 (9 * 1.3 * 0.9 * 1.1)
    
    apply example2:
        # Since the layer is non stackable we only have to check for the highest value:
        mod_example2 = 10.0
    
        If current < mod_example2 Then
            current = mod_example2
    
    # current is still 11.583 since 10.0 was smaller than it
    
    apply example3:
        # Since the layer is non stackable bonus we only have to check for the highest value:
        mod_example3 = 5.1
        # Since type is additive we simply add this to the previous value:
        current = current + mod_example3
    
    # current is 16.683 ((9 * 1.3 * 0.9 * 1.1) + 5.1)


So our actual attribute value will be 16.683.

FIXME: Check if non stackable really replaces the base value too

##  storage in database
The database saves both the base + the sum of modification of all modifiers. However the game server will never use the stored modification. It will always recalculate it. So there is no need to worry about changing the database when modifying attribute mods in the items.xml for example. However be careful with setting the base attribute in scripts since it will be persistent.

##  Dependencies between attributes
You will most likely want to have multiple attributes that depend on each other
or change others. To implement this you have to do the recalculation in your
scripts.

To do this you have two callbacks which will tell you when you need to do
recalculations:
 * [on_update_derived_attribute](scripting.html#on_update_derived_attribute)
 * [on_recalculate_base_attribute](scripting.html#on_recalculate_base_attribute)

Here is an example that shows how this recalculation could look like:

{% highlight lua %}
local function recalculate_base_attribute(being, attribute)
    local old_base = being_get_base_attribute(being, attribute)
    local new_base = old_base
    if attribute == ATTR_ACCURACY then
        -- Provisional
        new_base = being_get_modified_attribute(being, ATTR_DEX)
    elseif attribute == ATTR_DEFENSE then
        new_base = 0.3 * being_get_modified_attribute(being, ATTR_VIT)
    elseif attribute == ATTR_DODGE then
        -- Provisional
        new_base = being_get_modified_attribute(being, ATTR_AGI)
    elseif attribute == ATTR_HP_REGEN then
        local hp_per_sec = being_get_modified_attribute(being, ATTR_VIT) * 0.05
        new_base = hp_per_sec * TICKS_PER_HP_REGENERATION / 10
    elseif attribute == ATTR_HP then
        local hp = being_get_modified_attribute(being, ATTR_HP)
        local max_hp = being_get_modified_attribute(being, ATTR_MAX_HP)

        if hp > max_hp then
            new_base = new_base - hp - max_hp
        end
    elseif attribute == ATTR_MAX_HP then
        local vit = being_get_modified_attribute(being, ATTR_VIT)
        new_base = (vit + 3) * (vit + 20) * 0.125
    end

    if new_base ~= old_base then
        being_set_base_attribute(being, attribute, new_base)
    end
end

local function update_derived_attributes(being, attribute)
    if attribute == ATTR_STR then
        recalculate_base_attribute(ATTR_INV_CAPACITY, being)
    elseif attribute == ATTR_AGI then
        recalculate_base_attribute(ATTR_DODGE, being)
    elseif attribute == ATTR_VIT then
        recalculate_base_attribute(ATTR_MAX_HP, being)
        recalculate_base_attribute(ATTR_HP_REGEN, being)
        recalculate_base_attribute(ATTR_DEFENSE, being)
    end
end

on_recalculate_base_attribute(recalculate_base_attribute)
on_update_derived_attribute(update_derived_attributes)
{% endhighlight %}

The script should be pretty self-explanatory. If an attribute is changed
`update_derived_attributes` is called. That function then checks which
attributes have to get recalculated and recalculates them.

#  attributes.xml

The attributes.xml file is used to set up the different usable attributes for beings in the game world. Attribute scopes are typically as being, but monster and character scopes are available as well.

The attribute types are still hardcoded into the game-server - this file determines how the attribute can be further modified past the base value.
Calculation of the base value is hardcoded - see the virtual being updateDerivedAttributes() method for details.

Additional (non-core) attributes can be specified in the file, but would have undefined base values (should still be alterable via scripts)

As of a822f8f257aaec37174a11add3543ef70a29e206, the following attributes (and associated ids) are:

<table class="table table-bordered table-hover" markdown="1">
    <thead>
        <tr>
            <th>Attribute name</th>
            <th>id</th>
        </tr>
    </thead>
    <tbody>
        <tr>
            <td>Strength</td>
            <td>1</td>
        </tr>
        <tr>
            <td>Agility</td>
            <td>2</td>
        </tr>
        <tr>
            <td>Vitality</td>
            <td>3</td>
        </tr>
        <tr>
            <td>Intelligence</td>
            <td>4</td>
        </tr>
        <tr>
            <td>Dexterity</td>
            <td>5</td>
        </tr>
        <tr>
            <td>Willpower</td>
            <td>6</td>
        </tr>
        <tr>
            <th colspan="2">&nbsp;</th>
        </tr>
        <tr>
            <td>Accuracy</td>
            <td>7</td>
        </tr>
        <tr>
            <td>Defence</td>
            <td>8</td>
        </tr>
        <tr>
            <td>Dodge</td>
            <td>9</td>
        </tr>
        <tr>
            <th colspan="2">&nbsp;</th>
        </tr>
        <tr>
            <td>Magic dodge</td>
            <td>10</td>
        </tr>
        <tr>
            <td>Magic defence</td>
            <td>11</td>
        </tr>
        <tr>
            <th colspan="2">&nbsp;</th>
        </tr>
        <tr>
            <td>Bonus aspd</td>
            <td>12</td>
        </tr>
        <tr>
            <th colspan="2">&nbsp;</th>
        </tr>
        <tr>
            <td>Hp</td>
            <td>13</td>
        </tr>
        <tr>
            <td>Max hp</td>
            <td>14</td>
        </tr>
        <tr>
            <td>Hp regen</td>
            <td>15</td>
        </tr>
        <tr>
            <th colspan="2">&nbsp;</th>
        </tr>
        <tr>
            <td>Movespeed (tps)</td>
            <td>16</td>
        </tr>
        <tr>
            <td>Movespeed (raw)</td>
            <td>17</td>
        </tr>
        <tr>
            <td>Gp</td>
            <td>18</td>
        </tr>
        <tr>
            <td>Capacity (invy)</td>
            <td>19</td>
        </tr>
        <tr>
            <th colspan="2">The following are also defined (for mobs only), but are merely temporary until mobs are altered to properly use auto-attacks.</th>
        </tr>
        <tr>
            <td>Physical atk (min)</td>
            <td>20</td>
        </tr>
        <tr>
            <td>Physical atk (delta)</td>
            <td>21</td>
        </tr>
        <tr>
            <td>Magical atk</td>
            <td>22</td>
        </tr>
    </tbody>
</table>

Up to date definitions can be found in defines.h and in relevant updateDerivedAttributes methods.

Here is an example of an attributes.xml file:
It is recommended to use exactly this file for now: [attributes reference file](https://github.com/mana/manaserv/blob/master/example/attributes.xml)

{% highlight xml %}
<?xml encoding="UTF-8" version="1.0"?>
<attributes>
    <points start="100" minimum="1" maximum="20" />

    <attribute id="1" name="Strength" desc="Increases carrying capacity and increases damage for many melee weapons." scope="being">
        <modifier tag="str" effect="Strength %+.1f" stacktype="stackable" modtype="additive" />
    </attribute>
    <!-- ... -->
    <attribute id="15" name="Hitpoint regeneration" tag="hpregen" effect="hp regen +%d" desc="The rate at which hitpoints are automatically replenished." modifiable="false" scope="being">
        <modifier stacktype="non stackable bonus" modtype="multiplicative" tag="hpr1" effect="You shouldn't be seeing this. Items shouldn't be affecting this layer."/> <!-- Reserved for map effects -->
        <modifier stacktype="non stackable bonus" modtype="multiplicative" tag="hpr2" effect="Hitpoint regeneration x%.2f" additional="This modifier does not stack with other ##1Basic##0 hitpoint regeneration type effects."/> <!-- Reserved for passive item effects -->
        <modifier stacktype="stackable" modtype="multiplicative" tag="hpr3" effect="Hitpoint regeneration x%.2f"/> <!-- Reserved for active effects -->
        <modifier stacktype="stackable" modtype="additive" tag="hpr4" effect="Hitpoint regeneration %+.2f"/> <!-- General purpose -->
        <modifier stacktype="non stackable bonus" modtype="multiplicative" tag="hpr5" effect="Hitpoint regeneration x%.2f" additional="This modifier does not stack with other ##1Greater##0 hitpoint regeneration type effects."/> <!-- For *Very* powerful effects only -->
    </attribute>
    <!-- ... -->
</attributes>
{% endhighlight %}

<table class="table table-bordered table-hover" markdown="1">
    <thead>
        <tr>
            <th colspan="7">`attributes` node</th>
        </tr>
    </thead>
    <tbody>
        <tr>
            <th colspan="7">`points` child node</th>
        </tr>
        <tr>
            <th>Parameter name</th>
            <th>Type</th>
            <th>Required in client</th>
            <th>Required in account-server</th>
            <th>Required in game-server</th>
            <th>Default value</th>
            <th>Description</th>
        </tr>
        <tr>
            <td>start</td>
            <td>**integer**</td>
            <td>yes</td>
            <td>yes</td>
            <td>no</td>
            <td>0</td>
            <td>The characters' starting points. Here are the points a player can distribute in modifiable attributes when creating a new character.</td>
        </tr>
        <tr>
            <td>minimum</td>
            <td>**integer**</td>
            <td>yes</td>
            <td>yes</td>
            <td>no</td>
            <td>0</td>
            <td>The minimum permitted value of a modifiable attribute when creating a character.</td>
        </tr>
        <tr>
            <td>maximum</td>
            <td>**integer**</td>
            <td>yes</td>
            <td>yes</td>
            <td>no</td>
            <td>0</td>
            <td>The maximum permitted value of a modifiable attribute when creating a character.</td>
        </tr>
        <tr>
            <th colspan="7">`attribute` child node</th>
        </tr>
        <tr>
            <th>Parameter name</th>
            <th>Type</th>
            <th>Required in client</th>
            <th>Required in account-server</th>
            <th>Required in game-server</th>
            <th>Default value</th>
            <th>Description</th>
        </tr>
        <tr>
            <td>id</td>
            <td>**integer**</td>
            <td>yes</td>
            <td>when modifiable</td>
            <td>yes</td>
            <td>0</td>
            <td>The attribute id. Must be unique, non-zero, and match between the server and the client.</td>
        </tr>
        <tr>
            <td>name</td>
            <td>**string**</td>
            <td>yes</td>
            <td>no</td>
            <td>no</td>
            <td>""</td>
            <td>The attribute name displayed by the client.</td>
        </tr>
        <tr>
            <td>desc</td>
            <td>**string**</td>
            <td>no</td>
            <td>no</td>
            <td>no</td>
            <td>""</td>
            <td>The attribute description displayable as a tooltip in the client for instance.</td>
        </tr>
        <tr>
            <td>modifiable</td>
            <td>**boolean** <br /> false/true</td>
            <td>yes</td>
            <td>yes</td>
            <td>yes</td>
            <td>no</td>
            <td>Defines whether the player is able to put points in the attribute. Must match for all three definitions. Modifiable attributes are displayed at character's creation and modifiable when the character levels up. Other attributes are usually derived ones only modified by the server and modified in the client on server's request.</td>
        </tr>
        <tr>
            <td>scope</td>
            <td>**string** <br /> *predefined values:* <br /> being, monster, character, none</td>
            <td>yes</td>
            <td>no</td>
            <td>yes</td>
            <td>-</td>
            <td>The attribute's scope used to know what types of beings have this attribute. <br /> Note that being scope attributes apply to all beings, including monsters and characters.</td>
        </tr>
        <tr>
            <th colspan="7">`modifier` child node to `attribute`. Not required in the account-server. Optional in the client.</th>
        </tr>
        <tr>
            <th>Parameter name</th>
            <th>Type</th>
            <th>Required in client</th>
            <th>Required in account-server</th>
            <th>Required in game-server</th>
            <th>Default value</th>
            <th>Description</th>
        </tr>
        <tr>
            <td>tag</td>
            <td>**string**</td>
            <td>optional</td>
            <td>no</td>
            <td>yes</td>
            <td>-</td>
            <td>The attribute's modifier tag. Must be unique.</td>
        </tr>
        <tr>
            <td>effect</td>
            <td>**string**</td>
            <td>optional</td>
            <td>no</td>
            <td>no</td>
            <td>""</td>
            <td>If provided, the client will use as a format specifier to describe the effect to this layer whenever a reference to this layer is found. For instance, given a stackable additive layer for agility, an appropriate format specifier would be "Agility %+.1f". For example an item that applies +3 on equip to this layer would show "Agility +3.0 upon successful equip" in the item's description, along with any other specifiers (such as note or additional) in the item definition.</td>
        </tr>
        <tr>
            <td>stacktype</td>
            <td>**string** <br /> *predefined values:* <br /> stackable, <br /> non stackable, <br /> non stackable bonus</td>
            <td>no</td>
            <td>no</td>
            <td>yes</td>
            <td>-</td>
            <td>Defines how modifiers on this layer apply when other modifiers on this layer are present. <br /> **Stackable** modifiers are precisely this - all modifiers on this layer apply. <br /> **Non stackable** modifiers will only apply one modifier at a time - the character will automatically use the highest modifier at this level. If a new modifier has an effect greater than that of the previous highest modifier and/or previous base value, it takes precedence over them. Otherwise, there is no effect. <br /> **Non stackable bonus** modifiers are similar to **Non stackable** modifiers, but will apply on top of the previous base value.</td>
        </tr>
        <tr>
            <td>modtype</td>
            <td>**string** <br /> *predefined values:* <br /> additive, <br /> multiplicative</td>
            <td>no</td>
            <td>no</td>
            <td>yes</td>
            <td>-</td>
            <td>The modifier type. <br /> **Additive** modifiers are applied additively: base + mod1 + mod2 + ... modn; (greatest)modx; base + (greatest)modx for stackable, non stackable, and non stackable bonus respectively. <br /> **Multiplicative** modifiers are applied using multiplication: base x mod1 x mod2 x ... x modn; (greatest)modx; base x (greatest)modx for stackable, non-stackable, and non-stackable bonus respectively.</td>
        </tr>
    </tbody>
</table>
