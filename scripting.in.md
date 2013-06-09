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

{{body}}

# Needed script bindings

## Area of Effect
Possible missing area of effect functions:

 * get_beings_in_cone
 * get_beings_in_line
