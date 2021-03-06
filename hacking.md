---
title: hacking
layout: wiki
---
{% include toc.md %}
#  Coding style guidelines

With multiple coders working on the same source files, there needs to be a standard specifying how code is written down. Not doing so can cause quite some annoyance for certain coders and easily creates more version conflicts than necessary.

##  Indentation

Code is indented using 4 spaces, no tabs.

##  Line length

Should not exceed 79 characters.

One reason for this is to keep code readable. In such cases it would often be better to spread the line over multiple lines or use some extra temporary variables. Another reason is that some of us are using editors that default to an 80 character wide screen, and often put two instances next to each other. 79 character wide lines leave just a spot for the cursor at the end of the line.

##  Control constructs

Control keywords are not function names, so they should be followed by a space. Statements should be enclosed in brackets, and these brackets should be on their own lines. Control constructs are complete statements, so they should not be followed by semi-colons.

{% highlight cpp %}
if (condition)
{
}
else
{
}

{% endhighlight %}

{% highlight cpp %}
for (init; condition; step)
{
}

{% endhighlight %}

{% highlight cpp %}
while (condition)
{
}

{% endhighlight %}

When there is only one statement you may leave out the braces, but don’t place the statement on the same line as the condition:

Good:

{% highlight cpp %}
if (condition)
    statement;

{% endhighlight %}

Bad:

{% highlight cpp %}
if (condition) statement;

{% endhighlight %}

Functions and members should be laid as follows. They have no reason to be followed by semi-colons either.

{% highlight cpp %}
/**
 * Documentation about behaviour
 * ...
 *
 * @param param1 the first argument
 * @param param2 the second argument
 */
void function(param1, param2)
{
}

{% endhighlight %}

Classes should be laid as follows.

&lt;code cpp&gt;class TheClass : public TheParentclass
{
    public:
        void something();

    private:
        void somethingElse();
};


##  Includes

Source files should include their header first, to make sure the headers are self-contained. After that follow other project includes, grouped by directory and alphabetically ordered, with subdirectories after other headers in that directory. All project includes are done relative from the `src` directory. Library includes (like Guichan) come next. System includes come last. Each set of includes (project directories, separate libraries, system includes) should be set off from each other.

Good (subdirectory/source.cpp):

{% highlight cpp %}
#include "subdirectory/source.h"

#include "foo.h"

#include "asub/whatever.h"

#include "somesub/bar.h"
#include "somesub/zaro.h"

#include "somesub/anothersub/baz.h"

#include <librarylib.h>

#include <systemlib.h>

{% endhighlight %}

##  Comments

Single line C++ style comments are indented the same as the previous line.

Multiple line C style comments are initially indented like previous line except every new line of the comment begins with a asterisk (`*`) which lines up with the initial asterisk of the comment opening (1 space indent). The comment is closed also with the asterisk lining up. Comment text is only placed on a line starting with a asterisk.

Good:

{% highlight cpp %}
/*
 * Some comment
 * additional comment material
 */

{% endhighlight %}

Bad:

{% highlight cpp %}
/* text
comment
*/

{% endhighlight %}

