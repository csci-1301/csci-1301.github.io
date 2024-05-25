---
title: Operators
---

# Arithmetic Operators

Variables can be used to do math. All the usual arithmetic operations are available in C#:

| Operation                  | C# Operator | C# Expression |
| ----------                 | ----------  | ----------    |
| Addition                   | `+`         |  `myVar + 7`   |
| Subtraction                | `-`         |  `myVar - 7`   |
| Multiplication             | `*`         |  `myVar * 7`   |
| Division                   | `/`         |  `myVar / 7`   |
| Remainder (a.k.a.\ modulo) | `%`         |  `myVar % 7`   |

Note: the "remainder" or "modulo" operator represents the remainder after doing integer division between its two operands. \
For example, 44 % 7 = 2 because 44/7 = 6 when rounded down, then do 7*6 to get 42 and 44 - 42 = 2.

### Arithmetic and variables

- The result of an arithmetic expression (like those shown in the table) is a numeric value
    - For example, the C# expression `3 * 4` has the value `12`, which is `int` data
- A numeric value can be assigned to a variable of the same type, just like a literal: `int myVar = 3 * 4;` initializes the variable `myVar` to contain the value `12`
- A numeric-type variable can be used in an arithmetic expression
- When a variable is used in an arithmetic expression, its current value is read, and the math is done on that value
- Example:

    ```
    int a = 4;
    int b = a + 5;
    a = b * 2;
    ```

    - To execute the second line of the code, the computer will first evaluate the expression on the right side of the `=` sign. It reads the value of the variable `a`, which is 4, and then computes the result of `4 + 5`, which is 9. Then, it assigns this value to the variable `b` (remember assignment goes right to left).
    - To execute the third line of code, the computer first evaluates the expression on the right side of the `=` sign, which means reading the value of `b` to use in the arithmetic operation. `b` contains 9, so the expression is `9 * 2`, which evaluates to 18. Then it assigns the value 18 to the variable `a`, which now contains 18 instead of 4.
- A variable can appear on both sides of the `=` sign, like this:

    ```
    int myVar = 4;
    myVar = myVar * 2;
    ```

    This looks like a paradox because `myVar` is assigned to itself, but it has a clear meaning because assignment is evaluated right to left. When executing the second line of code, the computer evaluates the right side of the `=` before doing the assignment. So it first reads the current ("old") value of `myVar`, which is 4, and computes `4 * 2` to get the value 8. Then, it assigns the new value to `myVar`, overwriting its old value.

### Compound assignment operators

- The pattern of "compute an expression with a variable, then assign the result to that variable" is common, so there are shortcuts for doing it
- The **compound assignment operators** change the value of a variable by adding, subtracting, etc. from its current value, equivalent to an assignment statement that has the value on both sides:

| Statement | Equivalent   |
| --------- | ---------    |
| `x += 2;` | `x = x + 2;` |
| `x -= 2;` | `x = x - 2;` |
| `x *= 2;` | `x = x * 2;` |
| `x /= 2;` | `x = x / 2;` |
| `x %= 2;` | `x = x % 2;` |

# Implicit and Explicit Conversions Between Datatypes

### Assignments from different types

- The "proper" way to initialize a variable is to assign it a literal of the same type:

    ```
    int myAge = 29;
    double myHeight = 1.77;
    float radius = 2.3f;
    ```

    Note that `1.77` is a `double` literal, while `2.3f` is a `float` literal

- If the literal is not the same type as the variable, you will sometimes get an error -- for example, `float radius = 2.3` will result in a compile error -- but sometimes, it appears to work fine: for example `float radius = 2;` compiles and executes without error even though 2 is an `int` value.

- In fact, the value being assigned to the variable **must** be the same type as the variable, but some types can be **implicitly converted** to others

### Implicit conversions

- Implicit conversion allows variables to be assigned from literals of the "wrong" type: the literal value is first implicitly converted to the right type

    - In the statement `float radius = 2;`, the `int` value 2 is implicitly converted to an equivalent `float` value, `2.0f`. Then the computer assigns `2.0f` to the `radius` variable.

- Implicit conversion also allows variables to be assigned from other variables that have a different type:

    ```
    int length = 2;
    float radius = length;
    ```

When the computer executes the second line of this code, it reads the variable `length` to get an `int` value 2. It then implicitly converts that value to `2.0f`, and then assigns `2.0f` to the `float`-type variable `radius`.

- Implicit conversion only works between *some* data types: a value will only be implicitly converted if it is "safe" to do so without losing data

