 
# Arrays

## Motivation

Arrays are collection, or grouping, of values held in a single place.
They can store multiple values of the same datatype, and are useful, for instance,

- When we want to store a collection of related values,
- When we don't know in advance how many variables we need.

## Declaration and Initialization of Arrays

Declaration and assignment

~~~~~~~{.cs .numberLines .lineAnchors}
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
~~~~~~~

As usual, we can combine declaration and assignment on one line:

~~~~~~~{.cs .numberLines .lineAnchors}
int[] myArray = new int[3];
~~~~~~~

We can even initialize _and_ give values on one line:

~~~~~~~{.cs .numberLines .lineAnchors}
int[] myArray = new int[3] { 10, 20, 30 };
~~~~~~~

And that statement can be rewritten as any of the following:

~~~~~~~{.cs .numberLines .lineAnchors}
int[] myArray = new int[] { 10, 20, 30 };
int[] myArray = new[] { 10, 20, 30 };
int[] myArray = { 10, 20, 30 };
~~~~~~~

But, we should be careful, the following would cause an error:

~~~~~~~{.cs .numberLines .lineAnchors}
int[] myArray = new int[5];
myArray = { 1, 2 ,3, 4, 5}; // ERROR
~~~~~~~

If we use the shorter notation, we _have to_ give the values at initialization, we cannot re-use this notation once the array was created.

Other datatype, and even objects, can be stored in arrays:

~~~~~~~{.cs .numberLines .lineAnchors}
string[] myArray = { "Bob", "Mom", "Train", "Console" };
Rectangle[] arrayOfRectangle = new Rectangle[5];
~~~~~~~

## Custom Size and Values

~~~~~~~{.cs .numberLines .lineAnchors}
Console.WriteLine("What is size of the array that you want?");
int size = int.Parse(Console.ReadLine());
int[] customArray = new int[size];
~~~~~~~

How can we fill it with values, since we do not know its size?
Using iteration!

~~~~~~~{.cs .numberLines .lineAnchors}
int counter = 0;
while (counter < size)
{
    Console.WriteLine($"Enter the {counter + 1}th value");
    customArray[counter] = int.Parse(Console.ReadLine());
    counter++;
}
~~~~~~~

We can use `length`, a property of our `array`.
That is, the integer value `myArray.Length` is the length (= size) of the array, we can access it directly.

To display an array, we need to iterate as well (this time using the `Length` property):

~~~~~~~{.cs .numberLines .lineAnchors}
int counter2 = 0;
while (counter2 < customArray.Length)
{
    Console.WriteLine($"{counter2}: {customArray[counter2]}.");
    counter2++;
}
~~~~~~~


## Changing the Size

`Array` is actually a class, and it comes with methods!

~~~~~~~{.cs .numberLines .lineAnchors}
Array.Resize(ref myArray, 4);
myArray[3] = 40;
Array.Resize(ref myArray, 2);
~~~~~~~

`Resize` shrinks (and content is lost) and extends (and store the default value, i.e., $0$ for `int`, etc.)!
