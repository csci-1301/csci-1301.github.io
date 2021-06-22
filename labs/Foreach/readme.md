---
title: foreach
---
# Practicing `foreach` Loop
## Problem 1

- Create a new project, and replace the content of the _main_ method with the following code:
```
int[] primes = {2, 3, 5, 7, 11, 13, 17, 19}
for(int i = 0; i< primes.Length; i++)
{
    Console.WriteLine(primes[i]);
}
```
- Execute the code. You should see the elements of the array _primes_ (the prime numbers less than 20) in the console.
- Rewrite the code with **foreach** statement. Try to code yourself. Then check your answer with the following answer.
```
int[] primes = {2, 3, 5, 7, 11, 13, 17, 19}
foreach(int n in primes)
{
    Console.WriteLine(n);
}
```
- Explain two differences between the above codes. 
- Which one is easier to understand?
- Which one needs fewer variables?


## Problem 2
- Create a new project and replace the content of the file _Program.cs_ with the following code:
```
using System;

namespace Practice
{
    class Book
    {
        public string Title;
        public int Year;
        public string Publisher;
    }
    class Program
    {
        static void Main(string[] args)
        {
            Book[] bookList = new Book[10];
            for(int i =0; i< 10; i++)
            {
                Console.Write("Enter the book title:");
                bookList[i].Title = Console.ReadLine();
                Console.Write("Enter the publish year:");
                bookList[i].Year = int.Parse(Console.ReadLine());
                Console.Write("Enter the publisher:");
                bookList[i].Publisher = Console.ReadLine();
            }
        }
    }
}
```
- As you notice, in the above code we define an array of 10 Book objects, and using a _for_ loop, we accommodate the array.
- Replace the _for_ statement with _foreach_ statement and apply the required changes.
- Add a piece of code that, using a _foreach_ statement, gets a year from the user and prints all the books published in the given year.
- Add a piece of code that, using a _for_ statement, gets a year from the user and prints all the books published in the given year. 
- _foreach_ or _for_? Which one do you prefer to implement the above search? Explain your answer.
## Problem 3

- Can you rewrite the following code with `foreach` statement? Why?

```
double [] numbers = {1.2, 4.3, 5.7, 11, -3.13, 1.7}

for(int i = 0; i< numbers.Length; i++)
{
    numbers[i] = numbers[i] * 1.1;
    Console.WriteLine(numbers[i]);
}
```
## problem 4


- Can you rewrite the following code with `foreach` statement? Why?

```
double [] numbers = {1.2, 4.3, 5.7, 11, -3.13, 1.7}

for(int i = 0; i< numbers.Length - 1; i++)
{   
    Console.WriteLine((numbers[i] + numbers[i+1] )/2);
}
```

## Problem 5
- Can you think of any loops that are implementable by _foreach_ but not with _for_?
