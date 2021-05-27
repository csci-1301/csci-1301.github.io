using System;
static void Main(string[] args)
{
    Rectangle rect1 = new Rectangle();
    rect1.SetLength(8);
    rect1.SetWidth(10);
    Rectangle rect2 = rect1;
    rect2.SetLength(4);
    Console.WriteLine($"Rectangle 1: {rect1.GetLength()} "
        + $"by {rect1.GetWidth()}");
    Console.WriteLine($"Rectangle 2: {rect2.GetLength()} "
        + $"by {rect2.GetWidth()}");
}