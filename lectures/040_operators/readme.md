# Operators

<!-- 

from list of topics, this should cover the following:

## Operators

- Binary arithmetic operators: `*`, `/`, `%`, `+`, `-`
- Unary arithmetic operators: `++`, `--`
- The difference between postfix and infix notation for unary operators :question:
- Comparison operators: `!=`, `==`, `>`, `>=`, `<`, `<=`
- Boolean logical operators: `&&`, `||`, `!`
- Precedence and "validity" of some expressions (typically, `! 2 < 3` is not a valid expression) 
- Combined assignment operators: `+=`, `*=`, `-=`, `/=`, `%=`

-->

# Operations on `int` (reminder)

Suppose we are given an `int` variable, `myVar`, with which we can perform the following operations:

Operation | Arithmetic Operator | Algebraic Expression |  Expression
--- | --- | --- | ---
Addition | $+$ | $x + 7$ | `myVar + 7`
Substraction | $-$ | $x - 7$ | `myVar - 7`
Multiplication | $*$ | $x \times 7$ | `myVar * 7`
Division | $/$ | $x / 7$,  $x \div 7$ | `myVar / 7`
Remainder (a.k.a.\ modulo) | $\%$ | $x \bmod 7$ | `myVar % 7`

For the remainder, courtesy of [wikipedia](https://en.wikipedia.org/wiki/Modulo_operation):

> For example, the expression "5 mod 2" would evaluate to 1, because 5 divided by 2 has a quotient of 2 and a remainder of 1, while "9 mod 3" would evaluate to 0, because the division of 9 by 3 has a quotient of 3 and a remainder of 0; there is nothing to subtract from 9 after multiplying 3 times 3. 

We use `=` to assing a value to a variable, but we can also use `=` followed by one of the previous operator to obtain an "augmented assignment operators" or "compound assignment operators":

~~~~~~~{.cs}
int a = 3, b, c; // Multiple declarations with an assignment.
b = 34 + a;
a = a - 1; // Self-assignment
a -= 1; // Shorthand, this is the same as a = a - 1;
~~~~~~~



# Implicit and Explicit Conversions Between Numeric Datatypes

As we saw [in the cheatsheet](https://spots.augusta.edu/caubert/teaching/2020/fall/csci1301/weekly/03/datatypes/index.html#compatibility), we can store e.g. a `float` literal inside a `double` variable (that's an automatic, or _implicit_ conversion), but we can not store a `double` literal inside a `float` variable.
C# refuses to do this "automatically", because we risk to lose information, but we can "force" it to perform this operation _explicitly_ using _cast operators_.


~~~~~~~{.cs}
float b = 4.7F;
int a = (int) b; // A cast operator is simply the name of the datatype between parenthesis. Here, we convert a float into an int.
~~~~~~~

Using casting allows us to go "against" those safe-guards, and can lead to the following complications:

- Storing an imprecise number using a precise datatype (e.g. from `double` to `decimal`).
- Truncating a floating-point number as a "truncated" number (e.g. from `double` to `int`).
- Rounding a precise number to fit a less precise datatype (e.g. from `decimal` to `double`).

!["Implicit and Explicit Conversion Between Datatypes"](/img/conversions.svg)


Note that _you can_, actually, store a `float` literal inside a `double`, but that you _can not_ store a `double` or a `float` literal inside a `decimal`.



# Operations on other numerical datatypes

Actually, there is a `+` operator for `float`, `double`, and `decimal`, and the same goes for `-`, `*`, and `%`

Casting can be useful when one wants to divide integers:

~~~~~~~{.cs}
int pie = 21;
int person = 5;
~~~~~~~

Operation | Result | Type of the multiplication used
--- | --- | --- 
 `pie / person` | 4 | `int`
 `(float)pie / person` | 4.2 |  `float`
`pie / (float)person`  | 4.2 | `float`
`(float)(pie / person)` |  4 | `int` 

Note that the integer division simply "truncates", and does not round up (that is, `19 / 10` would return 1).

Also note that in "4.2", "4" is the integer, "." (period) is the decimal separator, not to be mixed with "," (comma), the thousands separator.

When performing an operation involving different datatypes, the result type of the operation is the "most precise" datatype if it is allowed (i.e., an implicit conversion can take place), otherwise an error is returned.
Refer to [the "Result Type of Operations" chart from the cheatsheet](../datatypes_in_csharp.html#result-type-of-operations) for more detail.

# Increment and Decrement Operators

Increment and decrement operators are used to add or remove one from variables holding numerical values.


| | Increment | Decrement |
| --- | --- | --- | 
| Postfix (after) | a++ | a-- |
| Infix (before) | ++a | --a |

Postfix operators are always executed before any other operators (cf. <https://docs.microsoft.com/en-us/dotnet/csharp/language-reference/operators/arithmetic-operators#operator-precedence-and-associativity>), but the way those fours operators interact with other assignments is subtle.
Generally, postfix operators are executed _after_ the rest of the statement is executed, while prefix operators are executed _before_ the rest of the statement:

~~~~~~~{.cs .numberLines}
int a = 0;
Console.WriteLine(a--); // The value of a (0) is displayed, then decremented (-1).
Console.WriteLine(a);   // The value of a is (-1) displayed
Console.WriteLine(--a); // The value of a (-1) is decremented (-2) then displayed.

int b = a++;    // The value of a (-2) is assigned to b then incremented (-1).
~~~~~~~


# Operations on Strings

We saw that we could perform interpolation on strings to "fetch" the value of a variable and "insert" it into a string; however, we can use other operations as well.
For instance, we can use the `+` sign for strings as well, to perform an operation called "concatenation":

~~~~~~~{.cs}
string name = "Bob";
string greetings = $"Welcome, {name}!\nI'll be your guide."; // interpolation

string text = "Hi there" + ", my name is Marie."; // Concatenation. This "join" the strings together.

Console.WriteLine(text); // We can write directly the name of the variable, instead of using interpolation, if we wish.
~~~~~~~

Note that the `+` sign denotes different operations depending on the type of the operands (`string` or `int`, for instance).

