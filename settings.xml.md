---
title: settings.xml
layout: wiki
---
{% include toc.md %}
#  Description

Since Mana 0.7, the `settings.xml` file defines all the settings for the game. It
replaces the predefined files that were used before, like `npcs.xml`, `monsters.xml`,
`items.xml`, etc. The new format allows including arbitrary additional files,
which gives total freedom of the structure of the settings. The meaning of each node
is based on the name of its tag.

FIXME: Update these docs to no longer link to the old file names.

FIXME: There are still some setting files that are not supported in this new structure, which are `equip.xml`, `paths.xml` and `skills.xml` (client-side).

##  &lt;color&gt;

See [hair.xml](hair.xml.html).

##  &lt;effect&gt;

See [effects.xml](effects.xml.html).

##  &lt;emote&gt;

See [emotes.xml](emotes.xml.html).

##  &lt;item&gt;

See [items.xml](items.xml.html).

##  &lt;monster&gt;

See [monsters.xml](monsters.xml.html).

##  &lt;npc&gt;

See [npcs.xml](npcs.xml.html).

##  &lt;status-effect&gt;

See [statis-effects.xml](statis-effects.xml.html).

##  &lt;unit&gt;

Defines a unit of measurement. Supported units are 'currency' and 'weight'.

See [units.xml](units.xml.html).

##  &lt;attribute&gt;

Defines an attribute. Used only for the Mana server.

See [attributes.xml](attributes.xml.html).

##  &lt;points&gt;

Defines character starting points. Used only for the Mana server.

See [attributes.xml](attributes.xml.html).

##  &lt;special-set&gt;

Defines a set of specials. Used only for the Mana server. For backwards compatibility, a &lt;set&gt; node inside a file with &lt;specials&gt; as its root element is also interpreted as &lt;special-set&gt;.

See [specials.xml](specials.xml.html).

##  &lt;skill-set&gt;

Defines a set of skills. For backwards compatibility, a &lt;set&gt; node inside a file with &lt;skills&gt; as its root element is also interpreted as &lt;skill-set&gt;.

FIXME: Current this element is only supported server-side, the client still reads `skills.xml` directly.

See [skills.xml](skills.xml.html).
