---
title: User Input
---


# Reading From the User

#. Download the [PersonalizedWelcomeMessage solution](PersonalizedWelcomeMessage_Solution.zip), extract and open it as usual.

#. If you are using Visual Studio on Mac or Monodevelop, you may have to perform an additional step for this program to run as expected.
    
    - For Visual Studio on Mac, follow the instructions at <https://stackoverflow.com/a/49056993/> to have your project "Run on external console".
    - For Monodevelop, follow the instructions at <https://stackoverflow.com/a/67185469/> to similarly have your projeect "Run on external console".

    You may have to perform this operation for every solution where the user is supposed to enter values.

#. Compile and execute it.
#. The user of your program (in this case, you!) will be prompted with the message:

        Please, enter your first name, followed by "Enter":
    
    Enter your first name, followed by <kbd>Enter ↵</kbd>.
    You just witnessed an interaction between a program and the user!

#. Read the source code carefully and make sure you understand all of it.
#. Change the code so that the program would also ask for the user's last name and print both their first and last names.

# Parsing Numeric Types

#. So far, our user input has always returned a specific type.  What type is it?
#. Without making changes to the code, execute it again but give a number as your first name. Does the type returned change if the user enters only numeric values?

#. What if you ask the user directly for an integer?  How can you store it in an int variable?
#. Add the following to the code:

    Console.WriteLine("Please enter your age in years as an integer.");

    string ageInput = Console.ReadLine();
    int age = int.Parse(ageInput);
    
    Console.WriteLine($"Your age in months is {age*12}");
    
#. Re-compile and execute your code.  Be sure to enter a whole number for your age.
#. Are the results what you expect?
#. Run the code again, this time with a negative number for your age.  Then try again with 0.  Does the code still work?

#. What if you were to enter a floating point number when asked for an integer?  What if you entered the word "twenty"?
#. Here you are purposely ignoring the prompt, but know that your user may purposely or accidentally give the wrong input type.
#. Later in the course you will learn how to handle untrustworthy user input

#. Can you think of a change you can make to the code to accept ages of type float instead of int?  Try making that change!
#. If you were to ask a user to enter an age without specifying its type, what .Parse should you use?
