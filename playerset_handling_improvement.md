---
title: playerset handling improvement
layout: wiki
---
{% include toc.md %}
# Player and equipment layers handling

This page will attempt to provide specifications improving the current playerset layer definition,
including race specific sprites for the body, equipment, and hairstyles support:

Currently, the layer specification is made of these layers for each supported protocols:

### Current static layer specifications

**TmwAthena:**
    SPRITE_BASE = 0,
    SPRITE_SHOE,
    SPRITE_BOTTOMCLOTHES,
    SPRITE_TOPCLOTHES,
    SPRITE_MISC1,
    SPRITE_MISC2,
    SPRITE_HAIR,
    SPRITE_HAT,
    SPRITE_CAPE,
    SPRITE_GLOVES,
    SPRITE_WEAPON,
    SPRITE_SHIELD,

**the Mana server:**
    SPRITE_BASE = 0,
    SPRITE_SHOE,
    SPRITE_BOTTOMCLOTHES,
    SPRITE_TOPCLOTHES,
    SPRITE_HAIR,
    SPRITE_HAT,
    SPRITE_WEAPON,

#### Pseudo-dynamic layer handling

From the different problems encountered, for instance when firing with a bow, or some annoyance when sprite makers have to erase part of their sprites to get the illusion that an particular equipment layer is behind another, even if drawn after it, I’ve listed the following possible layers:

**Identified playerset layer definition so far:**

  Hairs – back (2 versions: 1 under covering helmet, 1 without helmet or with uncovering helmet equipment.)
  Hairs – front (2 versions: 1 under covering helmet, 1 without helmet or with uncovering helmet equipment.)
  Eyes
  Head
  Torso
  Arms-back
  Arms-front
  Legs

**Identified equipment layer definition so far:**

  Helmet – back
  Helmet – front
  Chest
  Gloves
  Legs armor
  Shoes – back
  Shoes - front
  Weapons back
  Weapons front

**Merged together:**
//(in a logical order, from background to foreground)//

  Weapons - back
  Shoes – back
  Legs
  Arms – back
  Helmet – back
  Hairs – back
  Torso
  Head
  Eyes
  Legs armor
  Shoes - front
  Chest armor
  Arms – front
  Gloves
  Hairs – front
  Helmet front
  Weapons-front

Every layer being optional, only the needed layer (even if two are present for a specific body part) would have to be drawn, of course.

**Exception handling:**

To handle layout exceptions, some layers will have to be drawn in another order for a specific item. To keep things simple for the equipment makers, empty layer spaces should be left between each defined layer, permitting specific changes or additions. We could number them 5 by 5, for instance:

  05. Weapons - back
  10. Shoes – back
  15. Legs
  20. Arms – back
  25. Helmet – back
  30. Hairs – back
  35. Torso
  40. Head
  45. Eyes
  50. Legs armor
  55. Shoes - front
  60. Chest armor
  65. Arms – front
  70. Gloves
  75. Hairs – front
  80. Helmet front
  85. Weapons-front

The layer numbering should be defined in a xml definition file to be the most flexible, for instance :

{% highlight xml %}
<?xml encoding=”UTF-8”?>
  <layers>
    <layer name="weapons-back" value="5" />
    <layer name="shoes-back" value="10" />
    <layer name="legs" value="15" />
    <layer name="arms-back" value="20" />
    <layer name="helmet-back" value="25" />
    <layer name="hairs-back" value="30" />
    <layer name="torso" value="35" />
    <layer name="head" value="40" />
    <layer name="eyes" value="45" />
    <layer name="legs-armor" value="50" />
    <layer name="shoes-front" value="55" />
    <layer name="chest-armor" value="60" />
    <layer name="arms-front" value="65" />
    <layer name="gloves" value="70" />
    <layer name="hairs-front" value="75" />
    <layer name="helmet-front" value="80" />
    <layer name="weapons-front" value="85" />
  </layers>

{% endhighlight %}
**N.B.:** The same file could also providing a default hair xml file, and default sfx:

