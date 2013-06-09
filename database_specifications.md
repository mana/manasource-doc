---
title: database specifications
layout: wiki
---
{% include toc.md %}
#  Database version 8


<table class="table table-bordered table-hover" markdown="1">
    <thead>
        <tr>
        </tr>
    </thead>
    <tbody>
        <tr>
            <td>Column name</td>
            <td>Datatype</td>
            <td>Nullable</td>
            <td>References</td>
            <td>Description</td>
        </tr>
        <tr>
            <td>id</td>
            <td>int(10)</td>
            <td>PRIMARY KEY</td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td>username</td>
            <td>varchar(64)</td>
            <td>UNIQUE KEY</td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td>password</td>
            <td>varchar(64)</td>
            <td>NOT NULL</td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td>email</td>
            <td>varchar(32)</td>
            <td>UNIQUE KEY</td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td>level</td>
            <td>tinyint(3)</td>
            <td>NOT NULL</td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td>banned</td>
            <td>int(10)</td>
            <td>NOT NULL</td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td>registration</td>
            <td>int(10)</td>
            <td>NOT NULL</td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td>lastlogin</td>
            <td>int(10)</td>
            <td>NOT NULL</td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td>authorization</td>
            <td>text</td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
            <td>for manaweb</td>
        </tr>
        <tr>
            <td>expiration</td>
            <td>int(10)</td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
            <td>for manaweb</td>
        </tr>
    </tbody>
</table>

 * email
    * The email is stored as a one-way sha256 hash value. This ensures, that the email address a user enters cannot be used to send spam mails. It is only used to validate the mailaddress during password recovery procedure.
 * level
   * describes the user rights in the game (10 = normal user, 50 = gm, 99 = administrator)
 * authorization and expiration
   * these fields are used by TMWWEB to store a secret key and the time of expiration if the user has requested to reset its password. The secret key is sent via mail to the user.

<table class="table table-bordered table-hover" markdown="1">
    <thead>
        <tr>
        </tr>
    </thead>
    <tbody>
        <tr>
            <td>Column name</td>
            <td>Datatype</td>
            <td>Nullable</td>
            <td>References</td>
            <td>Description</td>
        </tr>
        <tr>
            <td>id</td>
            <td>int(10)</td>
            <td>NOT NULL</td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td>user_id</td>
            <td>int(10)</td>
            <td>NOT NULL</td>
            <td>mana_accounts(id)</td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td>name</td>
            <td>varchar(32)</td>
            <td>UNIQUE KEY</td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td>gender</td>
            <td>tinyint(3)</td>
            <td>NOT NULL</td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td>hair_style</td>
            <td>tinyint(3)</td>
            <td>NOT NULL</td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td>level</td>
            <td>tinyint(3)</td>
            <td>NOT NULL</td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td>char_pts</td>
            <td>smallint(5)</td>
            <td>NOT NULL</td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td>correct_pts</td>
            <td>smallint(5)</td>
            <td>NOT NULL</td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td>money</td>
            <td>int(10)</td>
            <td>NOT NULL</td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td>x</td>
            <td>smallint(5)</td>
            <td>NOT NULL</td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td>y</td>
            <td>smallint(5)</td>
            <td>NOT NULL</td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td>map_id</td>
            <td>tinyint(3)</td>
            <td>NOT NULL</td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td>str</td>
            <td>smallint(5)</td>
            <td>NOT NULL</td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td>agi</td>
            <td>smallint(5)</td>
            <td>NOT NULL</td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td>dex</td>
            <td>smallint(5)</td>
            <td>NOT NULL</td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td>vit</td>
            <td>smallint(5)</td>
            <td>NOT NULL</td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td>int</td>
            <td>smallint(5)</td>
            <td>NOT NULL</td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td>will</td>
            <td>smallint(5)</td>
            <td>NOT NULL</td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
        </tr>
    </tbody>
</table>


<table class="table table-bordered table-hover" markdown="1">
    <thead>
        <tr>
        </tr>
    </thead>
    <tbody>
        <tr>
            <td>Column name</td>
            <td>Datatype</td>
            <td>Nullable</td>
            <td>References</td>
            <td>Description</td>
        </tr>
        <tr>
            <td>char_id</td>
            <td>int(10)</td>
            <td>PRIMARY KEY</td>
            <td>mana_characters(id)</td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td>skill_id</td>
            <td>smallint(5)</td>
            <td>:::</td>
            <td>(skills.xml)</td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td>skill_exp</td>
            <td>smallint(5)</td>
            <td>NOT NULL</td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
        </tr>
    </tbody>
