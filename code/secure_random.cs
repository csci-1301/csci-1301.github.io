using System;
using System.Security.Cryptography; // include definition!

class Program
{
    static void Main()
    {
        
        // choose secure (!) random integer
        // between 0 (inclusive) and 100 (exclusive)
        int secureRandom = RandomNumberGenerator.GetInt32(100);
        
        // display cryptographically secure int
        Console.WriteLine(secureRandom);
        
        // choose secure (!) random integer
        // between 50 (inclusive) and 500 (exclusive)
        int anotherSecureRandom = RandomNumberGenerator.GetInt32(50, 500);
        
        // display cryptographically secure int
        Console.WriteLine(anotherSecureRandom);
    }
}