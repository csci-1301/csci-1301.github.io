using System;

public class Program
{
    public static void Main()
    {
        int x,
            n;

        // 1st question
        x = 5;
        n = x++;
        Console.WriteLine("n is now " + n + ".");
        Console.WriteLine("x is now " + x + ".");

        // 2nd question
        // Resetting the value of x.
        x = 5;
        n = ++x;
        Console.WriteLine("n is now " + n + ".");
        Console.WriteLine("x is now " + x + ".");

        // 3rd question
        // Resetting the value of x.
        x = 5;
        n = x + x++;
        // So, the order is:
        // 1. Sum x and x,
        // 2. Assign the result (10) to n,
        // 3. Increment x.
        Console.WriteLine("n is now " + n + ".");
        Console.WriteLine("x is now " + x + ".");

        // 4th question
        // Resetting the value of x.
        x = 5;
        n = ++x + ++x;
        // So, we the order is:
        // 1. Increment x (it is now 6),
        // 2. Increment x again (it is now 7)
        // 3. Sum the two values of x *at the time they were read*
        // (that is, sum 6 and 7)
        Console.WriteLine("n is now " + n + ".");
        Console.WriteLine("x is now " + x + ".");
    }
}
