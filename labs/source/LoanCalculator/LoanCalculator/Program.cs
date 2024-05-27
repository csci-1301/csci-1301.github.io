/*
 * Application program for the "Loan" class.
 * This program gathers from the user all the information needed
 * to create a "proper" Loan object.
*/

using System;

class Program
{
    static void Main()
    {
        Console.WriteLine("What is your name?");
        string name = Console.ReadLine();

        Console.WriteLine(
            "Do you want a loan for an Auto (A, a), a House (H, h), or for some Other (O, o) reason?"
        );
        char type = Console.ReadKey().KeyChar; // This part of the code reads *a char* from the user.
        // We haven't studied it, but it's pretty straightforward.
        Console.WriteLine();

        /*
         * The part of the code that follows
         * does the convertion from the character
         * to the corresponding string.
         * We could have a method in the Loan
         * class that does it for us, but
         * we'll just do it "by hand" here
         * for simplicity.
         */
        string typeOfLoan;

        if (type == 'A' || type == 'a')
        {
            type = 'a';
            typeOfLoan = "an auto";
        }
        else if (type == 'H' || type == 'h')
        {
            type = 'h';
            typeOfLoan = "a house";
        }
        else
        {
            type = 'o';
            typeOfLoan = "some other reason";
        }

        // We display the information back to the user, and ask the next question:
        Console.WriteLine(
            $"{name}, you need money for {typeOfLoan}, great.\nWhat is your current credit score?"
        );
        int cscore = int.Parse(Console.ReadLine());

        Console.WriteLine("How much do you need, total?");
        decimal need = decimal.Parse(Console.ReadLine());

        Console.WriteLine("What is your down payment?");
        decimal down = decimal.Parse(Console.ReadLine());

        Loan myLoan = new Loan(name, type, cscore, need, down);
        Console.WriteLine(myLoan);
    }
}
