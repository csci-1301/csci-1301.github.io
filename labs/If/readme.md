---
title: If Statements
---

This lab is aimed at having you practice simple conditional statements.
It may seem repetitive, but you need to practice `if` statements _a lot_ to understand their mechanics and to be able to write them properly.

# Basic Conditional Statements

## Testing and Improving Conditional Statements

Consider the following code:

```
!include code/voting_age.cs
```

The information about the age of majority [comes from wikipedia](https://en.wikipedia.org/wiki/Age_of_majority).

#. _Without executing it_, write down what you expect to be displayed if the user enters
    #. "That's confidential",
    #. 10
    #. 18
    #. 19
    #. 22
    #. 29339
#. Copy-and-paste the code in the body of the `main` method and execute it, providing the values written below. Was your thinking correct? If not, revise it and make sure you understand the logic of the program.
#. There is at least one issue with this code, as "You have reached the age of majority in all US states." will never be displayed. Can you understand why?
#. Fix the program so that all the messages can be displayed when relevant.  Feel free to reorder statements or to use conjunction, disjunction, etc. to alter your conditions.

## Writing Simple Conditional Statements

Read all the instructions in this part before starting to type code. Create a new project, and write portions of code that perform the following:

#. Ask the user for an integer, and display on the screen "You were born after me" if the number is strictly greater than your year of birth.
#. Ask the user for an integer, and display on the screen "Between $-1$ and $1$" if the number is greater than or equal to $-1$ and less than or equal to $1$.
#. Ask the user for an integer, and display on the screen "Not between $-1$ and $1$" if the number is greater than $1$ or less than $-1$.
#. Ask the user for an integer, and display on the screen "Odd" or "Even", depending if the number is odd or even.
#. Ask the user for an integer, and display on the screen "Negative" if the integer is negative, "Positive" if the integer in positive, and nothing if the integer is $0$.
#. Ask the user for an integer, and display on the screen "positive and odd" if the number is positive and odd, "positive and even" if the number is positive and even, "negative and odd" if the number is negative and odd, "negative and even" if the number is negative and even, and "You picked $0$" if the number is $0$.

For each of those questions, write on paper whenever you should use `if`, `if-else`, `if-else-if`, and what the condition(s) should be. Once you feel confident, write the code in your IDE, and then test it intensively: enter all kinds of values (positive and odd, negative and even, $0$, and remember that $0$ is even, etc.) and make sure that what is displayed on the screen is always correct.

## Observation: How to Construct a Value Progressively

Please, read this part only once you have solved the last question of the previous exercise.
You were asked the following:

> Ask the user for an integer, and display on the screen “positive and odd” if the number is positive and odd, “positive and even” if the number is positive and even, “negative and odd” if the number is negative and odd, “negative and even” if the number is negative and even, and “You picked 0” if the number is 0.

A possible answer is:

```
int a;
Console.WriteLine("Enter an integer");
a = int.Parse(Console.ReadLine());

if (a >= 0 && a % 2 == 0){
	Console.WriteLine("Positive and even");
}
else if (a >= 0 && a % 2 != 0) {
	Console.WriteLine("Positive and odd");	
}
else if (a < 0 && a % 2 == 0){
	Console.WriteLine("Negative and even");
}
else if (a < 0 && a % 2 != 0){
	Console.WriteLine("Negative and odd");
}
```

That is a lot of repetition!
And, as you know, it is not good practice to copy-and-paste the very same code, as it requires twice the editing every time you make an update!

We could actually "progressively" construct the message we will be displaying:

```
string msg;

if (a >= 0)
{
    msg = "Positive";
}
else
{
    msg = "Negative";
}
if (a % 2 == 0) 
{
    msg += " and even";
}    
else // if (a % 2 != 0)
{
    msg += " and odd";
}

Console.WriteLine(msg);
```

Much better!
Since the two conditions are actually independent, we can test them in two different `if` statements!


# Pushing Further (Optional)

## Computing Entry Price

You are asked to write a simple program that computes the total price for a group of people to enter a park.

Your program should:

- Ask the user how many adults and how many children want to enter the park,
- If the group comprises $6$ persons or more, offer to sell a group pass for \$$30$ (that allows everyone in the group to enter the park),
- Compute and display the total price on the screen, knowing that:
    - Adults pay \$$7$,
    - Children pay \$$4$,
    - *If* purchasing the group pass allowed the group to save money (which isn't always the case!), you should display on the screen the amount saved.

Some tips:

- When asking "yes" / "no" questions, treat "y" and "Y" as a "Yes", and any other string as a "No".
- Note that we will sell the pass even if the user is not gaining money by doing so (for instance, if 6 children want to enter, $\$4 \times 6 = \$24 < \$ 30$, but we would still sell them the pass).
