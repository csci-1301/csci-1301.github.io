/*
 * "Loan" class.
 * This class helps primarily in computing
 * an APR based on information provided from the user.
 * A ToString method is provided.
 */
using System;
class Loan
{
    private string name;    // For the name of the loan holder.
    private char type;      // For the type ('a'uto, 'h'ouse or 'o'ther) of the loan
    private int cscore;     // For the credit score.
    private decimal amount; // For the amount of money loaned.
    private decimal rate;   // For the A.P.R., the interest rate.

    /*
     * Our constuctor will compute the amount and the rate
     * based on the information given as arguments.
     * The name, type and credit score will simply be given as arguments.
     */
    public Loan(string nameP, char typeP, int cscoreP, decimal needP, decimal downP)
    {
        name = nameP;
        type = typeP;
        cscore = cscoreP;
        if (cscore < 421)
        {
            Console.WriteLine("Sorry, we can't accept your application.");
            amount = -1;
            rate = -1;
        }
        else
        {
            amount = needP - downP;

            switch (type)
            {
                case ('a'):
                    rate = .05M;
                    break;

                case ('h'):
                    if (cscore > 600 && amount < 1000000M)
                        rate = .03M;
                    else
                        rate = .04M;
                    break;

                case ('o'):
                    if (cscore > 650 || amount < 10000M)
                        rate = .07M;
                    else
                        rate = .09M;
                    break;
            }

        }
    }
    public override string ToString()
    {
        string typeName = "";
        switch (type)
        {
            case ('a'):
                typeName = "an auto";
                break;

            case ('h'):
                typeName = "a house";
                break;
            case ('o'):
                typeName = "another reason";
                break;

        }
        return "Dear " + name + $", you borrowed {amount:C} at {rate:P} for "
            + typeName + ".";
    }
}

