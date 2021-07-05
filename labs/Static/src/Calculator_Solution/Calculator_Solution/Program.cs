using System;

class Program {
    
    static void Main()
    {
        double x = 10d, y = 2d;

        Console.WriteLine($"{x} + {y} = {Calculator.Add(x, y)}");
        Console.WriteLine($"{x} - {y} = {Calculator.Subtract(x, y)}");
        Console.WriteLine($"{x} * {y} = {Calculator.Multiply(x, y)}");
        Console.WriteLine($"{x} / {y} = {Calculator.Divide(x, y)}");
        Console.WriteLine($"{x} % {y} = {Calculator.Modulo(x, y)}"); 
    }
}