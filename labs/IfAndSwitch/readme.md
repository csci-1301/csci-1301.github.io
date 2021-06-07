---
title: Practising if and switch
---

# Practicing `if` and `switch`

This exercise will ask you to write a rather abstract program that performs simple manipulations on a few variables. Create a new project and do the following in Main. Initialize a `string` variable named "day," an `int` variable named "myVar," a `char` variable named "initial," and a Boolean variable named "flag."
Set and change the value of these variables to make good tests as you progress through this problem.
You can also display them on the screen to help you in making sure that your statements behave as they are supposed to.

## From `switch` to `if-else`

#. Write a `switch` statement that sets `flag` to `true` if the value of `day` is `"Mon."`, `"Tue."`, `"Wed."`, `"Thu."` or `"Fri."`, and to `false` otherwise. 
#. Rewrite the previous statement as an `if-else` statement.

## From `if-else` to `switch`

#. Write a `if-else` statement that doubles the value of `myVar` if `myVar` is `3`, `5` or `7`.
#. Can you rewrite the previous statement as a `switch` statement? If so, do it. If not, explain why not.

## Deciding Between Condition Types

#. Write a statement that doubles the value of `myVar` and sets `initial` to `'M'` if `day` is equal to `"Sat"`.
What is the appropriate kind of statement to do this?
#. Write a statement that displays "Hello" on the screen if the value of `initial` is `'E'` or `'e'`, "Bonjour" if the value of `initial` is `'F'` or `'f'`, "Guten Tag" if the value of `inital` is `'D'` or `'d'`.
What is the appropriate kind of statement to do this?

## Complex Conditions

#. Write a statement that doubles the value of `myVar` if `day` is `"Sun."`, triples the value of `myVar` if `day` is not `"Sun."` and `initial` is `'a'`, and sets `myVar` to `0` otherwise.
#. Write a statement that sets `myVar` to `0` if `initial` is an upper-case letter, and to `1` otherwise. You will need to understand how to use the `IsUpper` method (<https://docs.microsoft.com/en-us/dotnet/api/system.char.isupper?view=net-5.0>).

