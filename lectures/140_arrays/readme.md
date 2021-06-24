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
type[] arrayName;
```

- `type` can be any data-type and specifies the data-type of the array elements.
- `arrayName` is an identifier that you will use to access and modify the array elements.
- Before using an array, you must specify the number of elements of the array as follow:

    ```
    arrayName = new type[number of elements];
    ```

- An element of a single-dimensional array can be accessed and modified by using the name of the array and the index of the element as follow:

    ```
    arrayName[Index] = value;  // assigning a value to an element
    
    value = arrayName[Index]; // Reading the current value of an element
    ```
  
- The index of the first element in an array is always zero; the index of the second element is one, and so on.
- If you specify an index greater or equal to the number of elements, a run time error will happen.

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

// the following would give an error:
//myArray[3] = 40;
// Unhandled Exception: System.IndexOutOfRangeException: Index was outside the bounds of the array at Program.Main()
// "Array bound checking": happen at runtime.
```

If you know the number of elements when you are defining an array, you can combine declaration and assignment on one line as follow:

```
type[] arrayName = new type[number of elements];
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

If we use the shorter notation, we _have to_ give the values at initialization, we cannot re-use this notation once the array was created.

Other datatype, and even objects, can be stored in arrays:

```
string[] myArray = { "Bob", "Mom", "Train", "Console" };
Rectangle[] arrayOfRectangle = new Rectangle[5];  // Assume there is a class called Rectangle
```

## Custom Size and Values

One of the benefits of arrays is that they allow you to specify the number of their elements at run-time. Hence, depending on the run-time conditions, we can have enough space to store and process values.

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

## Array Size

Every single-dimensional array has a property called `Length` that returns the number of the elements in the array (or size of the array).

To process an array that its size is not fixed, we can use this property to find out the number of elements in the array

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

There is a class named `Array` that can be used to resize an array. But, note that if you resize an array, you will lose all the current values and the elements will be reset to the data-type default.

### Example

```
Array.Resize(ref myArray, 4);
myArray[3] = 40;
Array.Resize(ref myArray, 2);
```

`Resize` shrinks (and content is lost) and extends (and store the default value, i.e., $0$ for `int`, etc.)!
