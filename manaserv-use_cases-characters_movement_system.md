---
title: manaserv-use cases-characters movement system
layout: wiki
---
{% include toc.md %}
#  Mana Server - Use cases for the Characters' movement system

Here is a list of proposed use cases to test the quality of the movement system under the Mana server:

**Component description:**

The server sided movement system is tile-based under the Mana server. On the contrary, the client emulates pixel coordinates
handling in order to attempt to smooth the user experience.
Please keep in mind that characters/monsters/ NPC/... are moving pixel-wise while keeping a tile logic, expecially for collision handling.

Please, also make use of the F key to toggle the grid and path view when testing.

As a last note, the current use case are made against the &lt;del&gt;http://gitorious.org/~bertram/mana/mana-manaserv-movement-fixes&lt;/del&gt; branch.

**Prerequisites:** To be able to realise these tests, a compiled version of the client of the above branch and a fully running the Mana server version is necessary. You should also be able to connect to the server with some prepared testing maps, characters, and monsters. Some collision case should also be available in these maps to test the corresponding cases. Last but not least, don't forget to enable debug mode with the default 'F' key, to actually view the being's path existence, and other useful things.

<table class="table table-bordered table-hover" markdown="1">
    <thead>
        <tr>
            <th>Use case</th>
            <th>Description</th>
            <th>Expected</th>
            <th colspan="2">Results</th>
        </tr>
    </thead>
    <tbody>
        <tr>
            <th>:::</th>
            <th>:::</th>
            <th>:::</th>
            <th>Git Version</th>
            <th>Next version</th>
        </tr>
        <tr>
            <th colspan="5">General view</th>
        </tr>
        <tr>
            <td>?</td>
            <td>?</td>
            <td>?</td>
            <td>?</td>
            <td>?</td>
        </tr>
        <tr>
            <th colspan="5">Player Mouse pathfinding tests</th>
        </tr>
        <tr>
            <td>Make a one tile away click</td>
            <td>Try to click one tile away from the character. <br /> Neither the destination tile nor its surroundings should be blocking to test the simplest walkability.</td>
            <td>The character walks directly to that pixel exact position.</td>
            <td>ok</td>
            <td>?</td>
        </tr>
        <tr>
            <td>Make a few tile away click</td>
            <td>Try to click a few tile away from the character. <br /> Neither the destination tile nor its surroundings should be blocking to test the simplest walkability.</td>
            <td>The character walks directly to that pixel exact position.</td>
            <td>ok</td>
            <td>?</td>
        </tr>
        <tr>
            <td>Make a few tile away click with obstacles</td>
            <td>Try to click a few tile away from the character. <br /> Between the start and destination tile, there should be blocking tiles along the way but a path should be existing.</td>
            <td>The character walks to that pixel exact position avoiding smoothly obstacles.</td>
            <td>ok</td>
            <td>?</td>
        </tr>
        <tr>
            <td>Make the character go through a narrow (1 tile free) passageway</td>
            <td>Try to make the character go between two blocking tiles in one or more path tiles. <br /> Between the start and destination tile, there should be blocking tiles along the way but a path should be existing.</td>
            <td>The character walks to that pixel exact position avoiding smoothly obstacles.</td>
            <td>ok</td>
            <td>?</td>
        </tr>
        <tr>
            <td>Test blocking corners.</td>
            <td>Try to make the character do a quarter-turn on each corner of a blocking tile. <br /> A path should still be existing.</td>
            <td>The character walks to that pixel exact position avoiding smoothly obstacles.</td>
            <td>ok</td>
            <td>?</td>
        </tr>
        <tr>
            <td>Go through-wall test.</td>
            <td>Try to click on a collision-free tile as no path is found to go there.</td>
            <td>The character should do nothing.</td>
            <td>ok</td>
            <td>?</td>
        </tr>
        <tr>
            <th colspan="5">Player keyboard pathfinding tests</th>
        </tr>
        <tr>
            <td>Mouse walking interruption.</td>
            <td>Try to click on a tile with a valid path, and interrupt the character while it is moving with keyboard movement keys.</td>
            <td>The character should start to move correspondingly to the keyboard input.</td>
            <td>ok</td>
            <td>?</td>
        </tr>
        <tr>
            <td>Smallest move.</td>
            <td>Try to push a keyboard movement key as short as you can.</td>
            <td>The character should do a very small move within the same tile, proving pixel exact client efficience.</td>
            <td>ok</td>
            <td>?</td>
        </tr>
        <tr>
            <td>Make a one tile away move</td>
            <td>Try to move one tile away from the character. <br /> Neither the destination tile nor its surroundings should be blocking to test the simplest walkability.</td>
            <td>The character walks directly to that pixel exact position.</td>
            <td>ok</td>
            <td>?</td>
        </tr>
        <tr>
            <td>Make a few tile away move</td>
            <td>Try to move a few tile away from the character. <br /> Neither the destination tile nor its surroundings should be blocking to test the simplest walkability.</td>
            <td>The character walks directly to that pixel exact position.</td>
            <td>ok</td>
            <td>?</td>
        </tr>
        <tr>
            <td>Make a few tile away move with obstacles</td>
            <td>Try to move a few tile away from the character. <br /> Between the start and destination tile, there should be blocking tiles along the way but a path should be existing.</td>
            <td>The character walks to that pixel exact position avoiding smoothly obstacles.</td>
            <td>ok</td>
            <td>?</td>
        </tr>
        <tr>
            <td>Make the character go through a narrow (1 tile free) passageway</td>
            <td>Try to make the character go between two blocking tiles in one or more path tiles. <br /> Between the start and destination tile, there should be blocking tiles along the way but a path should be existing.</td>
            <td>The character walks to that pixel exact position avoiding smoothly obstacles.</td>
            <td>ok</td>
            <td>?</td>
        </tr>
        <tr>
            <td>Test blocking corners with straight direction.</td>
            <td>Try to make the character do avoid each corner of a blocking tile by approaching straightly (Left, Right, Up or Down only) to it from a tile not in the same line or row as the blocking tile. <br /> A path should still be existing.</td>
            <td>The character walks to that pixel exact position avoiding smoothly the corner.</td>
            <td>ok</td>
            <td>?</td>
        </tr>
        <tr>
            <td>Test blocking corners with straight direction.</td>
            <td>Try to make the character approach straightly (Left, Right, Up or Down only) to a blocking tile corner, this time in the same line or row. <br /> A path should still be existing.</td>
            <td>The character walks to the pixel exact position and stops in front of the blocking tile taking in account its collision radius of 16 pixels.</td>
            <td>ok</td>
            <td>?</td>
        </tr>
        <tr>
            <td>Test blocking corners with diagonal direction.</td>
            <td>Try to make the character do avoid each corner of a blocking tile by approaching diagonally (Top-Left, Top-Right, ...) to it from with a tile not in the same line or row. <br /> A path should still be existing.</td>
            <td>The character walks near the blocking tile and avoid it smoothly, walking straight temporarily when necessary.</td>
            <td>ok</td>
            <td>?</td>
        </tr>
        <tr>
            <th colspan="5">Other beings tests</th>
        </tr>
        <tr>
            <td>Other players, NPCs, monsters and actors observation.</td>
            <td>Have a look at monsters and other beings movement.</td>
            <td>They should never walk into a wall, but can still walk over other beings.</td>
            <td>ok</td>
            <td>?</td>
        </tr>
        <tr>
            <td>Other players, NPCs, monsters and actors speed factor.</td>
            <td>Have a look at monsters and other beings movement. You'll need this time to configure beings with different speed value (in tiles per second)</td>
            <td>The different beings movements should correspond to their speed without adding glitches in the animation.</td>
            <td>ok</td>
            <td>?</td>
        </tr>
        <tr>
            <th colspan="5">Networking - Other players behaviour</th>
        </tr>
        <tr>
            <td>Other players observation.</td>
            <td>Play with a friend or from another account in a preferably distant server. Make your two players be one next to another, and walk around.</td>
            <td>The position of the each other's remote being should be tiled-based correct when the being stops. Note that the path could slightly (but slightly) differ when moving.</td>
            <td>Ok</td>
            <td>?</td>
        </tr>
    </tbody>
</table>

