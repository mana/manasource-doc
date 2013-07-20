---
title: executing sql statements
layout: wiki
---
{% include toc.md %}
#  Executing SQL statements from C++

The current Data access layer (DAL) of manaserv provides an abstract interface to execute SQL statements against several types of database engines. SQL statement can be executed using two different methods whereas the second one is the preferred way.

##  Using the execSQL method

The easiest way to execute an SQL statement is to call the `execSql` method, providing the statement is a complete string. As this looks very simple and comes as an one liner, you have to be aware of [SQL injection attacks](http://en.wikipedia.org/wiki/SQL_Injection).

{% highlight cpp %}
const RecordSet& execSql(const std::string& sql, const bool refresh = false)
const RecordSet& info = mDb->execSql("SELECT x FROM y WHERE z = 'a'");

{% endhighlight %}

##  Using prepared statements

The secure way in executing SQL, without having to worry about SQL injection attacks, is to use prepared statements and bind variables. Many database systems are even faster when using them, because the internal memory can be used much more efficiently.

To execute a statement using bind variables, you have to do the following steps:

   - Write your SQL statement containing place holders instead of final values
   - Let the dataprovider parse and prepare your statement
   - Bind the final values to your prepared statement
   - Execute the prepared statement with your bound values
      - Return to 3, if you have to execute the statement more than once, but with different values
      - Finalize the prepared statement and free memory

Ported to our DAL this means the following:

{% highlight cpp %}
std::string sql = "SELECT x FROM y WHERE z = ?";   // ? is used as placeholder for out final value
                                                   // column or table names can never be expressed as placeholders!
mDb->prepareStatement(sql, 1);                     // prepare the statement, define that we need 1 bind variable
mDb->bindParameter("a", 1);                        // bind value "a" as first parameter
const RecordSet& info = mDb->execStatement();      // execute statement

{% endhighlight %}

As you can see, it takes a little more effort to execute a SQL statement using bind variables, but that should not frighten you doing it that way! The `execStatement()` method frees up memory for you and finalizes the prepared statement. If you want to re-execute it with different bind variables have a look at the following example:

{% highlight cpp %}
std::string sql = "INSERT INTO x (z) VALUES (?);";
mDb->prepareStatement(sql, 1);

for (int i = 1; i <= 10; i++)
{
    mDb->bindParameter(i, 1);
    mDb->execStatement((i==10));
}

{% endhighlight %}

Calling `execStatement(bool)` with `false`, resets the bound variables in the prepared statement to `NULL` but keeps the statement in prepared state. Only if we come to the last execution, we want to finalize and clean up everything.
