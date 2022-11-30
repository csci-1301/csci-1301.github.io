/*
 * Dr. Aubert
 * 2022_10_24
 * Overflow and Underflow lab
 */

using System;

class Overflow
{
    static void Main()
    {
        unchecked // This desactivates C#'s overflow checks.
        {
            int int_max_value = int.MaxValue; // This variable contains the maximum value for integer
            int int_max_value_plus_one = int_max_value + 1; // This variable contains the maximum value for integer +1.

            Console.Write( // We display information about the maximum value of different datatypes:
                "\n|-------|---------------------------------|---------------------------------|\n"
                    + String.Format("|{0,7}|{1,33}|{2,33}|", "Type", "Max value", "Max Value +1")
                    + "\n|=======|=================================|=================================|\n"
                    + String.Format(
                        "|{0,7}|{1,33}|{2,33}|",
                        "int",
                        int.MaxValue,
                        int_max_value_plus_one
                    )
                    + "\n|-------|---------------------------------|---------------------------------|\n"
                    + String.Format(
                        "|{0,7}|{1,33}|{2,33}|",
                        "float",
                        float.MaxValue,
                        float.MaxValue + 1
                    )
                    + "\n|-------|---------------------------------|---------------------------------|\n"
                    + String.Format(
                        "|{0,7}|{1,33}|{2,33}|",
                        "double",
                        double.MaxValue,
                        double.MaxValue + 1
                    )
                    + "\n|-------|---------------------------------|---------------------------------|\n"
                    + String.Format("|{0,7}|{1,33}|{2,33}|", "decimal", decimal.MaxValue, "N/a")
                    + "\n|-------|---------------------------------|---------------------------------|\n"
            );

            // Running some additional tests…

            if (int_max_value > int_max_value_plus_one)
            {
                Console.WriteLine("Integers in C# are not really reliable.");
            }
            if (float.MaxValue == float.MaxValue + 1)
            {
                Console.WriteLine("Floats in C# are not really reliable.");
            }

            if (double.MaxValue == double.MaxValue + 1)
            {
                Console.WriteLine("Double in C# are not really reliable.");
            }

            if (float.MaxValue * 2 / 2 == float.MaxValue * 2)
            {
                Console.WriteLine(
                    $"{float.MaxValue} times 2, then divided by 2, is {float.MaxValue * 2 / 2}."
                );
            }

            if (double.MaxValue * 2 / 2 == double.MaxValue * 2)
            {
                Console.WriteLine(
                    $"{double.MaxValue} times 2, then divided by 2, is {double.MaxValue * 2 / 2}."
                );
            }
        } // Unchecked stops here.
    }
}
