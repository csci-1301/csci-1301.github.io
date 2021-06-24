---
title: foreach
---

# Practicing `foreach` Loop

## Problem 1

Create a new project, and replace the content of the `Main` method with the following code:

```
int[] primes = {2, 3, 5, 7, 11, 13, 17, 19}
for(int i = 0; i< primes.Length; i++)
{
    Console.WriteLine(primes[i]);
}
```

Execute the code. You should see the elements of the array _primes_ (the prime numbers less than 20) in the console.

Next rewrite the code using a **foreach** statement, then answer the following questions:
 
#. Identify two differences between the `for` and `foreach` versions. 
#. Which one is easier to understand?
#. Which one needs fewer variables?

## Problem 2

Can you rewrite the following code with `foreach` statement? Why?

```
double [] numbers = {1.2, 4.3, 5.7, 11, -3.13, 1.7}

for(int i = 0; i< numbers.Length; i++)
{
    numbers[i] = numbers[i] * 1.1;
    Console.WriteLine(numbers[i]);
}
```

## problem 3


Can you rewrite the following code with `foreach` statement? Why?

```
double [] numbers = {1.2, 4.3, 5.7, 11, -3.13, 1.7}

for(int i = 0; i< numbers.Length - 1; i++)
{   
    Console.WriteLine((numbers[i] + numbers[i+1] )/2);
}
```

## Problem 4

#. Can you think of any loops that can be implemented by _foreach_ but not with _for_?
#. Can you think of any loops that can be implemented by _for_ but not with _foreach_?


## Problem 5

Download [Library project](Library.zip), extract it, and open it with your IDE. 

Observe the program and its two classes:

- `Book` class represents a single book. 
- `Program` creates an array of 10 books.

Next modify the code in the `Program.cs` to perform the following steps:

#. Write a foreach loop that displays all books.
#. Add statements where you ask the user to enter a year, then modify the foreach loop to display only books published on or after the year user entered.
#. Write a `for` loop implementation that performs the same task of displaying books published on or after the year user entered.

Which one do you prefer to implement the above search? Explain your answer.
