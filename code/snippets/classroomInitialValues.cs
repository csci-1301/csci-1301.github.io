using System;

class Program
{
    static void Main(string[] args)
    {
        ClassRoom english = new ClassRoom();
        Console.WriteLine($"Building is {english.GetBuilding()}");
        Console.WriteLine($"Room number is {english.GetNumber()}");
    }
}