Note that for documenting functions, methods and other things that can use documentation, you should use Doxygen style as in the function example above. For details see the manual at [http://www.doxygen.org/](http://www.doxygen.org/).

##  Whitespace

Good:

{% highlight cpp %}
x = ((5 + 4) * 3) / 1.5;
afunction(12, 3, 1 + 1);

{% endhighlight %}

Bad:

{% highlight cpp %}
x = ( ( 5 + 4 )*3 ) / 1.5;
afunction (12,3,(1+1));

{% endhighlight %}
##  Naming

Method, class, member and constant naming is based on the generally accepted way Java code is written.

 * Classes: `CapitalizedWords`
 * Methods: `camelCase`
 * Members: `mCamelCase`
 * Constants/enums: `UPPERCASE_UNDERSCORES`

To denote global variables and functions the lowercase_underscores style may be used. Hungarian style should be avoided.

##  Adding, moving or deleting a file

Whenever you add, move or delete a source file somewhere in `./src` do not forget to add them in:

 * for the [Automake](http://www.gnu.org/software/automake/) build tools:
  `./src/Makefile.am`
 * for the [Cmake](http://www.cmake.org/) build tools:
  `./src/CMakeLists.txt`
 * for the [Code::Blocks](http://www.codeblocks.org/) project file:
  `./src/mana.cbp`
 * for [QT Creator](http://qt.nokia.com/products/developer-tools):
  `./src/mana.files`

##  Coding in Emacs

You can add the following code to your `~/.emacs` file.


    ;;
    ;; Defines custom tmw-c++-mode
    ;;
    (defun tmw-c++-mode ()
      ;; Set style to ellemtel
      (c-set-style "ellemtel")
      ;; Set line indent to 4
      (setq c-basic-offset 4)
      ;; Use space for indent instead of tabs
      (setq indent-tabs-mode nil)
      ;; Message
      (message "Loading tmw-c++-mode...")
      )
    
    ;; Cleanup whitespace before saving. Safe for diffs.
    (add-hook 'before-save-hook 'whitespace-cleanup)
    
    ;; Hookup tmw-c++-mode as default c++-mode and c-mode
    (add-hook 'c-mode-common-hook 'tmw-c++-mode)


#  Hacking C++ files

While obtaining an efficient program usually requires to have efficient algorithms, it is sometimes enough to be follow a few simple rules when writing code.

##  Argument types, variable types, and return types

The `int` primitive type is the most efficient integer type on a given architecture, by definition. As a consequence, it should always be used be for types of function arguments, and return types, and automatic local variables, when it is wide enough to store all the values. Using other types would force the compiler to constantly go though costly sign/zero-extensions in order to manipulate values in processor registers. There is an exception with "unsigned" types for local variables, when a modulo semantic is explicitly required in order to get an overflow behavior of arithmetic operations.

When complicated objects are passed as arguments, they should be passed by reference to avoid a costly copy of the value. Note that `std::string` is such a complicated object. Primitive types should passed by value. Example:

{% highlight cpp %}
void f(const std::string &s);
void g(int);

{% endhighlight %}

When returning a complicated object, if this object already exists in non-local memory, the function should return it as a reference. Example:

{% highlight cpp %}
class Character : public Being
{
    public:
        /** Gets the name of the character. */
        const std::string &getName() const
        { return mName; }

    private:
        std::string mName; /**< Name of the character. */
};

{% endhighlight %}

Note that members that do not modify the objects they are invoked upon should have the `const` keyword at the end of their prototype.

When passing an argument by value, the `const` keyword is ignored by the compiler for the declaration of the function (it is taken into account for the body definition though). For example, compilers will refuse to compile the following code, as you have defined two functions with the same prototype.

{% highlight cpp %}
struct A
{
    void f(int v)       { /* something */ }
    void f(const int v) { /* something else */ }
};

{% endhighlight %}

So please avoid putting `const` everywhere.

##  Class layout

Concerning data members of objects, there is no constraints on the types. The smallest ones able to hold all the values should be chosen, in order to minimize the memory footprint of the objects. Be careful with alignment issues, as the size of an object does not only depend on the size of its data members, but also on the relative position of these members. In the following example on a x86-64 architecture, an object of type A is 25% bigger than an object of type B, even though they contain the exact same members.

{% highlight cpp %}
struct A
{
    char a;
    int b;
    char c;
    std::vector< short > d;
};

struct B
{
    std::vector< short > d;
    int b;
    char a;
    char c;
};

{% endhighlight %}

A simple way to get small objects is to start the class declaration with the most complicated members and finish with the ones with the least requirements on alignment.

##  Trivial accessors

Some class members are trivial accessors to private data of objects. These members should be defined in the header files, so that the compiler can optimize them away when they are called from source files. Example:

{% highlight cpp %}
class Character : public Being
{
    public:
        /**
         * Gets client computer.
         */
        GameClient *getClient() const
        { return mClient; }

        /**
         * Sets client computer.
         */
        void setClient(GameClient *c)
        { mClient = c; }

    private:
        GameClient *mClient; /**< Client computer. */
};

{% endhighlight %}

##  Empty default constructors and destructors

While trivial accessors should be put into header files, it sometimes makes sense to move compiler-generated default constructors and destructors outside the header files, even if means having constructors and destructors with empty bodies in the source files. A comment should then be added, so that the intent of the developer is clear.

{% highlight cpp %}
// a.hpp

class A
{
    public:
        ~A();

    private:
        std::string mS;
        std::map< void *, std::string > mM;
        std::vector< std::list< int > > Mv;
};

{% endhighlight %}

{% highlight cpp %}
// a.cpp

A::~A()
{
    /*
     * Due to the numerous complicated data members, the compiler-generated
     * default destructor is actually huge. So it is explicitly declared in
     * the header file and defined here, even though it has an empty body.
     */
}

{% endhighlight %}

##  Loops and iterators

The following loop suffers from several short-comings:

{% highlight cpp %}
std::map< int, std::string >::const_iterator i;
for (i = themap.begin(); i != themap.end(); i++)
{
    std::cout << i->first << ", " << i->second << std::endl;
}
// i no longer used

{% endhighlight %}

First, the variable `i` is not used outside the loop, so it should have been defined inside the loop header.

Second, the map is never modified, so iterators are never invalidated. As a consequence, the iterator `themap.end()` should be computed only once at the beginning of the loop instead of being recomputed at each iteration. If the body of the loop is complicated, the compiler may not be able to optimize away this recomputation. An end iterator or a container size should be recomputed at each iteration, only when the container size may have changed in the body.

Third, the `i++` syntax tells the compiler to first perform a copy of the iterator, and then to increment the original variable. The `++i` syntax, however, does not require a copy. If the loop index is a primitive type, even a poor compiler will be able to optimize away the copy. If the loop index is a complicated iterator, even a good compiler may be unable to remove every dead parts of the generated code. So always using `++i` is a good practice.

So the loop should have been coded as:

{% highlight cpp %}
for (std::map< int, std::string >::const_iterator
     i = themap.begin(), i_end = themap.end(); i != i_end; ++i)
{
    std::cout << i->first << ", " << i->second << std::endl;
}

{% endhighlight %}

##  dynamic_cast

Dynamically casting a pointer is a powerful yet costly tool. It should be used only when
   - Static casting is impossible, e.g. when casting from a virtual base class. Note that there is no such beast in Mana.
   - You have no way to know the real type of the object pointed to. Note that most base classes in Mana have a virtual member returning the real type of a derived object, e.g. `Being::getType`.

There usually isn't a reason to use `dynamic_cast` instead of `static_cast`, but cases do happen. Don't just use it to be lazy.

##  throw()

While an empty throw specification does guarantee that a function will never throw an exception, it does not guarantee it by forbidding the body of the function from throwing an exception, like it would in Java for example. In C++, the compilers guarantee it by adding an implicit `try catch` block around the body of the function. When an exception is caught, the program will call the `terminate` function, hence ensuring the caller never sees the exception as the program will abort.

Developers used to Java tend to put `throw()` on the prototype of every functions that do not contain the `throw` keyword. This is a bad habit in C++, due to the slightly different meaning of the exception specification. For example, some compilers completely disable inlining of (even trivial) functions when they encounter an empty specification, as the implicit `catch` would break their optimizers.

So only use an empty throw specification when you need the catch-and-terminate semantic of the language. Do not use it to say that your function does not throw.

##  Execution of SQL Statements

As this is a special topic for its own, see [executing SQL statements](executing_sql_statements.html).