</table>

<table class="table table-bordered table-hover" markdown="1">
    <thead>
        <tr>
        </tr>
    </thead>
    <tbody>
        <tr>
            <td>Column name</td>
            <td>Datatype</td>
            <td>Nullable</td>
            <td>References</td>
            <td>Description</td>
        </tr>
        <tr>
            <td>char_id</td>
            <td>int(10)</td>
            <td>PRIMARY KEY</td>
            <td>mana_characters(id)</td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td>status_id</td>
            <td>smallint(5)</td>
            <td>:::</td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td>status_time</td>
            <td>int(10</td>
            <td>NOT NULL</td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
        </tr>
    </tbody>
</table>


<table class="table table-bordered table-hover" markdown="1">
    <thead>
        <tr>
        </tr>
    </thead>
    <tbody>
        <tr>
            <td>Column name</td>
            <td>Datatype</td>
            <td>Nullable</td>
            <td>References</td>
            <td>Description</td>
        </tr>
        <tr>
            <td>char_id</td>
            <td>int(10)</td>
            <td>PRIMARY KEY</td>
            <td>mana_characters(id)</td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td>monser_id</td>
            <td>int(10)</td>
            <td>:::</td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td>kills</td>
            <td>int(10)</td>
            <td>NOT NULL</td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
        </tr>
    </tbody>
</table>


<table class="table table-bordered table-hover" markdown="1">
    <thead>
        <tr>
        </tr>
    </thead>
    <tbody>
        <tr>
            <td>Column name</td>
            <td>Datatype</td>
            <td>Nullable</td>
            <td>References</td>
            <td>Description</td>
        </tr>
        <tr>
            <td>id</td>
            <td>int(10)</td>
            <td>PRIMARY KEY</td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td>name</td>
            <td>varchar(100)</td>
            <td>NOT NULL</td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td>description</td>
            <td>varchar(255)</td>
            <td>NOT NULL</td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td>image</td>
            <td>varchar(50)</td>
            <td>NOT NULL</td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td>weight</td>
            <td>smallint(5)</td>
            <td>NOT NULL</td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td>itemtype</td>
            <td>varchar(50)</td>
            <td>NOT NULL</td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td>effect</td>
            <td>varchar(100)</td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td>dyestring</td>
            <td>varchar(50)</td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
        </tr>
    </tbody>
</table>


<table class="table table-bordered table-hover" markdown="1">
    <thead>
        <tr>
        </tr>
    </thead>
    <tbody>
        <tr>
            <td>Column name</td>
            <td>Datatype</td>
            <td>Nullable</td>
            <td>References</td>
            <td>Description</td>
        </tr>
        <tr>
            <td>item_id</td>
            <td>int(10)</td>
            <td>PRIMARY KEY</td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td>itemclass_id</td>
            <td>int(10)</td>
            <td>FOREIGN KEY</td>
            <td>mana_items(id)</td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td>amount</td>
            <td>tinyint(3)</td>
            <td>NOT NULL</td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
        </tr>
    </tbody>
</table>


<table class="table table-bordered table-hover" markdown="1">
    <thead>
        <tr>
        </tr>
    </thead>
    <tbody>
        <tr>
            <td>Column name</td>
            <td>Datatype</td>
            <td>Nullable</td>
            <td>References</td>
            <td>Description</td>
        </tr>
        <tr>
            <td>attribute_id</td>
            <td>int(10)</td>
            <td>PRIMARY KEY</td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td>item_id</td>
            <td>int(10)</td>
            <td>FOREIGN KEY</td>
            <td>mana_items_instances(item_id)</td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td>attribute_class</td>
            <td>tinyint(3)</td>
            <td>NOT NULL</td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td>attribute_value</td>
            <td>varchar(500)</td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
        </tr>
    </tbody>
</table>


<table class="table table-bordered table-hover" markdown="1">
    <thead>
        <tr>
        </tr>
    </thead>
    <tbody>
        <tr>
            <td>Column name</td>
            <td>Datatype</td>
            <td>Nullable</td>
            <td>References</td>
            <td>Description</td>
        </tr>
        <tr>
            <td>id</td>
            <td>int(10)</td>
            <td>PRIMARY KEY</td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td>owner_id</td>
            <td>int(10)</td>
            <td>UNIQUE KEY</td>
            <td>mana_characters(id)</td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td>slots</td>
            <td>tinyint(3)</td>
            <td>:::</td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td>class_id</td>
            <td>int(10)</td>
            <td>NOT NULL</td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td>amount</td>
            <td>tinyint(3)</td>
            <td>NOT NULL</td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
        </tr>
    </tbody>
</table>

<table class="table table-bordered table-hover" markdown="1">
    <thead>
        <tr>
        </tr>
    </thead>
    <tbody>
        <tr>
            <td>Column name</td>
            <td>Datatype</td>
            <td>Nullable</td>
            <td>References</td>
            <td>Description</td>
        </tr>
        <tr>
            <td>id</td>
            <td>int(10)</td>
            <td>PRIMARY KEY</td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td>name</td>
            <td>varchar(35)</td>
            <td>UNIQUE KEY</td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
        </tr>
    </tbody>
</table>


<table class="table table-bordered table-hover" markdown="1">
    <thead>
        <tr>
        </tr>
    </thead>
    <tbody>
        <tr>
            <td>Column name</td>
            <td>Datatype</td>
            <td>Nullable</td>
            <td>References</td>
            <td>Description</td>
        </tr>
        <tr>
            <td>guild_id</td>
            <td>int(10)</td>
            <td>PRIMARY KEY</td>
            <td>mana_guilds(id)</td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td>member_id</td>
            <td>int(10)</td>
            <td>:::</td>
            <td>mana_characters(id)</td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td>rights</td>
            <td>int(10)</td>
            <td>NOT NULL</td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
        </tr>
    </tbody>
</table>


<table class="table table-bordered table-hover" markdown="1">
    <thead>
        <tr>
        </tr>
    </thead>
    <tbody>
        <tr>
            <td>Column name</td>
            <td>Datatype</td>
            <td>Nullable</td>
            <td>References</td>
            <td>Description</td>
        </tr>
        <tr>
            <td>owner_id</td>
            <td>int(10)</td>
            <td>PRIMARY KEY</td>
            <td>mana_characters(id)</td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td>name</td>
            <td>varchar(100)</td>
            <td>:::</td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td>value</td>
            <td>varchar(200)</td>
            <td>NOT NULL</td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
        </tr>
    </tbody>
</table>


<table class="table table-bordered table-hover" markdown="1">
    <thead>
        <tr>
        </tr>
    </thead>
    <tbody>
        <tr>
            <td>Column name</td>
            <td>Datatype</td>
            <td>Nullable</td>
            <td>References</td>
            <td>Description</td>
        </tr>
        <tr>
            <td>state_name</td>
            <td>varchar(100)</td>
            <td>PRIMARY KEY</td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td>map_id</td>
            <td>INTEGER</td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td>value</td>
            <td>TEXT</td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td>moddate</td>
            <td>INTEGER</td>
            <td>NOT NULL</td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
        </tr>
    </tbody>
</table>



<table class="table table-bordered table-hover" markdown="1">
    <thead>
        <tr>
        </tr>
    </thead>
    <tbody>
        <tr>
            <td>Column name</td>
            <td>Datatype</td>
            <td>Nullable</td>
            <td>References</td>
            <td>Description</td>
        </tr>
        <tr>
            <td>auction_id</td>
            <td>int(10)</td>
            <td>PRIMARY KEY</td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td>auction_state</td>
            <td>tinyint(3)</td>
            <td>NOT NULL</td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td>char_id</td>
            <td>int(10)</td>
            <td>FOREIGN KEY</td>
            <td>mana_characters(id)</td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td>itemclass_id</td>
            <td>int(10)</td>
            <td>NOT NULL</td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td>amount</td>
            <td>int(10)</td>
            <td>NOT NULL</td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td>start_time</td>
            <td>int(10)</td>
            <td>NOT NULL</td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td>end_time</td>
            <td>int(10)</td>
            <td>NOT NULL</td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td>start_price</td>
            <td>int(10)</td>
            <td>NOT NULL</td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td>min_price</td>
            <td>int(10)</td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td>buyout_price</td>
            <td>int(10)</td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td>description</td>
            <td>varchar(255)</td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
        </tr>
    </tbody>
</table>

 * auction_state can have the following values:
    *  0 = The auction is published and ready for bidders
    * 1 = The auction has finished and closed
 * start_time contains the creation date of the auction. Format: Unixtimestamp

<table class="table table-bordered table-hover" markdown="1">
    <thead>
        <tr>
        </tr>
    </thead>
    <tbody>
        <tr>
            <td>Column name</td>
            <td>Datatype</td>
            <td>Nullable</td>
            <td>References</td>
            <td>Description</td>
        </tr>
        <tr>
            <td>bid_id</td>
            <td>int(10)</td>
            <td>PRIMARY KEY</td>
            <td>mana_characters(id)</td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td>auction_id</td>
            <td>int(10)</td>
            <td>NOT NULL</td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td>char_id</td>
            <td>int(10)</td>
            <td>NOT NULL</td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td>bid_time</td>
            <td>int(10)</td>
            <td>NOT NULL</td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td>bid_price</td>
            <td>int(10)</td>
            <td>NOT NULL</td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
        </tr>
    </tbody>
</table>


<table class="table table-bordered table-hover" markdown="1">
    <thead>
        <tr>
        </tr>
    </thead>
    <tbody>
        <tr>
            <td>Column name</td>
            <td>Datatype</td>
            <td>Nullable</td>
            <td>References</td>
            <td>Description</td>
        </tr>
        <tr>
            <td>letter_id</td>
            <td>int(10)</td>
            <td>PRIMARY KEY</td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td>sender_id</td>
            <td>int(10)</td>
            <td>FOREIGN KEY</td>
            <td>mana_characters(id)</td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td>receiver_id</td>
            <td>int(10)</td>
            <td>FOREIGN KEY</td>
            <td>mana_characters(id)</td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td>letter_type</td>
            <td>int(5)</td>
            <td>NOT NULL</td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td>expiration_date</td>
            <td>int(10)</td>
            <td>NOT NULL</td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td>sending_date</td>
            <td>int(10)</td>
            <td>NOT NULL</td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td>letter_text</td>
            <td>TEXT</td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
        </tr>
    </tbody>
</table>


<table class="table table-bordered table-hover" markdown="1">
    <thead>
        <tr>
        </tr>
    </thead>
    <tbody>
        <tr>
            <td>Column name</td>
            <td>Datatype</td>
            <td>Nullable</td>
            <td>References</td>
            <td>Description</td>
        </tr>
        <tr>
            <td>attachment_id</td>
            <td>int(10)</td>
            <td>PRIMARY KEY</td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td>letter_id</td>
            <td>int(10)</td>
            <td>FOREIGN KEY</td>
            <td>mana_post(letter_id)</td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td>item_id</td>
            <td>int(10)</td>
            <td>FOREIGN KEY</td>
            <td>mana_item_instances(item_id)</td>
            <td>&nbsp;</td>
        </tr>
    </tbody>
</table>


<table class="table table-bordered table-hover" markdown="1">
    <thead>
        <tr>
        </tr>
    </thead>
    <tbody>
        <tr>
            <td>Column name</td>
            <td>Datatype</td>
            <td>Nullable</td>
            <td>References</td>
            <td>Description</td>
        </tr>
        <tr>
            <td>id</td>
            <td>int(10)</td>
            <td>PRIMARY KEY</td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td>description</td>
            <td>text</td>
            <td>NOT NULL</td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td>category</td>
            <td>text</td>
            <td>NOT NULL</td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
        </tr>
    </tbody>
</table>


<table class="table table-bordered table-hover" markdown="1">
    <thead>
        <tr>
        </tr>
    </thead>
    <tbody>
        <tr>
            <td>Column name</td>
            <td>Datatype</td>
            <td>Nullable</td>
            <td>References</td>
            <td>Description</td>
        </tr>
        <tr>
            <td>char_id</td>
            <td>int(10)</td>
            <td>PRIMARY KEY</td>
            <td>mana_characters(id)</td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td>login_date</td>
            <td>int(10)</td>
            <td>NOT NULL</td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
        </tr>
    </tbody>
</table>


<table class="table table-bordered table-hover" markdown="1">
    <thead>
        <tr>
        </tr>
    </thead>
    <tbody>
        <tr>
            <td>Column name</td>
            <td>Datatype</td>
            <td>Nullable</td>
            <td>References</td>
            <td>Description</td>
        </tr>
        <tr>
            <td>id</td>
            <td>int(11)</td>
            <td>PRIMARY KEY</td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td>char_id</td>
            <td>int(11)</td>
            <td>NOT NULL</td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td>action</td>
            <td>int(11)</td>
            <td>NOT NULL</td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td>message</td>
            <td>text</td>
            <td>NOT NULL</td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td>time</td>
            <td>int(11)</td>
            <td>NOT NULL</td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
        </tr>
    </tbody>
</table>









