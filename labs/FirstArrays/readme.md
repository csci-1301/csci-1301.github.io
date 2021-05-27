---
title: First Arrays Manipulations
---

# First Array Manipulation

Write a program that

#. declares an array `myArray` of `int` of size $5$,
#. initializes `myArray` with the values $1$, $2$, $3$, $4$ and $5$,
#. displays the content of `myArray`.

Now, let us write *incorrect* statements.
Add the following statements one by one to your program, observe how C# reacts (that is, try to compile and execute after you add one, then remove it), and answer the following questions.

~~~~~~~{.cs}
myArray = { 1, 2 ,3, 4, 5};
Console.WriteLine(myArray[5]);
myArray[5] = 12;
Console.WriteLine(myArray);
~~~~~~~

- One of these statements is not "incorrect" in the sense that it won't prevent your program from executing, but it is not doing what you would have expected: which one?
- Can you read and understand the error messages you obtained for the others?

# Second Array Manipulation

Write a program that

#. declares an array `myArray` of `int` of size $10$,
#. initializes `myArray` with the values $1$, $2$, $3$, …, $9$ and $10$,
#. displays the content of `myArray`.
#. sums the values stored in `myArray` and displays the result.
#. computes the product of the values stored in `myArray` and displays the result.


# Pushing Further (Optional)


## Default values

Execute the following:

~~~~~~~{.cs}
int[] ar = new int[5];
ar[0] = 5;
for (int i = 0; i < ar.Length; i++)
    Console.WriteLine(ar[i]);
~~~~~~~

What can you conclude about the value of the array cells that were not assigned?

