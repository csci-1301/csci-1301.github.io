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

- Can you rewrite the following code with `foreach` statement? Why?

```
double [] numbers = {1.2, 4.3, 5.7, 11, -3.13, 1.7}

for(int i = 0; i< numbers.Length; i++)
{
    numbers[i] = numbers[i] * 1.1;
    Console.WriteLine(numbers[i]);
}
```
## problem 3
