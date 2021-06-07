# Decisions and Decision Structures

Everybody needs to take decisions all the time.
Consider an instructor teaching CSCI 1301 for instance, at the beginning of class they may

- Ask if there are questions. If a student have a question, then the instructor will answer it, and ask again ("Anything else?").
- When there are no more questions, they may move on to the next step, which is to introduce the class ("Today, we will be discussing Decisions and Decision Structures").
- If there is a quiz scheduled, then they will proceed to distribute it, otherwise they may start the class.
- etc.

This type of "branching" between multiple choices can be represented with an [activity diagram](https://en.wikipedia.org/wiki/Activity_diagram):

!["An Activity Diagram on Teaching a Class"](img/teaching)

In C#, we will represent

- repetitions (or "loops") ("As long as there are questions…") with the `while`, `do…while` and `for` keywords, 
- branchings ("If there is a quiz…") with the `if`, `if…else` and `switch` keywords.

Both structures need a datatype to express the result of a decision ("Is it _true_ that there are questions.", or "Is it _false_ that there is a quiz.") called booleans.
Those booleans can be obtained using conditions, that can be composed ("If we are a Monday, and if it is not past 10:10 am, and if mid-term is not passed, the class will also include a brief reminder about the upcoming first exam.") in different ways using three operators ("and", "or" and "not").


# Boolean Variables and Values

## Variables

We can store if something ("The user has reached the majority", "The switch is on", "The user is using windows", "This computer's clock indicate that we are in the afternoon", …) is true or false in a (boolean) *flag*, which is simply a variable of type boolean.
Note that `true` and `false` are the only possible two values for boolean variables: there is no third option!

We can declare, assign, initialize and display a boolean variable, a flag, as any other variable:

```
bool learning_how_to_program = true;
Console.WriteLine(learning_how_to_program);
```
## Operations on Boolean Values

The only two possible values are `true` and `false`, and we will study three operations on them:

#. "and" (`&&`, the conjunction),
#. "or" (`||`, the disjunction),
#. and "not" (`!`, the negation).

They have the expected meaning that 

#. the condition "A and B" is true if and only if A is true, and B is true,
#. "A or B" is false if and only if A is false, and B is false (that is, it takes only one to make their disjunction true),
#. "not A" is true if and only if A is false (that is, "not" "flips" the value it is applied to).

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

We could also have represented those tables in $2$-dimensions, as it is done [for instance on wikipedia](https://en.wikipedia.org/wiki/Truth_table#Logical_conjunction_(AND)) for the conjunction.

# Equality and Relational Operators

There is another way of obtaining boolean values, and it is to write expressions, or tests, that "evaluates", or transforms themselves, into a boolean value.
For instance, you can write an expression meaning "my variable `myAge` has the value 12" which will evaluates to `true` if the value of `myAge` is indeed 12, and to false otherwise.
_To ease your understanding_, we will write "expressions $\to$ `true`" to express that "expression" evaluates to `true` below, but this is _not_ part of C#'s syntax.

Operators are of two kinds:
- Equality operators, that can test if two values or variables have the same value and works on all datatypes,
- Relational operators, that can test if a value or variable have values that is greater or smaller (stricly or largely) than an other value or variable.

Relational operators will be primarily used for numerical values.

## Equality Operators

**Equality Operators** ||
:---: | :---: | :---: 
Mathematical Notation | C# Notation | Example 
$=$ | `==` | `3 == 4` $\to$ `false`
$\neq$  | `!=` | `3!=4` $\to$ `true`

We test numerical value for equality, as well as `string`, `char` and `bool`!

```
Console.WriteLine(3 == 4);
Console.WriteLine(myStringVar == "Train");
Console.WriteLine(myCharVar == 'b');
```
## Relational Operators

We can also test if a value or a variable is greater than another, using the following _relational_ operators.

**Relational Operators** | |
:---: | :---: | :---: 
Mathematical Notation | C# Notation | Example 
$>$ |  `>` | `3 > 4` $\to$ `false`
$<$ | `<` | `3 < 4` $\to$ `true`
$\geqslant$| `>=` | `3 >= 4` $\to$ `false`
$\leqslant$ | `<=` | `3 <= 4` $\to$ `true`

We can also compare `char`, but the order is a bit complex (you can find it explained, for instance, [in this stack overflow answer](https://stackoverflow.com/a/14967721/)).

The precedence is as follows:

`! (* / %) (+ -) (< > <= >=) (== !=) && ||`

- Operators with higher precedence are on the left and operators with lower precedence are on the right: for instance, in an expression like `2*3+4`, `2*3` will have higher precedence than `3+4`, and thus be evaluated first: `2*3+4` is to be read as `(2*3)+4 = 6 + 4 = 10` and _not_ as `2*(3+4) = 2*7 = 14`.
- Operators in parenthesis have equal precedence and are evaluated in the order they appear, from left to right: in `1-2+3`, `1-2` will be evaluated before `2+3`: `1-2+3` is to be read as `(1-2)+3 = -1 + 3 = 2` and _not_ as `1-(2+3) = 1-5 = 4`.
 
