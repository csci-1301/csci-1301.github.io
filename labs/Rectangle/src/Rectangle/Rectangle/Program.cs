/*
 * CSCI 1301
 * A simple application program for the Rectangle class
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

        Console.WriteLine(
            $"You rectangle's length is {myRectangle.GetLength()}"
                + // a.
                $", its width is {myRectangle.GetWidth()}"
                + //b.
                $", so its area is {myRectangle.ComputeArea()}."
        ); //c.
    }
}
