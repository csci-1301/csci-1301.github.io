# Loops, Increment Operators, and Input Validation

## The `--` and `++` Operators

- Increment and decrement basics
    - In C#, we have already seen multiple ways to add 1 to a numeric variable:

        ```
        int myVar = 1;
        myVar = myVar + 1;
        myVar += 1
        ```

      These two lines of code have the same effect; the `+=` operator is "shorthand" for "add and assign"

    - The **increment operator**, `++`, is an even shorter way to add 1 to a variable. It can be used in two ways:

        ```
        myVar++;
        ++myVar;
        ```

    - Writing `++` after the name of the variable is called a **postfix increment**, while writing `++` before the name of the variable is called a **prefix increment**. They both have the same effect on the variable: its value increases by 1.

    - Similarly, there are multiple ways to subtract 1 from a numeric variable:

        ```
        int myVar = 10;
        myVar = myVar - 1;
        myVar -= 1;
        ```

    - The **decrement operator**, `--`, is a shortcut for subtracting 1 from a variable, and is used just like the increment operator:

        ```
        myVar--;
        --myVar;
        ```

    - To summarize, the increment and decrement operators both have a prefix and postfix version:

        |         | Increment | Decrement |
        | Postfix | `myVar++` | `myVar--` |
        | Prefix  | `++myVar` | `--myVar` |

- Difference between prefix and postfix

    - The prefix and postfix versions of the increment and decrement operators both have the same effect on the variable: Its value increases or decreases by 1

    - The difference between prefix and postfix is whether the "old" or "new" value of the variable is *returned* by the expression

    - With postfix increment/decrement, the operator returns the value of the variable, *then* increases/decreases it by 1

        - This means the value of the increment/decrement expression is the *old* value of the variable, before it was incremented/decremented

        - Consider this example:

            ```
            int a = 1;
            Console.WriteLine(a++);
            Console.WriteLine(a--);
            ```

        - The expression `a++` returns the current value of `a`, which is 1, to be used in Console.WriteLine. *Then* it increments `a` by 1, giving it a new value of 2. Thus, the first Console.WriteLine displays "1" on the screen.

        - The expression `a--` returns the current value of `a`, which is 2, to be used in Console.WriteLine, and *then* decrements `a` by 1. Thus, the second Console.WriteLine displays "2" on the screen.

    - With prefix increment/decrement, the operator increases/decreases the value of the variable by 1, *then* returns its value

        - This means the value of the increment/decrement expression is the *new* value of the variable, after the increment/decrement

        - Consider the same code, but with prefix instead of postfix operators:

            ```
            int a = 1;
            Console.WriteLine(++a);
            Console.WriteLine(--a);
            ```

        - The expression `++a` increments `a` by 1, then returns the value of `a` for use in Console.WriteLine. Thus, the first Console.WriteLine displays "2" on the screen.

        - The expression `--a` decrements `a` by 1, then returns the value of `a` for use in Console.WriteLine. Thus, the second Console.WriteLine displays "1" on the screen.

- Using increment/decrement in expressions

    - The `++` and `--` operators have higher precedence than the other math operators, so if you use them in an expression they will get executed first

    - The "result" of the operator, i.e. the value that will be used in the rest of the math expression, depends on whether it is the prefix or postfix increment/decrement operator: The prefix operator returns the variable's new value, while the postfix operator returns the variable's old value

    - Consider these examples:

        ```
        int a = 1;
        int b = a++;
        int c = ++a * 2 + 4;
        int d = a-- + 1;
        ```

    - The variable `b` gets the value 1, because `a++` returns the "old" value of `a` (1) and then increments `a` to 2

    - In the expression `++a * 2 + 4`, the operator `++a` executes first, and it returns the new value of `a`, which is 3. Then the multiplication executes (`3 * 2`, which is 6), then the addition (`6 + 4`, which is 10). Thus `c` gets the value 10.

    - In thee expression `a-- + 1`, the operator `a--` executes first, and it returns the *old* value of `a`, which is 3 (even though `a` is now 2). Then the addition executes, so `d` gets the value 4.

## While Loops

- Introduction to `while` loops
    - There are two basic types of decision structures in all programming languages. We've just learned about the first, which is the "selection structure," or `if` statement. This allows the program to choose whether or not to execute a block of code, based on a condition.
    - The second basic decision structure is the loop, which allows the program to execute the same block of code repeatedly, and choose when to stop based on a condition.
    - The **while statement** executes a block of code repeatedly, *as long as a condition is true*. You can also think of it as executing the code repeatedly *until a condition is false*
