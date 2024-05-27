using System;

class Program
{
    static void Main()
    {
        /* Pre-Constructor */
        // This code would not compile without a "no args" constructor
        /*
        Room n126 = new Room(); //n126.building = null, n126.number = 0, n126.computer = false
        n126.SetComputer(true);
        Console.Write("This room has a computer: " + n126.GetComputer());
        */
        Room n126 = new Room("Allgood Hall", 126, true); //n126.building = "Allgood Hall", n126.number = 126, n126.computer = true
        Console.WriteLine($"The code is {n126.GetCode()}.");
        Console.WriteLine(n126);
        Room test = new Room("Allgood Hall", 999, false);
        Console.WriteLine($"n126 and test are in the same building: {n126.InSameBuilding(test)}");
        n126.RoomRoute();
        Console.WriteLine(test.RoomRoute());
    }
}
