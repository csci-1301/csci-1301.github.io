---
title: Type Casting
---

# Numerical Datatypes

For this part, it is recommended to have the datatypes cheatsheet, which is available in the Week 4 module of the lecture notes.
Note that it contains numerous references at its end.
You are encouraged to open those links, if you have not already, to have a look at the official documentation, which should not scare you.

## Literals and Variables

This part should be first carried out without using VS.

Assume we have the following statements:

~~~~~~~{.cs}
int a = 21, b = 4;
float f = 2.5000000f;
double d = -1.3;
decimal m = 2.5m;
~~~~~~~
 
Answer the following: 

- How many variables are declared?
- What are their datatypes?
- What are their values?
- What are their names?


## Operations


- Consider the following expressions. For each of them, tell if they are legal and if so, give the result and its corresponding datatype.  The first two are given as examples:


Operation | Legal? | Result | Datatype
--- | --- | --- | ---
`a + d` | Yes | $19.7$ | `double`
`m + f` | No |\_ | \_|
`a / b` |\_ |\_|\_|
`b * f` |\_ |\_|\_|
`d + f` |\_ |\_|\_|
`d + b` |\_ |\_|\_|
`a + m` |\_ |\_|\_|
`f / m` |\_ |\_|\_|
`d * m` |\_ |\_|\_|

    
You can check your answers using VS: create a new project, copy the variable declarations and assignments, and  write your own statements to perform the calculations in the `Main` method.
For instance, if you want to check that the result of `a + d` is of type `double`, write something like:

~~~~~~~{.cs}
double tempVariable1 = a + d;
Console.WriteLine($"The value of d+f is {tempVariable1}");
int tempVariable2 = a + d; // This line should give you an error.
~~~~~~~

<!-- 
There has to be a better way!
https://stackoverflow.com/questions/11634079/how-can-i-get-the-data-type-of-a-variable-in-c
Check the actual type!
-->

## Cast Operator

Create a new project, and then do the following.

#. Add in your program the following:

    ~~~~~~~{.cs}
    float floatVar = 4.3f;
    int intVar = floatVar; // This statement will give you an error
    ~~~~~~~

    You will get an error that reads

    ~~~~~~~{.bash}
    Cannot implicitly convert type 'float' to 'int'. An explicit conversion exists (are you missing a cast?)
    ~~~~~~~

    Can you explain it?

#. VS is suggesting that we use a "cast" to "force" C# to store the value of the variable `floatVar` into the variable `intVar`.
To do so, replace the previous statement with the following:

    ~~~~~~~{.cs}
    int intVar = (int)floatVar; // This statement will compile
    ~~~~~~~

#. Using a `Console.WriteLine` statement, observe the value stored in `intVar`.
Can you tell if the value stored in `floatVar` was rounded or truncated before being stored in the variable `intVar`?
Conduct further experiments if needed to answer this question.