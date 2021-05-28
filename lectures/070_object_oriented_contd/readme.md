# More Advanced Object Concepts

## Default Values and the ClassRoom Class

- Instance variables get default values
    - In lab, you were asked to run a program like this:

        ```
        !include code/rectangle_initial_values.cs
        ```

      Note that we create a Rectangle object, but do not use the `SetLength` or `SetWidth` methods to assign values to its instance variables. It displays the following output:

        ```text
        Length is 0
        Width is 0
        ```

    - This works because the instance variables `length` and `width` have a default value of 0, even if you never assign them a value

    - Local variables, like the ones we write in the Main method, do *not* have default values. You must assign them a value before using them in an expression.

        - For example, this code will produce a compile error:

            ```
            int myVar1;
            int myVar2 = myVar1 + 5;
            ```

          You can't assume `myVar1` will be 0; it has no value at all until you use an assignment statement.

    - When you create (instantiate) a new object, its instance variables will be assigned specific default values based on their type:

        | **Type**      | **Default Value** |
        | ------------- | :---------------- |
        | Numeric types | 0                 |
        | `string`      | `null`            |
        | objects       | `null`            |
        | `bool`        | `false`           |
        | `char`        | `'\0'`            |

    - Remember, `null` is the value of a reference-type variable that refers to "nothing" - it does not contain the location of any object at all. You can't do anything with a reference variable containing `null`.

- A class we'll use for subsequent examples

    - ClassRoom: Represents a room in a building on campus

    - UML Diagram:

        |                **ClassRoom**            |
        | --------------------------------------- |
        | - building: `string`                    |
        | - number: `int`                         |
        | --------------------------------------- |
        | + SetBuilding(buildingParam : `string`) |
        | + GetBuilding(): `string`               |
        | + SetNumber(numberParameter: `int`)     |
        | + GetNumber(): `int`                    |

        - There are two attributes: the name of the building (a string) and the room number (an `int`)
        - Each attribute will have a "getter" and "setter" method

    - Implementation:

        ```
        !include code/classroom.cs
        ```

        - Each attribute is implemented by an instance variable with the same name
        - To write the "setter" for the building attribute, we write a method whose return type is `void`, with a single `string`-type parameter. Its body assigns the `building` instance variable to the value in the parameter `buildingParam`
        - To write the "getter" for the building attribute, we write a method whose return type is `string`, and whose body returns the instance variable `building`

    - Creating an object and using its default values:

        ```
        !include code/classroom_initial_values.cs
        ```

      This will print the following output:

        ```text
        Building is
        Room number is 0
        ```

      Remember that the default value of a `string` variable is `null`. When you use string interpolation on `null`, you get an empty string.

## Constructors

- Instantiation and constructors
    - Instantiation syntax requires you to write parentheses after the name of the class, like this:

        ```
        ClassRoom english = new ClassRoom();
        ```

    - Parentheses indicate a method call, like in `Console.ReadLine()` or `english.GetBuilding()`
    - In fact, the instantiation statement `new ClassRoom()` does call a method: the **constructor**
    - Constructor: A special method used to create an object. It "sets up" a new instance by **initializing its instance variables**.
    - If you don't write a constructor in your class, C# will generate a "default" constructor for you -- this is what's getting called when we write `new ClassRoom()` here
    - The default constructor initializes each instance variable to its default value -- that's where default values come from
- Writing a constructor
    - Example for ClassRoom:

        ```
        public ClassRoom(string buildingParam, int numberParam)
        {
            building = buildingParam;
            number = numberParam;
        }
        ```

    - To write a constructor, write a method whose name is *exactly the same* as the class name
    - This method has *no return type*, not even `void`. It does not have a `return` statement either
    - For `ClassRoom`, this means the constructor's header starts with `public ClassRoom`
        - You can think of this method as "combining" the return type and name. The name of the method is `ClassRoom`, and its output is of type `ClassRoom`, since the return value of `new ClassRoom()` is always a `ClassRoom` object
        - You don't actually write a `return` statement, though, because `new` will always return the new object after calling the constructor
    - A custom constructor usually has parameters that correspond to the instance variables: for `ClassRoom`, it has a `string` parameter named `buildingParam`, and an `int` parameter named `numberParam`
        - Note that when we write a method with two parameters, we separate the parameters with a comma
    - The body of a constructor must assign values to **all** instance variables in the object
    - Usually this means assigning each parameter to its corresponding instance variable: initialize the instance variable to equal the parameter
        - Very similar to calling both "setters" at once
