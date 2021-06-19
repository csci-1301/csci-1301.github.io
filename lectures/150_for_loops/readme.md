# For Loops

## `for` Loops

```
int i = 0;
while (i <= 5)
{
    Console.Write(i + " ");
    i++;
}
```


```
int j = 0;
do
{
    Console.Write(j + " ");
    j++;
} while (j <= 5);
```


```
int k = 0;
for (k = 0; k <= 5; k++)
{
    Console.Write(k + "");
}
```


```
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

```
for (int i = 0; i < size; i++)
{
    Console.WriteLine($"Enter the {i + 1}th value");
    customArray[i] = int.Parse(Console.ReadLine());
}
```

Remember that we can use the `Length` property of our `array`.
The previous code could become (only the first line changed):

```
for (int i = 0; i < customArray.Length; i++)
{
    Console.WriteLine($"Enter the {i + 1}th value");
    customArray[i] = int.Parse(Console.ReadLine());
}
```

## Nested Loops

Of course, exactly as we could nest `if` statements, we can nest looping structures!

```
for (int o = 0; o < 11; o++)
{
    for (int p = 0; p < 11; p++)
        Console.Write($"{o} × {p} = {o * p}  \t ");
    Console.WriteLine();
}
```

## Mixing Control Flows

And we can use `if` statements in the body of `for` loops:

```
for (int m = 0; m < 10; m++)
{
    if (m % 2 == 0) Console.WriteLine("This is my turn.");
    else Console.WriteLine("This is your turn.");
}
```


## Iterations

There is another, close, structure that allows to iterate over the elements of an array, but can only access them, not change their values (they are "read only").

```
for (int i = 0; i < myArray.Length; i++)
    Console.Write(myArray[i] + " ");

foreach (int i in myArray) // "Read only"
    Console.Write(i + " ");
```

Difference is w.r.t (with respect to) modifying the array "read vs write".
Having `i = 2` in the `foreach` would cause an error!

That last structure is given for the sake of completeness, but it's ok if you'd rather not use it.

## `break` statement
The `break` statement ends a loop immediately.

### Example
```
int number = 1;
while (true)
{
    Console.WriteLine(number);
    number++;
    if(number > 5) break;
}
```

## `continue` statement

This command ends the current iteration of a loop and skips the remaining statements in the body of the loop.

### Example
```
int number = 0;
while (number <= 100)
{
    number++;
    if(number % 2 == 1) continue;
    Console.WriteLine(number);
}
```
- The above code prints all the even numbers from 1 to 100.
