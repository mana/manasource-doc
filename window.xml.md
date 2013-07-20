---
title: window.xml
layout: wiki
---
{% include toc.md %}
#  window.xml

The `window.xml` file located per default in the `graphics/gui` folder, or in a custom theme folder (See [GUI configuration](gui_configuration.html)),
is used to specify how to display every GUI window of the Mana client.

Here is an example of a usable `window.xml` file:

{% highlight xml %}
<skinset name="Default" image="window.png">
	<widget type="Window">
		<!-- Top Row -->
		<part type="top-left-corner" xpos="0" ypos="0" width="4" height="4" />
		<part type="top-edge" xpos="4" ypos="0" width="32" height="4" />
		<part type="top-right-corner" xpos="36" ypos="0" width="4" height="4" />

		<!-- Middle Row -->
		<part type="left-edge" xpos="0" ypos="4" width="4" height="216" />
		<part type="bg-quad" xpos="4" ypos="4" width="32" height="216" />
		<part type="right-edge" xpos="36" ypos="4" width="4" height="216" />

		<!-- Bottom Row -->
		<part type="bottom-left-corner" xpos="0" ypos="220" width="4" height="4" />
		<part type="bottom-edge" xpos="4" ypos="220" width="32" height="4" />
		<part type="bottom-right-corner" xpos="36" ypos="220" width="4" height="4" />
	</widget>
</skinset>
{% endhighlight %}

