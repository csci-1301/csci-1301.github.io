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
        // (e.g., "Monday", "Tuesday", …) to its number (2, 3, …).
        switch (string_day)
        {
            case ("Monday"):
            case ("monday"):
                num_day = 2;
                break;
            case ("Tuesday"):
            case ("tuesday"):
                num_day = 3;
                break;
            case ("Wednesday"):
            case ("wednesday"):
                num_day = 4;
                break;
            case ("Thursday"):
            case ("thursday"):
                num_day = 5;
                break;
            case ("Friday"):
            case ("friday"):
                num_day = 6;
                break;
            case ("Saturday"):
            case ("saturday"):
                num_day = 7;
                break;
            case ("Sunday"):
            case ("sunday"):
                num_day = 1;
                break;
            default:
                num_day = -1; // This is an error code.
                break;
        }

        // We display the number corresponding to the day entered:
        if (num_day < 0) {
            Console.WriteLine($"I am sorry, but {string_day} does not seem to be a valid day."); 
        }
        else
        {
            Console.WriteLine("The number corresponding to " + string_day + " is " + num_day + ".");
        }
    }
}
