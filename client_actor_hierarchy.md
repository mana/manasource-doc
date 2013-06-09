---
title: client actor hierarchy
layout: wiki
---
{% include toc.md %}
With c22ea2f169f58e765fc699fcd71bfd3a3cd4f859, the client now has an actor class that underlies Being, FloorItem, and Particle. The hierarchy is currently this:
 * Actor
    * Being
      * Monster
      * Player
        * LocalPlayer
        * NPC
    * FloorItem
    * Particle
      * ImageParticle
        * AnimationParticle
        * RotationalParticle
      * TextParticle

I propose to make a sprite hierarchy like this:
 * Sprite
    * AnimatedSprite
    * ImageSprite
    * CompoundSprite
      * ActorSprite (public Actor)
        * Being
          * ...
        * FloorItem

An ImageSprite is a fixed image in a sprite wrapper. A CompoundSprite is basically a layered sprite. It manages a list of Sprites that it draws in order. An ActorSprite adds the Actor parent class and manages that (other things, like attached particles and targeting circles should go here; status and stun effects should stay with Being). Putting Being and FloorItem under it will simplify Being and make it easy to support full sprite functionality for FloorItem (solving [Mantis task 124](http://bugs.manasource.org/view.php?id=124)). I'd rather not put FloorItem under Being, or Being under FloorItem, as neither makes sense. Having ActorSprite separate from CompoundSprite allows us to nest CompoundSprites without bringing in the unneeded complexity of what the Actor class has and what it's child class will need to do here. Traditional FloorItem display (using the inventory icon) would be achieved by using the ImageSprite class.

Under Being, we have a hierarchy that can be collapsed. Almost all of the differences between Player and LocalPlayer deal with data storage about the player's character, which can be moved elsewhere. The enums in it's header file should be eliminated anyways, as they are TMW-specific. The targeting stuff should be moved to ActorSprite to keep the targeting system flexible. The message queue should be put into Being (maybe ActorSprite) so we can use that functionality to display messages about other Beings(/...). Being's type enum should be put in ActorSprite and FLOOR_ITEM added.

[Mantis task 24](http://bugs.manasource.org/view.php?id=24) would be handled by CompoundSprite. ActorSprite could manage two copies of that single Image (with different alphas).

#  Comments