- Example code with a `while` loop

    ```
    int counter = 0;
    while(counter <= 3)
    {
        Console.WriteLine("Hello again!");
        Console.WriteLine(counter);
        counter++;
    }
    Console.WriteLine("Done");
    ```

    - After the keyword `while` is a condition, in parentheses: `counter <= 3`
    - On the next line after the `while` statement, the curly brace begins a code block. The code in this block is "controlled" by the `while` statement.
    - The computer will repeatedly execute that block of code as long as the condition `counter <= 3` is true
    - Note that inside this block of code is the statement `counter++`, which increments `counter` by 1. So eventually, `counter` will be greater than 3, and the loop will stop because the condition is false.
    - This program produces the following output:

        ```text
        Hello again!
        0
        Hello again!
        1
        Hello again!
        2
        Hello again!
        3
        Done
        ```

- Syntax and rules for `while` loops

    - Formally, the syntax for a `while` loop is this:

        ```
        while(<condition>)
        {
            <statements>
        }
        ```

    - Just like with an `if` statement, the condition is any expression that produces a `bool` value (including a `bool` variable by itself)

    - When the computer encounters a `while` loop, it first evaluates the condition

    - If the condition is false, the loop body (code block) is skipped, just like with an `if` statement

    - If the condition is true, the loop body is executed

    - After executing the loop body, the computer goes back to the `while` statement and evaluates the condition again to decide whether to execute the loop again

    - Just like with an `if` statement, the curly braces can be omitted if the loop body is just one statement:

        ```
        while(<condition>)
            <statement>
        ```

- Examining the example in detail

    - When our example program runs, it initializes `counter` to 0, then it encounters the loop

    - It evaluates the condition `counter <= 0`, which is true, so it executes the loop's body. The program displays "Hello again!" and "0" on the screen.

    - At the end of the code block (after `counter++`) the program returns to the `while` statement and evaluates the condition again. 1 is less than 3, so it executes the loop's body again.

    - This process repeats two more times, and the program displays "Hello again!" with "2" and "3"

    - After displaying "3", `counter++` increments `counter` to 4. Then the program returns to the `while` statement and evaluates the condition, but `counter <= 3` is false, so it skips the loop body and executes the last line of code (displaying "Done")

- While loops may execute zero times
    - You might think that a "loop" always repeats code, but nothing requires a while loop to execute at least once
    - If the condition is false when the computer first encounters the loop, the loop body is skipped
    - For example, if we initialize `counter` to 5 with our previous loop:

        ```
        int counter = 5;
        while(counter <= 3)
        {
            Console.WriteLine("Hello again!");
            Console.WriteLine(counter);
            counter++;
        }
        Console.WriteLine("Done");
        ```

      The program will only display "Done," because the body of the loop never executes. `counter <= 3` is false the first time it is evaluated, so the program skips the code block and continues on the next line.

- Ensuring the loop ends

    - If the loop condition is always true, the loop will never end, and your program will run "forever" (until you forcibly stop it, or the computer shuts down)

    - Obviously, if you use the value `true` for the condition, the loop will run forever, like in this example:

        ```
        int number = 1;
        while (true)
            Console.WriteLine(number++);
        ```

    - If you don't intend your loop to run forever, you must ensure the statements in the loop's body do something to *change a variable* in the loop condition, otherwise the condition will stay true

    - For example, this loop will run forever because the loop condition uses the variable `counter`, but the loop body does not change the value of `counter`:

        ```
        int counter = 0;
        while(counter <= 3)
        {
            Console.WriteLine("Hello again!");
            Console.WriteLine(counter);
        }
        Console.WriteLine("Done");
        ```

    - This loop will also run forever because the loop condition uses the variable `num1`, but the loop body changes the variable `num2`:

        ```
        int num1 = 0, num2 = 0;
        while(num1 <= 5)
        {
            Console.WriteLine("Hello again!");
            Console.WriteLine(num1);
            num2++;
        }
        Console.WriteLine("Done");
        ```

    - It's not enough for the loop body to simply change the variable; it must change the variable in a way that will eventually *make the condition false*

        - For example, if the loop condition is `counter <= 5`, then the loop body must increase the value of `counter` so that it is eventually greater than 5

        - This loop will run forever, even though it changes the right variable, because it changes the value in the wrong "direction":

            ```
            int number = 10;
            while(number >= 0)
            {
                Console.WriteLine("Hello again!");
                Console.WriteLine(number);
                number++;
            }
            ```

          The loop condition checks to see whether `number` is $\geq$ 0, and `number` starts out at the value 10. But the loop body increments `number`, which only moves it further away from 0 in the positive direction. In order for this loop to work correctly, we need to *decrement* `number` in the loop body, so that eventually it will be less than 0.

        - This loop will run forever, even though it uses the right variable in the loop body, because it multiplies the variable by 0:

            ```
            int number = 0;
            while (number <= 64)
            {
                Console.WriteLine(number);
                number *= 2;
            }
            ```

          Since `number` was initialized to 0, `number *= 2` doesn't actually change the value of `number`: $2 \times 0 = 0$. So the loop body will never make the condition `number <= 64` false.

