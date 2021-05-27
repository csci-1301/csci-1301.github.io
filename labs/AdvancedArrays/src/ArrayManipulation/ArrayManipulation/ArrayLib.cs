static class ArrayLib
{
    public static string Display(int[] arrayP) // Returns the content of the array, where each value is separated from the next one by a space.
    {
        string ret = "";
        foreach (int i in arrayP)
            ret += i + " ";
        return ret;
    }

    /*
    * Complete the following methods.
    */
    public static int FindMax(int[] arrayP) // Returns the greatest value in arrayP.
    {
        return 0;
    }

    public static int FindMin(int[] arrayP) // Returns the lowest value in arrayP.
    {
        return 0;
    }

    public static double Average(int[] arrayP) // Returns the average of the values in arrayP.
    {
        return 0;
    }

    public static bool Occurs(int[] arrayP, int numberP) // Returns true if numberP occurs at least once in arrayP
    {
        return false;
    }
    public static int FirstIndexOf(int[] arrayP, int numberP) // Returns the smallest index where numberP occurs in arrayP if numberP is in arrayP, -1 otherwise.
    {
        return 0;
    }

    public static int LastIndexOf(int[] arrayP, int numberP) // Returns the largest index where numberP occurs in arrayP if numberP is in arrayP, -1 otherwise.
    {
        return 0;
    }

    public static bool SameSize(int[] arrayP1, int[] arrayP2) // Returns true if arrayP1 and arrayP2 are of the same size, false otherwise
    {
        return false;
    }

    public static bool Common(int[] arrayP1, int[] arrayP2) // Returns true if at least one value of arrayP1 is in arrayP2, false otherwise.
    {
        return false;
    }

    public static bool OccursOnce(int[] arrayP, int valueP) // Returns true if valueP occurs exactly once in arrayP.
    {
        return false;
    }


    /*
     * 
     * If you want to push futher, you can consider the following other ideas for algorithms.
     * They are not needed to obtain full credit, but will help you in your future if you want to become
     * a CS or IT major.
     * 
     *  Other ideas for algorithms include:
     * • "Remove" one cell whose index was given as an argument from the array, using the Resize method.
     * • Return the smallest index where the greatest value in the array is located.
     * • Return the smallest index where the smallest value in the array is located.
     * • Return the number of time a number given as an argument occurs in the array.
     * • Given two indexes a and b, swap the values stored at a and b.
     * • Given an integer, fill the array with this integer.
     * • "Reverse" the array: if the array containing {1, 2, 3} is given as input, return {3, 2, 1}.
     * • Sort the array.
     * 
     * The last two algorithms are clearly harder than the first ones:
     * looking around for hints is fine, but do not copy a solution that you don't understand.
     * The code turned in must be your own, and you must be able to explain it.
     */
}

