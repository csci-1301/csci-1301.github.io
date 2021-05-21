# Datatypes

<!-- 

from list of topics, this should cover the following:

## Variable

- Datatype (numerical, boolean, string, character) -- including a mention of reference datatypes
- Declaration, assignment, initialization
- Naming variables correctly
- The absence of default value after declaration (un-assigned variables)

## Numerical Values

- Integers (`int`, `long`) – range and size, signature (`uint`)
- Floating Point (`float`, `double`, and `decimal`)  – range, size and precision, 
- Type casting (e.g. from `int` to `double`, and legal operations between different datatypes) and casting operator (e.g. `(int)`).
- Overflow and underflow :lock:

## Booleans

- Possible values (`true`, `false`)
- Usage
- That boolean variables are called "switches"

## Strings

- `ReadLine` method
- Concatenation (`+`)
- Interpolation
- Additional methods: `ToLower`, `ToUpper`, `Contains` :question:

### Displaying Strings on the Screen

- [Format specifiers](https://docs.microsoft.com/en-us/dotnet/standard/base-types/standard-numeric-format-strings) for numbers:
    – Currency (`C`), 
    - Fixed-point (`F`) or Number (`N`)
    - Percent (`P`) :question:
    - Exponential (`E`) :question:

- The `String.Format` method

## Characters 

- Possible values and the existence of binary, oct, dec and hex representation (cf. for instance [wikipedia](https://en.wikipedia.org/wiki/ASCII#Printable_characters))
- Escape character and sequences: `\n`, `\t`, `\\`
- Conversion between glyph and decimal value.
- Various methods: `ToLower`, `ToUpper`, `Contains`, `StartsWith`, `EndsWith` :question:

-->

## Datatypes Nomenclature

- Value types
    - Numeric    
        - Signed integer (`sbyte`, `short`, _`int`_, `long`)
        - Unsigned integer (`byte`, `ushort`, `uint`, `ulong`)
        - Real number (`float`, _`double`_, `decimal`)
        
    - Logical (_`bool`_)
    - Character (_`char`_)
    
- Reference types
    - String (_`string`_)
    - Object (`object`)

*(In _italics_, the one we will mainly be using.)*

Integers are "whole" numbers (ℤ = \{…, -1, 0, 1, 2, 3, …\}), floating point numbers are real numbers (ℝ), strings are "text messages", …

Please refer to the ["Datatypes in C#" cheatsheet](https://csci-1301.github.io/datatypes_in_csharp.html) for more information about datatypes.

## String and Int Variables

Literals are fixed values ("Hi Mom", $40$, $1.2404$,  …) in the source code.


#### My First Variables

<!-- TODO: title this code block -->

```
!include code/my_first_variables.cs
```

A variable has a *name* (which must be an identifier), a *type*, a *size*, and a *value*.

Variable Name | Variable Type | Variable Size | Variable Value
--- | --- | --- | --- |
`myAge` | `int` | 32 bit | `40` 
`myName` | `string` | Variable | `"Clément"`


## Variable Initialization

You can declare and assign a variable in one statement using what is called an "initialization statement".


#### Initialization

<!-- TODO: title this code block -->

```
string myMessage = "Hey Mom";
int myValue = 12;
```

There is now one additional rule when it comes to chosing a valid identifier for your variable name: you can not take an identifier that was already used.
That is, you can have only one variable named `myMessage`: if you want to re-assign a variable, you can not use an initialization again (that would re-declare the variable), you need to use an assignment statement again.

## Remarks

- The value can change (hence the name!) if you re-assign it. The previously stored value is simply wiped out, and lost.
- You can store one variable's value into another, but that value in the other variable won't change when the original variable's value changes:

    ```{.cs}
    int a = 12;
    int b = a; // b's value is 12
    a = 0; // a's value changed to 0, but b's value is still 12.
    ```

- We can perform basic math operations with numeric datatypes:  `+` (sum), `*` (multiplication), `-` (substraction) but also the modulo operation (`%`), which corresponds to the remainder.
More details will be given in lab #3, in homework #2, and during lecture #4.

- There is a difference between

    ```
    int sum = num * 2; // The value of sum is num's value times two
    Console.WriteLine($"{sum}"); // The value of sum is displayed.
    ```

    and

    ```
    Console.WriteLine($"{num * 2}"); // The value of num times two is displayed, but the value of num is still the same.
    ```

- You can combine multiple declarations, initializations, and even mix both in one statement:

    ```
    int a=0, b, c;  // a, b, c are declared as three int variables, and a's value is set to 0.
    ```

# Named Constant

A constant is a variable whose value cannot change.

~~~~~~~{.cs}
const int MONTHS = 12;
const double AVOGADRO = 6.0220e23; // Avogadro Number. Units  1/mol 
const double PI = 3.14159265358979;
const double MILES_TO_KM = 1.60934;
~~~~~~~

- Value at to be fixed at declaration (= can only be initialized), and cannot change.
- Name is often ALL CAPS.

For instance, $π$ is defined in the `Math` class and can be accessed as follows:

~~~~~~~{.cs}
Console.WriteLine(Math.PI);
~~~~~~~

<!--

~~~~~~~{.cs}
public const double PI = 3.14159265358979;
~~~~~~~

-->
