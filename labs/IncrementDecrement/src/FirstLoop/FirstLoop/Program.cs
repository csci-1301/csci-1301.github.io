using System;

public class FirstLoop
{
    static void Main()
    {
        // This is a very minimal solution.
        int counter = 1; // The counter starts at 1.
        while (counter <= 100) // The loop will exit when the counter reaches 101.
        {
            Console.Write(counter + " "); // The counter is displayed, followed by a space.
            counter++; // The counter is incremented (by 1).
        }
    }
}
