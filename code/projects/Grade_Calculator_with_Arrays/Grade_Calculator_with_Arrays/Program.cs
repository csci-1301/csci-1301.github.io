/*
 * C. Aubert & J. Weeks
 * 2022_03_15
 * Grade Calculator
 *
 * This is a possible solution, many other answers were valid.
 * It uses by default the following way of computing the grade:
         Evaluation  Number   Points   Percents
  ---------------- -------- -------- ----------
           Quizzes    4        20       10%
          Projects    2        20       10%
    In-class Tests    2       100       40%
        Final Exam    1       200       40%
        
 * But can be relatively easily tweaked to accomodate other grade calculations.
 *
 * WARNING: The calculation on D2L will be used to compute your final grade.
 * This program is for informative purpose only.
 */
using System;

class Program
{
    static void Main(string[] args)
    {
        int[] CONSTVARS = { 20, 20, 100, 200, 4, 2, 2, 1 };
        //0-3: Max points for quizzes, projects, tests and final, respectively.
        //4-7: Number of scheduled quizzes, projects, tests and final, respectively.

        //Note: The array above is being used as if it contains constant integers, but it's missing the "const" designation. This is because you cannot make an array of constants. For a solution to this, see here: https://stackoverflow.com/a/5142378

        int[] accumAssignments = new int[] { 0, 0, 0 }; //Number of quizzes, projects, and tests completed

        int[] pointsEarned = new int[] { 0, 0, 0 }; //Total points earned for each category

        double[] averagePoints = new double[] { 0, 0, 0, 0 }; // The average for quizzes, projects, tests and the final.
        // No need to compute the average for the exam: there is only one exam, but we still include a averagePoints[3] variable for consistency in our program.

        double tot = 0.0;
        // tot is for the percent of possible points.

        int read;
        // We will use this variable to temporarily store the value entered by the user.

        bool skip = false;
        // We will use this flag to determine when to exit while loops (if some of the evaluations did not take place yet).

        // We now display the instructions:
        Console.WriteLine(
            "For all the questions below, enter, as an integer, \n \t- your grade, or\n\t- \"0\" if you missed the evaluation, or\n\t- \"-1\" if that evaluation did not happened yet."
        );

        // Loop to collect the data for the quizzes, and then we compute the average for the quizzes.
        do
        {
            Console.WriteLine(
                "What was your grade for quiz "
                    + (accumAssignments[0] + 1)
                    + " (out of "
                    + CONSTVARS[0]
                    + ")?"
            );
            read = int.Parse(Console.ReadLine());
            if (read == -1)
            {
                skip = true;
            } // If the value entered is -1, we set skip to true, so that we exit the loop.
            else
            {
                pointsEarned[0] += read;
                accumAssignments[0]++;
            } // If the value entered is not -1, we increment our accumulator by the value entered, and increment the number of quizzes that took place by 1.
        } while (!skip && accumAssignments[0] < CONSTVARS[4]); // We quit if the user entered -1 or if the number of quizzes taken is TOTQ.

        // If quizzes were actually taken, we compute the average, increment the total, and display the average for quizzes.
        if (accumAssignments[0] != 0)
        {
            averagePoints[0] = pointsEarned[0] / ((double)accumAssignments[0] * CONSTVARS[0]);
            tot += 0.1;
            Console.WriteLine($"Your average for the quiz is {averagePoints[0]:P}.");
        }

        skip = false; // We reset this counter to its original value.

        // Loop to collect the data for the projects, and then we compute the average for the projects.
        // It works pretty much as the part on quizzes, except that there are TOTP projects.
        do
        {
            Console.WriteLine(
                "What was your grade for project "
                    + (accumAssignments[1] + 1)
                    + " (out of "
                    + CONSTVARS[1]
                    + ")? "
            );
            read = int.Parse(Console.ReadLine());
            if (read == -1)
            {
                skip = true;
            }
            else
            {
                pointsEarned[1] += read;
                accumAssignments[1]++;
            }
        } while (!skip && accumAssignments[1] < CONSTVARS[5]);

        if (accumAssignments[1] != 0)
        {
            averagePoints[1] = pointsEarned[1] / ((double)accumAssignments[1] * CONSTVARS[1]);
            tot += 0.1;
            Console.WriteLine($"Your average for the project is {averagePoints[1]:P}.");
        }

        skip = false;

        // Loop to collect the data for the in-class tests, and then we compute the average for the in-class tests.
        // It works pretty much as the part on quizzes, except that there are TOTT tests, and that they count for 40% of the grade.
        do
        {
            Console.WriteLine(
                "What was your grade for in-class test "
                    + (accumAssignments[2] + 1)
                    + " (out of "
                    + CONSTVARS[2]
                    + ")? "
            );
            read = int.Parse(Console.ReadLine());
            if (read == -1)
            {
                skip = true;
            }
            else
            {
                pointsEarned[2] += read;
                accumAssignments[2]++;
            }
        } while (!skip && accumAssignments[2] < CONSTVARS[6]);

        if (accumAssignments[2] != 0)
        {
            averagePoints[2] = pointsEarned[2] / ((double)accumAssignments[2] * CONSTVARS[2]);
            tot += 0.4;
            Console.WriteLine($"Your average for the tests is {averagePoints[2]:P}.");
        }

        skip = false;

        // Asking and reading for the final.
        Console.WriteLine("What was your grade for the final (out of " + CONSTVARS[3] + ")?");
        read = int.Parse(Console.ReadLine());
        if (read != -1)
        {
            averagePoints[3] += (double)read / CONSTVARS[3];
            accumAssignments[3]++;
            tot += 0.4;
        } // If the final was taken, we update accordingly the average and number for the final, and the possible total.
        // Note that we do not use the nF variable in this program, but still declare and update it, to accomodate possible evolution of our program.

        // Finally, we compute the average, based on the coefficients (10%, 10%, 40%, 40%) and on the total possible points:
        double avg =
            (
                averagePoints[0] * 0.1
                + averagePoints[1] * 0.1
                + averagePoints[2] * 0.4
                + averagePoints[3] * 0.4
            ) / tot;

        // We then display the average, using the format specifier for percentage:
        Console.WriteLine($"Your average so far is {avg:P}.");
    }
}