{% highlight xml %}
<?xml encoding=”UTF-8”?>
  <layers>
    <layer name="weapons-back" value="5" />
    <layer name="shoes-back" value="10" />
    ...
  </layers>
  <hairs file="hairs.xml" /> <!-- Default hair file -->

  <sfx>
    <default name="unarmed"   file="fist-swish.ogg" />
    <default name="walking"   file="character-walking.ogg" />
    <default name="appearing" file="character-appearing.ogg" />
    <default name="leaving"   file="character-leaving.ogg" />
    <default name="levelup"   file="character-levelup.ogg" />
    <default name="skillup"   file="character-skillup.ogg" />
    ...
  </sfx>

  <races> <!-- Node describing available playable races -->
    <race name="Human" file="graphics/sprites/races/humans/humans.xml" />
  </races>

{% endhighlight %}

For each piece of equipment, the keywords given above would make the equipment by drawn at the given layer number, for instance:

 * Given in the items.xml file when willing to apply the layer to every sprites:
{% highlight xml %}
<?xml encoding=”UTF-8”?>
    ...
    <item id="624"
        image="armor-chest-vnecksweater.png|W:#A4B2B2,FFFFFF"
        name="V-Neck Sweater"
        description="A soft, warm sweater."
        effect="+8% Defense"
        type="equip-torso"
        layer="chest-armor"> <!-- new layer parameter. Not optional here -->
        <sprite gender="male">chest-vnecksweater-male.xml|#A4B2B2,FFFFFF</sprite>
        <sprite gender="female">chest-vnecksweater-female.xml|#A4B2B2,FFFFFF</sprite>
    </item>
…

{% endhighlight %}

 * And /or for each animation in the corresponding equipment xml file:
{% highlight xml %}
<?xml encoding=”UTF-8”?>
<sprite name="player" action="stand">
        <imageset name="base" src="graphics/sprites/chest-vnecksweater-male.png|W" width="64" height="64" />
        <action name="stand" imageset="base">
                <animation direction="down">
                  <!-- New layer parameter, here it is optional, since a default is given in items.xml for equipment-->
                  <!-- On the contrary would be required in player-base-male/female.xml files -->
                  <frame index="0" layer="torso" />
                </animation>
                <animation direction="left">
                  <frame index="18" />
                </animation>
                ...
        </action>
        ...
</sprite>
{% endhighlight %}

And for special cases where a specific layer must be drawn differently than the current set, a ‘layer’ parameter could be added, setting specifically the layer number where it should be drawn. Values used by preset definition (multiple of 5 in this case) would be refused and make the equipment piece fall back to its default layer number.

For instance:
{% highlight xml %}
<?xml encoding=”UTF-8”?>
<sprite name="player" action="stand">
        <imageset name="base" src="graphics/sprites/chest-vnecksweater-male.png|W" width="64" height="64" />
        <action name="stand" imageset="base">
                <animation direction="down">
                  <!-- new layer_id parameter: In this case, the sprite is drawn after the head layer. -->
                  <frame index="0" layer_id="41" />
                </animation>
                <animation direction="left">
                  <frame index="18" />
                </animation>
                ...
        </action>
        ...
</sprite>
{% endhighlight %}

