using System;

// This is just a test program.
class Program
{
    static void Main()
    {
        int[] array1 = { 1, 8, 9, 10, 1, 30, 1, 32, 3 };

        int[] array2 = { -4, -2, -3 };

        int[] array3 = { -1, 1, -2 };

        Console.WriteLine(
            String.Format("{0, 25} {1, 25} {2, 25}\n", "Method Called", "Expected Value", "Actual Value") +
            "-------------------------------------------------------------------------------------------\n" +
            String.Format("{0, 25} {1, 25} {2, 25}\n", "Display(array1)", "1 8 9 10 1 30 1 32 3 ", ArrayLib.Display(array1)) +
            String.Format("{0, 25} {1, 25} {2, 25}\n", "Display(array2)", "-4 -2 -3 ", ArrayLib.Display(array2)) +
            String.Format("{0, 25} {1, 25} {2, 25}\n", "Display(array3)", "-1 1 -2 ", ArrayLib.Display(array3)) +
            "-------------------------------------------------------------------------------------------\n" +
             String.Format("{0, 25} {1, 25} {2, 25}\n", "FindMax(array1)", "32", ArrayLib.FindMax(array1)) +
             String.Format("{0, 25} {1, 25} {2, 25}\n", "FindMax(array2)", "-2", ArrayLib.FindMax(array2)) +
             String.Format("{0, 25} {1, 25} {2, 25}\n", "FindMax(array3)", "1", ArrayLib.FindMax(array3)) +
             "-------------------------------------------------------------------------------------------\n" +
             String.Format("{0, 25} {1, 25} {2, 25}\n", "FindMin(array1)", "1", ArrayLib.FindMin(array1)) +
             String.Format("{0, 25} {1, 25} {2, 25}\n", "FindMin(array2)", "-4", ArrayLib.FindMin(array2)) +
             String.Format("{0, 25} {1, 25} {2, 25}\n", "FindMin(array3)", "-2", ArrayLib.FindMin(array3)) +
             "-------------------------------------------------------------------------------------------\n" +
             String.Format("{0, 25} {1, 25} {2, 25}\n", "Average(array1)", "10.5555555555556", ArrayLib.Average(array1)) +
             String.Format("{0, 25} {1, 25} {2, 25}\n", "Average(array2)", "-3", ArrayLib.Average(array2)) +
             String.Format("{0, 25} {1, 25} {2, 25}\n", "Average(array3)", "-0.666666666666667", ArrayLib.Average(array3)) +
             "-------------------------------------------------------------------------------------------\n" +
             String.Format("{0, 25} {1, 25} {2, 25}\n", "Occurs(array1, 1)", "True", ArrayLib.Occurs(array1, 1)) +
            String.Format("{0, 25} {1, 25} {2, 25}\n", "Occurs(array1, 32)", "True", ArrayLib.Occurs(array1, 32)) +
            String.Format("{0, 25} {1, 25} {2, 25}\n", "Occurs(array1, 2)", "False", ArrayLib.Occurs(array1, 2)) +
            "-------------------------------------------------------------------------------------------\n" +
            String.Format("{0, 25} {1, 25} {2, 25}\n", "FirstIndexOf(array1, 1)", "0", ArrayLib.FirstIndexOf(array1, 1)) +
            String.Format("{0, 25} {1, 25} {2, 25}\n", "FirstIndexOf(array1, 32)", "7", ArrayLib.FirstIndexOf(array1, 32)) +
            String.Format("{0, 25} {1, 25} {2, 25}\n", "FirstIndexOf(array1, 2)", "-1", ArrayLib.FirstIndexOf(array1, 2)) +
            "-------------------------------------------------------------------------------------------\n" +
            String.Format("{0, 25} {1, 25} {2, 25}\n", "LastIndexOf(array1, 1)", "6", ArrayLib.LastIndexOf(array1, 1)) +
            String.Format("{0, 25} {1, 25} {2, 25}\n", "LastIndexOf(array1, 32)", "7", ArrayLib.LastIndexOf(array1, 32)) +
            String.Format("{0, 25} {1, 25} {2, 25}\n", "LastIndexOf(array1, 2)", "-1", ArrayLib.LastIndexOf(array1, 2)) +
             "-------------------------------------------------------------------------------------------\n" +
             String.Format("{0, 25} {1, 25} {2, 25}\n", "SameSize(array1, array2)", "False", ArrayLib.SameSize(array1, array2)) +
             String.Format("{0, 25} {1, 25} {2, 25}\n", "SameSize(array2, array3)", "True", ArrayLib.SameSize(array2, array3)) +
             "-------------------------------------------------------------------------------------------\n" +
             String.Format("{0, 25} {1, 25} {2, 25}\n", "Common(array1, array2)", "False", ArrayLib.Common(array1, array2)) +
             String.Format("{0, 25} {1, 25} {2, 25}\n", "Common(array1, array3)", "True", ArrayLib.Common(array1, array3)) +
             String.Format("{0, 25} {1, 25} {2, 25}\n", "Common(array2, array3)", "True", ArrayLib.Common(array2, array3)) +
              "-------------------------------------------------------------------------------------------\n" +
            String.Format("{0, 25} {1, 25} {2, 25}\n", "OccursOnce(array1, 1)", "False", ArrayLib.OccursOnce(array1, 1)) +
            String.Format("{0, 25} {1, 25} {2, 25}\n", "OccursOnce(array1, 32)", "True", ArrayLib.OccursOnce(array1, 32)) +
            String.Format("{0, 25} {1, 25} {2, 25}\n", "OccursOnce(array1, 2)", "False", ArrayLib.OccursOnce(array1, 2)) +
            "-------------------------------------------------------------------------------------------\n");
    }
}

