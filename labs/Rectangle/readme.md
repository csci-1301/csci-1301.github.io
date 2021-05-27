---
title: Introduction to Classes -- Rectangle Class
---



# Using a Pre-Defined Class

This lab will guide you in your first manipulation of a programmer-defined class.
We will use the example shown in lecture.
The last part is challenging; therefore, we will give a possible solution to it in the next class, but make sure you try to solve it by yourself beforehand.

## Manipulating Two `.cs` Files at a Time

#. Download the Rectangle project, extract it, and open it with VS.
Note that in the "Solution Explorer", there are two `cs` files listed: `Program.cs` and `Rectangle.cs`.
#. In the Solution Explorer, double-click on `Rectangle.cs` and note how close it is to what was presented during the lecture.
#. In the Solution Explorer, double-click on `Program.cs` and observe it.
#. Compile and execute the code.
#. Now, do the following:
  - Introduce a syntactical error in `Program.cs` (e.g., remove a `;`), and try to build the solution: what do you observe? Restore the program to its previous state, using <kbd>CTRL</kbd> + <kbd>z</kbd> to "undo" your operation.
  - Introduce a syntactical error in `Rectangle.cs` (e.g., remove a `;`), and try to build the solution: what do you observe? Undo the modification using <kbd>CTRL</kbd> + <kbd>z</kbd>.
  - Add `length = 12;` in the main method of `Program.cs` and try to build the solution: what do you observe? Undo the modification using <kbd>CTRL</kbd> + <kbd>z</kbd>.

## Enriching `Program.cs`

Edit the `Main` method of `Program.cs` by adding at its end statements that perform the following:

#. Create a second `Rectangle` object and set its length and width to 3.
#. Create a third `Rectangle` object and ask the user to specify its length and width. Display the area of this rectangle on the screen.
#. Create a fourth `Rectangle` object, do not specify its length or width, and display them on the screen. What do you observe?

In the last part, you may notice that the length and the width of the newly created object were assigned default values.
To know more about this, refer to <https://docs.microsoft.com/en-us/dotnet/csharp/language-reference/keywords/default-values-table>.

## Editing `Rectangle.cs`

Edit `Rectangle.cs`:

#. Rename every instance of `lengthParameter` to `lengthP` in the `SetLength` method (that is, replace the two occurrences). You can use the [symbol refactoring](https://docs.microsoft.com/en-us/visualstudio/ide/reference/rename?view=vs-2019) feature of C# to do so. Compile and run your program. What do you observe?
#. Some people use the convention of prefixing instance variables with `_` (the underscore character), `m` (for "member"), or even `m_`.
You can always find someone furiously advocating for one particular convention, but the truth is that if you're not forced to use one (for example, by the rules of a software company you work for), you should pick whichever suits you best.
Still, just to use it at least once, rename every instance of `width` into `m_width` and see how it feels. Compile and run your program. What do you observe?
Either undo this modification or rename `length` into `m_length` (you have to be consistent!).
#. Change the name of one of the accessor methods in `Rectangle.cs` without changing it in `Program.cs`. Compile and run your program. What do you observe? Undo your modification.

<!--
You can find a good summary of the pro and cons underscore Vs this
https://stackoverflow.com/a/17937309/
-->


## Enriching `Rectangle.cs`

Taking inspiration from the `ComputeArea()` method, write three new methods:

#. A method that returns the perimeter of the calling object.
#. A method that doubles the length and the width of the calling object.
#. A method that swaps the length and the width of the calling object.

For each method: pick a (valid) name, think about the return type and the parameters, and write the body of the method carefully.
After compliation succeeds, call that method in `Program.cs` and see if it has the expected behavior.

This is more challenging than the rest of the lab, so if you are unable to finish this part during the lab session, don't worry; we will review a possible solution in the next lecture.
