using System;

class Program
{
    static void Main()
    {
        Circle myCircle = new Circle();
        myCircle.SetRadius(2.3);

        // Test that you can un-comment if you'd like.
        /*
        Console.WriteLine(Math.PI);
        Console.WriteLine(myCircle.ComputeCircum() + " " + myCircle.ComputeArea());

        Pushing further:
        Console.WriteLine(Math.Min(Math.Pow(2, 14), Math.Floor(Math.Log(4000))));
        */

        Console.WriteLine(myCircle.ToString());
    }
}