- Principles of writing a `while` loop

    - When writing a `while` loop, ask yourself these questions about your program:

        1. When (under what conditions) do I want the loop to continue?
        2. When (under what conditions) do I want the loop to stop?
        3. How will the body of the loop bring it closer to its ending condition?

    - This will help you think clearly about how to write your loop condition. You should write a condition (Boolean expression) that will be `true` in the circumstances described by (1), and `false` in the circumstances described by (2)

    - Keep your answer to (3) in mind as you write the body of the loop, and make sure the actions in your loop's body match the condition you wrote.

## Loops and Input Validation

- Valid and invalid data

    - Depending on the purpose of your program, each variable might have a limited range of values that are "valid" or "good," even if the data type can hold more

    - For example, a `decimal` variable that holds a price (in dollars) should have a positive value, even though it's legal to store negative numbers in a `decimal`

    - On a recent quiz we saw the `Item` class, which represents an item sold in a store, and it has a `price` attribute that should only store positive values

    - When you write a program that constructs an `Item` from literal values, you (the programmer) can make sure you only use positive prices. However, if you construct an `Item` based on input provided by the user, you can't be certain that the user will follow directions and enter a valid price:

        ```
        Console.WriteLine("Enter the item's description");
        string desc = Console.ReadLine();
        Console.WriteLine("Enter the item's price (must be positive)");
        decimal price = decimal.Parse(Console.ReadLine());
        Item myItem = new Item(desc, price);
        ```

      In this code, if the user enters a negative number, the `myItem` object will have a negative price, even though that doesn't make sense.

    - One way to guard against "bad" user input values is to use an `if` statement or a conditional operator, as we saw in the previous lecture (Switch and Conditional), to provide a default value if the user's input is invalid. In our example with Item, we could add a conditional operator to check whether `price` is negative before providing it to the `Item` constructor:

        ```
        decimal price = decimal.Parse(Console.ReadLine());
        Item myItem = new Item(desc, (price >= 0) ? price : 0);
        ```

      In this code, the second argument to the `Item` constructor is the result of the conditional operator, which will be 0 if `price` is negative.

    - You can also put the conditional operator inside the constructor, to ensure that an `Item` with an invalid price can never be created. If we wrote this constructor inside the `Item` class:

        ```
        public Item(string initDesc, decimal initPrice)
        {
            description = initDesc;
            price = (initPrice >= 0) ? initPrice : 0;
        }
        ```

      then the instantiation `new Item(desc, price)` would never be able to create an object with a negative price. If the user provides an invalid price, the constructor will ignore their value and initialize the `price` instance variable to 0 instead.

- Ensuring data is valid with a loop

    - Another way to protect your program from "bad" user input is to check whether the data is valid as soon as the user enters it, and prompt him/her to re-enter the data if it is not valid

    - A `while` loop is the perfect fit for this approach: you can write a loop condition that is true when the user's input is *invalid*, and ask the user for input in the body of the loop. This means your program will repeatedly ask the user for input until he/she enters valid data.

    - This code uses a `while` loop to ensure the user enters a non-negative price:

        ```
        Console.WriteLine("Enter the item's price.");
        decimal price = decimal.Parse(Console.ReadLine());
        while(price < 0)
        {
            Console.WriteLine("Invalid price. Please enter a non-negative price.");
            price = decimal.Parse(Console.ReadLine());
        }
        Item myItem = new Item(desc, price);
        ```

        - The condition for the `while` loop is `price < 0`, which is true when the user's input is invalid
        - If the user enters a valid price the first time, the loop will not run at all -- remember that a `while` loop will skip the code block if the condition is false
        - Inside the loop's body, we ask the user for input again, and assign the result of `decimal.Parse` to the same `price` variable we use in the loop condition. This is what ensures that the loop will end: the variable in the condition gets changed in the body.
        - If the user still enters a negative price, the loop condition will be true, and the body will execute again (prompting them to try again)
        - If the user enters a valid price, the loop condition will be false, so the program will proceed to the next line and instantiate the Item
        - Note that the *only* way for the program to "escape" from the `while` loop is for the user to enter a valid price. This means that `new Item(desc, price)` is guaranteed to create an Item with a non-negative price, even if we did not write the constructor that checks whether `initPrice >= 0`. On the next line of code after the end of a `while` loop, you can be certain that the loop's condition is false, otherwise execution would not have reached that point.

