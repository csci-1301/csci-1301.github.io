# Switch Statements and the Conditional Operator

## Switch Statements

- Introduction: Multiple equality comparisons

    - In some situations, your program will need to test if a variable is equal to one of several values, and perform a different action based on which value the variable matches

    - For example, you have an `int` variable named `month` containing a month number, and want to convert it to a `string` with the name of the month. This means your program needs to take a different action depending on whether `month` is equal to 1, 2, 3, ... or 12:

        !["A flowchart representation of the mapping between month number and name"](img/activity_diag_month)

    - One way to do this is with a series of `if-else-if` statements, one for each possible value, like this:

        ```
        Console.WriteLine("Enter the month as a number between 1 and 12.");
        int month = int.Parse(Console.ReadLine());
        string monthName;
        if(month == 1)
        {
            monthName = "January";
        }
        else if(month == 2)
        {
            monthName = "February";
        }
        else if(month == 3)
        {
            monthName = "March";
        }
        else if(month == 4)
        {
            monthName = "April";
        }
        else if(month == 5)
        {
            monthName = "May";
        }
        else if(month == 6)
        {
            monthName = "June";
        }
        else if(month == 7)
        {
            monthName = "July";
        }
        else if(month == 8)
        {
            monthName = "August";
        }
        else if(month == 9)
        {
            monthName = "September";
        }
        else if(month == 10)
        {
            monthName = "October";
        }
        else if(month == 11)
        {
            monthName = "November";
        }
        else if(month == 12)
        {
            monthName = "December";
        }
        else
        {
            monthName = "Invalid month"
        }
        Console.WriteLine("The number " + month + " corresponds to the month " + monthName + ".")
        ```

    - This code is very repetitive, though: every `else if` statement is almost the same, with only the number changing. The text "`if(month ==`" is copied over and over again.

