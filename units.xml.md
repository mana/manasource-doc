---
title: units.xml
layout: wiki
---
{% include toc.md %}
#  units.xml file configuration
Data from the `units.xml` file are used to set up the currency name and its subdivisions, but also weight unit names.

The units.xml file has to be located in the **data** directory.

Each configuration option in this xml file, is defined using a `&lt;unit&gt;` tag within the `&lt;unit**s**&gt;` main node, which itself has got an `&lt;level&gt;` child node, ...
Here is an example:

{% highlight xml %}
<?xml version="1.0" encoding="utf-8"?>
<units>
    <unit type="currency" base="Kuna" round="0">
        <level symbol="Litas" count="1000" round="2"/>    
        <level symbol="Loti" count="100000" round="4"/>
    </unit>
    <unit type="weight" base="g" round="0">
        <level symbol="kg" count="1000" round="2"/>
    </unit>
</units>
{% endhighlight %}

**Note:** This file is used only by the client for customisation purpose.

##  &lt;unit&gt; node description

The `&lt;unit&gt;` node is used to define the different values used to bring a specific currency and weight subdivisions within the game.

This node is **required** by the client.

{% highlight xml %}
 <?xml version="1.0"?>
 <units>
   <unit type="currency" base="Kuna" round="0">
   ...
   </unit>
 ...
 </units>
{% endhighlight %}

<table class="table table-bordered table-hover" markdown="1">
    <thead>
        <tr>
            <th>Parameter name</th>
            <th>Type</th>
            <th>Mandatory</th>
            <th>Default value</th>
            <th>Description</th>
        </tr>
    </thead>
    <tbody>
        <tr>
            <td>type</td>
            <td>string <br /> defined value: <br /> 'currency', 'weight'</td>
            <td>Yes</td>
            <td>&nbsp;</td>
            <td>Tells the system whether the unit is for the currency or the weight.</td>
        </tr>
        <tr>
            <td>base</td>
            <td>string</td>
            <td>Yes</td>
            <td>&nbsp;</td>
            <td>Tells the currency/weight name displayed by the client.</td>
        </tr>
        <tr>
            <td>round</td>
            <td>integer</td>
            <td>Yes</td>
            <td>&nbsp;</td>
            <td>Tells the currency round or precision. If equal to 0, every digit is counted. A round of 10 would make the currency display 0 for every digit before the dozen.</td>
        </tr>
    </tbody>
</table>

**Note:** Only one currency and one weight unit should be defined in the units.xml file for consistency.

###  &lt;level&gt; node description

The `&lt;level&gt;` node is used to set each currency/weight sublevels.

This node is optional.

{% highlight xml %}
<?xml version="1.0" encoding="utf-8"?>
<units>
    <unit type="currency" base="Kuna" round="0">
        <level symbol="Litas" count="1000" round="2"/>    
        <level symbol="Loti" count="100000" round="4"/>
        ...
    </unit>
 ...
 </units>
{% endhighlight %}

<table class="table table-bordered table-hover" markdown="1">
    <thead>
        <tr>
            <th>Parameter name</th>
            <th>Type</th>
            <th>Mandatory</th>
            <th>Default value</th>
            <th>Description</th>
        </tr>
    </thead>
    <tbody>
        <tr>
            <td>symbol</td>
            <td>string</td>
            <td>Yes</td>
            <td>&nbsp;</td>
            <td>Tells the currency/weight name subdivision displayed by the client.</td>
        </tr>
        <tr>
            <td>count</td>
            <td>integer</td>
            <td>Yes</td>
            <td>&nbsp;</td>
            <td>Tells the currency/weight subdivision base count. If equal to 0, it would be equal to the parent currency/weight. Eg: A Byte would have a count of 8 relatively to the Bit.</td>
        </tr>
        <tr>
            <td>round</td>
            <td>integer</td>
            <td>Yes</td>
            <td>&nbsp;</td>
            <td>Tells the currency/weight subdivision round or precision. If equal to 0, every digit is counted. A round of 10 would make the currency display 0 for every digit before the dozen.</td>
        </tr>
    </tbody>
</table>
