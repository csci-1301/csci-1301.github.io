# `--` and `++` Operators

In programming, there are many cases that we either need to increment or decrement the value of one variable by one unit. C# provides special optimized operators for this purpose.

- The `++` operator takes an operand and adds one to the value of the operand. Hence, the operand must be a variable.
- `x++;` or `++x;` are similar to  `x = x + 1;`
- Similarly, the `--` operator takes an operand and decrements the value of the operand by one. Hence, the operand must be a variable.
- `x--;` or `--x;` are similar to  `x = x - 1;`
- Both of the `--` and `++` operators can be written before or after an operand.
- If they are put before the operand, they act on the operand, and then the result will be returned. See the bellow example:
```
int x = 10;
int y = x++;  \\ First y = 10; then x = x + 1
```
- If they are put after the operand, the current value of the operand will be returned, and then the current value of the operand will be changed. See the bellow example:
```
int x = 10;
int y = ++x;  \\ First x = x + 1, so x = 11; then y = x, So y = 11
```


# Loops

One of the significant reasons humans use computers is to execute a specific process without mistakes repeatedly. Therefore, each programming language provides some statements that iterate a block of code. In this course, you will learn `while`, `do-while`, `for`, and `foreach` statements that are used for implementing loops. 

## `while` Statement

The `while` statement executes a block of statements while a specified _boolean expression_ evaluates to true at the begining of each iteration.

### Formal Syntax

```
while (<boolean expression>)
    <code block> or <a statement>
```

- In the above code, `<code block>` or `<a statement>` is called the loop body.
<!-- This notion should have been introduced earlier, and I believe it has been. -->
<!-- Since this is the first time that we introduce loops, I assume we have not introduced the loop body. But, if we have, remove the code -->

### Example 1
The underneath example prints numbers 1 to 5 in the console. Note that the loop bode is a code block consist of two statements.
```
int number = 1;
while (number <=5)
{
    Console.WriteLine(number);
    number++;
}
```
- Remember, one or more statements enclosed in left and right braces is called a code block.


### Example 2
The underneath example does the same as Example 1, but its body loop consists of only one statement. Hence, there is no need for braces).

```
int number = 1;
while (number <=5)
    Console.WriteLine(number++);
```



### Example 3

```
int number = 1;
while (true)
    Console.WriteLine(number++);
```

- Note, if `<boolean expression>` is always true, then the program loops until the program fails or an special statement(See the next section) in the loop body ends the loop!
- A program may fail for sevral reasons like
    - Power outage
    - Hardware malfunctinong
    - Operating System issue.
    
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

This command ends the current iteration of a loop and skips the remaming statements in the body of the loop.

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

### Five Ways a `while` Loop Can Go Wrong

It is easy to write _wrong_ `loop` statements. 
Let us review some of the "classic" blunders.

#### 1- Failing to update the variable occurring in the condition


```
int number = 0;
while (number <=5)
{
    Console.WriteLine(number);
}
```

Number isn't changed!

#### 2- Updating the "wrong" value

```
int number1, number = 0;
while (number <=5)
{
    Console.WriteLine(number);
    number1++;
}
```

#### 3- Having an empty body

```
int number = 0; 
while (number <=5); // Note the semi-colon here!
{
    Console.WriteLine(number);
    number++;
}
```

#### 4- Missing braces

```
int number = 0;
while (number <=5)
    Console.WriteLine(number);
    number++;
```

#### 5- Going in the wrong direction

```
int number = 5;
while (number >=0)
{
    Console.WriteLine(number);
    number++;
}
```

The variable `number` should be decremented, not incremented.

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
    - If the first argument is convertable to the desired data type, the method returns _true_ and saves the string into the variable name as the desired datatype.     - If the first argument is _not_ convertable to the desired datatype, it returns _false_ and 0 is saved into the variable name.
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

: The exit condition test if a variable has (or is different from) a specific value.

User controlled loop

: The number of iterations depends on the user.

Count controlled loop

: The number of iterations depends on a counter.

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