- Syntax for `switch` statements

    - A `switch` statement is a simpler, easier way to compare a single variable against multiple possible values

    - It is written like this:

        ```
        switch (<variable name>)
        {
            case <value 1>:
                <statement block 1>
                break;
            case <value 2>:
                <statement block 2>
                break;
            …
            default:
                <statement block n>
                break;
        }
        ```

    - First, the "header" of the `switch` statement names the variable that will be compared

    - The "body" of the switch statement is enclosed in curly braces, and contains multiple `case` statements

    - Each `case` statement gives a possible value the variable could have, and a block of statements to execute if the variable equals that value. Statement block 1 is executed if the variable is equal to value 1, statement block 2 is executed if the variable is equal to value 2, etc.

    - The statement "block" within each `case` is **not** enclosed in curly braces, unlike `if` and `else if` blocks. Instead, it begins on the line after the `case` statement, and ends with the keyword `break`.

    - The `default` statement is like the `else` statement: It defines code that gets executed if the variable does not match any of the values in the `case` statements.

    - The values in each `case` statement must be **literals**, not variables, and they must be **unique** (you can't write two `case` statements with the same value)

- Example `switch` statement

    - This program has the same behavior as our previous example, but uses a `switch` statement instaed of an `if-else-if` statement:

        ```
        Console.WriteLine("Enter the month as a number between 1 and 12.");
        int month = int.Parse(Console.ReadLine());
        string monthName;
        switch(month)
        {
            case 1:
                monthName = "January";
                break;
            case 2:
                monthName = "February";
                break;
            case 3:
                monthName = "March";
                break;
            case 4:
                monthName = "April";
                break;
            case 5:
               monthName = "May";
               break;
            case 6:
                monthName = "June";
                break;
            case 7:
                monthName = "July";
                break;
            case 8:
                monthName = "August";
                break;
            case 9:
                monthName = "September";
                break;
            case 10:
                monthName = "October";
                break;
            case 11:
                monthName = "November";
                break;
            case 12:
                monthName = "December";
                break;
            default:
                monthName = "Invalid month"
                break;
        }
        Console.WriteLine("The number " + month + " corresponds to the month " + monthName + ".")
        ```

    - Since the variable in the `switch` statement is `month`, each `case` statement means, effectively, `if (month == <value>)`. For example, `case 1:` has the same effect as `if (month == 1)`

    - The values in each `case` statement must be `int` literals, since `month` is an `int`

    - The `default` statement has the same effect as the final `else` in the `if-else-if` statement: it contains code that will be executed if `month` didn't match any of the values

- `switch` with multiple statements

    - So far, our examples have used only one line of code in each `case`

    - Unlike `if-else`, you do not need curly braces to put multiple lines of code in a `case`

    - For example, imagine our "months" program needed to convert a month number to both a month name and a three-letter abbreviation. The `switch` would look like this:

        ```
        string monthName;
        string monthAbbrev;
        switch(month)
        {
            case 1:
                monthName = "January";
                monthAbbrev = "Jan";
                break;
            case 2:
                monthName = "February";
                monthAbbrev = "Feb";
                break;
            // and so on, with all the other months...
        }
        ```

    - The computer knows which statements are included in each case because of the `break` keyword. For the "1" case, the block of statements starts after `case 1:` and ends with the `break;` after `monthAbbrev = "Jan";`

- The importance of `break`

    - The curly braces in an `if` statement *must* be matched up because this is a rule in C#; you will get a compile error if you forget the `}`

    - There is *not* a rule stating that each `case` must have a matching `break`, so if you forget the `break`, the compiler will not give you an error -- but your program might not behave the way you want

    - The `case` statement only defines where code execution *starts* when the variable matches a value, not where it *ends*. The `break` statement is what defines where code execution stops after a `case` is matched.

    - Thus, if your "case block" does not end with `break`, the computer will continue executing code within the `switch`, and proceed to the next case's statements. This behavior is called **fall-through**.

    - For example, imagine you forgot to write `break` at the end of the first "case block" in the months program:

        ```
        switch(month)
        {
            case 1:
                monthName = "January";
            case 2:
                monthName = "February";
                break;
            //...
        }
        ```

      When this program executes, if `month` is equal to 1, this is what will happen:

        - When the computer encounters `switch(month)`, it compares `month` to each value in a `case`
        - Since `month == 1`, the computer starts executing code at the line `case 1:`
        - `monthName` gets assigned the value "January"
        - The computer continues past the line `case 2:` without doing anything, since the `switch` comparison has already been done
        - The computer executes `monthName = "February";` and `monthName` gets assigned the value "February"
        - The computer encounters a `break;` statement and stops executing code from the `switch`. It skips to the closing `}` for the `switch` and continues with the next line of code after that.

      As a result, `monthName` will end up with the value "February" even though `month` was equal to 1.

- Intentionally omitting `break`

    - It's not always a mistake to write a `case` without a matching `break`

    - If there is more than one value that should have the same behavior (i.e. you would write an `if` condition with an `||`, like `if(x == 1 || x == 2)`), you can "combine" multiple cases by omitting the `break` between them

    - In a switch statement with this structure:

        ```
        switch(<variable>)
        {
            case <value 1>:
            case <value 2>:
                <statement block 1>
                break;
            case <value 3>:
            case <value 4>:
                <statement block 2>
                break;
            default:
                <statement block 3>
                break;
        }
        ```

      The statements in block 1 will execute if the variable matches value 1 *or* value 2, and the statements in block 2 will execute if the variable matches value 3 *or* value 4.

    - For example, imagine our program needs to tell the user which season the month is in. If the month number is 1, 2, or 3, the season is the same (winter), so we can combine these 3 cases. This code will correctly initialize the string `season`:

        ```
        switch(month)
        {
            case 1:
            case 2:
            case 3:
                season = "Winter";
                break;
            case 4:
            case 5:
            case 6:
                season = "Spring";
                break;
            case 7:
            case 8:
            case 9:
                season = "Summer";
                break;
            case 10:
            case 11:
            case 12:
                season = "Fall";
                break;
            default:
                season = "Error!"
                break;
        }
        ```

      If `month` is equal to 1, execution will start at `case 1:`, but the computer will continue past `case 2` and `case 3` and execute `season = "Winter"`. It will then stop when it reaches the `break`, so `season` gets the value "Winter".

- Scope and `switch`

    - In C#, the scope of a variable is defined by curly braces (recall that local variables defined in a method have a scope that ends with the `}` at the end of the method)

    - Since the `case` statements in a `switch` do not have curly braces, they are all in the same scope: the one defined by the `switch` statement's curly braces

    - This means you cannot declare a "local" variable within a `case` statement -- it will be in scope (visible) to all the other `case` statements

    - For example, imagine you wanted to use a local variable named `nextMonth` to do some local computation within each case in the "months" program. This code will not work:

        ```
        switch(month)
        {
            case 1:
                int nextMonth = 2;
                monthName = "January";
                // do something with nextMonth...
                break;
            case 2:
                int nextMonth = 3;
                monthName = "February";
                // do something with nextMonth...
                break;
            //...
        }

        ```

      The line `int nextMonth = 3` would cause a compile error because a variable named `nextMonth` already exists -- the one declared within `case 1`.

- Limitations of `switch`

    - Not all `if-else-if` statements can be rewritten as `switch` statements

    - `switch` can only test equality, so in general, only `if` statements whose condition uses `==` can be converted to `switch`

    - For example, imagine we have a program that determines how much of a fee to charge a rental car customer based on the number of miles the car was driven. A variable named `mileage` contains the number of miles driven, and it is used in this `if-else-if` statement:

        ```
        decimal fee = 0;
        if(mileage > 1000)
        {
            fee = 50.0M;
        }
        else if(mileage > 500)
        {
            fee = 25.0M;
        }
        ```

    - This `if-else-if` statement could not be converted to `switch(mileage)` because of the condition `mileage > 1000`. The `switch` statement would need to have a `case` for each number greater than 1000, which is infinitely many.

## The Conditional Operator

- Assignment and `if` statements

    - There are many situations where we need to assign a variable to a different value depending on the result of a condition

    - For example, the `if-else-if` and `switch` statements in the previous section were used to decide which value to assign to the variable `monthName`

    - A simpler example: Imagine your program needs to tell the user whether a number is even or odd. You need to initialize a `string` variable to either "Even" or "Odd" depending on whether `myInt % 2` is equal to 0. We could write an `if` statement to do this:

        ```
        string output;
        if(myInt % 2 == 0)
        {
            output = "Even";
        }
        else
        {
            output = "Odd";
        }
        ```

- Assignment with the conditional operator

    - If the only thing an `if` statement does is assign a value to a variable, there's a much shorter way to write it

    - The **conditional operator** `?:` tests a condition, and then outputs one of two values based on the result

    - Continuing the "even or odd" example, the conditional operator is used like this:

        ```
        string output = (myInt % 2 == 0) ? "Even" : "Odd";
        ```

      When this line of code is executed:

        - The condition `(myInt % 2 == 0)` is evaluated, and the result is either true or false
        - If the condition is true, the conditional operator returns (outputs) the value `"Even"` (the left side of the `:`)
        - If the condition is false, the operator returns the value `"Odd"` (the right side of the `:`)
        - This value, either "Even" or "Odd", is used in the initialization statement for `string output`
        - Thus, `output` gets assigned the value `"Even"` if `(myInt % 2 == 0)` is true, or `"Odd"` if `(myInt % 2 == 0)` is false

    - In general, the syntax for the conditional operator is:

        ```
        condition ? true_expression : false_expression;
        ```

        - The "condition" can be any expression that produces a `bool` when evaluated, just like in an `if` statement

        - `true_expression` and `false_expression` can be variables, values, or more complex expressions, but they must both produce the same *type* of data when evaluated

        - For example, if `true_expression` is `myInt * 1.5`, then `false_expression` must also produce a `double`

        - When the conditional operator is evaluated, it returns either the value of `true_expression` or the value of `false_expression` (depending on the condition) and this value can then be used in other operations such as assignment

- Conditional operator examples

    - The `true_expression` and `false_expression` can both be mathematical expressions, and only one of them will get computed. For example:

        ```
        int answer = (myInt % 2 == 0) ? myInt / 2 : myInt + 1;
        ```

      If `myInt` is even, the computer will evaluate `myInt / 2` and assign the result to `answer`. If it is odd, the computer will evaluate `myInt + 1` and assign the result to `answer`.

    - Conditional operators can be used with user input to quickly provide a "default value" if the user's input is invalid. For example, we can write a program that asks the user their height, but uses a default value of 0 if the user enters a negative height:

        ```
        Console.WriteLine("What is your height in meters?");
        double userHeight = double.Parse(Console.ReadLine());
        double height = (userHeight >= 0.0) ? userHeight : 0.0;
        ```

    - The condition can be a Boolean variable by itself, just like in an if statement. This allows you to write code that looks kind of like English, due to the question mark in the conditional operator. For example,

        ```
        bool isAdult = age >= 18;
        decimal price = isAdult ? 5.0m : 2.5m;
        string closingTime = isAdult ? "10:00 pm" : "8:00 pm";
        ```