- Ensuring the user enters a number with `TryParse`

    - Another way that user input might be invalid: When asked for a number, the user could enter something that is not a number

    - The `Parse` methods we have been using assume that the `string` they are given (in the argument) is a valid number, and produce a run-time error if it is not

        - For example, this program that you might remember from lab will crash if the user enters "hello" instead of a number:

            ```
            Console.WriteLine("Guess a number"):
            int guess = int.Parse(Console.ReadLine());
            if(guess == favoriteNumber)
            {
                Console.WriteLine("That's my favorite number!");
            }
            ```

    - Each built-in data type has a **TryParse method** that will *attempt* to convert a `string` to a number, but will not crash (produce a run-time error) if the conversion fails. Instead, TryParse indicates failure by returning the Boolean value `false`

    - The `TryParse` method is used like this:

        ```
        string userInput = Console.ReadLine();
        int intVar;
        bool success = int.TryParse(userInput, out intVar);
        ```

        - The first parameter is a `string` to be parsed (`userInput`)

        - The second parameter is an **out parameter**, and it is the name of a variable that will be assigned the result of the conversion. The keyword `out` indicates that a method parameter is used for *output* rather than *input*, and so the variable you use for that argument will be changed by the method.

        - The return type of `TryParse` is `bool`, not `int`, and the value returned indicates whether the input string was successfully parsed

        - If the string `userInput` contains an integer, `TryParse` will assign that integer value to `intVar` and return `true` (which gets assigned to `success`)

        - If the string `userInput` does not contain an integer, `TryParse` will assign 0 to `intVar` and return `false` (which gets assigned to `success`)

        - Either way, the program will not crash, and `intVar` will be assigned a new value

    - The other data types have `TryParse` methods that are used the same way. The code will follow this general format:

        ```
        bool success = <numeric datatype>.TryParse(<string to convert>, out <numeric variable to store result>)
        ```

      Note that the variable you use in the out parameter must be the same type as the one whose `TryParse` method is being called. If you write `decimal.TryParse`, the out parameter must be a `decimal` variable.

    - A more complete example of using `TryParse`:

        ```
        Console.WriteLine("Please enter an integer");
        string userInput = Console.ReadLine();
        int intVar;
        bool success = int.TryParse(userInput, out intVar);
        if(success)
        {
            Console.WriteLine($"The value entered was an integer: {intVar}");
        }
        else
        {
            Console.WriteLine($"\"{userInput}\" was not an integer");
        }
        Console.WriteLine(intVar);
        ```

        - The `TryParse` method will attempt to convert the user's input to an `int` and store the result in `intVar`

        - If the user entered an integer, `success` will be `true`, and the program will display "The value entered was an integer: " followed by the user's value

        - If the user entered some other string, `success` will be `false`, and the program will display a message indicating that it was not an integer

        - Either way, `intVar` will be assigned a value, so it's safe to write `Console.WriteLine(intVar)`. This  will display the user's input if the user entered an integer, or "0" if the user did not enter an integer.

    - Just like with `Parse`, you can use `Console.ReadLine()` itself as the first argument rather than a `string` variable. Also, you can declare the output variable within the out parameter, instead of on a previous line. So we can read user input, declare an `int` variable, and attempt to parse the user's input all on one line:

        ```
        bool success = int.TryParse(Console.ReadLine(), out int intVar);
        ```

    - You can use the return value of `TryParse` in a `while` loop to keep prompting the user until they enter valid input:

        ```
        Console.WriteLine("Please enter an integer");
        bool success = int.TryParse(Console.ReadLine(), out int number);
        while(!success)
        {
            Console.WriteLine("That was not an integer, please try again.");
            success = int.TryParse(Console.ReadLine(), out number);
        }
        ```

        - The loop condition should be true when the user's input is *invalid*, so we use the negation operator `!` to write a condition that is true when `success` is `false`

        - Each time the loop body executes, both `success` and `number` are assigned new values by `TryParse`


