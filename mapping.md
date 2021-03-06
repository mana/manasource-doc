---
title: mapping
layout: wiki
---
{% include toc.md %}

#  Basics
Making maps for The Mana World is not a task that requires a lot of knowledge but is a very good way to become creative and help the game to become more attractive. But getting started can be a little frustrating. Here is a guide that will help you to learn how to make maps.

#  Folders
You need to use a certain folder structure when mapping for the Mana server:
Store your map file and the tilesets((A tileset is an image made of tiles(pieces of textures) used draw a canvas, a pattern representing your map.)) in your client data:

(Remember that certain client data are used by the server, too)

Store your map files (\*.tmx or \*.tmx.gz) into the 'maps/' folder (required here).
Store your tilesets files into the `graphics/tilesets/` folder, for instance. (This is up to you).

#  How to get a map Editor
The official map editor used for the Mana server is called Tiled. This a Qt-based application that you can find at http://mapeditor.org/.

#  Setting up the data files
To create a map, you will first need some graphics, as well as existing maps to use for reference.

You can get all the files in the right directory structure by having a look at the Mana server source files, in the `example/` folder, [here](http://gitorious.org/mana/manaserv/trees/master/example/clientdata).

Another good example can be found [here](http://gitorious.org/tmwdata/mainline/trees/master).

Alternatively, you can use the data files that are downloaded while playing the game.  When you downloaded the Mana client as an installer packet, all map graphics were downloaded at the start of Mana from the update server of your favourite world and are stored in the update sub-folder ([depending on your OS](client_data_handling.html#data_locations)) of your home directory as zip archives. Unpack these into the "data" sub-folder of your Mana installation.

#  Setting up Tiled for making Maps

Tiled is a map editor that isn't made specifically for Mana or the Mana server. That means it has a lot of options and settings we don't need.

##  Create a map
To create a new map, press `File-&gt;New` and use the following settings:

 * **Map Type:** Orthogonal
 * **Tile Size:** 32x32
 * **Tile Spacing:** 0 (Tile spacing and margins currently not supported.)
 * **Map Size:** Should be at least 60x60 but not larger than 200x200 (although the theoretical maximum is much higher). A 20 tile border around the outside of every map is needed. Additionally, a 20 tile border is recommended between rooms for indoor maps; this is to prevent more than one room from showing at a time on the client.

##  Importing tilesets

Now you have to choose the tilesets you want to use on the map. To import a tileset, select `Tilesets-&gt;New Tileset` and set the following options:

 * **Name:** (doesn't matter, but it helps if it's descriptive)
 * **Tile width:** 32
 * **Tile height:** 32 (64 for _x2 tilesets and 96 for _x3 tilesets. [see below](#over_sized_tiles))
 * **Tile spacing:** 0
 * **Use transparent color:** unchecked

Now push the browse button and browse to the sub-folder graphics/tiles/ in your Mana folder. Here you will find all tilesets that are used by Mana; they are saved as PNG graphics. Select the one you want to use for your map.

Please only import the tilesets you want to use. Don't forget to import the Tileset "Collision.png", too. It has a very important purpose that will be explained later.

##  Starting to map
Now you can finally start to map.
To place tiles on the map, select the pen tool from the toolbox. Then select a tile from the tile palette. Now you can place the tiles on the map.

Please, always take notice of what layer you are drawing on, because the layers play different roles:
 * Use a layer **beneath the "Fringe"** layer for tiles without transparency. The layers beneath fringe have to be filled completely before you can call the map finished. When there are partially transparent tiles without completely opaque tiles on a layer below, strange graphic bugs will appear in the empty area.
 * The **"Fringe"** Layer itself is for oversized tiles which have to be drawn in front of or behind moving objects, depending on their location. This sorting takes up CPU, making the game run slower. Thus, you should only use this layer for the tiles which have to use it.
 * Layers **above the "Fringe"** layer are always drawn over the map sprites. It should be used for objects which are meant to look as if they are far above the game area. Keep in mind that there are also monsters which are larger than player characters.
 * The **"Collision"** Layer isn't displayed in the game. It contains information about which parts of the map are walkable and which aren't. Don't put any tiles on this layer except for the red collision tiles from the collision tileset.

When you are finished with your map, you have to determine which tiles are walkable and which aren't. To do so, mark all tiles you want to be blocked with the red squares from the collision tileset on the collision layer. Be careful that even if a tile is not reachable, but is walkable, the server can spawn monsters there which can not be killed by the players because they can't reach them. This will eventually lead to all monsters accumulating in the unreachable area until there are no monsters left in the reachable areas.

You can check if you did this properly by saving the map, zooming out until the entire map is visible, hiding all layers except for the collision layer, and then using the flood fill tool with the cross tile on the empty area. Any tiles which are still unmarked are not reachable by the players.

Be aware that you need a border of about 20 tiles in every direction that should not be walkable, but should be designed properly. Portals to other maps should only be some tiles wide. (You can't define the portals with Tiled, by the way. Leave this to the server administrators. The same applies to monster population, NPCs and other interactive objects.)

##  Testing your map
To test your map, you have to replace one of the maps in your Mana folder (in the sub-folder data/maps). When you start the game and go to the map you replaced you will see your new map. You will see monsters and other players on the map, but don't worry, the other players still see their version of the map, and they won't see you walk through walls. Just ignore them while you explore your map.

Sometimes your changed map is overridden by a new version of the map in the updates. In that case, you won't see any changes when you change or even remove a map. When you encounter this problem, either skip the update loading by starting mana with the parameter `"-u"`.

#  Intermediate topics
##  Adding monsters to a map
To add an monster create an object layer and create an new rectangular object. This rectangle will be the spawning area. Then open the properties of the object choose a name and set type to "spawn" (upper or lowercase makes no difference). Then set the following properties:
<table class="table table-bordered table-hover" markdown="1">
    <thead>
        <tr>
            <th>Key</th>
            <th>Value</th>
        </tr>
    </thead>
    <tbody>
        <tr>
            <td>monster_id</td>
            <td>"maggot"</td>
        </tr>
        <tr>
            <td>max_beings</td>
            <td>100</td>
        </tr>
        <tr>
            <td>spawn_rate</td>
            <td>10</td>
        </tr>
    </tbody>
</table>

This creates a spawn area for the monster "maggot". The spawn will be limited to a max number of beings of 100 and 10 beings per minutes will spawn if nessecary.

##  Over sized tiles
You might have noticed the tilesets ending with `_x2.png` or `_x3.png` in the mana folder containing objects that are two or three tiles high. The new version of Tiled allows you to place them with one click. The TMW graphic engine recognizes these oversized tiles when they are placed on the object layer, and automatically draws sprites in front of them when they are south of them and behind them when they are north of them. When importing a _x2 tileset, set the tile height to 64; when importing a _x3 tileset, set it to 96.

**You should never put an oversized tile on any layer but the object layer.**

##  The Stamp
The Stamp Feature is a powerful feature of Tiled that is hard to find but can save a lot of time. It allows you to do quick copy/pasting of a part of a layer. This allows you to draw objects consisting of multiple tiles very quick. Just select the pen tool, press the right mouse button, and drag the mouse over the tiles you want to copy. Now you can draw the whole square of tiles over and over again with a single left click. To return to the normal drawing mode, just select the pen tool again or choose a tile from the tile palette.

##  Making two maps with a fluent transition

When you create an outdoor map, it is most likely supposed to be adjacent to an existing map. In this case, the transmission from one map to the other should be as seamless as possible. This can only be reached when the border areas of both maps are identical. Unfortunately, Tiled can't copy/paste between different maps (well, it is possible, but it only works correctly when both maps use exactly the same tilesets in exactly the same order), so we developed a command-line based program called TMXcopy for this task. You can find the sourcecode on the GIT repository in the folder [http://gitorious.org/tmw/mainline/trees/master/tools/tmxcopy](http://gitorious.org/tmw/mainline/trees/master/tools/tmxcopy).

An introduction on how to use this program is described in its [readme file](http://gitorious.org/tmw/mainline/blobs/HEAD/tools/tmxcopy/readme.txt).

To create a map adjacent to an existing one, you should:
 * Create the new map as described above, and save it.
 * Use TMXcopy to copy the border area of the old map to the opposite side of the new map. The area should have the double width of the unwalkable area.
 * Open the new map and check if the copying worked correctly. Then modify the lower three layers of the copied area to fit into your map. While doing so, you should focus on the half of the new area that is inside the walkable area of your map. The half that lies in the border zone of your map should not be modified too much because it is part of the old map.
 * Use TMXCopy to copy the new area from the new map back to the old map.
 * Update the collision layers on both maps.

Now the border area should be visually identical on both maps. The only difference should be that the unwalkable areas are switched. When sending the map to the team, remember to include the new version of the old map.

##  Ambient effects
Ambient Effects are very important to an ambiance to your maps. They are either background images drawn at places where you place no tiles or tiles with transparency or they are transparent graphics that will be drawn over your map. All these graphics can scroll independent. They can be used to create a variety of special effects like weather, darkness, etc.

To add ambient effects to your map open your map with Tiled and click `Map-&gt;Properties` to open the map properties dialog.

###  Adding foreground images
First you have to choose an image. Do so by adding a key `foreground0image` and set its value to the path of the image that you want to use relative to the data directory. Then, enter the relative path to your ambient PNG file. E.g.: `/graphics/images/ambient/spotlight.png`.

When you want the image to move permanently add the new keys `foreground0scrollX` and `foreground0scrollY` followed by a number (can be a decimal value). `foreground0scrollX` determines the scroll speed to the right (negative values mean scrolling to the left) and `foreground0scrollY` the scroll speed down (negative values mean up). both values are in pixels per frame.

You can also define a `foreground0parallax` parameter. This parameter affects how much the overlay scrolls when the screen scrolls. A value of 1.0 means that the overlay will stay relative to the ground when the screen scrolls. A value of 0.0 means that the overlay stays relative to the "camera" and is not affected by scrolling. It is a decimal value so you can set it to values between 1 and 0 to create the three dimensional illusion of a layer between the "camera" and the map.

When using foregrounds at different resolutions, some would become disproportioned (for instance, the halo in cave maps that had to fill the screen repeated it self in higher resolution than 800x600.). That why, the keepratio parameter has been added: It will scaled up or down the image based on the current resolution.

Remember that the scaling factor is based on the default 800x600 resolution, so new overlay images are to be fitted for that resolution to make this parameter work.
(The image scaling in 1024x768 resolution mode, for instance, will be calculated this way: New Image Width = image-width / 800 * 1024, New Image Height = image-height / 600 * 768).

To add this parameter to your foreground configuration, you'll have to define the `foreground0keepratio` to the `true` value.

You can create any number of independent foreground graphics. To define a 2nd one create keys with 1 instead of 0, for a 3rd one 2, and so on. For instance `foreground2parallax` for the third foreground parallax value.

The foregrounds won't appear in Tiled. They will only appear in the game.

When it doesn't work please check that all key names are written correctly (they are cAsEsEnSiTiVe) and that the numbers of the foreground are consecutive starting from 0.

When you want to create foreground images yourself (transparent 32bit png graphics of any size) please don't forget to make them transparent with your image manipulation program. Otherwise the player won't be able to see the map under it. An opacity of 50% should be the absolute maximum. When you want to create effects that are not meant to obstruct the players view use an opacity between 10% and 20%.

###  Adding background images
Backgrounds are added in the same way foregrounds are, with the exceptions that the property keys don't start with the prefix foreground but with background. They use their own numbering, so you have to number your backgrounds 0, 1, 2 etc. no matter if you have foregrounds or not.
 `background0image`
 `background0scrollY`
 `background0scrollX`
 `background0keepratio`
In contrary to all other fore- or background images the first background (background0image) must not have any transparency but should be 100% opaque. Otherwise ugly graphic bugs will appear.

###  Particle effects

Check out the article about the [Particle system](particle_system.html) for a description about how to add particle effects to your map and how to create new particle effects when the effect you need doesn't exist yet.

###  Animated tiles
To make a type of tiles animated rightclick the tile you want to animate in tileset dock and open the properties.

Here an example for a 3-phase animation:

<table class="table table-bordered table-hover" markdown="1">
    <thead>
        <tr>
            <th>Name</th>
            <th>VALUE</th>
        </tr>
    </thead>
    <tbody>
        <tr>
            <td>animation-frame0</td>
            <td>0</td>
        </tr>
        <tr>
            <td>animation-delay0</td>
            <td>100</td>
        </tr>
        <tr>
            <td>animation-frame1</td>
            <td>16</td>
        </tr>
        <tr>
            <td>animation-delay1</td>
            <td>100</td>
        </tr>
        <tr>
            <td>animation-frame2</td>
            <td>48</td>
        </tr>
        <tr>
            <td>animation-delay2</td>
            <td>100</td>
        </tr>
    </tbody>
</table>

animation-frameX is the Tile number (0 is top left tile, 1 would be the tile right of that one, ...) and animation-delayX is how long it is shown (100 is equal to one second).

The animation does not show up in Tiled.

###  Advanced Topics/Adding a map to the server
To get the Mana server to use your map, you will need to make it available for him by adding it in client data and making those data set in the `clientDataPath` of the [manaserv.xml](manaserv.xml.html) file, and by editing the [maps.xml](maps.xml.html) file and add it without the file extension. For the maps/myMap.tmx file, add `&lt;map id="&lt;insert an unique ID here&gt;" name="myMap"/&gt;`

The server will only need the `collision` layer to compute the walkability.

###  Creating a Minimap
The Creation of a minimap is a task that requires an image manipulation software that supports multiple layers and the PNG format (we recommend [GIMP](http://www.gimp.org)). When you are not familiar with using one you should ask one of the artists to create a minimap for your map. When you want to create your own minimap then you should exactly follow the following steps to ensure to stay in style with the rest of the minimaps:
 * Open your map with tiled, zoom out until the whole map is visible and use the "save as image" option.
 * Open the image with your image manipulation program.
 * Resize it so that one pixel represents one tile. When your map is for example 160x100 tiles large (including border zone) your picture should be 160x100 pixels large.
 * Create a new transparent layer over the existing one.
 * Select the pencil tool with a brush size of 1x1 pixel and with the color #000000 (pure black). Anti aliasing should be deactivated when available.
 * Now draw lines on the new layer along the following map features:
    * Cliffs and walls (lower and upper edge)
    * River/lake shores
    * Roads (both sides of the road as single lines)
    * The border of any other large map structure that you feel should be on the map
 * Trees or other objects can be represented by single pixels with 50% alpha transparency when there are so many that they affect the game play on the map.
 * When you are finished remove the background layer. Now only the black lines should be visible
 * Resize the image so the sides are half (50%) as long. You should use the best image filtering method available (cubic filtering in GIMP).
 * Save your finished minimap as a PNG image with 32bit color depth and alpha transparency as *your_mana_folder*/data/graphics/minimaps/*mapname*.png.
 * Open your map with Tiled, click Map-&gt;Properties in the menu bar and add a new property with the key "minimap" and the value "/graphics/minimaps/*mapname*.png". The properties dialog is a little bit buggy in the current version of Tiled, so make sure that the property has really been set before you save the map.

You can also make maps using any of your favourite imag editor, of course.

###  Hints for good mapping

 * Before you start with a map you should have a loose idea of the layout. Making a sketch of the map on a piece of paper can be very useful.
 * Try to avoid choke points like bridges, mountain passes or corridors that are only one tile wide. They can be blocked very easily.
 * Don't put too many similar objects on one screen. Very eye catching tiles should only be used sparingly. Try to break up large areas with the same tile over and over again by throwing in some objects.
 * Avoid regular patterns in natural environments. Trees usually don't grow in grid patterns. Rivers, mountain ridges or corridors in caves should never be completely straight.
 * Don't map too functional. Give the players something to look at, even when it hasn't got any relevance for the gameplay.
 * But keep the playability in mind.
