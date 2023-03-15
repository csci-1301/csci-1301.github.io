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

        // 2nd question
        // Resetting the value of x.
        x = 5;
        n = ++x;
        Console.WriteLine("n is now " + n + ".");

        // 3rd question
        // Resetting the value of x.
        x = 5;
        n = x++ + x++;
        Console.WriteLine("n is now " + n + ".");

        // 4th question
        // Resetting the value of x.
        x = 5;
        n = ++x + ++x;
        Console.WriteLine("n is now " + n + ".");

        // 5th question
        // Resetting the value of x.
        x = 5;
        int y = 6;
        n = x++ * ++y;
        Console.WriteLine("n is now " + n + ".");

        // 6th question
        // Resetting the value of x.
        x = 5;
        n = x++ + --x;
        Console.WriteLine("n is now " + n + ".");
    }
}
