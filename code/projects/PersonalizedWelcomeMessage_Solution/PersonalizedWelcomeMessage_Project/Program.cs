/*
 * A simple program to display a personalized welcome message to the user.
 * Principles of Computer Programming I – CSCI 1301
 */

using System;

class Program
{
    static void Main()
    {
        string yourFirstName; // Variable to hold the user's first name

        Console.WriteLine("Please enter your first name, followed by \"Enter\":"); // We ask the user for their first name.

        yourFirstName = Console.ReadLine(); // We read from the user using Console.ReadLine(), and store the result in the variable yourFirstName.

        Console.WriteLine($"Welcome, {yourFirstName}!"); // We display "Welcome," followed by the name entered, followed by "!".
    }
}
