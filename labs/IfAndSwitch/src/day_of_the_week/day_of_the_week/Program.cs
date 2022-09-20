using System;

class Program
{
    static void Main()
    {
        // We ask the user to enter the day of the week:
        Console.WriteLine("Please enter the day of the week.");
        // Note that anything that is not spelled exactly as 
        // in the switch statement will be treated by the 
        // default case.

        // We read from the user:
        string string_day = Console.ReadLine();

        // Variable where the result of our computation will be stored:
        int num_day;

        // Switch statement to map textual description of the day 
        // (e.g., "Monday", "Tuesday", …) to its number (1, 2, …).
        switch (string_day)
        {
            case ("Monday"):
                num_day = 1;
                break;
            case ("Tuesday"):
                num_day = 2;
                break;
            case ("Wednesday"):
                num_day = 3;
                break;
            case ("Thursday"):
                num_day = 4;
                break;
            case ("Friday"):
                num_day = 5;
                break;
            case ("Saturday"):
                num_day = 6;
                break;
            case ("Sunday"):
                num_day = 7;
                break;
            default:
                num_day = -1; // This is an error code.
                break;
        }

        // We display the number corresponding to the day entered:
        Console.WriteLine("The number corresponding to " + string_day + " is " + num_day + ".");
    }
}