- Using a constructor
    - An instantiation statement will call a constructor for the class being instantiated
    - Arguments in parentheses must match the parameters of the constructor
    - Example with the `ClassRoom` constructor:

        ```
        !include code/classroom_using_constructor.cs
        ```

      This program will produce this output:

        ```text
        Building is Allgood East
        Room number is 356
        ```

    - The instantiation statement `new ClassRoom("Allgood East", 356)` first creates a new "empty" object of type `ClassRoom`, then calls the constructor to initialize it. The first argument, "Allgood East", becomes the constructor's first parameter (`buildingParam`), and the second argument, 356, becomes the constructor's second parameter (`numberParam`).

    - After executing the instantiation statement, the object referred to by `csci` has its instance variables set to these values, even though we never called `SetBuilding` or `SetNumber`

- Methods with multiple parameters
    - The constructor we wrote is an example of a method with two parameters
    - The same syntax can be used for ordinary, non-constructor methods, if we need more than one input value
    - For example, we could write this method in the `Rectangle` class:

        ```
        public void MultiplyBoth(int lengthFactor, int widthFactor)
        {
            length *= lengthFactor;
            width *= widthFactor;
        }
        ```

    - The first parameter has type `int` and is named lengthFactor. The second parameter has type `int` and is named `widthFactor`

    - You can call this method by providing two arguments, separated by a comma:

        ```
        myRect.SetLength(5);
        myRect.SetWidth(10);
        myRect.MultiplyBoth(3, 5);
        ```

      The first argument, 3, will be assigned to the first parameter, `lengthFactor`. The second argument, 5, will be assigned to the second parameter, `widthFactor`

    - The order of the arguments matters when calling a multi-parameter method. If you write `myRect.MultiplyBoth(5, 3)`, then `lengthFactor` will be 5 and `widthFactor` will be 3.

    - The type of each argument must match the type of the corresponding parameter. For example, when you call the `ClassRoom` constructor we just wrote, the first argument must be a `string` and the second argument must be an `int`

- Writing multiple constructors
    - Remember that if you don't write a constructor, C# generates a "default" one with no parameters, so you can write `new ClassRoom()`

    - Once you add a constructor to your class, C# will **not** generate a default constructor
        - This means once we write the `ClassRoom` constructor (as shown earlier), this statement will produce a compile error: `ClassRoom english = new ClassRoom();`
        - The constructor we wrote has 2 parameters, so now you always need 2 arguments to instantiate a `ClassRoom`

    - If you still want the option to create an object with no arguments (i.e. `new ClassRoom()`), you must write a constructor with no parameters

    - A class can have more than one constructor, so it would look like this:

        ```
        class ClassRoom
        {
            //...
            public ClassRoom(string buildingParam, int numberParam)
            {
                building = buildingParam;
                number = numberParam;
            }
            public ClassRoom()
            {
                building = null;
                number = 0;
            }
            //...
        }

    - The "no-argument" constructor must still initialize all the instance variables, even though it has no parameters

        - You can pick any "default value" you want, or use the same ones that C# would use (0 for numeric variables, `null` for object variables, etc.)

    - When a class has multiple constructors, the instantiation statement must decide which constructor to call

    - The instantiation statement will call the constructor whose parameters match the arguments you provide

        - For example, each of these statements will call a different constructor:

            ```
            ClassRoom csci = new ClassRoom("Allgood East", 356);
            ClassRoom english = new ClassRoom();
            ```

          The first statement calls the two-parameter constructor we wrote, since it has a `string` argument and an `int` argument (in that order), and those match the parameters `(string buildingParam, int numberParam)`. The second statement calls the zero-parameter constructor since it has no arguments.

        - If the arguments don't match any constructor, it's still an error:

            ```
            ClassRoom csci = new ClassRoom(356, "Allgood East");`
            ```

          This will produce a compile error, because the instantiation statement has two arguments in the order `int`, `string`, but the only constructor with two parameters needs the first parameter to be a `string`.

## Writing ToString Methods

- ToString usage
    - String interpolation automatically calls the `ToString` method on each variable or value
    - `ToString` returns a string "equivalent" to the object; for example, if `num` is an `int` variable containing 42, `num.ToString()` returns "42".
    - C# datatypes already have a `ToString` method, but you need to write a `ToString` method for your own classes to use them in string interpolation
