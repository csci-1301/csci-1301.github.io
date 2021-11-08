# Arrays

Arrays are structures that allow you to store multiple values in memory using a single name and indexes.

- Usually all the elements of an array have the same type.
- You limit the type of array elements when you declare the array.
- If you want the array to store elements of any type, you can specify object as its type.

An array can be:

- Single-Dimensional
- Multidimensional (not covered)
- Jagged (not covered)

Arrays are useful, for instance,

- When you want to store a collection of related values,
- When you don't know in advance how many variables we need.
- When you need too many variables of the same type.

## Single-Dimensional Arrays

You can define a single-dimensional array as follow:

```
<type>[] arrayName;
```

where

- `<type>` can be any data-type and specifies the data-type of the array elements.
- `arrayName` is an identifier that you will use to access and modify the array elements.

Before using an array, you must specify the number of elements in the array as follows:

```
arrayName = new <type>[<number of elements>];
```

where `<type>` is a type as before, and `<number of elements>`, called the _size declarator_, is a strictly positive integer which will correspond to the size of the array.

- An element of a single-dimensional array can be accessed and modified by using the name of the array and the index of the element as follows:

    ```
    arrayName[<index>] = <value>;  // Assigns <value> to the <index> element of the array arrayName.

    Console.WriteLine(arrayName[<index>]); // Display the <index> element of the array arrayName.
    ```


The index of the first element in an array is always _zero_; the index of the second element is one, and the index of the last element is the size of the array minus one.
As a consequence, if you specify an index greater or equal to the number of elements, a run time error will happen.

Indexing starting from 0 may seem surprising and counter-intuitive, but this is a largely respected convention across programing languages and computer scientists. Some insights on the reasons behind this (collective) choice can be found [in this answer on Computer Science Educators](https://cseducators.stackexchange.com/a/5026).

### Example

In the following example, we define an array named _myArray_ with three elements of type integer, and assign 10 to the first element, 20 to the second element, and 30 to the last element.

```
int[] myArray;
myArray = new int[3]; // 3 is the size declarator
// We can now store 3 ints in this array,
// at index 0, 1 and 2

myArray[0] = 10; // 0 is the subscript, or index
myArray[1] = 20;
myArray[2] = 30;
```

If we were to try to store a fourth value in our array, at index 3, using e.g.

```
myArray[3] = 40;
```

our program would compile just fine, which may seems surprising.
However, when executing this program, _array bounds checking_ would be performed and detect that there is a mismatch between the size of the array and the index we are trying to use, resulting in a quite explicit error message:

```text
Unhandled Exception: System.IndexOutOfRangeException: Index was outside the bounds of the array at Program.Main()
```

### Abridged Syntaxes

If you know the number of elements when you are defining an array, you can combine declaration and assignment on one line as follows:

```
<type>[] arrayName = new <type>[<number of elements>];
```

So, we can combine the first two lines of the previous example and write:

```
int[] myArray = new int[3];
```

We can even initialize _and_ give values on one line:

```
int[] myArray = new int[3] { 10, 20, 30 };
```

And that statement can be rewritten as any of the following:

```
int[] myArray = new int[] { 10, 20, 30 };
int[] myArray = new[] { 10, 20, 30 };
int[] myArray = { 10, 20, 30 };
```

But, we should be careful, the following would cause an error:

```
int[] myArray = new int[5];
myArray = { 1, 2 ,3, 4, 5}; // ERROR
```

If we use the shorter notation, we _have to_ give the values at initialization, we cannot re-use this notation once the array has been created.

Other datatype, and even objects, can be stored in arrays in a perfectly similar way:

```
string[] myArray = { "Bob", "Mom", "Train", "Console" };
Rectangle[] arrayOfRectangle = new Rectangle[5];  // Assume there is a class called Rectangle
```

## Custom Size and Values

One of the benefits of arrays is that they allow you to specify the number of their elements at run-time. Hence, depending on run-time conditions such as user input, we can have enough space to store and process any number of values.

### Example

In the following example, we get the number of elements at run-time from the user, create an array with the appropriate size, and fill the array.

```
Console.WriteLine("What is the size of the array that you want?");
int size = int.Parse(Console.ReadLine());
int[] customArray = new int[size];

int counter = 0;
while (counter < size)
{
    Console.WriteLine($"Enter the {counter + 1}th value");
    customArray[counter] = int.Parse(Console.ReadLine());
    counter++;
}
```

Observe that:

- If the user enters a negative value or a string that does not correspond to an integer for the `size` value, our program will crash: we are not performing any user-input validation here, to keep our example compact.
- We are asking for the `{counter +1}th` value because we prefer not to confuse the user by asking for the "0th" value. Note that a more sophisticated program would replace "th" with "st", "nd" and "rd" for the first three values.

## Array Size

Every single-dimensional array has a property called `Length` that returns the number of the elements in the array (or size of the array).

To process an array whose size is not fixed, we can use this property to find out the number of elements in the array

### Example

```
int counter2 = 0;
while (counter2 < customArray.Length)
{
    Console.WriteLine($"{counter2}: {customArray[counter2]}.");
    counter2++;
}
```

## Changing the Size

There is a class named `Array` that can be used to resize an array. Upon expanding an array, the additional indices will be filled with the default value of the corresponding type.  Shrinking an array will cause the data in the removed indices (those beyond the new length) to be lost.

### Example

```
Array.Resize(ref myArray, 4); //myArray[3] now contains 0
myArray[3] = 40;
Array.Resize(ref myArray, 2);
```


In the above example, all data starting at index 2 is lost.
