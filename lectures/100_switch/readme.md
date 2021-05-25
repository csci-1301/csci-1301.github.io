# Switch Statements

`switch` statements allow to simplify the "matching" of a value against a pre-determined set of values.
Its formal syntax is as follows:

~~~~~~~{.cs .numberLines}
switch (<variable name>)
{
    case (<literal 1>):
        <statement block 1>
        break;
    case (<literal 2>):
        <statement block 2>
        break;
    ...
    default:
        <statement block n>
        break;
}
~~~~~~~

The `(…)` are mandatory, the `{…}` are optional.

- All the literals need to be different.
- The literal and the variable have to be of the same type.
- You can't have case(\<variable name\>)

For instance, imagine we want to go from a month's number to its name.
We could do that with an `if…else if …`:

~~~~~~~{.cs .numberLines}
int month = 11;
string monthname;
if (month == 1) monthname = "January";
else if (month == 2) monthname = "February";
// ...
else if (month == 12) monthname = "December";
else monthname = "Error!";
~~~~~~~

But since we know that "month" will be a value between 1 and 12, or else we have an error, we could also have:

~~~~~~~{.cs .numberLines}
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
~~~~~~~

Another example, to match a section letter against 4 possibilities, where two actually result in the same behavior:

~~~~~~~{.cs .numberLines}
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
~~~~~~~