# Do-While Loops and Loop Vocabulary

## The `do-while` Statement

- Comparing `while` and `if` statements

    - `while` and `if` are very similar: Both test a condition, execute a block of code if the condition is true, and skip the block of code if the condition is false

    - There's only a difference if the condition is true: `if` statements only execute the block of code once if the condition is true, but `while` statements may execute the block of code multiple times if the condition is true

    - Compare these snippets of code:

        ```
        if(number < 3)
        {
            Console.WriteLine("Hello!");
            Console.WriteLine(number);
            number++;
        }
        Console.WriteLine("Done");
        ```

      and

        ```
        while(number < 3)
        {
            Console.WriteLine("Hello!");
            Console.WriteLine(number);
            number++;
        }
        Console.WriteLine("Done");
        ```

        - If `number` is 4, then both will do the same thing: skip the block of code and display "Done".
        - If `number` is 2, both will also do the same thing: Display "Hello!" and "2", then increment `number` to 3 and print "Done".
        - If `number` is 1, there is a difference: The `if` statement will only display "Hello!" once, but the `while` statement will display "Hello! 2" and "Hello! 3" before displaying "Done"

- Since the `while` loop evaluates the condition before executing the code in the body (like an `if` statement), you sometimes end up duplicating code

    - For example, consider an input-validation loop like the one we wrote for Item prices:

        ```
        Console.WriteLine("Enter the item's price.");
        decimal price = decimal.Parse(Console.ReadLine());
        while(price < 0)
        {
            Console.WriteLine("Invalid price. Please enter a non-negative price.");
            price = decimal.Parse(Console.ReadLine());
        }
        Item myItem = new Item(desc, price);
        ```

    - Before the `while` loop, we wrote two lines of code to prompt the user for input, read the user's input, convert it to `decimal`, and store it in `price`

    - In the body of the `while` loop, we also wrote two lines of code to prompt the user for input, read the user's input, convert it to `decimal`, and store it in `price`

    - The code before the `while` loop is necessary to give `price` an initial value, so that we can check it for validity in the `while` statement

    - It would be nice if we could tell the `while` loop to execute the body first, and then check the condition

- The `do-while` loop executes the loop body **before** evaluating the condition

    - Otherwise works the same as a `while` loop: If the condition is true, execute the loop body again; if the condition is false, stop the loop

    - This can reduce repeated code, since the loop body is executed *at least once*

    - Example:

        ```
        decimal price;
        do
        {
            Console.WriteLine("Please enter a non-negative price.");
            price = decimal.Parse(Console.ReadLine());
        } while(price < 0);
        Item myItem = new Item(desc, price);
        ```

        - The keyword `do` starts the code block for the loop body, but it doesn't have a condition, so the computer simply starts executing the body

        - In the loop body, we prompt the user for input, read and parse the input, and store it in `price`

        - The condition `price < 0` is evaluated at the end of the loop body, so `price` has its initial value by the time the condition is evaluated

        - If the user entered a valid price, and the condition is false, execution simply proceeds to the next line

        - If the user entered a negative price (the condition is true), the computer returns to the beginning of the code block and executes the loop body again

        - This has the same effect as the `while` loop: the user is prompted repeatedly until he/she enters a valid price, and the program can only reach the line `Item myItem = new Item(desc, price)` when `price < 0` is false

        - Note that the variable `price` must be declared before the `do-while` loop so that it is in scope after the loop. It would not be valid to declare `price` inside the body of the loop (e.g. on the line with `decimal.Parse`) because then its scope would be limited to inside that code block.

- Formal syntax and details

    - A `do-while` loop is written like this:

        ```
        do
        {
            <statements>
        } while(<condition>);
        ```

    - The `do` keyword does nothing, but it is required to indicate the start of the loop. You can't just write a `{` by itself.

    - Unlike a `while` loop, a semicolon is required after `while(<condition>)`

    - It's a convention to write the `while` keyword on the same line as the closing `}`, rather than on its own line as in a `while` loop

    - When the computer encounters a `do-while` loop, it first executes the body (code block), then evaluates the condition

    - If the condition is true, the computer jumps back to the `do` keyword and executes the loop body again

    - If the condition is false, execution continues to the next line after teh `while` keyword

    - If the loop body is only a single statement, you can omit the curly braces, but not the semicolon:

        ```
        do
            <statement>
        while(<condition>);
        ```

