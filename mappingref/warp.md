---
title: mappingref/warp
layout: wiki
---
{% include toc.md %}
#  Map objects - Warp

A warp object can be a source of a warp, a warp destination or both at the same
time.

<table class="table table-bordered table-hover" markdown="1">
    <thead>
        <tr>
            <th>Key</th>
        </tr>
    </thead>
    <tbody>
        <tr>
            <td>DEST_MAP</td>
            <td>Destination map name</td>
        </tr>
        <tr>
            <td>DEST_NAME</td>
            <td>Destination object name</td>
        </tr>
        <tr>
            <td>DEST_X</td>
            <td>Destination X position</td>
        </tr>
        <tr>
            <td>DEST_Y</td>
            <td>Destination Y position</td>
        </tr>
        <tr>
            <td>EXIT_DIRECTION</td>
            <td>Exit direction, one of NORTH, EAST, SOUTH, WEST</td>
        </tr>
    </tbody>
</table>


##  Warping to absolute coordinates

To warp to absolute coordinates, you only need one warp object providing
the following properties: DEST_MAP, DEST_X, DEST_Y.

**NOTE:** This is the old way of doing warps. You should generally avoid it.


##  Warping to an object

To warp to an object, you need two warp map objects. One of them is the source,
the other is the destination.

The source object needs the following properties: DEST_MAP, DEST_NAME.

The destination object doesn't need any properties. The player will appear
in the center of that object after warping.

To make a two way warp, you need a total of 4 objects, 2 entrances and 2 exits.

This kind of warps work well for going from outdoor to indoor maps,
however in manaserv git repository, there is an even better way (read below).


##  Warping between objects

You can define how the player should exit a warp target. This is achieved
with EXIT_DIRECTION property.

By specifying NORTH, EAST, SOUTH or WEST in the EXIT_DIRECTION property
on the warp target object, you tell  where the player should appear when
exiting the warp relativelly to the warp target object.

The exit position is also interpolated, relative to the entry point, to allow
creating large warp areas, perfect for moving between large outdoor areas.

As side effect, since the player is exiting outside the warp target, the same
object can serve as warp entrance and warp exit. Thanks to this you only two
object to make a two way warp.

**NOTE:** you should leave at least two walkable tiles on the exit side,
to make sure the player has room to move when exiting the warp point.
