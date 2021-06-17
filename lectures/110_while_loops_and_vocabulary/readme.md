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

## `break` statement
The `break` statement ends a loop immediately.

### Example
```
int number = 1;
while (true)
{
    Console.WriteLine(number);
    number++;
    if(number > 5) break;
}
```

## `continue` statement

This command ends the current iteration of a loop and skips the remaining statements in the body of the loop.

### Example
```
int number = 0;
while (number <= 100)
{
    number++;
    if(number % 2 == 1) continue;
    Console.WriteLine(number);
}
```
- The above code prints all the even numbers from 1 to 100.


## `do-while` Statement
As like as the `while` statement, the `do-while` statement executes a block or a statement while a specified _boolean expression_ evaluates to true. But, the boolean expression is evaluated at the end of each iteration. Consequently, the loop body of a `do-while` loop executes at least once.

### Formal Syntax

```
do
    <code block> or <a statement>
while (<boolean expression>);
```

### Example
```
int number = 1;
do
{
    Console.WriteLine(number);
    number++;
}while (number <=5);
```

## User-Input Validation

We can use loops to test what was entered by the user, and ask again if the value does not fit our needs:

### Example 1
```
Console.WriteLine("Please enter a positive number");
int n = int.Parse(Console.ReadLine());
while (n < 0)
{
    Console.WriteLine($"You entered <{n}>, I asked you for a positive number. Please try again.");
    n = int.Parse(Console.ReadLine());
}
```

### TryParse

- The `TryParse` method allows us to parse strings, and to "extract" a number out of them if they contain one, or to be given a way to recover if they don't.
- `int.TryParse` takes two arguments, a string and a variable name (prefixed by the keyword `out`) and returns a boolean.
    - If the first argument is convertable to the desired data type, the method returns _true_ and saves the string into the variable name as the desired datatype.
    - If the first argument is _not_ convertable to the desired datatype, it returns _false_ and 0 is saved into the variable name.
- The `TryParse` method is typically structured like so:

```
bool result = <numeric datatype>.TryParse(<string to convert>, out <numeric variable to store result>)
```

- The first argument in TryParse can be string variable, literal, or any method call that returns a string, e.g. `Console.ReadLine()`.
- The second argument is a variable of the same type as the `TryParse` operation

### Example 2

```
// literal to int type
int myInt;
bool result = int.TryParse("5", out myInt);

// string variable to double type
// the output variable can be declared simultaneously
string numStr = "3.25";
bool success = double.TryParse(numStr, out double myDoubleVar);

// calling TryParse with result of ReadLine() method call
// without intermediate variables
bool isNumeric = float.TryParse(Console.ReadLine(), out float myFloatVar);
```

### Example 3

```
Console.WriteLine("Please enter a positive number");
int n;
while ( ! int.TryParse(Console.ReadLine() , out n))
{
    Console.WriteLine("The input is not correct. Please enter a positive number.");
}
```

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

You can have counter, accumulator and sentinel values at the same time!

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


# While Loop With Complex Conditions
In the following example, a complex boolean expression is used in the _while_ statement. The program gets a value and tries to parse it as an integer. If the value can not be convertible to an integer, the program tries again, but not more than three times.

```
int c;
string message;
int count;
bool res;

Console.WriteLine("Please, enter an integer.");
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
        Console.WriteLine("Please, enter an integer.");
        message = Console.ReadLine();
        res = int.TryParse(message, out c);
    }
}
Console.WriteLine("The value is: " + c);
```
