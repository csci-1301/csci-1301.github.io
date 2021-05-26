# Classes, Objects, and UML

## Class and Object Basics

- Classes vs. Objects
    - A **class** is a specification, blueprint, or template for an object; it is the code that describes what data the object stores and what it can do
    - An **object** is a single instance of a class, created using its "template." It is running code, with specific values stored in each variable
    - To **instantiate** an object is to create a new object from a class
- Object design basics
    - Objects have **attributes**: data stored in the object. This data is different in each instance, although the type of data is defined in the class.
    - Objects have **methods**: functions that use or modify the object's data. The code for these functions is defined in the class, but it is executed on (and modifies) a specific object
- Encapsulation: An important principle in class/object design
    - Attribute data is stored in **instance variables**, a special kind of variable
    - Called "instance" because each instance, i.e. object, has its own copy of them
    - **Encapsulation** means instance variables (attributes) are "hidden" inside an object: other code cannot access them directly
        - Only the object's own methods can access the instance variables
        - Other code must "ask permission" from the object in order to read or write the variables
    - **Accessor** method: a method written specifically to allow other code to access instance variables (i.e. attributes)

## Writing Our First Class

- Designing the class
    - Our first class will be used to represent rectangles; each instance (object) will represent one rectangle
    - Attributes of a rectangle:
        - Length
        - Width
    - Methods that will use the rectangle's attributes
        - Get length
        - Get width
        - Set length
        - Set width
        - Compute the rectangle's area
    - Note that the first four are **accessor** methods because they allow other code to read (get) or write (set) the rectangle's instance variables

The Rectangle class:

```
!include code/rectangle.cs
```

Let's look at each part of this code in order.

- Attributes
    - Each attribute (length and width) is stored in an instance variable
    - Instance variables are declared similarly to "regular" variables, but with one additional feature: the **access modifier**
    - Syntax: `[access modifier] [type] [variable name]`
    - The access modifier can be either `public` or `private`
    - An access modifier of `private` is what enforces encapsulation: when you use this access modifier, it means the instance variable cannot be accessed by any code outside the `Rectangle` class
    - The C# compiler will give you an error if you write code that attempts to use a `private` instance variable anywhere other than a method of that variable's class
- SetLength method - our first accessor method
    - This method will allow code outside the `Rectangle` class to modify a `Rectangle` object's "length" attribute
    - Note that the header of this method has an access modifier, just like the instance variable
    - In this case the access modifier is `public` because we *want* to allow other code to call the `SetLength` method
    - Syntax of a method declaration: `[access modifier] [return type] [method name]([parameters])`
    - This method has one **parameter**, named `lengthParameter`, whose type is `int`. This means the method must be called with one **argument** that is `int` type.
        - Similar to how `Console.WriteLine` must be called with one argument that is `string` type -- the `Console.WriteLine` declaration has one parameter that is `string` type.
        - Note that it's declared just like a variable, with a type and a name
    - A parameter works like a variable: it has a type and a value, and you can use it in expressions and assignment
    - When you call a method with a particular argument, like 15, the parameter is assigned this value, so within the method's code you can assume the parameter value is "the argument to this method"
    - The body of the `SetLength` method has one statement, which assigns the instance variable `length` to the value contained in the parameter `lengthParameter`. In other words, whatever argument `SetLength` is called with will get assigned to `length`
    - This is why it's called a "setter": `SetLength(15)` will set `length` to 15.
- GetLength method
    - This method will allow code outside the `Rectangle` class to read the current value of a `Rectangle` object's "length" attribute
    - The **return type** of this method is `int`, which means that the value it returns to the calling code is an `int` value
    - Recall that `Console.ReadLine()` returns a `string` value to the caller, which is why you can write `string userInput = Console.ReadLine()`. The `GetLength` method will do the same thing, only with an `int` instead of a `string`
    - This method has no parameters, so you don't provide any arguments when calling it. "Getter" methods never have parameters, since their purpose is to "get" (read) a value, not change anything
    - The body of `GetLength` has one statement, which uses a new keyword: `return`. This keyword declares what will be returned by the method, i.e. what particular value will be given to the caller to use in an expression.
    - In a "getter" method, the value we return is the instance variable that corresponds to the attribute named in the method. `GetLength` returns the `length` instance variable.
- SetWidth method
    - This is another "setter" method, so it looks very similar to `SetLength`
    - It takes one parameter (`widthParameter`) and assigns it to the `width` instance variable
    - Note that the return type of both setters is `void`. The return type `void` means "this method does not return a value." `Console.WriteLine` is an example of a `void` method we've used already.
    - Since the return type is `void`, there is no `return` statement in this method
- GetWidth method
    - This is the "getter" method for the width attribute
    - It looks very similar to `GetLength`, except the instance variable in the `return` statement is `width` rather than `length`
