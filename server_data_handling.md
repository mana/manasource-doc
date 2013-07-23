---
title: server data handling
layout: wiki
---
{% include toc.md %}
The Mana server, as a MMORPG server, will need rather a lot of different data. Depending on their scope, the data can used by the server, the client or both.
Maintainers usually tend to put data used by both in the client data along with the rest, and have the server points to it using the `clientDataPath` option from [manaserv.xml](manaserv.xml.html).

The following section will now attempt to describe what data is useful where, and why.

#  Required data

##  Data used only by the servers

The server requires only a few configuration files, located at the path corresponding to the `serverDataPath` manaserv.xml value.

<table class="table table-bordered table-hover" markdown="1">
    <thead>
        <tr>
            <th>File</th>
            <th>Required</th>
            <th>Description</th>
        </tr>
    </thead>
    <tbody>
        <tr>
            <td>[manaserv.xml](manaserv.xml.html)</td>
            <td>Yes</td>
            <td>Main configuration file.</td>
        </tr>
        <tr>
            <td>[maps.xml](maps.xml.html)</td>
            <td>Yes</td>
            <td>Map name to integer ID translation used internally to speed computation.</td>
        </tr>
        <tr>
            <td>[permissions.xml](permissions.xml.html)</td>
            <td>No</td>
            <td>File used to set up account's permissions. Without it, you can't set up admin players.</td>
        </tr>
    </tbody>
</table>

##  Data used by both the client and the servers

<table class="table table-bordered table-hover" markdown="1">
    <thead>
        <tr>
            <th>File</th>
            <th>Required by the server</th>
            <th>Required by the client</th>
            <th>Description</th>
        </tr>
    </thead>
    <tbody>
        <tr>
            <td>[attributes.xml](attributes.xml.html)</td>
            <td>Yes</td>
            <td>Yes <br /> (No for old servers)</td>
            <td>Attributes description and characters starting points. This file is only used by and required for playing with a Mana server.</td>
        </tr>
        <tr>
            <td>[equip.xml](equip.xml.html)</td>
            <td>Yes</td>
            <td>Yes</td>
            <td>Equipment slots description.</td>
        </tr>
        <tr>
            <td>[items.xml](items.xml.html)</td>
            <td>Yes</td>
            <td>Yes</td>
            <td>Items description.</td>
        </tr>
        <tr>
            <td>[skills.xml](skills.xml.html)</td>
            <td>No</td>
            <td>No</td>
            <td>Skills description.</td>
        </tr>
        <tr>
            <td>map files <br /> (`maps/*.tmx`)</td>
            <td>Yes</td>
            <td>Yes</td>
            <td>Map files. Their fienames must be in sync with the [maps.xml](maps.xml.html) file.</td>
        </tr>
        <tr>
            <td>[monsters.xml](monsters.xml.html)</td>
            <td>No</td>
            <td>No</td>
            <td>Monsters description. Without it, no monsters will be available to your world, though.</td>
        </tr>
        <tr>
            <td>[specials.xml](specials.xml.html)</td>
            <td>No</td>
            <td>No</td>
            <td>Special attack descriptions.</td>
        </tr>
    </tbody>
</table>


