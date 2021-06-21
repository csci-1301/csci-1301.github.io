---
title: Problem Solving
---

<!-- 

moved to random lab
# Problem Solving

Those problems are fairly advanced considering our progress so far.
Have a look at them, make an attempt, but don't feel bad if you don't succeed.

## A Guessing Game

Write a program that

#. Stores your favorite number in a variable.
#. Asks the user to enter a numerical value, and stores the user's answer in a variable.
#. With an `if` statement, displays on the screen "You guessed correctly" if the number entered by the user is your favorite number.
#. Once this part of the program works, add an `if` statement that displays on the screen "Too high!" if the number entered by the user is strictly greater than your favorite number.
#. Once this part of the program works, add an `if` statement that displays on the screen "Too low!" if the number entered by the user is strictly lower than your favorite number.
#. Once this part of the program works, add an `if` statement that displays on the screen "You found a multiple of my favorite number!" if the number entered by the user is a multiple of your favorite number, but different from it.

You can adjust your program so that e.g. if the user enters a number that is at the same time higher and a multiple of your favorite number, only one message is displayed.

A solution is proposed [in this archive](GuessingGame.zip).

-->


## Computing the Entry Price

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
