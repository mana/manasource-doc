---
title: development process
layout: wiki
---
{% include toc.md %}
#  Development Process

Manasource is a bazaar-style project which is open to input from users and invites everyone to contribute code. But we still need a bit of red tape to keep the development organized. This article describes how a change gets into the official codebase.

##  Using github.com

This process is the recommended process. Depending on how big and important the change, not all steps are mandatory.

<table class="table table-bordered table-hover" markdown="1">
    <thead>
        <tr>
            <th>step</th>
            <th>mandatory</th>
            <th>where</th>
            <th>who</th>
            <th>what</th>
        </tr>
    </thead>
    <tbody>
        <tr>
            <td>0</td>
            <td>only for large and complex new features</td>
            <td>http://doc.manasource.org</td>
            <td>anyone</td>
            <td>creates a RFC article describing a new feature an link it on [Requests for Comments](requests_for_comments.html)</td>
        </tr>
        <tr>
            <td>1</td>
            <td>only for non-trivial changes or changes you can't do yourself</td>
            <td>http://bugs.manasource.org</td>
            <td>anyone</td>
            <td>creates a bugtracker issue which points out a bug or proposes a new feature</td>
        </tr>
        <tr>
            <td>2</td>
            <td>only for non-trivial changes or changes you can't do yourself</td>
            <td>http://bugs.manasource.org</td>
            <td>all Manasource developers</td>
            <td>discuss whether the issue needs to be resolved</td>
        </tr>
        <tr>
            <td>3</td>
            <td>only for non-trivial changes or changes you can't do yourself</td>
            <td>http://bugs.manasource.org</td>
            <td>implementing developer</td>
            <td>assigns the issue to himself / herself</td>
        </tr>
        <tr>
            <td>4</td>
            <td>always</td>
            <td>http://github.com (personal fork)</td>
            <td>implementing developer</td>
            <td>creates a new branch for solving the issue</td>
        </tr>
        <tr>
            <td>5</td>
            <td>always</td>
            <td>http://github.com (personal fork)</td>
            <td>implementing developer</td>
            <td>commits his/her solution to the branch</td>
        </tr>
        <tr>
            <td>6</td>
            <td>always</td>
            <td>http://github.com/mana</td>
            <td>implementing developer</td>
            <td>opens a pull request for his/her branch</td>
        </tr>
        <tr>
            <td>7</td>
            <td>when there is a bugtracker issue</td>
            <td>http://bugs.manasource.org</td>
            <td>implementing developer</td>
            <td>creates a comment mentioning the pull request</td>
        </tr>
        <tr>
            <td>8</td>
            <td>when the solution is non-trivial</td>
            <td>http://github.com/mana</td>
            <td>all Manasource developers</td>
            <td>discuss whether the solution is acceptable</td>
        </tr>
        <tr>
            <td>9</td>
            <td>always</td>
            <td>http://github.com/mana</td>
            <td>any Manasource developer</td>
            <td>expresses his/her agreement with the solution</td>
        </tr>
        <tr>
            <td>10</td>
            <td>always</td>
            <td>http://github.com/mana</td>
            <td>implementing developer</td>
            <td>merges the pull request</td>
        </tr>
        <tr>
            <td>11</td>
            <td>when there is a bugtracker issue</td>
            <td>http://bugs.manasource.org</td>
            <td>implementing developer</td>
            <td>closes the bugtracker ticket with a comment mentioning the commit hash</td>
        </tr>
        <tr>
            <td>12</td>
            <td>when necessary</td>
            <td>http://doc.manasource.org</td>
            <td>implementing developer</td>
            <td>documents the change on the wiki</td>
        </tr>
    </tbody>
</table>

##  Using only the bugtracker

This alternative process is for casual contributors who don't want to create a github account. It should be used for small contributions only.

<table class="table table-bordered table-hover" markdown="1">
    <thead>
        <tr>
            <th>step</th>
            <th>where</th>
            <th>who</th>
            <th>what</th>
        </tr>
    </thead>
    <tbody>
        <tr>
            <td>0</td>
            <td>http://bugs.manasource.org</td>
            <td>anyone</td>
            <td>creates a bugtracker issue which points out a bug or proposes a new feature</td>
        </tr>
        <tr>
            <td>1</td>
            <td>http://bugs.manasource.org</td>
            <td>all Manasource developers</td>
            <td>discuss whether the issue needs to be resolved</td>
        </tr>
        <tr>
            <td>2</td>
            <td>http://bugs.manasource.org</td>
            <td>implementing developer</td>
            <td>uploads a patch with the proposed solution to the issue</td>
        </tr>
        <tr>
            <td>3</td>
            <td>http://bugs.manasource.org</td>
            <td>all Manasource developers</td>
            <td>discuss whether the solution is acceptable</td>
        </tr>
        <tr>
            <td>4</td>
            <td>http://bugs.manasource.org</td>
            <td>any Manasource developer</td>
            <td>expresses his/her agreement with the solution ((Please excuse that patches in bugtracker issues are easily overlooked. Feel free to ask for a review (or reason for not reviewing) on [IRC](irc.html) when your patch is ignored for too long.))</td>
        </tr>
        <tr>
            <td>5</td>
            <td>http://github.com/mana</td>
            <td>the developer who agreed with the patch</td>
            <td>pushes the patch to the main repository</td>
        </tr>
        <tr>
            <td>6</td>
            <td>http://bugs.manasource.org</td>
            <td>the developer who agreed with the patch</td>
            <td>closes the issue mentioning the commit hash</td>
        </tr>
    </tbody>
</table>
