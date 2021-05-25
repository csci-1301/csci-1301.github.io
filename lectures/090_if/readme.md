 
# if Statement

## First Example

~~~~~~~{.cs .numberLines}
Console.WriteLine("Enter your age");
int age = int.Parse(Console.ReadLine());
if (age >= 18)
{
    Console.WriteLine("You can vote!");
}
~~~~~~~

The idea is that the statement ` Console.WriteLine("You can vote!");` is executed only if the condition `(age >= 18)` evaluates to `true`. Otherwise, that statement is simply "skipped".

## Syntax

~~~~~~~{.cs .numberLines}
if (<condition>)
{
    <statement block>
}
~~~~~~~

Please observe the following.

- `<Condition>` is something that evaluates to a `bool`. For instance, having a number like in `if(3)` would not compile.
- Note the absence of semicolon after `if (<condition>)`.
- The curly braces can be removed if the statement block is just one statement.
- The following statements (that is, after the `}` that terminates the body of the `if` statement) are executed in any case.

# if-else Statements

## Syntax

~~~~~~~{.cs .numberLines}
if (<condition>)
{
    <statement block 1>
}
else
{
    <statement block 2>
}
~~~~~~~

With `if-else` statements, the idea is that the statement block 1 is executed only if the condition evaluates to `true`, and that the statement block 2 is executed only if the condition evaluates to `false`. 
Note that since a condition is always either true or false, we know that at least one of the block will be executed, and since a condition cannot be true and false at the same time, at most one block will be executed: hence, exactly one block will be executed.

# Nested if-else Statements

`<statement block>` can actually be an `if-else` statement itself!

<!--
https://mermaidjs.github.io/mermaid-live-editor/#/view/Z3JhcGggVEQKQVtTdGFydF0tLT58QXNrIGZvciBDaXRpemVuc2hpcCBhbmQgYWdlfCBCe1VzIENpdGl6ZW5zaGlwP30KQiAtLT58VHJ1ZXwgQ3tBZ2Ugb3ZlciAxOD99CkMgLS0-fEZhbHNlfCBFW1lvdSBhcmUgdG9vIHlvdW5nIV0KQyAtLT58VHJ1ZXwgRltZb3UgY2FuIHZvdGUhXQpCIC0tPnxGYWxzZXwgRFtTb3JyeSwgeW91IGNhbid0IHZvdGUgaW4gdGhlIFVTIV0
-->

!["A flowchart representation of the nested if-else statement"](img/15nestedif.png)

~~~~~~~{.cs .numberLines}
bool usCitizen = true;
int age = 19;

if (usCitizen == true)
{
    if (age > 18)
    {
        Console.WriteLine("You can vote!");
    }
    else
    {
        Console.WriteLine("You are too young!");
    }
}
else
{
    Console.WriteLine("Sorry, only citizens can vote");
}
~~~~~~~

Note that

- There is a simpler way to write `usCitizen == true`: simply write `usCitizen`!
- We could remove the braces
- We could have a similar flavor with only if: `if(age > 18 && usCitizen) … else …`, but the messages would be less accurate.

# if-else-if Statements

~~~~~~~{.cs .numberLines}
if (<condition 1>)
{
    <statement block> // Executed if condition 1 is true
}
else if (<condition 2>)
{
   <statement block> // Executed if condition 1 is false and condition 2 is true
}
...
else if (<condition N>)
{
    <statement block> // Executed if all the previous conditions are false and condition N is true
}
else
{
    <statement block>  // Executed if all the conditions are false
}
~~~~~~~

Note that the conditions could be really different, not even testing the same thing!

## Example

We can make an example with really different conditions, not overlapping: 

~~~~~~~{.cs .numberLines}
if (age > 12)
    x = 0;
else if (charVar == 'c')
    x = 1;
else if (boolFlag)
    x = 2;
else 
    x = 3;
~~~~~~~

Giving various values to age, charVar and boolFlag, we will see which value would `x` get in each case.

# ?: Operator

There is an operator for `if else` statements for particular cases (assignment, call, increment, decrement, and new object expressions):

`condition ? first_expression : second_expression;`

~~~~~~~{.cs .numberLines}
int price = adult ? 5 : 3;
~~~~~~~