- Summary of possible implicit conversions:

    | Type     | Possible Implicit Conversions                               |
    | -------- | --------------------------                                  |
    | `short`  | `int`, `long`, `float`, `double`, `decimal`                 |
    | `int`    | `long`, `float`, `double`, `decimal`                        |
    | `long`   | `float`, `double`, `decimal`                                |
    | `ushort` | `uint`, `int`, `ulong`, `long`, `decimal`, `float`, `double`|
    | `uint`   | `ulong`, `long`, `decimal`, `float`, `double`               |
    | `ulong`  | `decimal`, `float`, `double`                                |
    | `float`  | `double`                                                    |

- In general, a data type can only be implicitly converted to one with a *larger range* of possible values

- Since an `int` can store any integer between $-2^{31}$ and $2^{31}-1$, but a `float` can store any integer between $-3.4 \times 10^{38}$ and $3.4 \times 10^{38}$ (as well as fractional values), it is always safe to store an `int` value in a `float`

- You *cannot* implicitly convert a `float` to an `int` because an `int` stores fewer values than a `float` -- it cannot store fractions -- so converting a `float` to an `int` will **lose data**

- Note that all integer data types can be implicitly converted to `float` or `double`

- Each integer data type can be implicitly converted to a larger integer type: `short` $\rightarrow$ `int` $\rightarrow$ `long`

- Unsigned integer data types can be implicitly converted to a *larger* signed integer type, but not the *same* signed integer type: `uint` $\rightarrow$ `long`, but **not** `uint` $\rightarrow$ `int`

    - This is because of the "sign bit": a `uint` can store larger values than an `int` because it does not use a sign bit, so converting a large `uint` to an `int` might lose data

### Explicit conversions

- Any conversion that is "unsafe" because it might lose data will not happen automatically: you get a compile error if you assign a `double` variable to a `float` variable

- If you want to do an unsafe conversion anyway, you must perform an **explicit conversion** with the **cast operator**

- Cast operator syntax: `([type name]) [variable or value]` -- the cast is "right-associative", so it applies to the variable to the right of the type name

- Example: `(float) 2.8` or `(int) radius`

- Explicit conversions are often used when you (the programmer) know the conversion is actually "safe" -- data will not actually be lost

    - For example, in this code, we know that 2.886 is within the range of a `float`, so it is safe to convert it to a `float`:

        ```
        float radius = (float) 2.886;
        ```

        The variable `radius` will be assigned the value `2.886f`.

    - For example, in this code, we know that 2.0 is safe to convert to an `int` because it has no fractional part:

        ```
        double length = 2.0;
        int height = (int) length;
        ```

        The variable `height` will be assigned the value `2`.

- Explicit conversions only work if there exists code to perform the conversion, usually in the standard library. The cast operator isn't "magic" -- it just calls a method that is defined to convert one type of data (e.g. `double`) to another (e.g. `int`).
    - All the C# numeric types have explicit conversions to each other defined
    - `string` does not have explicit conversions defined, so you cannot write `int myAge = (int) "29";`

- If the explicit conversion is truly unsafe (will lose data), data is lost in a specific way

    - Casting from floating-point (e.g. `double`) types to integer types: fractional part of number is *truncated* (ignored/dropped)

    - In `int length = (int) 2.886;`, the value 2.886 is truncated to 2 by the cast to `int`, so the variable `length` gets the value 2.

    - Casting from more-precise to less-precise floating point type: number is *rounded* to nearest value that fits in less-precise type:

        ```
        decimal myDecimal = 123456789.999999918m;
        double myDouble = (double) myDecimal;
        float myFloat = (float) myDouble;
        ```

        In this code, `myDouble` gets the value 123456789.99999993, while `myFloat` gets the value `123456790.0f`, as the original `decimal` value is rounded to fit types with fewer significant figures of precision.

    - Casting from a larger integer to a smaller integer: the most significant *bits* are truncated -- remember that numbers are stored in binary format

    - This can cause weird results, since the least-significant *bits* of a number in binary do not correspond to the least significant *digits* of the equivalent base-10 number

    - Casting from another floating point type to `decimal`: Either value is stored precisely (no rounding), or *program crashes* with `System.OverflowException` if value is larger than `decimal`'s maximum value:

        ```
        decimal fromSmall = (decimal) 42.76875;
        double bigDouble = 2.65e35;
        decimal fromBig = (decimal) bigDouble;
        ```

        In this code, `fromSmall` will get the value `42.76875m`, but the program will crash when attempting to cast `bigDouble` to a `decimal` because $2.65 \times 10^{35}$ is larger than `decimal`'s maximum value of $7.9 \times 10^{28}$

    - `decimal` is more precise than the other two floating-point types (thus does not need to round), but has a smaller range (only $10^{28}$, vs. $10^{308}$)

Summary of implicit and explicit conversions for the numeric datatypes:

!["Implicit and Explicit Conversion Between Datatypes"](img/conversions)

