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

## Example

For instance, imagine we want to go from a month's number (e.g., `1`) to its name (e.g. `"January"`).
We could do that with an `if…else if …`:

```
int month = 11; // simply assume that we obtained this information somehow.
string monthname;
if (month == 1) monthname = "January";
else if (month == 2) monthname = "February";
// fill in cases for March to November
else if (month == 12) monthname = "December";
else monthname = "Error!";
```

But since we know that "month" will be a value between 1 and 12, or else we have an error, we could also have:

```
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
```

Here is another example, switching on section letter. There are 4 possibilities, but two result in the same behavior:

```
char section = 'c';
string meet;
switch (section)
{
    case ('a'):
        meet = "MW 1-2PM";
        break;
    case ('b'):
        meet = "TT 1-2PM";
        break;
    case ('c'):
    case ('d'):
 //   case ('a'): Would not compile!
        meet = "F 2-4PM";
        break;
    default:
        meet = "Invalid code";
        break;
}
```

The `break`statement identifies where the program should stop reading a case.  Here case c contains all of case d, with no additional information added.
It is also possible to add content exclusively to case c without including the break.  In that situation case c would contain both the c-exclusive content and all of the d content.
