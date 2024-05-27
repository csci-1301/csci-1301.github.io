using System;

public class Program
{
    static void Main()
    {
        int a = 0,
            b = 0;
        Console.WriteLine("Before changing their values:");
        Console.WriteLine($"\ta is {a}\n\tb is {b}\n-----------");
        Console.WriteLine("Incrementing, using postfix and prefix operators:");

        a++;
        ++b;
        Console.WriteLine($"\ta is {a}\n\tb is {b}\n-----------");
        Console.WriteLine("Decrementing, using postfix and prefix operators:");

        a--;
        --b;
        Console.WriteLine($"\ta is {a}\n\tb is {b}\n-----------");
        Console.WriteLine(
            "When combining decrementing and incrementing operators"
                + " with other operations,\nit makes a difference whether you use"
                + " postfix or prefix operators!"
        );

        int c = a--,
            d = ++b;
        Console.WriteLine(
            $"\ta is {a} (the decrementing took place as expected)\n"
                + $"\tb is {b}  (the incrementing took place as expected)\n"
                + $"\tc is {c}  (c got its value *before* a was decremented)\n"
                + $"\td is {d}  (d got its value *after* b was incremented)\n"
                + $"-----------"
        );
    }
}
