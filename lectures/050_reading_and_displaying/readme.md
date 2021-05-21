# Reading, Displaying and Converting Values, Variables, and From the  User

## Escape Sequences

Code | Produce
--- | ---
`\n` | A [new line](https://en.wikipedia.org/wiki/Newline) (yes, that _is_ a character!)
`\t` | A [tab character](https://en.wikipedia.org/wiki/Tab_key#Tab_characters) (that is generally interpreted as 4 spaces)
`\"` | Double quotes (`"`)
`\\` | A single backslash (`\`)

The difference between `Write` and `WriteLine`.

## Reading a String From the User

We can ask _the user_ to give their name to the program while it is running as RunTime input. 
We can use a statement like:

~~~~~~~{.cs}
string yourFirstName = Console.ReadLine();
~~~~~~~

to store the value entered by the user from the output window in the string variable labeled `yourFirstName`.


## Reading an Int From the User

### Converting a String into an Int

In the `int` class, there is a method called `Parse` that converts a `string` into an `int` if possible and "crashes" otherwise.

For instance, one can use:

```{.cs}
string test = "32";
int testConversion = int.Parse(test);
```

This converts _the `string`_ `"32"` into the integer 32 and stores it in the `testConversion` variable, so that the programmer may now treat it like a number (and perform operations on it).

Note that if the string does _not_ correspond to a number (e.g. `"Hi Mom!"`), then the program would … explode, as the conversion fails. It would simply stop and display an error message.

(In case you are curious, we can also convert an `int` into a string using the `ToString` method, as e.g. in `12.ToString()`.)

### Converting a User input into an int

We can simply combine the `Console.ReadLine()` instruction with the `int.Parse` method to read integers from the user:

```{.cs}
Console.WriteLine("Please enter the year.");
string answer = Console.ReadLine();
int currentYear = int.Parse(answer);
Console.WriteLine($"Next year we will be in {currentYear + 1}.");
```

We could shorten the previous program by "chaining" the methods:

```{.cs}
Console.WriteLine("Please enter the year.");
int currentYear = int.Parse(Console.ReadLine());
Console.WriteLine($"Next year we will be in {currentYear + 1}.");
```

Or even, if every line counts and we don't need to access the current year later on in the program:

```{.cs}
Console.WriteLine("Please enter the year.");
Console.WriteLine($"Next year we will be in {int.Parse(Console.ReadLine()) + 1}.");
```

But, of course, the more that happens on a single line, the more difficult it is to debug it properly.
 

## Format Specifiers

We can use interpolation to display more nicely numerical values.
There are four important format specifiers in C#.

Format specifier | Description
:--: | :---------: 
N or n | Formats the string with a thousands separator and a default of two decimal places.
E or e | Formats the number using scientific notation with a default of six decimal places.
C or c | Formats the string as currency. Displays an appropriate currency symbol ($ in the U.S.) next to the number. Separates digits with an appropriate separator character (comma in the U.S.) and sets the number of decimal places to two by default.
P or p | Print percentage

<!--
cf. Fig. 4.13
-->

~~~~~~~{.cs}
        Console.WriteLine(
              "\n" + $"{1234.567:N}" // 1,234.57
            + "\n" + $"{1234.5:N}"   // 1,234.50
            + "\n" + $"{1234.567:E}" // 1.234567E+003
            + "\n" + $"{1234.567:C}" // $1,234.57
            + "\n" + $"{1234.5:C}"   // $1,234.50
            + "\n" + $"{.5:P}"       // 50.00%
    );
~~~~~~~
