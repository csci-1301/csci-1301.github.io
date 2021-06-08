# if Statements

The keyword `if` allows us to write code that "branches" between multiple flows of execution.
So far, all the code we have studied has been executed one line after the other: line $n$ is always executed before line $n+1$ and after line $n-1$ (this order is called "sequential").
With `if` statements, we can tell C# that some lines need to be "skipped" depending if a condition (that evaluates to a boolean value) is met or not.

We will start by motivating with a simple example, then introduce the formal syntax of `if` and `if-else` statements, and conclude with a discussion of more advanced topics.

## First Example

Let us study the following lines:

```
Console.WriteLine("Enter your age");
int age = int.Parse(Console.ReadLine());
if (age >= 18)
{
    Console.WriteLine("You can vote!");
}
Console.WriteLine("Thanks for using our program!");
```

The code is written such that the statement `Console.WriteLine("You can vote!");` is executed only if the condition `(age >= 18)` evaluates to `true`.
Otherwise, that statement is simply "skipped".
Note that regardless of the truth value of the condition `(age >= 18)`, "Thanks for using our program" will always be displayed: once the body of the `if` statement is executed, the flow of execution resumes its sequential course.

## Syntax

The syntax of an `if` statement is as follows:

```
if (<condition>)
{
    <statement block>
}
```

Please observe the following.

- `<Condition>` is something that evaluates to a `bool`, such as `myAge > 18` or `firstName == "Thomas"`. Having something that is not an expression or a boolean variable, such as a number, would result in a compilation error: `if(3)` is not syntactically correct.
- Note the absence of semicolon after `if (<condition>)`.
- The curly braces can be removed if the statement block is just one statement. What is between them is called _the body_ of the `if` statement.
- The following statements (that is, after the `}` that terminates the body of the `if` statement) are executed in any case.

The body of an `if` statement can be arbitrarily complicated: it can contain multiple statements, including other `if` statements, object instantiation, etc.

# if-else Statements

One limit of `if` statements is that they only describe what happens if the condition is met, and not what should happen if the condition is _not_ met.
This can be worked around with a clever use of the negation operator (`!`):

```
if(<condition>)
{
    <statement block 1>
}
if(!<condition>)
{
    <statement block 2>
}
```

If `<condition>` is met, then `<statement block 1>` will be executed. 
If `<condition>` is not met, that is, if it evaluates to `false`, then we know that `!<condition>` will evaluate to `true`, and hence `<statement block 2>` will be executed.

This method is inconvenient and clunky, but luckily C# contains the keyword `else` that enables the described behavior in a more elegant syntax.

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

With `if-else` statements, `<statement block 1>` is executed only if the condition evaluates to `true`, and `<statement block 2>` is executed only if the condition evaluates to `false`. 
Note that since a condition always evaluates to either `true` or `false`, we know that at least one of the blocks will be executed.
Since a condition cannot be `true` and `false` at the same time, we also know that at most one block will be executed.
Hence, exactly one block will be executed.

Here we modify our previous example to include else:

```
Console.WriteLine("Enter your age");
int age = int.Parse(Console.ReadLine());
if (age >= 18)
{
    Console.WriteLine("You can vote!");
}
else
{
    Console.WriteLine("It seems that you are too young to vote!");
}

Console.WriteLine("Thanks for using our program!");
```


# Nested if-else Statements

As we wrote previously, the body of an `if` statement (that is, the `<statement block>`) can be arbitrarily complex.
In particular, it can include an `if-else` statement itself!

Imagine we want to improve our previous program that decides if the user can vote: we would like to ask not only for the age of the user, but also citizenship, and make a decision based on both parameters.
A possible way of doing that is by _nesting the options_, so that we would _first_ check the citizenship, and _then_ the age, before displaying a more personalized message.

The behavior we would like to implement can be represented with the following activity diagram:

!["A flowchart representation of the nested if-else statement"](img/vote_age_citizenship)

This particular behavior can be implemented as follows (where we simply "hard-code" the value of `usCitizen` and `age` to simplify the code):

```
bool usCitizen = true;
int age = 19;

if (usCitizen == true)
{
    if (age >= 18)
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
Console.WriteLine("Thanks for using our program!");
```

Note that

