---
title: Increment and Decrement Operators, First Loops
---

In this lab you will learn about increment and decrement operators and implement your first while loops.


# Increment and Decrement Operators

Before writing code, think through the following questions.

Assuming `int i` is initialized and its current value is 5,

#. What does `i++` do to `i`?
#. What dies `i--` do to `i`? 
#. Can you explain what is the difference between `++i` and `i++`? 

## Practice

Copy and paste this code into a new C\# project in your IDE and execute it.

Study the output carefully to make sure you understand the mechanism of the increment and decrement operators.

Compare your answers from previous section to what you observe in the output. Do your answers match?

```
!include code/increment_decrement.cs
```

# First While Loops


#. Write a `while` loop that displays the integers between $1$ and $100$ on the screen, with a space between them.
#. Write a `while` loop that displays the integers between $100$ and $-100$ on the screen, in decreasing order, with a space between them.
#. Write a `while` loop that displays the `*` (asterisk) character 100 times on the screen.
#. Modify your previous loop, so that a new line character is displayed on the screen every time 10 asterisks have been displayed on the screen.

That is, your program should display this on the screen (this example has a space after each asterisk for display purposes):

```text
 * * * * * * * * * *
 * * * * * * * * * *
 * * * * * * * * * *
 * * * * * * * * * *
 * * * * * * * * * *
 * * * * * * * * * *
 * * * * * * * * * *
 * * * * * * * * * *
 * * * * * * * * * *
 * * * * * * * * * *
```

# Pushing Further (Optional)

Here are additional (fun!) pattern problems. Try generating them using a while loop.

##. Triangle:

    ```text
     * 
     * *
     * * *
     * * * * 
     * * * * *
     * * * * * *
     * * * * * * * 
     * * * * * * * * 
     * * * * * * * * * 
     * * * * * * * * * *
    ``` 

##. Triangle of numbers 

    ```text
    1
    222
    33333
    4444444
    555555555
    ``` 

##. Upside-down binary triangle

    ```
    1010101
     10101 
      101  
       1
    ``` 