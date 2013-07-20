---
title: pixel-accurate route finding/partitioning the pixel plane into rectangles which are blocked or unblocked
layout: wiki
---
{% include toc.md %}
When using pixel-accurate route finding it is no longer viable to treat every possible position as an individual node (like it is done in tile-based route finding), because this would increase memory consumption and path complexity by the factor 1024.

A way to reduce the complexity is to partition the map into rectangles which are either completely walkable or completely unwalkable. When start and goal are inside a rectangle which is known to be completely walkable, route finding is trivial because a direct path can always be used. So the problem is reduced to finding the optimum sequence of adjacent rectangles from start to goal.

So how do we partition the map into rectangles? One way to do it is using the following algorithm:
  - start with a rectangle which spans the whole map
  - start in the upper left corner of said rectangle and find a subrectangle of uniform walkability by gradually expanding it to the lower right until both the right and the lower edge find a pixel of different walkability or the whole parent rectangle is covered
  - Mark the new rectangle as completely walkable or unwalkable
  - When the parent rectangle isn't covered, divide the rest of the parent rectangle into 3 rectangles (right, below and below-right of the new rectangle)
  - Perform the algorithm from step 1 on each of these 3 rectangles

When we assume that the walkability of a map is defined by placing differently shaped collision tiles on the collision layer of a map like we do now, and when we further assume that the majority of these collision tiles on a normal map will be either completely blocked or completely filled, we can optimize runtime and memory consumption by first performing this algorithm with a tile-sized resolution differing between the three states "blocked", "walkable" and "mixed" and then perform the algorithm with pixel-accuracy on the "mixed" rectangles.

Here a gif animation of the algorithm in action:

<img src="../media/pixel-accurate_route_finding/plane-partitioning1-v2.gif" />

You will notice that the result can be further simplified by merging adjacent rectangles with the same walkability.