We will have a brief look at it if time allows, otherwise you can read about it at <https://docs.microsoft.com/en-us/dotnet/csharp/language-reference/operators/conditional-operator>.

# if-else-if Statements

~~~~~~~{.cs .numberLines}
if (<condition 1>)
{
    <statement block 1> // Executed if condition 1 is true
}
else if (<condition 2>)
{
   <statement block 2> // Executed if condition 1 is false and condition 2 is true
}
...
else if (<condition N>)
{
    <statement block N> // Executed if all the previous conditions are false and condition N is true
}
else
{
    <statement block N+1>  // Executed if all the conditions are false
}
~~~~~~~

Note that the conditions could be really different, not even testing the same thing!

## Example

We can make an example with really different conditions, not overlapping: 

~~~~~~~{.cs .numberLines}
if (age > 12)
    x = 0;
else if (charVar == 'c')
    x = 1;
else if (boolFlag)
    x = 2;
else 
    x = 3;
~~~~~~~

Try to give various values to `age`, `charVar` and `boolFlag`, and see which value would `x` get in each case.


# Boolean Flags

Remember that a boolean *flag* is a boolean variable?
We can use it to "store" the result of an interaction with a user.

Assume we want to know if the user work full time at some place, we could get started with:

~~~~~~~{.cs .numberLines}
Console.WriteLine("Do you work full-time here?");
char ch = Console.ReadKey().KeyChar; // Note that here, passing by, we are using a new method, to read characters.

if (ch == 'y' || ch == 'Y')
     Console.WriteLine("Answered Yes");
else if (ch == 'n' || ch == 'N')
     Console.WriteLine("Answered No");
else
     Console.WriteLine("Said what?");
~~~~~~~

But we can't accommodate this 3-party situation (you either work here full-time, or you don't), so we can change the behavior to

~~~~~~~{.cs .numberLines}
if (ch == 'y' || ch == 'Y')
     Console.WriteLine("Answered Yes");
else
     Console.WriteLine("Answered No");
~~~~~~~

We'll study _user input validation_, that allows to get better answers from the users, later on.

But imagine we are at the beginning of a long form, and we will need to re-use that information multiple times.
With this previous command, we would need to duplicate all our code in two places.
Instead, we could "save" the result of our test in a boolean variable, like so:

~~~~~~~{.cs .numberLines}
bool fullTime;
if (ch == 'y' || ch == 'Y')
    fullTime = true;
else
    fullTime = false;
~~~~~~~

If you looked at the `?` operator in lab, you can even shorten that statement to:

~~~~~~~{.cs .numberLines}
fullTime = (ch == 'y' || ch == 'Y') ? true : false;
~~~~~~~

Why stop here? We could even do

~~~~~~~{.cs .numberLines}
fullTime = (ch == 'y' || ch == 'Y');
~~~~~~~

Tada! We went from a long, convoluted code, to a very simple line!
We already did this trick last time, but I thought that seeing it again would help.

#  Constructing a Value Progressively

In lab, last time, you were asked the following:

> Ask the user for an integer, and display on the screen “positive and odd” if the number is positive and odd, “positive and even” if the number is positive and even, “negative and odd” if the number is negative and odd, “negative and even” if the number is negative and even, and “You picked 0” if the number is 0.

A possible answer is:

~~~~~~~{.cs .numberLines}
int a;
Console.WriteLine("Enter an integer");
a = int.Parse(Console.ReadLine());
if (a >= 0)
{
    if (a % 2 == 0)
        Console.WriteLine("Positive and even");
    else // if (a % 2 != 0)
        Console.WriteLine("Positive and odd");
}
else
{
    if (a % 2 == 0)
        Console.WriteLine("Negative and even");
    else
        Console.WriteLine("Negative and odd");
}
~~~~~~~

That is a lot of repetition!
We could actually construct "progressively" the message we will be displaying:

~~~~~~~{.cs .numberLines}
string msg;
if (a >= 0)
{
    msg = "Positive";
}
else
{
    msg = "Negative";
}
if (a % 2 == 0)
    msg += " and even";
else // if (a % 2 != 0)
    msg += " and odd";
~~~~~~~

Much better!
Since the two conditions are actually independent, we can test them in two different `if` statements!
