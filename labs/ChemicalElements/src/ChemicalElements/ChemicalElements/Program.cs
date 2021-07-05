using System;

class Program
{
    static void Main(string[] args)
    {
        // You can use the FromKelvinToCelsius method even if no object exist:
        Console.WriteLine("Enter the value you want to covert from Kelvin to Celsius:");
        decimal valueEntered = Decimal.Parse(Console.ReadLine());
        
        // Note the way the method is called: by the class, not by an object!
        decimal valueEnteredInCelsius = ChemElem.FromKelvinToCelsius(valueEntered); 
        Console.WriteLine(valueEntered + "K is " + valueEnteredInCelsius + "°C.");

        // Of course, we can create objects, using our custom constructor:
        ChemElem hydrogen = new ChemElem(1, "Hydrogen", 14.01M);

        // Note that the following implicitly calls the ToString method:
        Console.WriteLine(hydrogen);
    }
}