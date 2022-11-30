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
        char type; // Variable to store the type of loan.

        do
        {
            Console.WriteLine(
                "Do you want a loan for an Auto (A, a), a House (H, h), or for some Other (O, o) reason?"
            );
            type = Console.ReadKey().KeyChar; // This part of the code reads *a char* from the user.
            // We haven't studied it, but it's pretty straightforward.
            type = char.ToLower(type); // We convert the charater type to lower case.
            // Char.ToLower is a static method too!
            // cf. https://docs.microsoft.com/en-us/dotnet/api/system.char.tolower?view=netframework-4.8
            Console.WriteLine();
        } while (type != 'a' && type != 'h' && type != 'o');

        // We display the information back to the user, and ask the next question:
        int cscore;
        bool success;
        do
        {
            Console.WriteLine(
                $"{name}, you need money for "
                    + Loan.TypeOfLoan(type)
                    + ", great.\nWhat is your current credit score?"
            );
            success = int.TryParse(Console.ReadLine(), out cscore);
        } while (!success || cscore < 300 || cscore > 850);

        decimal need;
        do
        {
            Console.WriteLine("How much do you need, total?");
            success = decimal.TryParse(Console.ReadLine(), out need);
        } while (!success || need < 0);

        decimal down;
        do
        {
            Console.WriteLine("What is your down payment?");
            success = decimal.TryParse(Console.ReadLine(), out down);
        } while (!success || down < 0);

        Loan myLoan = new Loan(name, type, cscore, need, down);
        Console.WriteLine(myLoan);
    }
}
