---
title: If Statements
---

This lab aims at having you practise simple conditional statements.
It may seem repetitive, but that is because you need to practise `if` statements _a lot_ to understand their mechanism and to be able to write them properly.

# Basic Conditional Statements

## Testing and Improving Conditional Statements

Consider the following code:

```
int yourAge;
Console.WriteLine("Please, enter your age");
yourAge = int.Parse(Console.ReadLine());
if(yourAge < 0){Console.WriteLine("I believe you made a mistake, an age cannot be negative!");}
else if(yourAge > 2000){Console.WriteLine("I believe you made a mistake, nobody can live that long!");}
else{
    if(yourAge >= 18){Console.WriteLine("In all States but Alabama, Nebraska, Mississippi and Puerto Rico, you have reached the age of majority.");}
    else if (yourAge >=19){Console.WriteLine("In all States but Mississippi and Puerto Rico, you have reached the age of majority.");}
    else if (yourAge >=21){Console.WriteLine("You have reached the age of majority in all US states.");}
}
```

The information about the age of majority [comes from wikipedia](https://en.wikipedia.org/wiki/Age_of_majority).

#. _Without executing it_, write down what you think will be displayed if the user enters
    #. "That's confidential",
    #. 10
    #. 18
    #. 19
    #. 22
    #. 29339
#. Copy-and-paste the code in the body of the `main` method, and execute it, providing the values written below. Was your thinking correct? If not, revise it and make sure you understand the logic of the program.
#. There is at least one issue with this code, as "You have reached the age of majority in all US states." will never be displayed. Can you understand why?
#. Fix the program so that all the messages can be displayed when relevant.

## Writing Simple Conditional Statements

Read all the instructions in this part before starting to type code. Create a new project, and write portions of code that perform the following:

#. Ask the user for an integer, and display on the screen "You were born after me" if the number is strictly greater than your year of birth.
#. Ask the user for an integer, and display on the screen "Between $-1$ and $1$" if the number is greater than or equal to $-1$ and less than or equal to $1$.
#. Ask the user for an integer, and display on the screen "Not between $-1$ and $1$" if the number is greater than $1$ or less than $-1$.
#. Ask the user for an integer, and display on the screen "Odd" or "Even", depending if the number is odd or even.
#. Ask the user for an integer, and display on the screen "Negative" if the integer is negative, "Positive" if the integer in positive, and nothing if the integer is $0$.
#. Ask the user for an integer, and display on the screen "positive and odd" if the number is positive and odd, "positive and even" if the number is positive and even, "negative and odd" if the number is negative and odd, "negative and even" if the number is negative and even, and "You picked $0$" if the number is $0$.

For each of those questions, write on paper whenever you should use if, if-else, if-else-if or nested conditional structures, and what the condition(s) should be. Once you feel confident, write the code in your IDE, and then test it intensively: enter all kinds of values (positive and odd, negative and even, $0$, and remember that $0$ is even, etc.) and make sure that what is displayed on the screen is always correct.

 
# Conditional Operator (optional)

You were introduced to the conditional operator, which can be used to replace `if-else` statements in particular cases (assignment, call, increment, decrement, and new object expressions).
Its structure is:

`condition ? first_expression : second_expression;`

You can read more about it [in the documentation](https://docs.microsoft.com/en-us/dotnet/csharp/language-reference/operators/conditional-operator).

If you have time, practice using the conditional operator by adding these statements to your program:

#. Write a statement that sets `myVar` to `0` if `initial` is an upper-case letter, and to `1` otherwise. You already wrote an `if` statement that accomplishes this in the previous exercise, so you just need to rewrite it using the conditional operator.
#. Write a statement that sets `initial` to `'B'` if `myVar` is greater than 500 and to `'S'` if `myVar` is less than or equal to 500.
#. Write a statement that doubles the value of `myVar` if `day` is `"Sat."` or `"Sun."` and adds 1 to the value of `myVar` otherwise.