A example where the given value is bad (because already preset and will fall back to the generic one:
{% highlight xml %}
<?xml encoding=”UTF-8”?>
<sprite name="player" action="stand">
        <imageset name="base" src="graphics/sprites/chest-vnecksweater-male.png|W" width="64" height="64" />
        <action name="stand" imageset="base">
                <animation direction="down">
                  <frame index="0" layer_id="45" /> <!-- bad layer_id parameter (already set for the eyes layer) -->
                </animation>
                <animation direction="left">
                  <frame index="18" />
                </animation>
                ...
        </action>
        ...
</sprite>
{% endhighlight %}

#### Other needed parameters identified so far:

**Flip flag for frames:**

 * **h-flip:** Would horizontally flip the given image part when drawing it.
 * **v-flip:** Same for vertical flip.
**N.B.:** Keep in mind that the flipped part should not be drawn on the opposite side, but still on the same coordinate as if it wasn’t flipped.

Example:
{% highlight xml %}
<?xml encoding=”UTF-8”?>
<sprite name="player" action="stand">
        <imageset name="base" src="graphics/sprites/chest-vnecksweater-male.png|W" width="64" height="64" />
        <action name="stand" imageset="base">
                <animation direction="down">
                  <frame index="0"/>
                </animation>
                <animation direction="left">
                  <frame index="18" h-flip/><!-- draw the image part flipped horizontally -->
                </animation>
                ...
        </action>
        ...
</sprite>
{% endhighlight %}

**Hairs flag definition when covered or not by an helmet:**

An 'hair_type' flag should tell which sub-image should be drawn if the player is equipped with
a covering helmet (not every helmet would be hair-covering, like the bandana.).
If no parameter is used, the sprite would be used for both.

Example:
{% highlight xml %}
<?xml version="1.0"?>
<sprite>
        <imageset name="base" src="graphics/sprites/hairstyle1.png|M" width="40" height="40" />
        <action name="stand" imageset="base">
                <animation direction="down">
                  <frame index="0" offsetX="0" offsetY ="-29" hair_type="covered"/>
                  <frame index="4" offsetX="0" offsetY ="-29" hair_type="uncovered"/>
                </animation>
                <animation direction="left">
                  <frame index="1" offsetX="0" offsetY ="-29" hair_type="covered"/>
                  <frame index="5" offsetX="0" offsetY ="-29"  hair_type="uncovered"/>
                </animation>
                <animation direction="up">
                  <frame index="2" offsetX="-1" offsetY ="-25" hair_type="covered"/>
                  <frame index="6" offsetX="-1" offsetY ="-25" hair_type="uncovered"/>
                </animation>
                <animation direction="right">
                  <frame index="3" offsetX="0" offsetY ="-29" hair_type="covered"/>
                  <frame index="7" offsetX="0" offsetY ="-29" hair_type="uncovered"/>
                </animation>
        </action>
        ...
</sprite>
{% endhighlight %}

Helmets should then indicates wether they're covering, defaulted to no if no parameter is given:

{% highlight xml %}
<?xml encoding="utf-8"?>
<items>
    ...
    <item id="511"
        image="armor-head-santahat.png"
        name="Santa Hat"
        description="Ask Santa about this hat."
        effect="+2% Defense"
        type="equip-head"
        hair_type="covered"> <!-- hair_type parameter -->
        <sprite>head-santahat.xml</sprite>
    </item>
    ...
</items>
{% endhighlight %}

##### Hair styles moved into the hair.xml file
Hairstyles definition, currently in the items.xml file, should be moved into
the hair.xml. The configuration would become more logical:

Future hair-xml file sample:
{% highlight xml %}
 <hairstyles>
  <hairstyle id="-1" name="Flat ponytail" sprite="hairstyles/hairstyle1.xml" />
  <hairstyle id="-2" name="Bowl cut" sprite="hairstyles/hairstyle2.xml" />
  ...
 </hairstyles>

 <colors>
  <color id="0" value="#8c4b41,da9041,ffffff" name="light brown"/>
  <color id="1" value="#06372b,489e25,fdedcc" name="green"/>
  <color id="2" value="#5f0b33,91191c,f9ad81" name="red"/>
  <color id="3" value="#602486,934cc3,fdc689" name="purple"/>
  <color id="4" value="#805e74,c6b09b,ffffff" name="gray"/>
  <color id="5" value="#8c6625,dab425,ffffff" name="yellow"/>
  <color id="6" value="#1d2d6d,1594a3,fdedcc" name="blue"/>
  <color id="7" value="#831f2d,be4f2d,f8cc8b" name="brown"/>
  <color id="8" value="#432482,584bbc,dae8e5" name="light blue"/>
  <color id="9" value="#460850,611967,e7b4ae" name="dark purple"/>
  <color id="10" value="#000000,202020,404040,dddddd" name="black"/>
 </colors>
{% endhighlight %}

### Discussion







{% highlight c++ %}
class DBManager
{
 public:
  enum DBTypes
  {
    ITEM_DB = 0,
    MONSTER_DB,
    ...
  };

  DBManager()
  { init(); }
  
  ~DBManager()
  { deinit(); }

  void init()
  {
    mItemDB = new itemDB(...);
    mMonsterDB =  new MonsterDB(...);
    ...
  }

  void deinit();

  bool exist(DBTypes type, int id) const;

  ItemInfo& get(int id) const
  { return mItemDB::get(id); }
  
  ItemInfo& get(std:string name) const
  { return mItemDB::get(name); }
  
  MonsterInfo& get(int id) const
  { return mMonsterDB::get(id); }
  
  MonsterInfo& get(std:string name) const
  { return mMonsterDB::get(name); }
  
  ...
  
 protected:
  /** Logs any eAthena specific ID problems */
  static void checkeAthenaSpecificID();
  
 private:
  ItemDB *mItemDB;
  MonsterDB *mMonsterDB;
  ...
};
{% endhighlight %}
