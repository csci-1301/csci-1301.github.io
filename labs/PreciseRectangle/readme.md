---
title: Precise Rectangle and Circle Class
---

# Writing Your Own PreciseRectangle Class

In this exercise, you will create your own first class instead of using and expanding one that was written for you. The idea is to take inspiration from the class you already know (`Rectangle`) to create a new class, called `PreciseRectangle`, that will manipulate rectangles whose width and length are floating-point values, instead of integers (as in `Rectangle`).

This should be a fairly straightforward exercise, that mostly re-enforce what you should know already (except for how to create a class in your IDE).

## Implementation

To implement your class in your IDE, you are given two methods below: you can edit the pre-existing project, or start "fresh".
It is recommended to pick the one you feel the most comfortable with (you will get an opportunity to start "fresh" in the next problem in any case).

### Edit the Pre-Existing Project

#. Re-download [the "Rectangle" project](../Rectangle/Rectangle.zip), extract it in a folder, and open it with your IDE.
#. Within your IDE, re-name the project to "PreciseRectangle", and rename the "Rectangle.cs" file to "PreciseRectangle.cs"

    It is important that you re-name the files within your IDE.  If you try to rename your files, or their folders, outside of the IDE then it will break your solution.  The solution will still be looking for the original file/folder names, and will not recognize the changed names.  If such an error occurs, restore the previous names and then rename your files through the IDE as instructed.
    
#. In the "PreciseRectangle.cs" file, replace `class Rectangle` with `class PreciseRectangle`.     
#. Comment out the body of the `Main` method in "Program.cs".
#. Your program should compile as it is, but you have to edit `PreciseRectangle.cs` to now store the `width` and the `length` with `double`, and to propagate this change accordingly. What should be the return type of `GetWidth`, for instance?
#. Declare and manipulate precise rectangles (i.e., with floating-point values for the width and the length) in the `Main` method, and make sure they behave as expected (can you compute the area, for instance?).
#. Add the missing methods (`ComputePerimeter`, `Swap`, `MultiplyRectangle`).

### Starting From Scratch

#. Create a new project in your IDE, name it "PreciseRectangle".
#. In the Solution Explorer, right-click on "PreciseRectangle", then on "Add..." and select "Class". 
Then, select "Class", write "PreciseRectangle.cs" as the name of the file, and click on "Add".
#. You are now supposed to have two ".cs" files opened and displayed in the Solution Explorer: "Program.cs" and "PreciseRectangle.cs".
#. Implement the `PreciseRectangle` class according to the following specification:

    - it should have two attributes, of type `double`
    - it should have and eight methods:
        - two setters, two getters (i.e., one for each attribute), 
        - one method to compute the area of a precise rectangle,
        - one method `ComputePerimeter` to compute the perimeter of a precise rectangle,
        - one method `Swap` to swap the length and the width of a precise rectangle,
        - one method `MultiplyRectangle` to multiply the length and width of a precise rectangle by an ratio given in argument as an integer.

#. Declare and manipulate rectangles with floating-point values for the width and the length in the `Main` method, and make sure they behave as expected (can you compute the area, for instance?).

# Writing A Circle Class

This time, you will have to start your project "from scratch" and shouldn't try to edit a previous program.

## Foundations

#. Create a new project in your IDE, name it "Circle".
#. In the Solution Explorer, right-click on "Circle", then on "Add..." and select "Class".
Then, select "Class", write "Circle.cs" as the name of the file, and click on "Add".
#. You are now supposed to have two `.cs` files opened and displayed in the Solution Explorer: `Program.cs` and `Circle.cs`.
#. Declare one single instance variable in `Circle.cs`, of type `double` and named `radius`.
Write a `set` and a `get` method for this instance variable.
#. In `Program.cs`, write statements that create a new `Circle` object and set its radius to $2.3$.
Display its radius on the screen using the method you defined previously.

## Extending the Class

#. In C#, `Math.PI` is a `double` holding an approximation of $π$.
In the `Main` method of `Program.cs`, write a statement that displays its value on the screen.
It should be $3.14159265358979$.
#. Now, edit this statement and use the format specifier `N`, to display the value of $π$ rounded to $3.14$.
#. In the `Circle.cs` file, add two methods:
    #. A method that returns the circumference of the circle that calls it (i.e., $2 π$ times the radius),
    #. A method that returns the area of the circle that calls it (i.e., $π$ times the radius squared).
#. Test those two methods in your `Main` program, by displaying on the screen the area and the circumference of the object you created in the previous exercise.
#. Use the format specifier `N` to round the circumference.

You can find a possible solution to this problem [in this archive](Circle_Solution.zip).

# Pushing Further (Optional)

The following is an independent task, to widen your understanding of this class, and to prepare you for the next labs.

#. Now that you know more about naming conventions, have a look at [microsoft's naming guideline](https://docs.microsoft.com/en-us/dotnet/standard/design-guidelines/naming-guidelines), and particularly at
- [the documentation on general naming conventions](https://docs.microsoft.com/en-us/dotnet/standard/design-guidelines/general-naming-conventions),
- and [the documentation on capitalization conventions](https://docs.microsoft.com/en-us/dotnet/standard/design-guidelines/capitalization-conventions).
 
