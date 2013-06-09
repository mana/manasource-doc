---
title: git repository
layout: wiki
---
{% include toc.md %}
#  The primary repository

##  Introduction

We are using the version control system Git as our main collaboration tool. You can use it to obtain all the source code and content files you need to take part in the development or to create your own fork. See the [Wikipedia article about Git](http://en.wikipedia.org/wiki/Git_%28software%29) and the [Git homepage](http://git-scm.com/) for details about Git.

##  Initial setup

With Git we have one repository for each project. The central repositories through which we cooperate are hosted on [github.com](http://github.com/).

We’ve categorized all projects related to Mana, so you can easily see the complete [list of the Mana repositories](http://github.com/mana/) on GitHub. The projects have different clone URLs for read-only or developer access. The URL for developer access is called the “push URL”, since it allows you to push commits into the repository via ssh. The list below is for your convenience.


<table class="table table-bordered table-hover" markdown="1">
    <thead>
        <tr>
            <th>Project</th>
            <th>Read-only URL</th>
            <th>Push URL (Developers only)</th>
            <th>Atom feed</th>
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
    </tbody>
</table>


Git uses ssh’s private/public key authentication for identifying committers. For development purposes you should clone the “push url”, but this requires that you have:

  - Signed up to github.com
  - Generated a private/public ssh key pair (if you haven’t got this already)
  - Filled in your public key in your account details on GitHub
##  Cloning

By cloning a project you get a local checkout of its source and a copy of its complete history. Use the following command to clone a project:

`$ git clone &lt;clone_url&gt;`

If you want to have all projects in one place, you probably want to do something like this:


    $ mkdir mana
    $ cd mana
    $ git clone git@github.com:mana/mana.git
    $ git clone git@github.com:mana/manaserv.git
    etc.

or for all of them in one go (after the cd mana step):
{% highlight bash %}
$ for repo in  mana manaserv manaweb ; do git clone git://github.com/mana/${repo}.git ; done

{% endhighlight %}

#  Working with Git

##  Committing

From now on, a commit is something you do locally. Others won’t see your change on GitHub unless you push it there. You’ll notice committing is very fast, and you can commit multiple times before you decide to push. You can also make corrections to your last commit.

Before you start committing, it is important to identify yourself to Git, so that it can include the correct authorship information with your commit. You are no longer identified with a username, as was the case with Subversion. You can read exactly how to do this, as well as other useful information geared towards people switching from Subversion, on this page:

 * **Git--SVN crash course:** [http://git.or.cz/course/svn.html](http://git.or.cz/course/svn.html)

##  Pushing

Once you have committed some stuff, you can push these to the repository on GitHub using `git push`. This works since by default the push command pushes to a *remote* called *origin*, and this remote is automatically set up when you clone. However, the push will fail if there have been new commits on the remote repository. In that case, you’ll first have to pull in these changes (just like with Subversion, however Subversion allowed this as long as the same files weren't touched, Git doesn’t).

##  Pulling

When you want to get the latest changes from the repository on GitHub, you generally use `git pull`. However, note that this command does not work when you have local changes. Also, when you have local commits, the pull command will generate a merge commit (and before that you may have to resolve some conflicts).

If you don’t want to create merge commits, but would rather stack your local commits on top of any incoming commits, you should use `git pull --rebase`. This *rebases* your local commits on top of the incoming ones. You should never do this when you have pushed these commits elsewhere, so only do it when you are sure the commits are only on your machine.

If you have local changes and want to update your checkout, then there are several options:

 * You commit your local changes, and do a pull, optionally with `--rebase`.
 * Or you use `git stash` to place your local changes on a “hidden” stash. Then, after pulling, you apply your changes again with `git stash apply`.
 * Or you create a patch of your local changes that you apply again after the pull. This approach sometimes makes sense, but is in general a more clumsy way to go. There are Git commands that help you with this though.

##  Resolving conflicts

Rather similar to Subversion. When there are conflicts, a merge or a rebase will add conflict markers into files. Use `git status` to see which files remain in conflict and use `git add` on files to mark them as resolved. When you did a merge and you have resolved all conflicts, you commit. When you were doing a rebase of several commits, you do `git rebase --continue` instead.

##  Patch making

Git has an easy way to send patches to other people to review and commit for you. After you have made a commit, `git format-patch` will make a patch out of it. The patch includes your author information the commit message you gave, and all the changes to be done. The recipient can just `git am [patch file]` to apply the commit. After it has been pushed, you'll need to remove the patch from your local repository, `git reset --hard HEAD^` will do that. If you don't do that, you'll get a conflict when your patch is pulled from the central repository.

##  Good to know

Git has several useful commands to figure out the current state of your repository, your files and what recently changed. Below is a non-exhaustive list of commands that are useful to know:

 * **git branch**: Without any parameters, this command lists your local branches, and indicates which branch you're currently on.
 * **git whatchanged**: This shows a list of all commits on the current branch similar to `git log`, but with a list of the files that have been touched in each commit as well.
 * **git status**: This shows all kind of things about your current checkout: which files changed, untracked (unknown) files, added or removed files, files that have conflicts (during merge), etc. It also shows the status of your index, which is what git will commit once you do `git commit`. If you are new to Git I would recommend to wait a bit with learning how to use the index, but not to avoid it forever.

There are also additional applications that help you with using Git:

 * **gitk**: A simple but effective tool that visualizes the history and some of your current state. Run with `--all` to have it show all branches, otherwise it will just show stuff relevant to your current branch.
 * **tig**: A textual interface, rather similar to an email reader.
 * **git gui**: A gui tool like gitk which helps you prepare and perform your commits. Also makes it easier to understand the index concept.

##  Git on Windows

When using Git on Windows you might use [msysgit](http://code.google.com/p/msysgit/). If you notice that some files seem to have changed after doing a fresh clone, you may want to disable `core.autocrlf` using `git config core.autocrlf false`. However, this is not recommended for contributors since the setting makes sure you don’t commit Windows style newlines into the repository. When encountering this problem it is usually best to consult other developers about the affected files.
