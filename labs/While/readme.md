---
title: while and do while
---

# Practicing while Loops

Write a loop that displays...

#. all integers between 0 and 100 that are divisible by 3.
#. all integers between 1 and 100 but do not display numbers between 10-20 and 40-60. 
#. `Hello World` ten times.
#. 10 rows of text where `Hello` is displayed on every other row and `World` on every other row
#. value that decreases by 0.5 on each iteration. Start from 10.0 and iterate as long as the value remains positive.    


In these problems you will need to ask for user for input then perform described actions on the input.

#. Ask the user for a positive integer value (1 or greater). After the user provides a number, compute the result of this series: `1 + 2 + 3 + 4 + ...` up to  `n` where `n` represents the number obtained from user

#. Ask user to enter integers. Keep track of the smallest value user enters. After user indicates they are done, display the smallest value user entered. If user did not enter any integers display `You did not enter anything.`
    
# Do while Loops

Before writing code, think through the following problems:

#. In your own words, what is the difference between `while` and `do while` loops?
#. Can you think of a problem where you can use `while` but not `do while` loop?

Next solve the following problems using a do while loop:

#. Display numbers 0 to 50.
#. Display numbers 30 to -20.
#. Write a do while loop that generates this output: `1 10 100 1000 10000 100000 1000000`

#. Ask user to enter integers. Keep track of the largest value user enters. After user indicates they are done, display the largest value user entered. If user did not enter any integers display `You did not enter anything.`

# Infinite Loops

All of the following are examples of infinite loops. Can you spot the problem? How would you change the code to fix it?

```
int number = 0;
while (number <=5) {
Console.WriteLine("Hi!");
Console.WriteLine(number);
}
```

```
int number1, number = 0;
while (number <=5) {
Console.WriteLine("Hi!");
Console.WriteLine(number);
number1++;
}
```

```
int number = 0;
while (number <=5);
{
Console.WriteLine("Hi!");
Console.WriteLine(number);
number++;
}
```

```
int number = 0;
while (number <=5)
Console.WriteLine("Hi!");
Console.WriteLine(number);
number++;
```

```
int number = 0;
while (number >=5)
{
Console.WriteLine("Hi!");
Console.WriteLine(number);
number++;
}
```