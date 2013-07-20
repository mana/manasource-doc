---
title: hair.xml
layout: wiki
---
{% include toc.md %}
#  hair.xml and colors.xml

The `colors.xml` and `hair.xml` files are used to dynamically [dye](image_dyeing_system.html) a sprite image (for characters hair, notably ) using a pre-defined dye channel.

Here is a description of the different parameters of this file:

#  Colors parameters

Here is a colors.xml file sample:

{% highlight xml %}
<?xml version="1.0" encoding="utf-8"?>
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

<table class="table table-bordered table-hover" markdown="1">
    <thead>
        <tr>
            <th>Parameter</th>
            <th>Value type</th>
            <th>Description</th>
        </tr>
    </thead>
    <tbody>
        <tr>
            <td>id</td>
            <td>Integer</td>
            <td>Color ID used by the client for internally store the color.</td>
        </tr>
        <tr>
            <td>name</td>
            <td>string</td>
            <td>Color name displayed in the client when necessary.</td>
        </tr>
        <tr>
            <td>value</td>
            <td>string <br /> ([dye channel](image_dyeing_system.html) format)</td>
            <td>Color channel using the format `#\&amp;lt;channel1\&amp;gt;,\&amp;lt;channel2\&amp;gt;,\&amp;lt;channel3\&amp;gt;`,... <br /> See the dye System for more information.</td>
        </tr>
    </tbody>
</table>
