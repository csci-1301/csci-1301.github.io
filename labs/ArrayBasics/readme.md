---
title: First Arrays Manipulations
---

# First Array Manipulation


## Warm-up

Write a program that implements the following steps:

#. declares an array `myArray` of `int` of size $5$,
    
    Question
    ~ What values are stored in this array

#. initializes `myArray` with the values $1$, $2$, $3$, $4$ and $5$,

    Question
    ~ There are a few different ways you can declare and initialize array of size $5$ holding values $1$, $2$, $3$, $4$ and $5$.
     Can you think of two different ways to do this?

#. displays the content of `myArray`.

       
## Going wrong

Now, let us write *incorrect* statements.

Add the following statement to the program you created in the warm-up part, and observe how C# reacts, that is, try to compile and execute the program after adding this line:

```
myArray = { 1, 2 ,3, 4, 5};
```

Remove the previous line. Then add this statement:

```
Console.WriteLine(myArray[5]);
```

try to compile and execute the program.

Then, remove previous line, and add this:

```
myArray[5] = 12;
```

try to compile and execute the program again.

Remove previous line. Add this line and try executing the program:

```
Console.WriteLine(myArray);
```

Now answer the following questions.

#. One of these statements is not "incorrect" in the sense that it won't prevent your program from executing, but it is not doing what you would have expected: which one?
#. Can you read and understand the error messages you obtained for the others?

# Second Array Manipulation

Write a program that

#. declares an array `myArray` of `int` of size $10$,
#. initializes `myArray` with the values $1$, $2$, $3$, …, $9$ and $10$,
#. displays the content of `myArray`.
#. sums the values stored in `myArray` and displays the result.
#. computes the product of the values stored in `myArray` and displays the result.


# Exploring arrays

For this exercise you will need an array to work with. Let's create one:

- declare a `char` array of length $6$, name it `letters`
- initialize the first 4 indices of `letters` with following values: `'a', 'b', 'c', 'd'` 
- initialize index 5 of `letters` with value `'f'`

Now, write the following statements:

#. Write a statement to display the last `char` value in `letters`? (should display `f`)
#. Write a statement to display value stored at index 4. What is the value? Why?
#. Write a statement to display characters in the first half of the array (`'a', 'b', 'c'` but no others).

Execute your program to ensure you seeing the expected output before proceeding.

Next, update the part of the program where `letters` is declared and change `letters` length to $8$. Do not modify any other parts of the program. Then execute the program again.

Answer the following questions:

#. What is the last `char` of the `letters` array now after changing the length? 
#. Does your program still output _the last_ `char` value in `letters` array?
#. When displaying the first half of the array, does your program still display _the first half_? (After changing length the first half contains values `'a', 'b', 'c', 'd'`) 
#. If you did not get the last value, or first half you expected, can you think of a way to perform these array operations in a way that can accomodate arrays of different lengths? 
