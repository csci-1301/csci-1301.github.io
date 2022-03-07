/*
 * C. Aubert
 * 2022_03_07
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

namespace Grade_Calculator
{
    class Program
    {
        static void Main()
        {
            /*
                  * For the quizzes (Q), the project (P), the in-class tests (T) and the finale (F), we need
                  * - The maximum number of points (MAX), which will be a constant,
                  * - An accumulator (acc, except for the final exam, since there will be only one), to hold the total number of points earned,
                  * - The number of evaluation of that kind that took place (n),
                  * - An average (a),
                  * - The total number of exams of this nature (TOT), which will be a constant.
                  * 
                  * This gives us the following variables, all initialized to 0, except for the maximum number of points.
                  */

            const int
                MAXQ = 20,
                MAXP = 20,
                MAXT = 100,
                MAXF = 200; // The maximum points for quizzes, projects, tests and final, respectively.
            int accQ = 0,
                nQ = 0; // The total number of points earned in quizzes, and the number of quizzes that took place.
            int accP = 0,
                nP = 0; // The total number of points earned in projects, and the number of projects that took place.
            int accT = 0,
                nT = 0; // The total number of points earned in tests, and the number of tests that took place.
            int
                nF = 0; // The total number of points earned during the final, no need for an accumulator for the final exam, since there is only one.
            double aQ = 0, aP = 0, aT = 0, aF = 0; // The average for quizzes, projects, tests and the finale.
            // No need to compute the average for the exam: there is only one exam, but we still include a aF variable for consistency in our program.
            const int
                TOTQ = 4, TOTP = 2, TOTT = 2, TOTF = 1; // Number of scheduled quizzes, projects, tests and finale.
            double tot = 0.0;
            // tot is for the percent of possible points.

            int read;
            // We will use this variable to temporarily store the value entered by the user.

            bool skip = false;
            // We will use this flag to determine when to exit while loops (if some of the evaluations did not take place yet).

            // We now display the instructions:
            Console.WriteLine(
                "For all the questions below, enter, as an integer, \n \t- your grade, or\n\t- \"0\" if you missed the evaluation, or\n\t- \"-1\" if that evaluation did not happened yet.");

            // Loop to collect the data for the quizzes, and then we compute the average for the quizzes.
            do
            {
                Console.WriteLine("What was your grade for quiz " + (nQ + 1) + " (out of " + MAXQ + ")?");
                read = int.Parse(Console.ReadLine());
                if (read == -1)
                {
                    skip = true;
                } // If the value entered is -1, we set skip to true, so that we exit the loop.
                else
                {
                    accQ += read;
                    nQ++;
                } // If the value entered is not -1, we increment our accumulator by the value entered, and increment the number of quizzes that took place by 1.
            } while (!skip && nQ < TOTQ); // We quit if the user entered -1 or if the number of quizzes taken is TOTQ.

            // If quizzes were actually taken, we compute the average, increment the total, and display the average for quizzes.
            if (nQ != 0)
            {
                aQ = accQ / ((double) nQ * MAXQ);
                tot += 0.1;
                Console.WriteLine($"Your average for the quiz is {aQ:P}.");
            }

            skip = false; // We reset this counter to its original value.


            // Loop to collect the data for the projects, and then we compute the average for the projects.
            // It works pretty much as the part on quizzes, except that there are TOTP projects.
            do
            {
                Console.WriteLine("What was your grade for project " + (nP + 1) + " (out of " + MAXP + ")? ");
                read = int.Parse(Console.ReadLine());
                if (read == -1)
                {
                    skip = true;
                }
                else
                {
                    accP += read;
                    nP++;
                }
            } while (!skip && nP < TOTP);

            if (nP != 0)
            {
                aP = accP / ((double) nP * MAXP);
                tot += 0.1;
                Console.WriteLine($"Your average for the project is {aP:P}.");
            }

            skip = false;

            // Loop to collect the data for the in-class tests, and then we compute the average for the in-class tests.
            // It works pretty much as the part on quizzes, except that there are TOTT tests, and that they count for 40% of the grade.
            do
            {
                Console.WriteLine("What was your grade for in-class test " + (nT + 1) + " (out of " + MAXT + ")? ");
                read = int.Parse(Console.ReadLine());
                if (read == -1)
                {
                    skip = true;
                }
                else
                {
                    accT += read;
                    nT++;
                }
            } while (!skip && nT < TOTT);

            if (nT != 0)
            {
                aT = accT / ((double) nT * MAXT);
                tot += 0.4;
                Console.WriteLine($"Your average for the tests is {aT:P}.");
            }

            skip = false;

            // Asking and reading for the final.
            Console.WriteLine("What was your grade for the final (out of " + MAXF + ")?");
            read = int.Parse(Console.ReadLine());
            if (read != -1)
            {
                aF += (double) read / MAXF;
                nF++;
                tot += 0.4;
            } // If the final was taken, we update accordingly the average and number for the final, and the possible total.
            // Note that we do not use the nF variable in this program, but still declare and update it, to accomodate possible evolution of our program.

            // Finally, we compute the average, based on the coefficients (10%, 10%, 40%, 40%) and on the total possible points:
            double avg = (aQ * 0.1 + aP * 0.1 + aT * 0.4 + aF * 0.4) / tot;

            // We then display the average, using the format specifier for percentage:
            Console.WriteLine($"Your average so far is {avg:P}.");
        }
    }
}