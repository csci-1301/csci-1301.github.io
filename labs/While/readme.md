---
title: while Loop
---

This lab serves multiple goals:

- To reinforce your understanding of the syntax of `while` loops,
- To stress the importance of conditions, e.g., the difference between `<` and `<=`,
- To study loops whose counter starts at values different from `0`,
- To exhibit that loop counters can be incremented or decremented by any value (not just one),
- To detect and debug infinite loops,
- To design simple algorithms requiring loops,
- (Optional) To have loops controlled by sentinel values.

# Practicing while Loops -- Warm-Up

Create a new project, and replace the content of the `Main` method with the following code:

```
int i = 0;
while(i < 100)
{
    Console.WriteLine(i);
    i++;
}
```

#. Execute the code. You should see the numbers 0 to 99 in the console.
#. Replace `<` with `<=`, and note that it prints the number from 0 to 100, even if you did not change the numbers.
#. Replace `0` with `100` and `100` with `300`, and note that it prints the numbers from 100 to 300. Observe that the counter can start from and terminate with any number you wish.
#. Modify the code such that it prints all integers between 0 and 100 that are divisible by 3. The solution is given below, but please think about it before reading it.

<details><summary>Solution</summary>

To implement the above problem, you may use the following:

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
Note that you do not have to increment the counter only by one each time.
You should update the counter wisely and try to use it more efficiently.
</details>

# Practicing while Loops -- Decrementing Counter

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


# Practicing while Loops -- Mystery Program

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

# Practicing while Loops -- Summing User-Input

Write a program that asks an integer value greater than 1 from the user, and computes the result of this series: `1 + 2 + 3 + 4 + ...` up to  `n` where `n` represents the number obtained from the user.

Here is an example of the desired execution, where the user input is underlined, and hitting "enter" is represented by ↵:

```text
Please enter an integer greater than 1:
8̲↵
The sum from 1 to your number is: 36
```

And indeed you can verify for yourself that 1+2+3+4+5+6+7+8 = 36.

# Infinite Loops

All of the following are examples of infinite loops.
Can you spot the "problem"?
For each of them, suggest an edit that would make them terminate.

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

```
int number = 0;
while (number <= 5)
{
    Console.WriteLine("Hi!");
    number--;
    Console.WriteLine(number);
    number++;
}
```

# Pushing Further (Optional)

Here are two advances challenges with little-to-no clue to help you getting started.
Try to think "off-keyboard" for a while before coding your solution, and test it extensively.

## Advanced Problem 1

Write a program that gets a number from the user and finds its biggest divisor less than the number itself.

## Advanced Problem 2

Study the following program:

```
Console.WriteLine("Enter a number to sum, or \"Done\" to stop and print the total.");
string enter = Console.ReadLine();
int sum = 0;
while (enter != "Done")
{
    sum += int.Parse(enter);
    Console.WriteLine("Enter a number to sum, or \"Done\" to stop and print the total.");
    enter = Console.ReadLine();
}
Console.WriteLine($"Your total is {sum}.");
```

#. Execute it, and make sure you understand its mechanism.
#. It contains a "sentinel value": can you tell what it is?
#. Write a program by taking inspiration from this previous program. Your program should ask the user to enter integers. After the user indicates they are done (by entering a sentinel value like "Done"), display the smallest value the user entered. If the user did not enter any integers, display "You did not enter anything."
