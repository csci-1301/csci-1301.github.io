# For Loops

## `for` Loops

```{.cs .numberLines .lineAnchors}
int i = 0;
while (i <= 5)
{
    Console.Write(i + " ");
    i++;
}
```


```{.cs .numberLines .lineAnchors}
int j = 0;
do
{
    Console.Write(j + " ");
    j++;
} while (j <= 5);
```


```{.cs .numberLines .lineAnchors}
int k = 0;
for (k = 0; k <= 5; k++)
{
    Console.Write(k + "");
}
```


```{.cs .numberLines .lineAnchors}
for (int l = 0; l <= 5; l++)
{
    Console.Write(l + "");
}
```

Structure : initialization / condition / update

## Ways Things Can Go Wrong
 
Don't:

- Increment the counter in the body of the for loop!
- Assume that a variable declared in the header of a for loop will be accessible in the rest of the code. / Use `for` if you want to use the counter for anything else.
- Declare the variable twice.

## For loops With Arrays
 
`for` loops actually go very well with arrays:
 
```{.cs .numberLines .lineAnchors}
for (int i = 0; i < size; i++)
{
    Console.WriteLine($"Enter the {i + 1}th value");
    customArray[i] = int.Parse(Console.ReadLine());
}
```

Remember that we can use the `Length` property of our `array`.
The previous code could become (only the first line changed):

```{.cs .numberLines .lineAnchors}
for (int i = 0; i < customArray.Length; i++)
{
    Console.WriteLine($"Enter the {i + 1}th value");
    customArray[i] = int.Parse(Console.ReadLine());
}
```

## Nested Loops

Of course, exactly as we could nest `if` statements, we can nest looping structures!

```{.cs .numberLines .lineAnchors}
for (int o = 0; o < 11; o++)
{
    for (int p = 0; p < 11; p++)
        Console.Write($"{o} × {p} = {o * p}  \t ");
    Console.Write();
}
```

## Mixing Control Flows

And we can use `if` statements in the body of `for` loops:

```{.cs .numberLines .lineAnchors}
for (int m = 0; m < 10; m++)
{
    if (m % 2 == 0) Console.WriteLine("This is my turn.");
    else Console.WriteLine("This is your turn.");
}
```


## Iterations

There is another, close, structure that allows to iterate over the elements of an array, but can only access them, not change their values (they are "read only").

```{.cs .numberLines .lineAnchors}
for (int i = 0; i < myArray.Length; i++)
    Console.Write(myArray[i] + " ");

foreach (int i in myArray) // "Read only"
    Console.Write(i + " ");
```

Difference is w.r.t (with respect to) modifying the array "read vs write".
Having `i = 2` in the `foreach` would cause an error!

That last structure is given for the sake of completeness, but it's ok if you'd rather not use it. 
