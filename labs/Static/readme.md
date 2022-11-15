---
title: Using static keyword
---

This lab serves multiple goals:

- To teach you how a static class differ from a non-static one,
- To illustrate the usefulness of static classes,
- To teach you how a non-static class can manipulate static fields.

# Static Classes -- Warm-Up

One use case for static classes is creating utility classes (or "helper classes")
that contain related and frequently-used methods; making those methods easily callable
anywhere in the program. Some examples of static classes in C\# are the `Math` and `Console` classes.

Pay attention to how these classes are used:

- A `Console` object is never instantiated before use,
- The `WriteLine` method is called referring to the _name of the class_ (not an object identifier):

    ```
    Console.WriteLine("calling a static method");
    ```
Question:
: 
    Using your IDE, check what happens if you do the following:

    ```
    Console test = new Console();
    ```

<details><summary>Solution:</summary>
Indeed, it is _not possible_ to instantiate an object when a class is declared `static`.
Further, if a class is declared static, all its members (attributes, methods, constructors, etc.) must also be declared `static`.
</details>

## Static Calculator

In your IDE create a new project. Then add a new class file called Calculator.cs

In Calculator.cs:

#. Declare a `static` class and name it `Calculator`.
#. Add 5 `public` methods to the `Calculator` class. Each method takes 2 arguments `x` and `y` of type `double`:
    #. `Add` method that returns the result of `x + y`.
    #. `Subtract` method that returns the result of `x - y`.
    #. `Multiply` method that returns the result of `x * y`.
    #. `Divide` method that returns the result of `x / y`.
    #. `Modulo` method that returns the result of `x % y`.

After implementing `Calculator`,

#. Open the file that contains the program's `Main` method
#. Paste the following code inside `Main` method:

    ```
    double x = 10d, y = 2d;

    Console.WriteLine($"{x} + {y} = {Calculator.Add(x, y)}");
    Console.WriteLine($"{x} - {y} = {Calculator.Subtract(x, y)}");
    Console.WriteLine($"{x} * {y} = {Calculator.Multiply(x, y)}");
    Console.WriteLine($"{x} / {y} = {Calculator.Divide(x, y)}");
    Console.WriteLine($"{x} % {y} = {Calculator.Modulo(x, y)}");
    ```

    Again, notice how
    - no instance of `Calculator` is created before use, and
    - each `Calculator` method is called referring to the _name of the class_.

#. Execute the program
    - If your implementation of `Calculator` class matches the instructions, you will see meaningful output after executing the program.
    - Otherwise review the instructions again and retrace your implementation steps to resolve any issues.

# Static Members in a Non-static Class

A non-static class can contain both static and non-static class members.

Download, extract and study this [project](Student.zip) implementation but *do not* execute it.
After reading through the implementation, answer the questions below.

#. How many non-static attributes does the `Student` class have?
#. How many static attributes does the `Student` class have?
#. How many non-static methods does the `Student` class have?
#. How many static methods does the `Student` class have?

#. What is the output of each of the following lines in "Program.cs":
    #. `Console.WriteLine(alice);`
    #. `Student.DisplayStudentCount(); // first time`
    #. `Console.WriteLine(bob);`
    #. `Student.DisplayStudentCount(); // second time`

#. If the `studentCount` attribute was *not* `static`, what would be the output of:
    #. `Student.DisplayStudentCount(); // first time`
    #. `Student.DisplayStudentCount(); // second time`

#. When a class contains both static and non-static members, is it possible to refer to non-static members inside a static method?
   For example, if we try to refer to  the `name` attribute inside `DisplayStudentCount`, will it work? Why or why not?

Check your answers by creating a matching program in your IDE and executing it.

To check the last question, in Student.cs, uncomment the following line and verify its behavior matches your answer:

```
// Console.WriteLine(name);
````

