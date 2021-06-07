# Decisions and Decision Structures

Decisions are a constant occurence in daily life.
For instance consider an instructor teaching CSCI 1301. At the beginning of class the instructor may

- Ask if there are questions. If a student has a question, then the instructor will answer it, and ask again ("Anything else?").
- When there are no more questions, the instructor will move on to the next step.
- If there is a quiz scheduled, the next step will be distributing the quiz.
- If there is no quiz scheduled or the quiz is complete (and collected), the instructor may introduce the lecture topic ("Today, we will be discussing Decisions and Decision Structures") and start the class.
- etc.

This type of "branching" between multiple choices can be represented with an [activity diagram](https://en.wikipedia.org/wiki/Activity_diagram):

!["An Activity Diagram on Teaching a Class"](img/teaching)

In C#, we will express

- repetitions (or "loops") ("As long as there are questions…") with the `while`, `do…while` and `for` keywords, 
- branchings ("If there is a quiz…") with the `if`, `if…else` and `switch` keywords.

Both structures need a datatype to express the result of a decision ("Is it _true_ that there are questions.", or "Is it _false_ that there is a quiz.") called booleans.
Boolean values can be set with conditions, that can be composed in different ways using three operators ("and", "or" and "not").  For example, "If today is a Monday, and it is not past 10:10 am, and if mid-term has not been given yet, the class will also include a brief reminder about the upcoming first exam."


# Boolean Variables and Values

## Variables

We can store if something is true or false ("The user has reached the age of majority", "The switch is on", "The user is using Windows", "This computer's clock indicates that we are in the afternoon", …) in a (boolean) *flag*, which is simply a variable of type boolean.
Note that `true` and `false` are the only possible two values for boolean variables: there is no third option!

We can declare, assign, initialize and display a boolean variable (flag) as with any other variable:

```
bool learning_how_to_program = true;
Console.WriteLine(learning_how_to_program);
```
## Operations on Boolean Values

Despite having only two possible values in `true` and `false`, we can use the following three operations to construct more complex booleans:

#. "and" (`&&`, conjunction),
#. "or" (`||`, disjunction),
#. and "not" (`!`, negation).

Each has the precise meaning described here: 

#. the condition "A and B" is true if and only if A is true, and B is true,
#. "A or B" is false if and only if A is false, and B is false (that is, it takes only one to make their disjunction true),
#. "not A" is true if and only if A is false (that is, "not" "flips" the value it is applied to).

The expected results of these operations can be displayed in _truth tables_, as follows:

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

These tables can also be written in $2$-dimensions, as can be seen for [conjunction on wikipedia](https://en.wikipedia.org/wiki/Truth_table#Logical_conjunction_(AND)).

# Equality and Relational Operators

Boolean values can also be set through expressions, or tests, that "evaluate" a condition or series of conditions as `true` or `false`.
For instance, you can write an expression meaning "variable `myAge` has the value 12" which will evaluate to `true` if the value of `myAge` is indeed 12, and to `false` otherwise.
_To ease your understanding_, we will write "expression $\to$ `true`" to indicate that "expression" evaluates to `true` below, but this is _not_ part of C#'s syntax.

Here we use two kinds of operators:
- Equality operators test if two values (literal or variable) are the same. This works on all datatypes.
- Relational operators test if a value (literal or variable) is greater or smaller (strictly or largely) than an other value or variable.

Relational operators will be primarily used for numerical values.

## Equality Operators

**Equality Operators** ||
:---: | :---: | :---: 
Mathematical Notation | C# Notation | Example 
$=$ | `==` | `3 == 4` $\to$ `false`
$\neq$  | `!=` | `3!=4` $\to$ `true`

We can test numerical values for equality, as well as `string`, `char` and `bool`!

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

Relational operators can also compare `char`, but the order is a bit complex (you can find it explained, for instance, [in this stack overflow answer](https://stackoverflow.com/a/14967721/)).

All of the operators explained in this lecture have an order (or precedence) in which they are evaluated. The precedence is as follows:

`! (* / %) (+ -) (< > <= >=) (== !=) && ||`

- Operators with higher precedence are on the left and operators with lower precedence are on the right: for instance, in an expression like `2*3+4`, `2*3` will have higher precedence than `3+4`, and thus be evaluated first: `2*3+4` is to be read as `(2*3)+4 = 6 + 4 = 10` and _not_ as `2*(3+4) = 2*7 = 14`.
- Operators in parenthesis have equal precedence and are evaluated in the order they appear, from left to right: in `1-2+3`, `1-2` will be evaluated before `2+3`: `1-2+3` is to be read as `(1-2)+3 = -1 + 3 = 2` and _not_ as `1-(2+3) = 1-5 = 4`.
 
