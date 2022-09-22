---
title: Practicing if and switch
---

This lab serves multiple goals:

- To reinforce your understanding of `if` statements,
- To help you practise `switch` statements,
- To help you understanding whenever `switch` or `if` should be used for simple problems,
- (Optional) to help you understanding the conditional operator,
- (Optional) to introduce you to the `ToUpper` method.


# Mastering the `switch` statement

Consider the following code:

```
// We ask the user to enter the day of the week:
Console.WriteLine("Please enter the day of the week.");
// Note that anything that is not spelled exactly as 
// in the switch statement will be treated by the 
// default case.

// We read from the user:
string string_day = Console.ReadLine();

// Variable where the result of our computation will be stored:
int num_day;

// Switch statement to map textual description of the day 
// (e.g., "Monday", "Tuesday", …) to its number (1, 2, …).
switch (string_day)
{
    case ("Monday"):
        num_day = 1;
        break;
    case ("Tuesday"):
        num_day = 2;
        break;
    case ("Wednesday"):
        num_day = 3;
        break;
    case ("Thursday"):
        num_day = 4;
        break;
    case ("Friday"):
        num_day = 5;
        break;
    case ("Saturday"):
        num_day = 6;
        break;
    case ("Sunday"):
        num_day = 7;
        break;
    default:
        num_day = -1; // This is an error code.
        break;
}

// We display the number corresponding to the day entered:
Console.WriteLine("The number corresponding to " + string_day + " is " + num_day + ".");
```

You can download it [as a solution](day_of_the_week.zip) (that also contains the solution to the problems asked below. Make sure you open `day_of_the_week` and not `day_of_the_week_solution` first).

Now, do the following:

#. Test the program with various values and make sure it behaves as expected.
#. Comment out the `default:` case along with the two lines below it, and compile your program. Why is the compiler complaining?
#. Restore the code to its original state.
#. Change the code so that "monday" would make the value 1 get assigned to `num_day`.
#. Change the code so that [the days of the week start on Sunday](https://en.wikipedia.org/wiki/Names_of_the_days_of_the_week#Days_numbered_from_Sunday), i.e., "Sunday" causes the value 1 to get assigned to `num_day`, "Monday" causes the value 2 to be assigned to `num_day`, etc.
#. Finally, change the last message to tell the user if the code encountered an error: use an `if` statement to display a different message if the user input did not match one of the literals in your `switch` statement.

Here is an example of execution, where the user input is underlined, and hitting "enter" is represented by ↵:

```text
Please enter the day of the week.
t͟u͟e͟s͟d͟a͟y͟↵
The number corresponding to tuesday is 3.
```

Here is a second example:

```text
Please enter the day of the week.
M͟O͟N͟D͟A͟Y͟↵
I am sorry, but MONDAY does not seem to be a valid day.
```

You can find an example solution in [this solution](day_of_the_week_solution.zip) or in the archive you downloaded previously.


# Practicing `if` and `switch`

This exercise will ask you to write a rather abstract program that performs simple manipulations on a few variables.
The main goal is to have you practice "transforming" `if` statements into `switch` statements, and reciprocally.
This will help you in memorizing both, and in understanding how to choose the most convenient to perform certain tasks.

Create a new project and do the following in `Main`.

#. Declare and initialize following variables:
    - a `string` variable named `day`
    - an `int` variable named `myVar`
    - a `char` variable named `initial`, and
    - a `bool` variable named `flag`
#. Set and change the value of these variables to make good tests as you progress through this problem.
#. You can also display them on the screen to help you in making sure that your statements behave as they are supposed to.

## From `switch` to `if-else`

#. Write a `switch` statement that sets `flag` to `true` if the value of `day` is `"Mon"`, `"Tue"`, `"Wed"`, `"Thu"` or `"Fri"`, and to `false` otherwise.
#. Rewrite the previous statement as an `if-else` statement.

## From `if-else` to `switch`

#. Write a `if-else` statement that doubles the value of `myVar` if `myVar` is: `3`, `5` or `7`.
#. Can you rewrite the previous statement as a `switch` statement? If so, do it. If not, explain why not.

## Deciding Between Condition Types

#. Write a statement that doubles the value of `myVar` and sets `initial` to `'M'` if `day` is equal to `"Sat"`.
What is the appropriate kind of statement to do this?
#. Write a statement that displays "Hello" on the screen if the value of `initial` is `'E'` or `'e'`, "Bonjour" if the value of `initial` is `'F'` or `'f'`, "Guten Tag" if the value of `initial` is `'D'` or `'d'`.
What is the appropriate kind of statement to do this?

Note that you can achieve those problems both with `if` and with `switch` statements.

## Complex Conditions

#. Write a statement that doubles the value of `myVar` if `day` is `"Sun"`, triples the value of `myVar` if `day` is not `"Sun"` and `initial` is `'a'`, and sets `myVar` to `0` otherwise.
#. Write a statement that sets `myVar` to `0` if `initial` is an upper-case letter, and to `1` otherwise. You will need to understand how to use the `IsUpper` method, and the [documentation](https://docs.microsoft.com/en-us/dotnet/api/system.char.isupper?view=net-5.0) can help you with that.

Note that you can achieve those problems only with `if` statements.

# Pushing Further (Optional)

## Conditional Operator

A *conditional operator* can be used to replace `if-else` statements in particular cases (assignment, call, increment, decrement, and new object expressions). Its structure is:

`condition ? first_expression : second_expression;`

You can read more about it [in the documentation](https://docs.microsoft.com/en-us/dotnet/csharp/language-reference/operators/conditional-operator).

Practice using the conditional operator by adding these statements to the program you developed previously:

#. Write a statement that sets `myVar` to `0` if `initial` is an upper-case letter, and to `1` otherwise. You already wrote an `if` statement that accomplishes this in the previous exercise, so you just need to rewrite it using the conditional operator.
#. Write a statement that sets `initial` to `'B'` if `myVar` is greater than 500 and to `'S'` if `myVar` is less than or equal to 500.
#. Write a statement that doubles the value of `myVar` if `day` is `"Sat"` or `"Sun"` and adds 1 to the value of `myVar` otherwise.

## `ToUpper()` Method

C# contains a method called `ToUpper()` in the `string` class. You can read [its documentation](https://learn.microsoft.com/en-us/dotnet/api/system.string.toupper?view=net-6.0), but the simplest is probably to see an example first.
The statement

```
Console.WriteLine("Hello, world!".ToUpper());
```

will display 

```text
HELLO, WORLD!
```

Can you use this method to make your `switch` statement [from the first part](#mastering-the-switch-statement) accommodate any combination of uppercase and lowercase letters for the days of the week? 
If done properly, your program should then correctly identify that "MoNdAy", "MONDAY", "monday" and "Monday" all match the same value.
