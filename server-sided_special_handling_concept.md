---
title: server-sided special handling concept
layout: wiki
---
{% include toc.md %}
#  Server-sided special handling

##  Introduction

A special, in Manaserv terminology, is what some other games call a "Skill" or "Ability". It is a character property which is acquired during gameplay and gives an advantage to the character. It can either be an action the character can perform, like a spell, a special attack or just performing an emote. Or it can be a passive ability which does not need to be activated but always gives a bonus after acquiring it.

The specials are a central part of the individual gameplay experience of a server. For that reason they must be highly customizable. But on the other hand it must not be too complicated to allow server administrators to implement their concepts without a too steep learning curve.

##  Use cases for specials
 * Magic spells
 * Physical special attacks
 * Emoticons
 * Character classes and their passive attribute bonusses
 * Passive attribute bonusses

##  What information is needed

###  Server-sided properties
These information are required by the core engine for managing when a character may use a special

 * Is it an active special?
 * Mana cost when using the TMW Manaflow system
 * SP cost when using the classical point-based system
 * Cooldown time
 * Target mode (self, friend, enemy, map location)
 * Does it require a specific weapon to be equipped

###  Server-sided passive effects
The requirements for this are mostly the same as for items, so the implementation can be copied directly from [items.xml](items.xml.html)

###  Server-sided use mechanics
The server also needs to know what happens when the character uses a special. While it could be possible to handle the most common use cases with xml, almost every server admin will desire at least some specials with more obscure effects which can not be covered that easily with XML notation. For that reason I propose to handle all effects with LUA scripts, but allow to define a handler function as well as some arguments which are passed to it, for every special in the xml code, while also providing a library of script functions which cover the most common use cases.

 * Script function
    * Arguments to script function

###  Client-sided properties
The client also needs some additional information to know how to visualize the special.

 * Name
 * Icon in special dialog
 * Visual representation
 * Audio representation

##  Requirements
 * Some servers want to use predefined specials (MDD, TAW)
 * Some servers want to use procedurally generated specials (TMW)

Predefined specials would prefer an xml configuration file which allows to define all properties for specials. A procedural system, on the other hand, would prefer to call a script function which outputs all properties of specials.

To fulfill both requirements I propose a hybrid approach of first searching in the specials.xml by ID and when the special isn't listed there try to calculate it by the script engine.

When the server gives a special to a character:
  - its properties are first searched in specials.xml by ID number
  - When no entry is found, the request is passed to a function of the script engine which returns a table with the properties

When a client uses a special
  - it is first searched in specials.xml by ID number. When it has a use function defined, this function is called
  - When no entry is found in specials.xml, the request is passed to a default function in the script engine

##  get_properties function
  get_properties(Being user, int specialID)

This function is called in special_actions.lua when a specialID is not defined in specials.xml and is supposed to return a table with all the properties which are usually listed there.

##  Use functions
Script functions are defined in special_actions.lua. This is the signature of all special script functions:

{% highlight lua %}
function_name(Being user, Being target, Integer mapX, Integer mapY, Integer equipSlot, Integer arg1, Integer arg2, [...], Integer argn)

{% endhighlight %}

These are the parameters of the function:
<table class="table table-bordered table-hover" markdown="1">
    <thead>
        <tr>
            <th>Parameter</th>
            <th>purpose</th>
        </tr>
    </thead>
    <tbody>
        <tr>
            <td>user</td>
            <td>Being handle of the character which uses the skill</td>
        </tr>
        <tr>
            <td>target</td>
            <td>Being on which the skill is aimed (nil for map-based or targetless effects)</td>
        </tr>
        <tr>
            <td>mapX</td>
            <td>Horizontal location in pixels the skill is aimed at (nil for being-based or targetless effects)</td>
        </tr>
        <tr>
            <td>mapY</td>
            <td>Vertical location in pixels the skill is aimed at (nil for being-based or targetless effects)</td>
        </tr>
        <tr>
            <td>equipSlot</td>
            <td>Equip slot with the weapon which was required for using this skill (might be relevant for several damage calculations)</td>
        </tr>
        <tr>
            <td>argX</td>
            <td>Argument values which are defined in specials.xml. Their meaning is specific to the function.</td>
        </tr>
    </tbody>
</table>

When a special is not found in specials.xml, the default script function "use_special" is called:

  use_special(Being user, Being target, Integer mapX, Integer mapY, Integer specialId)

This function allows to implement a completely procedural custom special system by giving the characters specials with IDs not listed in specials.xml.

##  Discussion

&lt;code comment Bertram 2011/08/22&gt;
Hi,

I like the proposal of an hybrid approach since you first mentioned it :)

Yet, I've got several requests and questions:
- Since I'll soon be on getting skills back, could you add a small note about the difference between a skill and a special and why they can't be merged (AFAIK)?
- Even if the attributes are the same than items.xml,can we have a small snippet with all the use cases in it?
- What happens when a script is defined in the specials.xml file, has a function defined and has an entry in the use_special function?
- How will the client display (if it has to) the specials not defined in the xml file at all?

