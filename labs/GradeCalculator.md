#  Grade Calculator

This lab serves multiple goals:

- To have you read a high-level description of a program,
- To help you implement this high-level description,
- To help you structure your reasoning and mathematical understanding of a simple problem,
- To exhibit different implementations of this high-level description.

## Presentation 

This project will help you design and implement a "grade calculator" for (a variation) of this class.

We will assume that your grade for this class will be computed as follows:

        Evaluation  Number   Points   Percents
  - -- -- -
           Quizzes    4        20       10%
          Projects    2        20       10%
    In-class Tests    2       100       40%
        Final Exam    1       200       40%

Our goal is to write a program that asks the user for their grades obtained *so far* (it is possible that some quizzes, projects, and tests are still to be taken, or that the final has not happened yet) and computes their *current* class average.

Your program can either ask the user for the number of quizzes, projects, tests, and exams taken so far, and then ask for the values, or use a sentinel value (as shown in the example below) to know when to "stop".
This means if they say that they have taken only 2 quizzes (or put the sentinel value for quiz 3), then the program should not ask for the later quiz grades (this is also true for the projects and exams).
It is fine to assume that the user will only enter "correct" numerical values, and you will not need to perform any user-input validation, but your program should be flexible enough so that changing the number of quizzes, for instance, would require changing only a variable or a couple of values.

An example of execution could be:

```{.text}
For all the questions below, enter 
    - your grade, or 
    - "0" if you missed the evaluation, or
    - "-1" if that evaluation has not happened yet.

What was your grade for Quiz 1 (out of 20)?
1͟6͟↵
What was your grade for Quiz 2 (out of 20)?
1͟4͟↵
What was your grade for Quiz 3 (out of 20)?
-͟1͟↵
Your average for the quiz is 75.00 %.
What was your grade for Project 1 (out of 20)? 
2͟2͟↵
What was your grade for Project 2 (out of 20)? 
-͟1͟↵
Your average for the project is 110.00 %.
What was your grade for Test 1 (out of 100)? 
6͟6͟↵
What was your grade for Test 2 (out of 100)? 
-͟1͟↵
Your average for the tests is 66.00 %.
What was your grade for the final (out of 200)?
-͟1͟↵
Your average so far is 74.83 %.
```

## How to Get Started?

This problem involves some tricky arithmetic, as well as cleverly getting the information from the user. Below are some hints to help push you in the right direction. 

### Hint 1 - Do The Math!

The first thing you need to do for this problem is to understand the equation needed to compute the grade.
Start by trying to reproduce the example given in the project description on paper.
Can you get the same result?
Can you find a way that seems simple and flexible to compute the current grade so far in all generality?

### Hint 2 - Gather The Data

Once you have the equation figured out, you need to understand how you can obtain the data from the user.
You have two possible ways of doing it:

- Will you ask first for the number of quizzes taken, and then ask for the values, or
- Will you ask for the values, and take "-1", for instance, as a signal that this quiz has not happened yet?

Try to implement one or the other, without worrying about the computation at this point (just add, for instance, the value entered).

## A Possible Solution

### Without arrays

You can find a possible solution to this problem in [GradeCalculator.zip](./code/projects/Grade_Calculator.zip).

Note that our solution _does not_ use arrays.
However, the solution is flexible enough (and, hopefully, commented enough) so that you can easily fine-tune it to your particular needs.

### With arrays

Another solution to this problem is in [Grade_Calculator_with_Arrays](./code/projects/Grade_Calculator_with_Arrays.zip).
This solution is much more flexible and uses fewer variables, but it may also be more difficult to understand because it uses arrays in a subtle way.
