using System;

class Program
{
    static void Main()
    {
        float myNumber;
        myNumber = 1E-45f;
        Console.WriteLine(myNumber); //outputs 1.401298E-45
        myNumber = myNumber / 10;
        Console.WriteLine(myNumber); //outputs 0
        myNumber = myNumber * 10;
        Console.WriteLine(myNumber); //outputs 0
        myNumber = (1E-45f / 10) * 10;
        Console.WriteLine(myNumber); //outputs 0
    }
}
