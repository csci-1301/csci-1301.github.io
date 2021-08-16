using System;

class Program
{
    static void Main()
    {
/* Start included */
        int yourAge;
        Console.WriteLine("Please, enter your age");
        yourAge = int.Parse(Console.ReadLine());
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
        else
        {
            if (yourAge >= 18)
            {
                Console.WriteLine(
                    "In all States but Alabama, Nebraska, Mississippi and Puerto Rico, you have reached the age of majority.");
            }
            else if (yourAge >= 19)
            {
                Console.WriteLine(
                    "In all States but Mississippi and Puerto Rico, you have reached the age of majority.");
            }
            else if (yourAge >= 21)
            {
                Console.WriteLine(
                    "You have reached the age of majority in all US states.");
            }
        }
/* End included */
    }
}