Refer to [the "Result Type of Operations" chart from the cheatsheet](../datatypes_in_csharp.html#result-type-of-operations) for more detail.

# Arithmetic on Mixed Data Types

- The math operators (`+`, `-`, `*`, `/`) are defined separately for each data type: There is an `int` version of `+` that adds `int`s, a `float` version of `+` that adds `float`s, etc.
- Each operator expects to get two values of the same type on each side, and produces a result of that same type. For example, `2.25 + 3.25` uses the `double` version of `+`, which adds the two `double` values to produce a `double`-type result, 5.5.
- Most operators have the same effect regardless of their type, except for `/`
- The `int`/`short`/`long` version of `/` does **integer division**, which returns only the quotient and drops the remainder: In the statement `int result = 21 / 5;`, the variable `result` gets the value 4, because $21 \div 5$ is 4 with a remainder of 1. If you want the fractional part, you need to use the floating-point version (for `float`, `double`, and `decimal`): `double fracDiv = 21.0 / 5.0;` will initialize `fracDiv` to 4.2.

### Implicit conversions in math

- If the two operands/arguments to a math operator are not the same type, they must become the same type -- one must be converted
- C# will first try implicit conversion to "promote" a less-precise or smaller value to a more precise, larger type
- Example: with the expression `double fracDiv = 21 / 2.4;`
    - Operand types are `int` and `double`
    - `int` is smaller/less-precise than `double`
    - 21 gets implicitly converted to 21.0, a `double` value
    - Now the operands are both `double` type, so the `double` version of the `/` operator gets executed
    - The result is 8.75, a `double` value, which gets assigned to the variable `fracDiv`
- Implicit conversion also happens in assignment statements, which happen *after* the math expression is computed
- Example: with the expression `double fraction = 21 / 5;`
    - Operand types are `int` and `int`
    - Since they match, the `int` version of `/`  gets executed
    - The result is 4, an `int` value
    - Now this value is assigned to the variable `fraction`, which is `double` type
    - The `int` value is implicitly converted to the `double` value 4.0, and `fraction` is assigned the value 4.0

### Explicit conversions in math

- If the operands are `int` type, the `int` version of `/` will get called, even if you assign the result to a `double`

- You can "force" floating-point division by explicitly converting one operand to `double` or `float`

- Example:

    ```
    int numCookies = 21;
    int numPeople = 6;
    double share = (double) numCookies / numPeople;
    ```

    Without the cast, `share` would get the value 3.0 because `numCookies` and `numPeople` are both `int` type (just like the `fraction` example above). With the cast, `numCookies` is converted to the value 21.0 (a `double`), which means the operands are no longer the same type. This will cause `numPeople` to be implicitly converted to `double` in order to make them match, and the `double` version of `/` will get called to evaluate `21.0 / 6.0`. The result is 3.5, so `share` gets assigned 3.5.

- You might also *need* a cast to ensure the operands are the same type, if implicit conversion does not work

- Example:

    ```
    decimal price = 3.89;
    double shares = 47.75;
    decimal total = price * (decimal) shares;
    ```

    In this code, `double` cannot be implicitly converted to `decimal`, and `decimal` cannot be implicitly converted to `double`, so the multiplication `price * shares` would produce a compile error. We need an explicit cast to `decimal` to make both operands the same type (`decimal`).

# Order of Operations

- Math operations in C# follow PEMDAS from math class: Parentheses, Exponents, Multiplication, Division, Addition, Subtraction
    - Multiplication/division are evaluated together, as are addition/subtraction
    - Expressions are evaluated left-to-right
    - Example: `int x = 4 = 10 * 3 - 21 / 2 - (3 + 3);`
        - Parentheses: `(3 + 3)` is evaluated, returns 6
        - Multiplication/Division: `10 * 3` is evaluated to produce 30, then `21 / 2` is evaluated to produce 10 (left-to-right)
        - Addition/Subtraction: 4 + 30 - 10 - 6 is evaluated, result is 18
- Cast operator is higher priority than all binary operators
    - Example: `double share = (double) numCookies / numPeople;`
        - Cast operator is evaluated first, converts `numCookies` to a `double`
        - Division is evaluated next, but operand types do not match
        - `numPeople` is implicitly converted to `double` to make operand types match
        - Then division is evaluated, result is 21.0 / 6.0 = 3.5
- Parentheses always increase priority, even with casts
    - An expression in parentheses gets evaluated before the cast "next to" it

    - Example:

        ```
        int a = 5, b = 4;
        double result = (double) (a / b);
        ```

      The expression in parentheses gets evaluated first, then the result has the `(double)` cast applied to it. That means `a / b` is evaluated to produce 1, since `a` and `b` are both `int` type, and then that result is cast to a `double`, producing 1.0.
