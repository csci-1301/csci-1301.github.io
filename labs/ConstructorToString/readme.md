---
title: Constructors and `ToString`
---

This lab serves multiple goals:

- To make sure that you understand the basics of class implementation and usage,
- To practise writing and using different constructors,
- To understand the role played by `ToString` and how to call this method,
- To understand that the information stored in the attributes and its visualization are two different things.

# Adding Constructors and `ToString` to An Existing Class

As a warm-up, you will practice writing constructors and `ToString` methods by adding them to a class you have already implemented and used.

## A Constructor for Rectangle

#. Open the "Rectangle" project you created in the ["Rectangle Class" lab](../Rectangle/). You can use the "enriched" class, [shared previously](https://csci-1301.github.io/labs/Rectangle/Enriched_Rectangle.zip), if you prefer.
#. In "Rectangle.cs", add a constructor to `Rectangle` that takes two arguments, a length and a width, and uses them to initialize the `length` and `width` attributes.
#. Within your `Main` method, you will notice that your `new Rectangle()` instantiation statements are now highlighted as errors, because `Rectangle` no longer has a zero-argument (or "no-args") constructor. Change each instantiation statement to call your new two-arguments constructor, using the initial length and width values that you previously used in `SetLength()` and `SetWidth()`.
#. Compile and execute your program and make sure your Rectangles still behave as expected.

## A `ToString` Method

In the `Main` method of your program, you should have one or more statements that display the length and width of a Rectangle, e.g., to test the result of your `Swap` method, like this:

```
Console.WriteLine($"The rectangle's length is {myRectangle.GetLength()}" +
            $", its width is {myRectangle.GetWidth()}.");
myRectangle.Swap();
Console.WriteLine($"The rectangle's length is {myRectangle.GetLength()}" +
            $", its width is {myRectangle.GetWidth()}.)";
```

We will add a `ToString` method to `Rectangle` to make it easier to display this information repeateadly. 

#. In "Rectangle.cs", add the following method to the `Rectangle` class:

   ```
   public override string ToString()
   {
       return $"Rectangle with length {length} and width {width}.\n";
   }
	```

#. Within your `Main` method, find a `WriteLine` statement that displays the length and width of a `Rectangle`, and replace the calls to `GetLength` and `GetWidth` with a single call to `ToString`. For example, you can replace the statement

    ```
    Console.WriteLine($"The rectangle's length is {myRectangle.GetLength()}" +
            $", its width is {myRectangle.GetWidth()}.");
    ```

   with

   ```
   Console.WriteLine($"My rectangle: {myRectangle.ToString()}");
   ```

#. Compile and execute your program. What do you observe about the new `WriteLine` statements?

# A Room Class

Now, we will create a `Room` class "from scratch," including constructors and a `ToString` method.

## Initial Set-Up

Create a `Room` class, with three attributes: 

#. one to hold the name of the room, 
#. one for the length of the room, and
#. one for the width of the room.

Name the attributes the way you want, and pick appropriate datatypes, knowing that we want to be able to store the length and the width of rooms (expressed in meters) using floating point numbers.

Create 6 methods:

- A method to set the value of each attribute ("setters")
- A method to get the value of each attribute ("getters")

To test your `Room` class, edit your `Main` method to create a `Room` object and ask the user for its name, length and width, and then display on the screen the name of the `Room` object that was created.

## Adding Methods

Now, add two methods:

- A constructor that takes three arguments and uses them to initialize the length, width, and name of the room
- A method that returns the area of the room in square meters

Test them before moving on.

## A `ToString` Method

This final part will guide you in writing your own `ToString` method.

#. To understand the need for such a method, start by trying to display an object "directly."
	In your `Main` method, create a `Room` object called `myKitchen` and write

	```
	Console.WriteLine(myKitchen);
	```

	Compile and execute your program.
	Is the information displayed on the screen what you expected?
	Is it useful?

#. Add the following to your `Room` class:

	```
	public override string ToString(){
		  return "The name of the room is...";
	}
	```

#. Test this method by adding

    ```
    Console.WriteLine(myKitchen.ToString());
    ```

    to your `Main` method.

#. Remove `.ToString()` from the previous statement and execute your program again. Did something change?

#. "Expand" this method by having it return a more meaningful string: the string returned should also contain the name of the room and its dimensions in meters. Use format specifiers to make it look nice!

# Pushing Further (Optional)

This last (optional) part is here to help you understand that the data stored in attributes is not necessarily the data displayed by the `ToString` method.

## Internationalization of the Room Class

Suppose that we want to accommodate users who are more familiar with feet.
Note that _we do not want to change the meaning of our width and length attributes, which are still supposed to hold dimensions in meters_, but we want to create methods that perform the conversions for us.
Remembering that

- 1 meter = 3.28084 feet,
- 1 foot = 0.3048 meter,

add four methods to your class:

- A method that returns the width of the room in feet,
- A method that returns the length of the room in feet,
- A method that returns the area of the room in square feet,

Then, edit your `ToString` method to display the dimensions of the rooms both in meters and feet.
