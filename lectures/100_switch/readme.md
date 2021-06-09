# Switch Statements

Another way of selecting which "branch" of code to execute is given thanks to `switch` statements.
Those statements have a flair similar to `if…else if … else`, except that they "force" all the conditions to test the value of the same variable.
While using _more restrictive_ structures can seem odd at first, it is important to understand that they allow the programmer to think differently about their program, and, in this particular case, that it allows to easily read, understand and check a particular decision structure.

Stated differently, `switch` statements allow to simplify the "matching" of a value against a pre-determined set of values.

## Syntax

The formal syntax of `switch` statements is as follows:

```
switch (<variable name>)
{
    case (<literal 1>):
        <statement block 1>
        break;
    case (<literal 2>):
        <statement block 2>
        break;
    …
    default:
        <statement block n>
        break;
}
```

The `(…)` are mandatory, but the `{…}` are optional.

Note that to be correct, you have to follow multiple restrictions:

- All the literals need to be different.
- The literals and the variable have to be of the same type.
- A literal _cannot be_ a variable name: it has to be an actual value!

Finally, note that since all the literals have to be different, the order of the literal does not matter in `switch` statements!
However, the `default` branch, that is executed if all the literal are different from the switch variable, must always come last, exactly like a trailing `else` in an `if … else if … ` statement.

## First Example: From if to switch

For instance, imagine we want to go from a month's number (e.g., `1`) to its name (e.g. `"January"`).
We could do that with an `if…else if …`:

```
Console.WriteLine("Enter the month as a number between 1 and 12.");
int month = int.Parse(Console.ReadLine());
string monthname;

if (month == 1) monthname = "January";
else if (month == 2) monthname = "February";
// fill in cases for March to November
else if (month == 12) monthname = "December";
else monthname = "Error!";

Console.WriteLine("The number " + month + " corresponds to the month " + monthname + ".");
```

But since we know that "month" will be a value between 1 and 12, or else we have an error, we could also have:

```
Console.WriteLine("Enter the month as a number between 1 and 12.");
int month = int.Parse(Console.ReadLine()); .
string monthname;

switch (month)
{
    case (1):
        monthname = "January";
        break;
    case (2):
        monthname = "February";
        break;
    // ..
    case (12):
        monthname = "December";
        break;
    default:
        monthname = "Error!";
        break;
}

Console.WriteLine("The number " + month + " corresponds to the month " + monthname + ".");
```

Both structures have the same activity diagram:

!["A flowchart representation of the mapping between month number and name"](img/activity_diag_month)

However, note that a more faithful representation of the `if…else if …` structure would actually be made only of _binary_ choices: `switch` statements open the possiblity of representing $n$-ary choices "natively", without having to represent them with $n-1$ binary choices.

Furthermore, note that _not_ all `if…else…if` statements can be rewritten as `switch`!
Typically, consider a condition `mileage > 1000` over an `int` `mileage`, a `switch` could never express that condition, as it would have to list all the `int` greater than 1,000!

## Second Example: Switching on Characters

Here is another example, that highlights two aspects:

- The "switch variable" can be of any datatype. It does not need to be an `int`.
- It is possible to express "if the switch variable has value <literal 1> _or_ <literal 2>", but note that _this is done without boolean disjunction_, simply by listing the two cases one after the other.
 
Imagine we want to ask the user their section for a particular class (that can be `'a'`, `'b'`, `'c'` or `'d'`) to inform them of their section's meeting time.
In that example, sections `'c'` and `'d'` meet at the same time.


```
Console.WriteLine("Please, enter your section (a, b, c or d).");
char section = Console.ReadKey().KeyChar; // Note that we are using a new method, to read characters.

string meet;
switch (section)
{
    case ('a'):
        meet = "MW 1-2PM";
        break;
    case ('b'):
        meet = "TR 1-2PM";
        break;
    case ('c'):
    case ('d'):
        meet = "F 2-4PM";
        break;
    default:
        meet = "Invalid code";
        break;
}

Console.WriteLine("Your section (" + section + ") meets on " + meet + ".");
```

The `break`statement identifies where the program should stop reading a case.
Here, the case for the literal `c` also contains the case for the literal `d`: the same statements are executed if one of those two values match the user-input for `section`.

<!--
It is also possible to add content exclusively to case c without including the break.  In that situation case c would contain both the c-exclusive content and all of the d content.
I don't think we want to discuss that.
-->
