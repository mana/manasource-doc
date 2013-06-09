---
title: specials.xml
layout: wiki
---
{% include toc.md %}
#  Special Overview
Specials in Manaserv are special attacks or abillities by characters that are actively triggered by the player. For example magic spells, special attacks or specific actions of the character can be implemented using specials.

#  specials.xml Documentation

The specials.xml file is used to set up the different special moves and capacity used by the player while in game.

**Warning: WIP** Currently, the implementation isn't fully tested. Feel free to [report bug in our mantis](mantis_workflow.html).

Here is an example of a specials.xml file:

{% highlight xml %}
<?xml version="1.0" encoding="utf-8"?>
<specials>
    <set name="Magic">
        <special
            id="1"
            name="Test Spell 1"
            rechargeable="true"
            needed="100"
            rechargespeed="10"
            icon="icons/spell_1.png"
        />
        <special
            id="2"
            name="Test Spell 2"
            rechargeable="true"
            needed="1000"
            rechargespeed="10"
            target="being"
            icon="icons/spell_2.png"
        />
    </set>
</specials>
{% endhighlight %}

<table class="table table-bordered table-hover" markdown="1">
    <thead>
        <tr>
            <th colspan="7">`skills` node</th>
        </tr>
    </thead>
    <tbody>
        <tr>
            <th colspan="7">`set` child node</th>
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
            <td>name</td>
            <td>**string**</td>
            <td>yes</td>
            <td>no</td>
            <td>no</td>
            <td>""</td>
            <td>The special group name. Sets are used to visually group specials in the same tab in the client's specials window.</td>
        </tr>
        <tr>
            <th colspan="7">`special` child node</th>
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
            <td>yes</td>
            <td>yes</td>
            <td>0</td>
            <td>The special Id used internally. Must be \&amp;gt; 0 and unique.</td>
        </tr>
        <tr>
            <td>name</td>
            <td>**string**</td>
            <td>yes</td>
            <td>yes</td>
            <td>yes</td>
            <td>-</td>
            <td>The special name.</td>
        </tr>
        <tr>
            <td>icon</td>
            <td>**string**</td>
            <td>no</td>
            <td>no</td>
            <td>no</td>
            <td>""</td>
            <td>The icon image displayed in the client.</td>
        </tr>
        <tr>
            <td>rechargeable</td>
            <td>**boolean**</td>
            <td>yes</td>
            <td>no</td>
            <td>yes</td>
            <td>"true"</td>
            <td>Whether the special is rechargeable. Unrechargable specials are possible to use any time without the need to wait for a reload.</td>
        </tr>
        <tr>
            <td>needed</td>
            <td>**integer**</td>
            <td>yes</td>
            <td>no</td>
            <td>yes</td>
            <td>0</td>
            <td>The amount of `mana` that the specials needs to be triggered (Obsolete if `rechargable` is false.</td>
        </tr>
        <tr>
            <td>rechargespeed</td>
            <td>**integer**</td>
            <td>no</td>
            <td>no</td>
            <td>yes</td>
            <td>0</td>
            <td>The default recharge of `mana` per game tick (100ms). Overwriteable for each character using scripts. Obsolete if `rechargable` is false.</td>
        </tr>
        <tr>
            <td>target</td>
            <td>**string**</td>
            <td>yes</td>
            <td>no</td>
            <td>yes</td>
            <td>"being"</td>
            <td>The target mode of the special. Possible values: <br /> "being" - targets beings <br /> "point" - targets a point on the map (**CLIENT IS LACKING SUPPORT**) <br /> If you do not need a target simply set it to "being".</td>
        </tr>
    </tbody>
</table>


#  A script example
Here is an example special. It implements a heal spell that can heal other people or yourself.
The example also shows how it is possible to link the specials to [skills](skills.xml.html).

First the needed entry in the [specials.xml](specials.xml.html#specials.xml_documentation):
{% highlight xml %}
        <!-- ... -->
        <special
            id="4"
            name="Heal"
            rechargeable="true"
            needed="17500"
            rechargespeed="175"
        />
        <!-- ... -->
{% endhighlight %}

Then the definition in the [skills.xml](skills.xml.html). This is of course *only* needed if you want to link the special to a skill. This is not directly needed for specials. It is only needed in this example.
{% highlight xml %}
    <!-- ... -->
    <set name="Magic">
        <!-- ... -->
        <skill id="203" name="Heal"
            icon="icons/spell_heal.png"/>
        <!-- ... -->
    </set>
    <!-- ... -->
{% endhighlight %}

And finally the lua script (see the [scripting documentation](scripting.html#special_info_class) for more info):
{% highlight lua %}
local skill_name = "Magic_Heal"
local heal = 20
local range = 6 * TILESIZE

-- Here we get the special info by the name (<setname>_<specialname>)
-- For getting it by id simply use the id instead of a string.
local spell = get_special_info("Magic_Heal")
spell:on_use(function(user, target, special_id)
    -- Either target a player or if no target is selected the user
    target = target or user
    if being_type(target) ~= TYPE_CHARACTER and target ~= user then
        return
    end 

    local heal_mod = heal * get_special_factor(user, skill_name)

    -- Spawn a effect on the target
    effect_create(11, target)
    
    -- Calculate the effect of heal
    local current_hp = being_get_modified_attribute(target, ATTR_HP)
    local max_hp = being_get_modified_attribute(target, ATTR_MAX_HP)

    heal_mod = math.min(heal_mod, max_hp - current_hp)
    local gained_exp = math.floor(heal_mod / 10) 

    -- Stop since nothing would be healed
    if heal_mod == 0 then
        return
    end 
    
    -- Actually do the healing
    being_set_base_attribute(target, ATTR_HP, current_hp + heal_mod)

    -- No exp for self heal
    if target ~= user then
        -- This gives the player XP for the Heal skill.
        -- As mentioned before, linking with skills if of course fully optional and not required.
        chr_give_exp(user, skill_name, gained_exp)
    end

    -- Consume the mana --> Force the special to recharge
    chr_set_special_mana(user, special_id, 0)
end)
{% endhighlight %}

So the structure of a special generally looks like this:
{% highlight lua %}
-- Here we get the special info by the name (<setname>_<specialname>)
-- For getting it by id simply use the id instead of a string.
local spell = get_special_info("setname_specialname")
spell:on_use(function(user, target, special_id)

    -- Define the effect of the special here!

    -- Consume the mana --> Force the special to recharge
    chr_set_special_mana(user, special_id, 0)
end)
{% endhighlight %}
