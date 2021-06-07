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

We can store if something ("The user has reached the majority", "The switch is on", "The user is using windows", "This computer's clock indicate that we are in the afternoon", …) is true or false in a (boolean) *flag*, which is simply a variable of type boolean.

We can declare, assign, initialize and display it as any other variable:

```
bool flag = true;
Console.WriteLine(true);
```

But the only two possible values are `true` and `false`, and we will study three operations on them: "and" (`&&`, the conjunction), "or" (`||`, the disjunction) and "not" (`!`, the negation).
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

We could also have represented those tables in $2$-dimensions, as it is done [for instance on wikipedia](https://en.wikipedia.org/wiki/Truth_table#Logical_conjunction_(AND)) for the conjunction.

# Equality and Relational Operators



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

- Operators with higher precedence are on the left and operators with lower precedence are on the right (ex: `1*2+3` = `1*2` will have higher precedence than `2+3`)
- Operators in parenthesis have equal precedence and are evaluated in the order they appear, from left to right (ex: `1+2-3` = `1+2` be evaluated before `2-3`)
 
