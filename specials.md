---
title: specials
layout: wiki
---
{% include toc.md %}
Specials are special actions the characters can perform. They can be used to implement magic systems, special attack systems or emotion systems.

# Script engine responsibilities
 * Telling the C++ engine which special IDs the character may use
 * Calculate the cost (recharge pool, points pool, cooldown time) of using the special ID for the C++ engine.
 * Implement the effects of using special IDs

# C++ engine responsibilities
   * Keeping persistence of the list of special IDs each character can perform
   * Managing the costs of using specials
   * Checking if a character may use a special
   * Informing the client about the special palette its character may use and its recharge status.
 
# Client responsibilities
   * Present the information about special palette and status in a GUI
   * Provide a GUI for using specials
   * Send a message when the player wants to use a special
 
 