- The ComputeArea method
    - This is *not* an accessor method: its goal is not to read or write a single instance variable
    - The goal of this method is to compute and return the rectangle's area
    - Since the area of the rectangle will be an `int` (it's the product of two `int`s), we declare the return type of the method to be `int`
    - This method has no parameters, because it doesn't need any arguments. Its only "input" is the instance variables, and it will always do the same thing every time you call it.
    - The body of the method has a `return` statement with an expression, rather than a single variable
    - When you write `return [expression]`, the expression will be evaluated first, then the resulting value will be used by the `return` command
    - In this case, the expression `length * width` will be evaluated, which computes the area of the rectangle. Since both `length` and `width` are `int`s, the `int` version of the `*` operator runs, and it produces an `int` result. This resulting `int` is what the method returns.

## Using Our Class

- We've written a class, but it doesn't do anything yet
    - The class is a blueprint for an object, not an object
    - To make it "do something" (i.e. execute some methods), we need to instantiate an object using this class
    - The code that does this should be in a separate file (e.g. Program.cs), not in Rectangle.cs
- Here is a program that uses our `Rectangle` class:

```
!include code/rectangle_main.cs
```

- Instantiating an object
    - The first line of code creates a `Rectangle` object
    - The left side of the `=` sign is a variable declaration -- it declares a variable of type `Rectangle`
        - Classes we write become new data types in C#
    - The right side of the `=` sign assigns this variable a value: a `Rectangle` object
    - We **instantiate** an object by writing the keyword `new` followed by the name of the class (syntax: `new [class name]()`). The empty parentheses are required, but we'll explain why later.
    - This statement is really an initialization statement: It declares and assigns a variable in one line
    - The value of the `myRectangle` variable is the `Rectangle` object that was created by `new Rectangle()`
- Calling setters on the object
    - The next two lines of code call the `SetLength` and `SetWidth` methods on the object
    - Syntax: `[object name].[method name]([argument])`. Note the "dot operator" between the variable name and the method name.
    - `SetLength` is called with an argument of 12, so `lengthParameter` gets the value 12, and the rectangle's `length` instance variable is then assigned this value
    - Similarly, `SetWidth` is called with an argument of 3, so the rectangle's `width` instance variable is assigned the value 3
- Calling ComputeArea
    - The next line calls the `ComputeArea` method and assigns its result to a new variable named `area`
    - The syntax is the same as the other method calls
    - Since this method has a return value, we need to do something with the return value -- we assign it to a variable
    - Similar to how you must do something with the result (return value) of `Console.ReadLine()`, i.e. `string userInput = Console.ReadLine()`
- Calling getters on the object
    - The last line of code displays some information about the rectangle object using string interpolation
    - One part of the string interpolation is the `area` variable, which we've seen before
    - The other interpolated values are `myRectangle.GetLength()` and `myRectangle.GetWidth()`
    - Looking at the first one: this will call the `GetLength` method, which has a return value that is an `int`. Instead of storing the return value in an `int` variable, we put it in the string interpolation brackets, which means it will be converted to a string using `ToString`. This means the rectangle's length will be inserted into the string and displayed on the screen

## Flow of Control with Objects

- Consider what happens when you have multiple objects in the same program, like this:

    ```
    !include code/multiple_rectangles.cs
    ```

    - First, we declare a variable of type `Rectangle`
    - Then we assign `rect1` a value, a new `Rectangle` object that we instantiate
    - We call the `SetLength` and `SetWidth` methods using `rect1`, and the `Rectangle` object that `rect1` refers to gets its `length` and `width` instance variables set to 12 and 3
    - Then we create another `Rectangle` object and assign it to the variable `rect2` . This object has its own copy of the `length` and `width` instance variables, not 12 and 3
    - We call the `SetLength` and `SetWidth` methods again, using `rect2` on the left side of the dot instead of `rect1`. This means the `Rectangle` object that `rect2` refers to gets its instance variables set to 7 and 15, while the other `Rectangle` remains unmodified
- The same method code can modify different objects at different times
    - Calling a method transfers control from the current line of code (i.e. in Program.cs) to the method code within the class (Rectangle.cs)
    - The method code is always the same, but the specific object that gets modified can be different each time
    - The variable on the left side of the dot operator determines which object gets modified
    - In `rect1.SetLength(12)`, `rect1` is the **calling object**, so `SetLength` will modify `rect1`
        - `SetLength` begins executing with `lengthParameter` equal to 12
        - The instance variable `length` in `length = lengthParameter` refers to `rect1`'s length
    - In `rect2.SetLength(7)`, `rect2` is the calling object, so `SetLength` will modify `rect2`
        - `SetLength` begins executing with `lengthParameter` equal to 7
        - The instance variable `length` in `length = lengthParameter` refers to `rect2`'s length