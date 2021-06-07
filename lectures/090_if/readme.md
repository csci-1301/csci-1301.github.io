 
# if Statement

## First Example

```
Console.WriteLine("Enter your age");
int age = int.Parse(Console.ReadLine());
if (age >= 18)
{
    Console.WriteLine("You can vote!");
}
```

Here, the idea is that the statement ` Console.WriteLine("You can vote!");` is executed only if the condition `(age >= 18)` evaluates to `true`. Otherwise, that statement is simply "skipped".

## Syntax

```
if (<condition>)
{
    <statement block>
}
```

Please observe the following.

- `<Condition>` is something that evaluates to a `bool`. For instance, having a number like in `if(3)` would not compile.
- Note the absence of semicolon after `if (<condition>)`.
- The curly braces can be removed if the statement block is just one statement.
- The following statements (that is, after the `}` that terminates the body of the `if` statement) are executed in any case.

# if-else Statements

## Syntax

```
if (<condition>)
{
    <statement block 1>
}
else
{
    <statement block 2>
}
```

With `if-else` statements, statement block 1 is executed only if the condition evaluates to `true`, and block 2 is executed only if the condition evaluates to `false`. 
Note that since a condition is always either true or false, we know that at least one of the blocks will be executed. Since a condition cannot be true and false at the same time, we also know that at most one block will be executed. Hence, exactly one block will be executed.

# Nested if-else Statements

A `<statement block>` can actually include an `if-else` statement itself!

<!--
https://mermaidjs.github.io/mermaid-live-editor/#/view/Z3JhcGggVEQKQVtTdGFydF0tLT58QXNrIGZvciBDaXRpemVuc2hpcCBhbmQgYWdlfCBCe1VzIENpdGl6ZW5zaGlwP30KQiAtLT58VHJ1ZXwgQ3tBZ2Ugb3ZlciAxOD99CkMgLS0-fEZhbHNlfCBFW1lvdSBhcmUgdG9vIHlvdW5nIV0KQyAtLT58VHJ1ZXwgRltZb3UgY2FuIHZvdGUhXQpCIC0tPnxGYWxzZXwgRFtTb3JyeSwgeW91IGNhbid0IHZvdGUgaW4gdGhlIFVTIV0
-->

!["A flowchart representation of the nested if-else statement"](img/15nestedif.png)

```
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
```

Note that

- There is a simpler way to write `usCitizen == true`: simply write `usCitizen`!
- We could remove the braces since each condition corresponds to exactly one statement.
- We could have a similar flavor with only if: `if(age > 18 && usCitizen) … else …`, but the messages would be less accurate.

# if-else-if Statements

```
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
```

Note that the conditions could be really different, not even testing the same thing!

## Example

We can make an example with really different conditions, not overlapping: 

```
if (age > 12)
    x = 0;
else if (charVar == 'c')
    x = 1;
else if (boolFlag)
    x = 2;
else 
    x = 3;
```

Giving various values for age, charVar and boolFlag, we can see which value would `x` get in each case.

# ?: Operator

There is an operator for `if else` statements for particular cases (assignment, call, increment, decrement, and new object expressions):

`condition ? first_expression : second_expression;`

```
int price = adult ? 5 : 3;
```

We will have a brief look at it if time allows, otherwise you can read about it at <https://docs.microsoft.com/en-us/dotnet/csharp/language-reference/operators/conditional-operator>.


# Boolean Flags

Do you remember that a boolean *flag* is a boolean variable?
We can use it to "store" the result of an interaction with a user.

Assume we want to know if the user works full time at some place, we could get started with:

```
Console.WriteLine("Do you work full-time here?");
char ch = Console.ReadKey().KeyChar; // Note that here, passing by, we are using a new method, to read characters.

if (ch == 'y' || ch == 'Y')
     Console.WriteLine("Answered Yes");
else if (ch == 'n' || ch == 'N')
     Console.WriteLine("Answered No");
else
     Console.WriteLine("Said what?");
```

But there aren't three answers to this question (you either work here full-time, or you don't), so we can change the behavior to

```
if (ch == 'y' || ch == 'Y')
     Console.WriteLine("Answered Yes");
else
     Console.WriteLine("Answered No");
```

We'll study _user input validation_, that allows us to require better answers from users, later on.

But imagine we are at the beginning of a long form, and we will need to re-use that information multiple times.
If we use this code fragment, we would need to duplicate all our code.
Instead, we could "save" the result of our test in a boolean variable, like so:

```
bool fullTime;
if (ch == 'y' || ch == 'Y')
    fullTime = true;
else
    fullTime = false;
```

If you understand the `?` operator (from the link in lecture or from lab), you can even shorten that statement to:

```
fullTime = (ch == 'y' || ch == 'Y') ? true : false;
```

Why stop here? We could even do

```
fullTime = (ch == 'y' || ch == 'Y');
```

Tada! We went from long, convoluted code, to a very simple line!
We already did this trick last time, but I thought that seeing it again would help.

#  Constructing a Value Progressively

In the if statement lab, you are asked the following:

> Ask the user for an integer, and display on the screen “positive and odd” if the number is positive and odd, “positive and even” if the number is positive and even, “negative and odd” if the number is negative and odd, “negative and even” if the number is negative and even, and “You picked 0” if the number is 0.

A possible answer is:

```
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
```

That is a lot of repetition!
We could actually "progressively" construct the message we will be displaying:

```
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
```

Much better!
Since the two conditions are actually independent, we can test them in two different `if` statements!
