---
title: gui configuration
layout: wiki
---
{% include toc.md %}
#  GUI configuration

You'll find below the files and options available in order to customize the Mana client's GUI.

##  GUI Theme support

The Mana client is aimed at being a generic client, supporting the necessary branding functions for other maintainers.
Hence, a GUI theming support has been added through the following branding option: `guiThemePath`. See the [branding.xml](branding.xml.html) page.

The above option permits to provide an alternate path to the gui files, thus making the client load a different skin set.
The GUI theme path is relative to the `data/` folder. Also, when GUI files are not found in the theme path, the default ones are used instead.

##  GUI Data handling

Here is a description of each required XML and PNG files used to set up the Mana client GUI:

<table class="table table-bordered table-hover" markdown="1">
    <thead>
        <tr>
            <th>File</th>
            <th>Description</th>
        </tr>
    </thead>
    <tbody>
        <tr>
            <th colspan="2">XML files</th>
        </tr>
        <tr>
            <td>graphics/gui/[colors.xml](gui_colors.html)</td>
            <td>The  XML file defining each text and progress bars colour depending on the case.</td>
        </tr>
        <tr>
            <td>graphics/gui/[speechbubble.xml](speechbubble.xml.html)</td>
            <td>An XML file defining how to display speech bubbles in game.</td>
        </tr>
        <tr>
            <td>graphics/gui/[window.xml](window.xml.html)</td>
            <td>An XML file specifying how to display each GUI windows.</td>
        </tr>
        <tr>
            <th colspan="2">PNG files depending on a XML</th>
        </tr>
        <tr>
            <td>graphics/gui/bubble.png</td>
            <td>The PNG file used by the default speechbubble.xml file.</td>
        </tr>
        <tr>
            <td>graphics/gui/window.png</td>
            <td>The PNG file used by the default window.xml file.</td>
        </tr>
        <tr>
            <td colspan="2">**PNG files with hard-coded parts** <br /> You won't have the possibility to change those images placement as there is no configuration available for them. <br /> Look at the default theme and place the same GUI part as in the default theme.</td>
        </tr>
        <tr>
            <td>button.png</td>
            <td>Used to draw button at their default state.</td>
        </tr>
        <tr>
            <td>buttonhi.png</td>
            <td>Used to draw buttons when highlighted.</td>
        </tr>
        <tr>
            <td>buttonpress.png</td>
            <td>Used to draw button when they are pressed.</td>
        </tr>
        <tr>
            <td>button_disabled.png</td>
            <td>Used to draw disabled buttons.</td>
        </tr>
        <tr>
            <td>checkbox.png</td>
            <td>Used to draw check-boxes.</td>
        </tr>
        <tr>
            <td>circle-gray.png</td>
            <td>Used to draw disabled leds. (Green dot presenting a on status, for instance. Used in the party window.)</td>
        </tr>
        <tr>
            <td>circle-green.png</td>
            <td>Used to draw green leds.</td>
        </tr>
        <tr>
            <td>close_button.png</td>
            <td>Used to draw the X close button.</td>
        </tr>
        <tr>
            <td>deepbox.png</td>
            <td>Used to draw input text areas, player boxes, and similar.</td>
        </tr>
        <tr>
            <td>hscroll_left_default.png</td>
            <td>Horizontal left arrow at default state.</td>
        </tr>
        <tr>
            <td>hscroll_left_highlight.png</td>
            <td>Horizontal left arrow at highlight state.</td>
        </tr>
        <tr>
            <td>hscroll_left_pressed.png</td>
            <td>Horizontal left arrow at pressed state.</td>
        </tr>
        <tr>
            <td>hscroll_right_default.png</td>
            <td>Horizontal right arrow at default state.</td>
        </tr>
        <tr>
            <td>hscroll_right_highlight.png</td>
            <td>Horizontal right arrow at highlight state.</td>
        </tr>
        <tr>
            <td>hscroll_right_pressed.png</td>
            <td>Horizontal right arrow at pressed state.</td>
        </tr>
        <tr>
            <td>vscroll_down_default.png</td>
            <td>Vertical down arrow at default state.</td>
        </tr>
        <tr>
            <td>vscroll_down_highlight.png</td>
            <td>Vertical down arrow when highlighted.</td>
        </tr>
        <tr>
            <td>vscroll_down_pressed.png</td>
            <td>Vertical down arrow when pressed.</td>
        </tr>
        <tr>
            <td>vscroll_up_default.png</td>
            <td>Vertical up arrow at default state.</td>
        </tr>
        <tr>
            <td>vscroll_up_highlight.png</td>
            <td>Vertical up arrow when highlighted.</td>
        </tr>
        <tr>
            <td>vscroll_up_pressed.png</td>
            <td>Vertical up arrow when pressed.</td>
        </tr>
        <tr>
            <td>vscroll_grey.png</td>
            <td>Progress bar at default state.</td>
        </tr>
        <tr>
            <td>vscroll_highlight.png</td>
            <td>Progress bar when highlighted.</td>
        </tr>
        <tr>
            <td>item_shortcut_bgr.png</td>
            <td>Item boxes background.</td>
        </tr>
        <tr>
            <td>mouse.png</td>
            <td>Mouse different cursors.</td>
        </tr>
        <tr>
            <td>progress-indicator.png</td>
            <td>Progress indicator's different images.</td>
        </tr>
        <tr>
            <td>radioin.png</td>
            <td>Activated radio button.</td>
        </tr>
        <tr>
            <td>radioin_highlight.png</td>
            <td>Activated and highlighted radio button.</td>
        </tr>
        <tr>
            <td>radioout.png</td>
            <td>Deactivated radio button.</td>
        </tr>
        <tr>
            <td>radioout_highlight.png</td>
            <td>Deactivated and highlighted radio button.</td>
        </tr>
        <tr>
            <td>resize.png</td>
            <td>The resize grip, seen at the windows' bottom-right corner.</td>
        </tr>
        <tr>
            <td>selection.png</td>
            <td>An item box when it is selected.</td>
        </tr>
        <tr>
            <td>slider.png</td>
            <td>Slider button different parts.</td>
        </tr>
        <tr>
            <td>slider_hilight.png</td>
            <td>Slider button different highlighted parts.</td>
        </tr>
        <tr>
            <td>sticky_button.png</td>
            <td>Window sticky button, to keep a window on top of the others.</td>
        </tr>
        <tr>
            <td>tab.png</td>
            <td>A tab at default state.</td>
        </tr>
        <tr>
            <td>tabselected.png</td>
            <td>A selected tab at default state.</td>
        </tr>
        <tr>
            <td>tab_hilight.png</td>
            <td>An highlighted tab at default state.</td>
        </tr>
        <tr>
            <td>unknown-item.png</td>
            <td>The default image used when no image is found for the given item.</td>
        </tr>
    </tbody>
</table>


##  Discussion

