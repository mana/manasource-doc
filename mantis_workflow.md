---
title: mantis workflow
layout: wiki
---
{% include toc.md %}
#  Mantis issue tracker workflow

Here is the documentation about the workflow used to deal with new bugs and features
in Mana, and ManaServ.

The [Mantis issue tracker ](http://www.mantisbt.org) is our tool to deal with task assignment, mainly for development purpose.

This tool is used to display, filter, and order the team development work.

To keep things clear, every contributor has deal with Mantis in a rather same way,
or the information flow growing there can become quickly messy.

Now, first thing first:
If you're willing to give feedback about a new bug or wishing a new feature, you'll have to seek for the good point of communication...


###  In which tracker?

 * **The Mana project**

The Mana project is using its own Mantis issue tracker, following the convention given in this page.


The [Mana Project](http://manasource.org) is aiming at giving a generic client used to many 2D MMORPG protocol, supporting currently eAthena
and ManaServ (The Mana project one) protocols.

Only Technical bugs and missing features about the client or the supported server (ManaServ)
should be reported there. We don't provide any support neither for new graphics, nor any kind of content itself, but the support to make use
of them in your own servers.
Issues related to the Mana Project can be reported [here](http://bugs.manasource.org).



 * **Tiled - The map editor supported by The Mana Project**

[Tiled](http://www.mapeditor.org) a strong attempt to make a free 2D map editor, available for any kind of 2D games supporting its format.


Tiled is currently supported by both Mana Project and will remain the reference editor for mapping purpose.

As every tools, this one has got its own issue tracker. You can report bugs and missing features concerning the map edition for Mana projects [here](http://sourceforge.net/apps/mantisbt/tiled/my_view_page.php).


###  How to report a bug or a missing feature?

Most issue trackers won't let your report an issue or even let you view what's going on if you don't a have access.
Consider registering and login using the appropriate link for each of them to view the options described below.

Also, there are simple and obvious rules to keep in mind while reporting a bug or a missing feature:
 * **Search if the issue already exists:** Using the 'View Issues' link in Mantis and the text field in the search options.
 * **Be polite and professional:** This could sound obvious to many of us... but still, issues can be rejected if they're hurting the eyes at the first glimpse.
 * **Try to be as complete as possible:** It's already hard to understand what the problem is, when we've got all the information sometimes. Then, just imagine if we have to dig all the details all by ourselves...

A bad bug reporting example:
`Title: Trading doesn't work!!
Description: Correct it, quickly!`

The good one:

    Title: Trading between 2 players isn't made when the given money is more than 2'000 GP.
    Description: If I start a trade with a friend and the sum of our money exchange is above 2'000 GP, the trade isn't effective.

-&gt; The difference between the two is simply that the second one is complete enough to **reproduce** your problem,
and as a plus, it is written in a correct and polite manner.

 * **Give client version number and server used:** The client version number and server type used is given in the top-left part of the client when it's starting.
 * **Give log and backtrace when the client crash:** For people at ease for that kind of things: When your client is crashing,don't forget to join a copy of your mana.log file or better start the client with gdb and give backtraces.

####  Fill a new issue report

Once logged in the issue tracker, click on the 'Report issue' link, and here it goes:

//(The bold field items are mandatory when reporting a new issue.)//

<table class="table table-bordered table-hover" markdown="1">
    <thead>
        <tr>
            <th>Field</th>
            <th>Use</th>
            <th>Comment</th>
        </tr>
    </thead>
    <tbody>
        <tr>
            <td>**Project**</td>
            <td>Used to know what component of the project is involved in the bug or the feature requested.</td>
            <td>Can be: Client or server, content, ...</td>
        </tr>
        <tr>
            <td>**Category**</td>
            <td>Used to know what part of the component is involved in the bug or the feature requested.</td>
            <td>Can be: Client core, Network, ...</td>
        </tr>
        <tr>
            <td>Reproductibility</td>
            <td>Used to know how often a bug is happening. This will help to determine the difficulty to reproduce it.</td>
            <td>Can be: Always, rarely, ...</td>
        </tr>
        <tr>
            <td>Severity</td>
            <td>Used to tell the bug's degree of anoyance. A crash is more severe than a slight short slowdown, for instance.</td>
            <td>Can be: crash, minor, ...</td>
        </tr>
        <tr>
            <td>Priority</td>
            <td>Lead developpers usually set the priority based on the severity, the difficulty and the need to get the issue done. When reporting a new issue, you can let this to 'normal'.</td>
            <td>Can be: high, trivial, ...</td>
        </tr>
        <tr>
            <td>Platform</td>
            <td>Used to know the lib/dll and other tools version you used to compile the client/server, and/or are running with.</td>
            <td>Can be: Guichan 0.8.1, gcc v4.4.3, SDL 1.2.14, ...</td>
        </tr>
        <tr>
            <td>OS</td>
            <td>Used to know the operating system your computer is running under.</td>
            <td>Can be: Linux, Mac, ...</td>
        </tr>
        <tr>
            <td>OS Version</td>
            <td>Used to know the operating system's version.</td>
            <td>Can be: Debian Testing, Mac OS X, ...</td>
        </tr>
        <tr>
            <td>Product version</td>
            <td>Used to know the version used when dealing with the bug or missing feature. Be sure to try with the latest version if you can.</td>
            <td>Can be: 0.0.29.1, CR1, ...</td>
        </tr>
        <tr>
            <td>Assign to</td>
            <td>Used by the team and lead developpers to assign tasks. You can leave this empty.</td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td>Target Version</td>
            <td>Used for planification purpose. This is used to know in which version the bug or the feature is to be implemented. No warranty, though.</td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td>**Summary**</td>
            <td>One of the most important part. Here, you'll have to sum up the bug or the feature in a few words. The better it will be, the best the developpers will be able to find it quickly.</td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td>Description</td>
            <td>Also an important part. Here you can describe the problem encountered. See the advice in the above category.</td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td>Step to reproduce</td>
            <td>Describe here precisely and sequencially the actions made to encounter the problem. This will help a **lot** the developpers to reproduce it.</td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td>Additional information</td>
            <td>You can tell here any information you're finding relevant.</td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td>Upload file</td>
            <td>Join a file to help resolve the problem. It can be a patch is the best cases, but also screenshots, a log file, ...</td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td>Public/Private</td>
            <td>Issues are public for most of them, but ita can happen that some of them are to be kept secret for a while, and this, for many reasons.</td>
            <td>&nbsp;</td>
        </tr>
    </tbody>
</table>

When you're ready, click on 'Submit issue', and Tadam! It's there in the list of the recently modified issues, and you can view it using 'My View' link.

You will be able to see that your issue is the 'New' Status. But what is the use of a status and how do the developpers and maintainers deal with them.
Check the developpers information below to find it out.


###  Maintainers information

####  Issues lifecycle and Workflow

In order to keep what is under development, get feedback for bugs and new ideas,
and help people understand about what is accepted and what is not, here is a simple description
of the mantis used status and their meanings.

<table class="table table-bordered table-hover" markdown="1">
    <thead>
        <tr>
            <th>Status</th>
            <th>Use in Mana Projects</th>
        </tr>
    </thead>
    <tbody>
        <tr>
        </tr>
        <tr>
        </tr>
        <tr>
        </tr>
        <tr>
        </tr>
        <tr>
        </tr>
        <tr>
        </tr>
    </tbody>
</table>

####  Issues Day-to-day maintenance

In order to keep the bug and feature trackers enough clean for the development team, every member of the team is invited to maintain these.
The day-to-day maintenance tasks in the trackers aren't that complicated even if it can take time:
 * **Issue triaging:** Most of the time, issues are set in the wrong component. Setting them back where they really belong is a good first step.
 * **Provide info on new issues:** Issues in the "New" or "Feedback" status are to be reviewed by the reporter and the developpers until they have got enough information and get to "Confirmed" or "Closed" status. Reviewing such issues and try to precise things up is the main maintenance task there. Remember, in the best case, a "Confirmed" bug or feature should be fully understandable and give enough information to tell a developper what to do to correct it. Don't hesitate to update information fields.
 * **Review own's assignements:** Many issues in the "Assigned" status for too long. It's effectively hard to stay task focused in an open-source project, but reviewing one's own assignements doesn't hurt sometimes.
 * **Unassign old issues of inactive members:** An open-source is all about spare-time. Then, thinking of that, an assigned task should get disassigned if a developper can't resolve it within 8 months or so. Don't hesitate to disassign issues when you feel you won't be able to get back to it before a long time.
 * **Pick-up preferably issues given in the roadmap:** Of course, for that, the roadmap is to be kept up-to-date, but keep in mind that following a roadmap gives some credit to the development team, and permit to narrow a bit the release cycle.

####  Issues gentleness convention

Here are some little advice to keep everyone happy in the day-to-day development:

 * **Don't assign issues:** Most of the time, people take issues by themselves without any problem, anyway. Remember also, that nobody is paid for what he/she is doing, so you should ask before assigning new task to someone.
 * **Don't steal assigned issues from others:** When an issue is assigned, it mainly means that the developer has put some efforts on it. So please, ask if you're not stepping on his/her toes before taking the wanted issue.

Thanks for having read it 'til the end ;)
