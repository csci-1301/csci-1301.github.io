using System;

class Program
{
    static void Main(string[] args)
    {
        ClassRoom csci = new ClassRoom("Allgood East", 356);
        Console.WriteLine($"Building is {csci.GetBuilding()}");
        Console.WriteLine($"Room number is {csci.GetNumber()}");
    }
}