- A `do-while` loop with multiple conditions

    - We can combine both types of user-input validation in one loop: Ensuring the user entered a number (not some other string), and ensuring the number is valid. This is easier to do with a `do-while` loop:

        ```
        decimal price;
        bool parseSuccess;
        do
        {
            Console.WriteLine("Please enter a price (must be non-negative).");
            parseSuccess = decimal.TryParse(Console.ReadLine(), out price);
        } while(!parseSuccess || price < 0);
        Item myItem = new Item(desc, price);
        ```

    - There are two parts to the loop condition: (1) it should be true if the user did not enter a number, and (2) it should be true if the user entered a negative number.

    - We combine these two conditions with `||` because either one, by itself, represents invalid input. Even if the user entered a valid number (which means `!parseSuccess` is false), the loop should not stop unless `price < 0` is also false.

    - Note that both variables must be declared before the loop begins, so that they are in scope both inside and outside the loop body

## Vocabulary

Variables and values can have multiple roles, but it is useful to mention three different roles in the context of loops:

Counter

: Variable that is incremented every time a given event occurs.

```
int i = 0; // i is a counter
while (i < 10){
    Console.WriteLine($"{i}");
    i++;
}
```

Sentinel Value

:  A special value that signals that the loop needs to end.

```
Console.WriteLine("Give me a string.");
string ans = Console.ReadLine();
while (ans != "Quit") // The sentinel value is "Quit".
{
    Console.WriteLine("Hi!");
    Console.WriteLine("Enter \"Quit\" to quit, or anything else to continue.");
    ans = Console.ReadLine();
}
```

Accumulator

: Variable used to keep the total of several values.

```
int i = 0, total = 0;
while (i < 10){
    total += i; // total is the accumulator.
    i++;
}

Console.WriteLine($"The sum from 0 to {i} is {total}.");
```


We can have an accumulator and a sentinel value at the same time:

```
Console.WriteLine("Enter a number to sum, or \"Done\" to stop and print the total.");
string enter = Console.ReadLine();
int sum = 0;
while (enter != "Done")
{
    sum += int.Parse(enter);
    Console.WriteLine("Enter a number to sum, or \"Done\" to stop and print the total.");
    enter = Console.ReadLine();
}
Console.WriteLine($"Your total is {sum}.");
```

You can have counter, accumulator and sentinel values at the same time:

```
int a = 0;
int sum = 0;
int counter = 0;
Console.WriteLine("Enter an integer, or N to quit.");
string entered = Console.ReadLine();
while (entered != "N") // Sentinel value
{
    a = int.Parse(entered);
    sum += a; // Accumulator
    Console.WriteLine("Enter an integer, or N to quit.");
    entered = Console.ReadLine();
    counter++; // counter
}
Console.WriteLine($"The average is {sum / (double)counter}");
```

We can distinguish between three "flavors" of loops (that are not mutually exclusive):

Sentinel controlled loop

: The exit condition tests if a variable has (or is different from) a _specific value_.

User controlled loop

: The number of iterations depends on the _user_.

Count controlled loop

: The number of iterations depends on a _counter_.

Note that a user-controlled loop can be sentinel-controlled (that is the example we just saw), but also count-controlled ("Give me a value, and I will iterate a task that many times").


## While Loop With Complex Conditions

In the following example, a complex boolean expression is used in the _while_ statement. The program gets a value and tries to parse it as an integer. If the value can not be converted to an integer, the program tries again, but not more than three times.

```
int c;
string message;
int count;
bool res;

Console.WriteLine("Please enter an integer.");
message = Console.ReadLine();
res = int.TryParse(message, out c);
count = 0; // The user has 3 tries: count will be 0, 1, 2, and then we default.
while (!res && count < 3)
{
    count++;
    if (count == 3)
    {
        c = 1;
        Console.WriteLine("I'm using the default value 1.");
    }
    else
    {
        Console.WriteLine("The value entered was not an integer.");
        Console.WriteLine("Please enter an integer.");
        message = Console.ReadLine();
        res = int.TryParse(message, out c);
    }
}
Console.WriteLine("The value is: " + c);
```
