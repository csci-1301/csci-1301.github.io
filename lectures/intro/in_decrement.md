# Increment and Decrement Operators

## Increment and decrement basics

- In C#, we have already seen multiple ways to add 1 to a numeric variable:

```
int myVar = 1;
myVar = myVar + 1;
myVar += 1
```

These two lines of code have the same effect; the `+=` operator is "shorthand" for "add and assign"

- The **increment operator**, `++`, is an even shorter way to add 1 to a variable. It can be used in two ways:

```
myVar++;
++myVar;
```

- Writing `++` after the name of the variable is called a **postfix increment**, while writing `++` before the name of the variable is called a **prefix increment**. They both have the same effect on the variable: its value increases by 1.

- Similarly, there are multiple ways to subtract 1 from a numeric variable:

```
int myVar = 10;
myVar = myVar - 1;
myVar -= 1;
```

- The **decrement operator**, `--`, is a shortcut for subtracting 1 from a variable, and is used just like the increment operator:

```
myVar--;
--myVar;
```

- To summarize, the increment and decrement operators both have a prefix and postfix version:

|         | Increment | Decrement |
| ------- | -------   | -------   |
| Postfix | `myVar++` | `myVar--` |
| Prefix  | `++myVar` | `--myVar` |

## Difference between prefix and postfix

- The prefix and postfix versions of the increment and decrement operators both have the same effect on the variable: Its value increases or decreases by 1

- The difference between prefix and postfix is whether the "old" or "new" value of the variable is *returned* by the expression

- With postfix increment/decrement, the operator returns the value of the variable, *then* increases/decreases it by 1

- This means the value of the increment/decrement expression is the *old* value of the variable, before it was incremented/decremented

- Consider this example:

```
int a = 1;
Console.WriteLine(a++);
Console.WriteLine(a--);
```

- The expression `a++` returns the current value of `a`, which is 1, to be used in Console.WriteLine. *Then* it increments `a` by 1, giving it a new value of 2. Thus, the first Console.WriteLine displays "1" on the screen.

- The expression `a--` returns the current value of `a`, which is 2, to be used in Console.WriteLine, and *then* decrements `a` by 1. Thus, the second Console.WriteLine displays "2" on the screen.

- With prefix increment/decrement, the operator increases/decreases the value of the variable by 1, *then* returns its value

- This means the value of the increment/decrement expression is the *new* value of the variable, after the increment/decrement

- Consider the same code, but with prefix instead of postfix operators:

```
int a = 1;
Console.WriteLine(++a);
Console.WriteLine(--a);
```

- The expression `++a` increments `a` by 1, then returns the value of `a` for use in Console.WriteLine. Thus, the first Console.WriteLine displays "2" on the screen.

- The expression `--a` decrements `a` by 1, then returns the value of `a` for use in Console.WriteLine. Thus, the second Console.WriteLine displays "1" on the screen.

## Using increment/decrement in expressions

- The `++` and `--` operators have higher precedence than the other math operators, so if you use them in an expression they will get executed first

- The "result" of the operator, i.e. the value that will be used in the rest of the math expression, depends on whether it is the prefix or postfix increment/decrement operator: The prefix operator returns the variable's new value, while the postfix operator returns the variable's old value

- Consider these examples:

```
int a = 1;
int b = a++;
int c = ++a * 2 + 4;
int d = a-- + 1;
```

- The variable `b` gets the value 1, because `a++` returns the "old" value of `a` (1) and then increments `a` to 2

- In the expression `++a * 2 + 4`, the operator `++a` executes first, and it returns the new value of `a`, which is 3. Then the multiplication executes (`3 * 2`, which is 6), then the addition (`6 + 4`, which is 10). Thus `c` gets the value 10.

- In thee expression `a-- + 1`, the operator `a--` executes first, and it returns the *old* value of `a`, which is 3 (even though `a` is now 2). Then the addition executes, so `d` gets the value 4.
