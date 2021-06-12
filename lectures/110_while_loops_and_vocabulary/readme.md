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

### Example 1

```
int number = 1;
while (number <=5)
{
    Console.WriteLine(number);
    number++;
}
```
- Note, one or more statements enclosed in left and right braces is called a code block.

### Example 2

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

- Note, if `<boolean expression>` is always true, then the program loops until the program fails or a statement in the loop body ends the loop!

## `break` statement
This command ends a loop immediately. 

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
This command ends the current iteration of a loop. 

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

### Example 2
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

 
# More Input Validation, Using TryParse

The `TryParse` method is a complex method that will allow us to parse strings, and to "extract" a number out of them if they contain one, or to be given a way to recover if they don't.

```
Console.WriteLine("Please, enter an integer.");
string message = Console.ReadLine();
int a;
bool res = int.TryParse(message, out a);
if (res)
    {
        Console.WriteLine($"The value entered was an integer: {a}.");
    }
else
    {
        Console.WriteLine("The value entered was not an integer, so 0 is assigned to a.");
    }
Console.WriteLine(a);
```

As you can see, `int.TryParse` takes two arguments, a string and a variable name (prefixed by the "magic" novel keyword `out`) and returns a boolean.
You will get a chance to experiment with this code in lab.

# While Loop With Complex Conditions

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
