/*
 * CSCI 1301
 * A simple application program for the Rectangle class
 * 
 * Solution File: see lines 33 and up.
 */

using System;

class Program
{
    static void Main(string[] args)
    {
        Rectangle myRectangle; // Declaration of a Rectangle variable.
        myRectangle = new Rectangle(); // Assignment, we are creating a Rectangle object and assigning it to our Rectangle variable.

        // Now we set the instance variables for this object, using the accessors
        myRectangle.SetLength(12); // Accessor to set the Length
        myRectangle.SetWidth(3); // Accessor to set the Width

        /*
         * Let us use the three other methods to 
         *  a. Retrieve the Length (using GetLength())
         *  b. Retrieve the Width (using GetWidth())
         *  c. Compute the Area (using ComputeArea())
         */

        Console.WriteLine($"You rectangle's length is {myRectangle.GetLength()}" + // a.
            $", its width is {myRectangle.GetWidth()}" + //b.
            $", so its area is {myRectangle.ComputeArea()}."); //c.

        // Create a second `Rectangle` object and set its length to 3 and its width to 3.
        Rectangle mySecondRect = new Rectangle();
        mySecondRect.SetLength(3);
        mySecondRect.SetWidth(3);

        // Create a third `Rectangle` object, and ask the user to specify its length and width.
        // Display the area of this rectangle on the screen.
        Rectangle myThirdRect = new Rectangle();
        string userInput;
        int temporary;
        Console.WriteLine("Please specify a length:");
        userInput = Console.ReadLine(); // We read a string from the user
        temporary = int.Parse(userInput); // We convert the string into a numerical value.
        myThirdRect.SetLength(temporary); // We set the length of the rectangle to be the value we obtained.
        Console.WriteLine("Please specify a witdh:");
        userInput = Console.ReadLine(); // We read a string from the user. Note that we can re-use the same string variable.
        temporary = int.Parse(userInput); // We convert the string into a numerical value. Note that we can re-use the same int variable.
        myThirdRect.SetWidth(temporary); // We set the length of the rectangle to be the value we obtained.
        Console.WriteLine($"The area of your rectangle is {myThirdRect.ComputeArea()}");

        //Create a fourth `Rectangle` object, do not specify its length or width, and display them on the screen. What do you observe?
        Rectangle myFourthRect = new Rectangle();
        Console.WriteLine($"This fourth rectangle's length is {myFourthRect.GetLength()}" +
             $", its width is {myFourthRect.GetWidth()}");
        // Both values are set to 0.

        // Trying our new methods:
        Console.WriteLine($"The rectangle's length is {myRectangle.GetLength()}" +
            $", its width is {myRectangle.GetWidth()}. Hence, its perimeter is {myRectangle.ComputePerimeter()}.");
        myRectangle.DoubleRectangle();
        Console.WriteLine($"After using the DoubleRectangle method, the rectangle's length is {myRectangle.GetLength()}" +
            $", its width is {myRectangle.GetWidth()}.");
        myRectangle.Swap();
        Console.WriteLine($"After using the Swap method, the rectangle's length is {myRectangle.GetLength()}" +
            $", its width is {myRectangle.GetWidth()}.");
    }
}
