# Boolean and Conditions

A condition is either true or false.
We can store if something is true or false in a (boolean) *flag*, which is simply a variable of type boolean.

We can declare, assign, initialize and display it as any other variable:

~~~~~~~{.cs .numberLines}
bool flag = true;
Console.WriteLine(true);
~~~~~~~

But the only two possible values are `true` and `false`, and we will study three operations on them: "and" (`&&`, the conjonction), "or" (`||`, the disjunction) and "not" (`!`, the negation).
They have the expected meaning that the condition "A and B" is true if and only if A is true, and B is true.
Similarly, "A or B" is false if and only if A is false, and B is false (that is, it takes only one to make their disjunction true).

We present this behavior with _truth tables_, as follows:

|
--- | ---
`true && true` | `true`
`true && false` | `false`
`false && true` | `false`
`false && false` | `false`

|
--- | ---
`true || true` | `true`
`true || false` | `true`
`false || true` | `true`
`false || false` | `false`

|
--- | ---
`!true` | `false`
`!false` | `true`

We could also have represented those tables in $2$-dimensions, and will do so in lab.


# Equality and Relational Operators

**Equality Operators** ||
:---: | :---: | :---: 
Mathematical Notation | C# Notation | Example 
$=$ | `==` | `3 == 4` $\to$ `false`
$\neq$  | `!=` | `3!=4` $\to$ `true`

We test numerical value for equality, as well as `string`, `char` and `bool`!

~~~~~~~{.cs .numberLines}
Console.WriteLine(3 == 4);
Console.WriteLine(myStringVar == "Train");
Console.WriteLine(myCharVar == 'b');
~~~~~~~

We can also test if a value is greater than another, using the following _relational_ operators.

**Relational Operators** | |
:---: | :---: | :---: 
Mathematical Notation | C# Notation | Example 
$>$ |  `>` | `3 > 4` $\to$ `false`
$<$ | `<` | `3 < 4` $\to$ `true`
$\geqslant$| `>=` | `3 >= 4` $\to$ `false`
$\leqslant$ | `<=` | `3 <= 4` $\to$ `true`

We can also compare `char`, but the order is a bit complex (you can find it, for instance, at <https://stackoverflow.com/a/14967721/>).

The precedence, that we will study in lab, is as follows:

`! (* / %) (+ -) (< > <= >=) (== !=) && ||`
 