- There is a simpler way to write `usCitizen == true`: simply write `usCitizen`!
- We could remove the braces (and new lines/indentation) since each condition corresponds to exactly one statement. However, notice that it would make the code harder to read and debug:
    ```
    if (usCitizen == true)if (age >= 18)Console.WriteLine("You can vote!");
    else Console.WriteLine("You are too young!");
    else Console.WriteLine("Sorry, only citizens can vote");
    ```

- We could have a similar program with only one `if else`, but using a more complex condition: `if(age > 18 && usCitizen) … else …`, but the messages would be less precise (as if this condition fails, we cannot tell if it is because of the age or the citizenship).

# if-else-if Statements

We can also nest the conditions in a different way: instead of writing

```
if (<condition 1>)
{
    <statement block1> // Executed if condition 1 is true.
}
else{
    if (<condition 2>)
    {
        <statement block2> // Executed if condition 1 is false and condition 2 is true.
    }
    else{
        if (<condition 3>)
        {
            <statement block3> // Executed if condition 1 and 2 are false and condition 3 is true.
        }
        else
        {
            <statement block4> // Executed if condition 1, 2 and 3 are false.
        }
        
    }
}

```

We can use a convenient `if-else-if` structure, as follows:

```
if (<condition 1>)
{
    <statement block> // Executed if condition 1 is true
}
else if (<condition 2>)
{
   <statement block> // Executed if condition 1 is false and condition 2 is true
}
…
else if (<condition N>)
{
    <statement block> // Executed if all the previous conditions are false and condition N is true
}
else
{
    <statement block>  // Executed if all the conditions are false
}
```

This reduces the need of nesting _statements_ (that comes with identation for readability) and makes the code easier to read and debug.

An important aspect to note is that the conditions could be really different, and may not even pertain to the same variable!

## Example

We can make an example with really different, non-overlapping, conditions: 

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

Giving various values for `age`, `charVar` and `boolFlag`, we can see which value would `x` get in each case:

`age` | `charVar` | `boolFlag` | `x`
--- | --- | --- | --- | 
13 | 'c' | `true`  | 0
10 | 'c' | `true`  | 1
10 | 'd' | `true`  | 2
10 | 'd' | `false` | 3

Note that, in this particular case, the order of the conditions matters quite a lot!
If we had
```
if (boolFlag)
    x = 2;
else if (age > 12)
    x = 0;
else if (charVar == 'c')
    x = 1;
else 
    x = 3;
```

Then we would obtain:

`age` | `charVar` | `boolFlag` | `x`
--- | --- | --- | --- | 
13 | 'c' | `true`  | 2
10 | 'c' | `true`  | 2
10 | 'd' | `true`  | 2
10 | 'd' | `false` | 3


# Shorthand notation: the `?:` Operator

There is an operator for `if else` statements for particular cases (assignment, call, increment, decrement, and new object expressions).
Its syntax is as follow:

`<condition> ? <first_expression> : <second_expression>;`

For example, one can write:

```
int price = adult ? 5 : 3;
```

which means that `price` will receive the value `5` if `adult` is `true`, and `3` otherwise.

You can read more about this convenient operator [in the documentation](https://docs.microsoft.com/en-us/dotnet/csharp/language-reference/operators/conditional-operator).

# Boolean Flags

Do you remember that a boolean *flag* is a boolean variable?
We can use it to "store" the result of an interaction with a user.

Assume we want to know if the user works full time at some place, we could get started with:

```
Console.WriteLine("Do you work full-time here?");
char ch = Console.ReadKey().KeyChar; // Note that we are using a new method, to read characters.

if (ch == 'y' || ch == 'Y')
     Console.WriteLine("Answered Yes");
else if (ch == 'n' || ch == 'N')
     Console.WriteLine("Answered No");
else
     Console.WriteLine("Said what?");
```

But there are not three answers to this question (you either work here full-time, or you do not), so we can change the behavior to

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

If you understand the `?` operator, you can even shorten that statement to:

```
fullTime = (ch == 'y' || ch == 'Y') ? true : false;
```

But why stop here? We could even do

```
fullTime = (ch == 'y' || ch == 'Y');
```

And that is it!
We went from long, convoluted code, to a very simple line!
This allows to simply store result of tests in variables, and to access it easily.
