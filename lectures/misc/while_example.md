---
date: 2024-05-24
default-code-class: csharp
title: While Loop With Complex Conditions
---

In the following example, a complex boolean expression is used in the
*while* statement. The program gets a value and tries to parse it as an
integer. If the value can not be converted to an integer, the program
tries again, but not more than three times.

``` csharp
int c;
string message;
int count;
bool res;

Console.WriteLine("Please enter an integer.");
message = Console.ReadLine();
res = int.TryParse(message, out c);
count = 0; // The user has 3 tries: count will be 0, 1, 2, and then we default.
while (!res && count < 3)
{
    count++;
    if (count == 3)
    {
        c = 1;
        Console.WriteLine("I'm using the default value 1.");
    }
    else
    {
        Console.WriteLine("The value entered was not an integer.");
        Console.WriteLine("Please enter an integer.");
        message = Console.ReadLine();
        res = int.TryParse(message, out c);
    }
}
Console.WriteLine("The value is: " + c);
```
