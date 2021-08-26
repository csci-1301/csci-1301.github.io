---
title: Increment and Decrement Operators, First Loops
---

In this lab you will learn about increment and decrement operators and implement your first while loops.


# Increment and Decrement Operators

Before writing code, think through the following questions.

Assuming `int i` is initialized and its current value is 5,

#. What does `i++` do to `i`?
#. What does `i--` do to `i`? 
#. In your own words, can you explain what is the difference between `++i` and `i++`? 

## Practice

Copy and paste this code into a new C\# project in your IDE and execute it.

Study the output carefully to make sure you understand the mechanism of the increment and decrement operators.

Compare your answers from previous section to what you observe in the output. Do your answers match with what you observe in the output?

```
!include code/increment_decrement.cs
```

Next, for each of the following, determine the final value of _n_.  

```
int x = 5;
int n = x++;
```

```
int x = 5;
int n = ++x;
```

```
int x = 5;
int n = x++ + x++;
```

```
int x = 5;
int n = ++x + ++x;
```

```
int x = 5, y = 6;
int n = x++ * ++y;
```

```
int x = 5;
int n = x++ + --x;
```




# First While Loops


#. Write a `while` loop that displays the integers between $1$ and $100$ on the screen, with a space between them.
#. Write a `while` loop that displays the integers between $100$ and $-100$ on the screen, in decreasing order, with a space between them.
#. Write a `while` loop that displays the `°` (degree symbol) character 100 times on the screen.
#. Modify your previous loop, so that a new line character is displayed on the screen every time 10 degree symbols have been displayed on the screen.

That is, your program should display this on the screen (this example has a space after each degree symbol for display purposes):

```text
 ° ° ° ° ° ° ° ° ° °
 ° ° ° ° ° ° ° ° ° °
 ° ° ° ° ° ° ° ° ° °
 ° ° ° ° ° ° ° ° ° °
 ° ° ° ° ° ° ° ° ° °
 ° ° ° ° ° ° ° ° ° °
 ° ° ° ° ° ° ° ° ° °
 ° ° ° ° ° ° ° ° ° °
 ° ° ° ° ° ° ° ° ° °
 ° ° ° ° ° ° ° ° ° °
```

# Pushing Further (Optional)

Here are additional (fun!) pattern problems. Try generating them using a while loop.

1. Triangle:

```text
 ° 
 ° °
 ° ° °
 ° ° ° ° 
 ° ° ° ° °
 ° ° ° ° ° °
 ° ° ° ° ° ° ° 
 ° ° ° ° ° ° ° ° 
 ° ° ° ° ° ° ° ° ° 
 ° ° ° ° ° ° ° ° ° °
``` 

2. Triangle of numbers 

```text
1
222
33333
4444444
555555555
``` 

3. Upside-down binary triangle

```text
1010101
 10101 
  101  
   1
``` 
