# Do while Loops

Before writing code, think through the following problems:

- In your own words, what is the difference between `while` and `do while` loops?
- Can you think of a problem using `while` preferred over the `do while` loop?

In all the problems in this section, use `do while` loop.

## Problem 1

Write a program that display numbers 0 to 50.

## Problem 2

Write a program that display numbers 30 to -20.

## Problem 3

Write a `do while` loop that generates this output: `1 10 100 1000 10000 100000 1000000`

# `while` vs `do while`

Both of the following programs keep getting inputs from the user until the user enters a valid integer. Which one is better? Explain your answer.

```
int n;
bool flag = false;
do
{
    Console.Write("Enter an integer:");
    flag = int.TryParse(Console.ReadLine(), out n);
    if (!flag)
    {
        Console.WriteLine("The value you entered is not a valid integer. Try one more time.");
    }
} while (!flag);

Console.WriteLine($"The number you entered is {n}");
```
 
```
 int n;
bool flag = false;

Console.Write("Enter an integer:");
flag = int.TryParse(Console.ReadLine(), out n);

while(! flag)
{
    Console.WriteLine("The value you entered is not a valid integer. Try one more time.");
    Console.Write("Enter an integer:");
    flag = int.TryParse(Console.ReadLine(), out n);
} 

Console.WriteLine($"The number you entered is {n}");
```