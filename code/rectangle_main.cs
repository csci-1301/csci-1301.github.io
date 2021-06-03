using System;

class Program
{
    static void Main(string[] args)
    {
        Rectangle myRectangle = new Rectangle();
        myRectangle.SetLength(12);
        myRectangle.SetWidth(3);
        int area = myRectangle.ComputeArea();
        Console.WriteLine("Your rectangle's length is " +
        $"{myRectangle.GetLength()}, and its width is " +
        $"{myRectangle.GetWidth()}, so its area is {area}.");
    }
}
