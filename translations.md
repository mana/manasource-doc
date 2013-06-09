---
title: translations
layout: wiki
---
{% include toc.md %}
Translations in the Mana client are handled by the [gettext](http://www.gnu.org/software/gettext/) system. This page  presents an overview in the context of the game. Please refer to the [manual](http://www.gnu.org/software/gettext/manual/gettext.html) for additional details.

#  Gettext for users

Translations are supposed to work out-of-the-box. If they are not,
complain to the maintainer of your binary package. This section is
dedicated to users compiling `mana` themselves.

When configuring, the script should tell you that Native Language
Support (NLS) is enabled. It just requires the presence of gettext on
your computer. From there, just compile and install like you usually
do, and it should work just fine. You just need to have properly set up
your system with respect to locales. If console applications, e.g.
`man`, are translated, then The Mana World will also be.

Note that the `install` part is mandatory for gettext to work. You
cannot run the program from your compilation directory and expect it to
be translated. Here is a work around:

{% highlight sh %}
./configure --localedir=$PWD/locale    # plus your special options
make                                   # compile as usual
cd po ; make install                   # whenever your .po file is modified

{% endhighlight %}

If you are not using the configure script, you need to tell your
compiler to set two macros. The `ENABLE_NLS` macro should be 1.
The `LOCALEDIR` macro should point to a directory structure
`xy/LC_MESSAGES/mana.mo` you created. The `mana.mo` file
is obtained by running the `msgfmt` tool.

#  Gettext for translators

The easiest way to translate Mana is to use the translation feature in [Launchpad](https://translations.launchpad.net/mana). If you wish to translate the files manually, keep on reading.

When creating a translation for a not yet supported language, get the
identifier of your language, as defined by ISO 639. It is usually two
letter long. Let us suppose it is `xy`. Copy the `po/mana.pot`
to `po/xy.po`, and add `xy` to the `po/LINGUAS`
file. That is all.

Now you can use your favorite text editor to modify the `po/xy.po`
file. There are also a few dedicated editors. For example, gtranslator in
Gnome and kbabel in KDE. The `.po` format is simple: on one
`msgid` line, you read the original English sentence, on the next
`msgstr` line, you write your translation. The encoding of your file
should be UTF-8, as it is the internal format of the game, and we do not
want it to waste time on converting between different charsets.

From time to time, modifications to the English strings will be merged
to your `.po` file. When it happens, translate the new empty
entries, and modify the old entries marked as `fuzzy`. Then submit the
new file.

Sentences containing percent characters (especially when preceded by the
`c-format` comment) need special care. They start special sequences that
ends with a letter. The game will replace them by words (`%s`) or
numbers (`%d`) or some other things. As a consequence, their order
need to be strictly respected in order not to crash the game. If
respecting the order makes it impossible to translate in your language,
you can use positional markers instead:


    #, c-format
    msgid "%s owns %s in one language"
    msgstr "%2$s is owned by %1$s in another language"


#  Gettext for developers

When you just needs the translation of a literal string (one given between
quotes), you can use the underscore macro.

{% highlight cpp %}
displayToUser(_("For long swords, size does matter."));

{% endhighlight %}

If you are in a context where you cannot execute this macro, you can delay
the translation. Using a macro is still mandatory so that the strings can
automatically be extracted for translators.

{% highlight cpp %}
static char const *msg = N_("For long swords, size does matter.");
...
displayToUser(gettext(msg));

{% endhighlight %}

A point has to be stressed: Using the `_()` and `N_()` macros on
anything else than a literal string, e.g. a variable or an expression, is
plain wrong.

You should also avoid crafting sentences by concatenating words, as it makes
it impossible to translate.

{% highlight cpp %}
displayToUser(std::string(id1) + _(" owns ") + id2);  # bad
displayToUser(strprintf(_("%s owns %s"), id1, id2);   # good

{% endhighlight %}

Log messages and messages for internal errors (e.g. not caused by the user)
should not be translated. They will usually be sent back as bug-reports,
and we want to understand them.

Files containing translatable strings must have their name listed in
`po/POTFILES.in`.

#  Gettext for translation manager

As `.po` and `.pot` files indicate at which positions the
strings were extracted, adding or removing a single line to a source file
would be enough to completely modify all the files of the `po`
directory. As a consequence, a developer should never update the
translations after modifying a source file, so as to not pollute the
git repository.

When preparing a release, during string freeze, one single developer (it
does not have to be always the same one, but it can help in case of
gettext version discrepancies) should be chosen to run


        cd po ; make update-po

and commit the resulting modifications. Then, just before releasing, once
translators have sent or committed their modifications to `.po`
files, it should be run again, so that packagers have access to updated
files.
