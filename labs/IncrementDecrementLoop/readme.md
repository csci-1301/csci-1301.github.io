---
title: Increment and Decrement Operators, First Loops
---


# Increment and Decrement Operators

Copy and paste this code into a new Visual Studio project and execute it.
Study the output carefully to make sure you understand the mechanism of the increment and decrement operators.

```
int a = 0, b = 0;
Console.WriteLine("Before changing their values:");
Console.WriteLine($"\ta is {a}\n\tb is {b}\n-----------");
Console.WriteLine("Incrementing, using postfix and prefix operators:");
a++;
++b;
Console.WriteLine($"\ta is {a}\n\tb is {b}\n-----------");
Console.WriteLine("Decrementing, using postfix and prefix operators:");
a--;
--b;
Console.WriteLine($"\ta is {a}\n\tb is {b}\n-----------");
Console.WriteLine("When combining decrementing and incrementing operators"
    + " with other operations,\nit makes a difference whether you use"
    + " postfix or prefix operators!");
int c = a--, d = ++b;
Console.WriteLine($"\ta is {a} (the decrementing took place as expected)\n"
    + $"\tb is {b}  (the incrementing took place as expected)\n"
    + $"\tc is {c}  (c got its value *before* a was decremented)\n" 
    + $"\td is {d}  (d got its value *after* b was incremented)\n"
    + $"-----------");
```


# First While Loops

#. Write a `while` loop that displays the integers between $1$ and $100$ on the screen, with a space between them.

#. Write a `while` loop that displays the `*` (asterisk) character 100 times on the screen.

#. Modify your previous loop, so that a new line character is displayed on the screen every time 10 asterisks have been displayed on the screen.
That is, your program should display on the screen:

    **********
    **********
    **********
    **********
    **********
    **********
    **********
    **********
    **********
    **********

<!-- There is a bug here, using ``` prevents the file from being compiled by pandoc. I suspect pandoc_include is causing this. -->
