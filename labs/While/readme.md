---
title: while Loop
---

# Practicing while Loops

## Problem 1

- Create a new project, and replace the content of the `Main` method with the following code:

```
int i = 0;
while(i < 100)
{
    Console.WriteLine(i);
    i++;
}
```

#. Execute the code. You should see the numbers 0 to 99 in the console.
#. Without changing the numbers, modify the code such that it prints 0 to 100 in the console. Note the difference between `<` and `<=` operators.
#. Modify the code such that it prints the numbers from 100 to 300. Note that the counter can start from any number you wish.
#. Modify the code such that it prints all integers between 0 and 100 that are divisible by 3.
#. To implement the above problem, you may code one of the following:

```
int i = 0;
while(i < 100)
{
    if(i % 3 == 0)
        Console.WriteLine(i);
    i++;
}
```

or

```
int i = 0;
while(i < 100)
{
    Console.WriteLine(i);
    i += 3;
}
```

Which one of the above codes is more efficient? Why?
Note that you do not have to increment the counter only by one each time. You should update the counter wisely and try to use it more efficiently.

## Problem 2

Create a new project and replace the content of the `Main` method with the following code:

```
int n;
Console.Write("Enter a natural number greater than 2: ");
n = int.Parse(Console.ReadLine());
int i = 2;
while(n % i != 0 && i < n )
{
    i++;
}
if (i == n)
    Console.WriteLine($"{n} is a ... number");
else
    Console.WriteLine($"{n} is not a ... number");
```

#. What does the code do? Explain the boolean expression of the loop
#. Replace `...` with a meaningful word.


## Problem 3

Create a new project and replace the content of the `Main` method with the following code:

```
int n = 100;
while (n > 0)
{
    Console.WriteLine(n);
    n--;
}
```

Execute the code, and explain what you see in the console. Note that the counter is decremented, not incremented.

## Problem 4

Write a program that gets a number from the console and finds its biggest divisor less than the number itself.

## Problem 5

Write a new program that asks an integer value greater than 1 from the user, and computes the result of this series: `1 + 2 + 3 + 4 + ...` up to  `n` where `n` represents the number obtained from the user.

## Problem 6

Ask the user to enter integers. Keep track of the smallest value the user enters. After the user indicates they are done (by entering a sentinel value like "Done"), display the smallest value the user entered. If the user did not enter any integers, display "You did not enter anything."

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
int number1 = 0, number = 0;
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
while (number <= 5)
{
    Console.WriteLine("Hi!");
    Console.WriteLine(number);
}
number++;
```
