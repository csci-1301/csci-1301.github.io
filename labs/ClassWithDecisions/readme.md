---
title: Class With Decisions
---

# Validating Inputs

Start by downloading the [LoanCalculator](LoanCalculator.zip) solution, that mixes classes and decision structures.

Edit the `Program.cs` file of the project you previously downloaded to add the following validation features:

#. Users entering a value other than `A`, `a`, `H`, `h`, `O` and `o` for the loan type will be asked again, and asked as long as they do not give a valid answer.
#. Users entering a credit score not between 300 and 850, or that is not an integer, will be asked again, and asked as long as they do not give a valid answer.
#. Users entering an amount needed or a down payment that is not a decimal, or is a negative decimal, will be asked again,  and asked as long as they do not give a valid answer.
#. (Optional) Use the [ToLower()](https://docs.microsoft.com/en-us/dotnet/api/system.char.tolower?view=netframework-4.7.2) or [ToUpper()](https://docs.microsoft.com/en-us/dotnet/api/system.char.toupper?view=netframework-4.7.2) methods of the `char` class to make the program more readable -- you will be able to greatly simplify the `if` statement that checks the loan type.
#. (Optional, hard) Write a method for the Loan class that takes a character as an argument, and returns the string describing the type of loan designed by that character. Then, use this method in the `ToString` and in the application program instead of doing it "by hand". 

You can find a possible solution [in this archive](LoanCalculatorSol.zip).
