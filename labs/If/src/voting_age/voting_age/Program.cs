using System;

class Program
{
    static void Main()
    {
        int yourAge; // This variable will contain the user's age.
        Console.WriteLine("Please, enter your age"); // We ask the user.
        // We read from the user and convert their answer into an int.
        yourAge = int.Parse(Console.ReadLine()); 

        // The rest of the code test the value of yourAge and
        // displays a message based on its value. You are asked
        // to explain this code next.

        if (yourAge < 0)
        {
            Console.WriteLine(
                "I believe you made a mistake, an age cannot be negative!");
        }
        else if (yourAge > 2000)
        {
            Console.WriteLine(
                "I believe you made a mistake, nobody can live that long!");
        }
        else if (yourAge >= 18)
        {
            Console.WriteLine(
                "In all States but Alabama, Nebraska, Mississippi"
                + " and Puerto Rico, you have reached the age of majority.");
        }
        else if (yourAge >= 19)
        {
            Console.WriteLine(
                "In all States but Mississippi and Puerto Rico,"
                + " you have reached the age of majority.");
        }
        else if (yourAge >= 21)
        {
            Console.WriteLine(
                "You have reached the age of majority in all US states.");
        }
    }
}
