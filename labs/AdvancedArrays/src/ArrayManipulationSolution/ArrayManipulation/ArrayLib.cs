static class ArrayLib
    {
    public static string Display(int[] arrayP) // Returns the content of the array, where each value is separated from the next one by a space.
    {
        string ret = "";
        foreach (int i in arrayP)
            ret += i + " ";
        return ret;
    }
    public static int FindMax(int[] arrayP) // Returns the greatest value in arrayP.
    {
        int maxSoFar = arrayP[0];
        foreach (int i in arrayP)
            if (i > maxSoFar) maxSoFar = i;
        return maxSoFar;
    }

    public static int FindMin(int[] arrayP) // Returns the lowest value in arrayP.
    {
        int minSoFar = arrayP[0];
        foreach (int i in arrayP)
            if (i < minSoFar) minSoFar = i;
        return minSoFar;
    }

    public static double Average(int[] arrayP) // Returns the average of the values in arrayP.
    {
        double accumulator = 0;
        foreach (int i in arrayP)
            accumulator += i;
        return accumulator / arrayP.Length; 
    }

    public static bool Occurs(int[] arrayP, int numberP) // Returns true if numberP occurs at least once in arrayP
    {
        foreach (int i in arrayP)
            if (i == numberP) return true;
        return false;
    }
        public static int FirstIndexOf(int[] arrayP, int numberP) // Returns the smallest index wher numberP is in arrayP if numberP is in arrayP, -1 otherwise.
    {
        for (int i = 0; i < arrayP.Length; i++)
        {
            if (arrayP[i] == numberP) return i;
        }
        return -1;
    }

    public static int LastIndexOf(int[] arrayP, int numberP) // Returns the largest index where numberP is in arrayP if numberP is in arrayP, -1 otherwise.
    {
        int greatestIndexSoFar = -1;
        for (int i = 0; i < arrayP.Length; i++)
        {
            if (arrayP[i] == numberP) greatestIndexSoFar = i;
        }
        return greatestIndexSoFar;
    }

    public static bool SameSize(int[] arrayP1, int[] arrayP2) // Returns true if arrayP1 and arrayP2 are of the same size, false otherwise
    {
        return arrayP1.Length == arrayP2.Length;
    }

    public static bool Common(int[] arrayP1, int[] arrayP2) // Returns true if at least one value of arrayP1 is in arrayP2, false otherwise.
    {
        foreach (int i in arrayP1)
            foreach (int j in arrayP2)
                if (i == j) return true;
        return false;
    }

    public static bool OccursOnce(int[] arrayP, int valueP) // Returns true if valueP occurs exactly once in arrayP.
    {
        return Occurs(arrayP, valueP) && (FirstIndexOf(arrayP, valueP) == LastIndexOf(arrayP, valueP));
    }


    public static void Fill(int[] arrayP, int valueP) // This method fills arrayP with the value valueP.
    {
        for (int i = 0; i < arrayP.Length; i++)
            arrayP[i] = valueP;
    }

    /*
     * Other ideas of algorithms include:
     * • Return an array without the value at index i, and resized to its previous size -1.
     * • Return the smallest index where the greatest value is
     * • Return the smallest index where the smallest value is
     * • Return the number of time a number given as an argument occurs in the array
     * • Given two indexes a and b, swap the values stored at a and b
     * • Given an integer, fill the array with this integer
     * • "Reverse" the array: if the array containing {1, 2, 3} is given as input, return {3, 2, 1}
     * • Sort the array
     * 
     * The last two algorithms are clearly harder than the first ones:
     * looking around for hints is fine, but do not copy a solution that you don't understand,
     * the code turned back must be your own, and you must be able to explain it.
     */


}

