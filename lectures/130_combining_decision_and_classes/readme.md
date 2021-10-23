# Combining Classes and Decision Structures

Now that we have learned about decision structures, we can revisit classes and methods. Decision structures can make our methods more flexible, useful, and functional.

## Using `if` Statements with Methods

There are several ways we can use `if-else` and `if-else-if` statements with methods:
    - For input validation in setters and properties
    - For input validation in constructors
    - With Boolean parameters to change a method's behavior
    - Inside a method to evaluate instance variables

#### Setters with Input Validation

- Recall that getters and setters are used to implement **encapsulation**: an object's attributes (instance variables) can only be changed by code in that object's class

- For example, this Item class (which represents an item for sale in a store) has two attributes, a price and a description. Code outside the Item class (e.g. in the Main method) can only change these attributes by calling `SetPrice` and `SetDescription`

    ```
    !include code/item.cs
    ```

- Right now, it's possible to set the price to any value, including a negative number, but a negative price doesn't make sense. If we add an `if` statement to SetPrice, we can check that the new value is a valid price before changing the instance variable:

    ```
    public void SetPrice(decimal p)
    {
        if(p >= 0)
        {
            price = p;
        }
        else
        {
            price = 0;
        }
    }
    ```

    - If the parameter `p` is less than 0, we do not assign it to `price`; instead we set `price` to the nearest valid value, which is 0.
    - Since code outside the Item class can't access `price` directly, this means it is now impossible to give an item a negative price: If your code calls `myItem.SetPrice(-90m)`, `myItem`'s price will be 0, not -90.

- Alternatively, we could write a setter that simply ignores invalid values, instead of changing the instance variable to the "nearest valid" value

- For example, in the `Rectangle` class, the length and width attributes must also be non-negative. We could write a setter for width like this:

    ```
    public void SetWidth(int newWidth)
    {
        if(newWidth >= 0)
        {
            width = newWidth
        }
    }
    ```

    - This means if `myRectangle` has a width of 6, and your code calls `myRectangle.SetWidth(-18)`, then `myRectangle` will still have a width of 6.

- A setter with input validation is a good example of where a conditional operator can be useful. We can write the `SetPrice` method with one line of code using a conditional operator:

  ```
  public void SetPrice(decimal p)
  {
      price = (p >= 0) ? p : 0;
  }
  ```

  The instance variable `price` is assigned to the result of the conditional operator, which is either `p`, if `p` is a valid price, or 0, if `p` is not a valid price.

- If you have a class that uses properties instead of getters and setters, the same kind of validation can be added to the `set` component of a property

    - For example, the "price" attribute could be implemented with a property like this:

      ```
      public decimal Price
      {
          get
          {
              return price;
          }
          set
          {
              price = value;
          }
      }
      ```

    - We can add an `if` statement or a conditional operator to the `set` accessor to ensure the price is not set to a negative number:

      ```
      public decimal Price
      {
          get
          {
              return price;
          }
          set
          {
              price = (value >= 0) ? value : 0;
          }
      }
      ```

- If a class's attributes have a more limited range of valid values, we might need to write a more complex condition in the setter. For example, consider the Time class:

  ```
  class Time
  {
      private int hours;
      private int minutes;
      private int seconds;
  }
  ```

- In a Time object, `hours` can be any non-negative number, but `minutes` and `seconds` must be between 0 and 59 for it to represent a valid time interval

- The `SetMinutes` method can be written as follows:

    ```
    public void SetMinutes(int newMinutes)
    {
        if(newMinutes >= 0 && newMinutes < 60)
        {
            minutes = newMinutes;
        }
        else if(newMinutes >= 60)
        {
            minutes = 59;
        }
        else
        {
            minutes = 0;
        }
    }
    ```

    - If the parameter `newMinutes` is between 0 and 59 (both greater than or equal to 0 and less than 60), it is valid and can be assigned to `minutes`
    - If `newMinutes` is 60 or greater, we set `minutes` to the largest possible value, which is 59
    - If `newMinutes` is less than 0, we set `minutes` to the smallest possible value, which is 0
    - Note that we need an if-else-if statement because there are two different ways that `newMinutes` can be invalid (too large or too small) and we need to distinguish between them. When the condition `newMinutes >= 0 && newMinutes < 60` is false, it could either be because `newMinutes` is less than 0 or because `newMinutes` is greater than 59. The `else if` clause tests which of these possibilities is true.

#### Constructors with Input Validation

- A constructor's job is to initialize the object's instance variables, so it's very similar to a "setter" for all the instance variables at once

- If the constructor uses parameters to initialize the instance variables, it can use `if` statements to ensure the instance variables are not initialized to "bad" values

- Returning to the `Item` class, this is how we could write a 2-argument constructor that initializes the price to 0 if the parameter `initPrice` is not a valid price:

  ```
  public Item(string initDesc, decimal initPrice)
  {
      description = initDesc;
      price = (initPrice >= 0) ? initPrice : 0;
  }
  ```

  With both this constructor and the `SetPrice` method we wrote earlier, we can now guarantee that it's impossible for an Item object to have a negative price. This will make it easier to write a large program that uses many Item objects without introducing bugs: the program can't accidentally reduce an item's price below 0, and it can add up the prices of all the items and be sure to get the correct answer.

- Recall the `ClassRoom` class from an earlier lecture, which has a room number as one of its attributes. If we know that no classroom building has more than 3 floors, then the room number must be between 100 and 399. The constructor for `ClassRoom` could check that the room number is valid using an if-else-if statement, as follows:

    ```
    public ClassRoom(string buildingParam, int numberParam)
    {
        building = buildingParam;
        if(numberParam >= 400)
        {
            number = 399;
        }
        else if(numberParam < 100)
        {
            number = 100;
        }
        else
        {
            number = numberParam;
        }
    }
    ```

    - Here, we have used similar logic to the `SetMinutes` method of the Time class, but with the conditions tested in the opposite order
    - First, we check if `numberParam` is too large (greater than 399), and if so, initialize `number` to 399
    - Then we check if `numberParam` is too small (less than 100), and if so, initialize `number` to 100
    - If both of these conditions are false, it means `numberParam` is a valid room number, so we  can initialize `number` to `numberParam`

- The `Time` class also needs a constructor that checks if its parameters are within a valid range, since both minutes and seconds must be between 0 and 59

- However, with this class we can be "smarter" about the way we handle values that are too large. If a user attempts to construct a Time object with a value of 0 hours and 75 minutes, the constructor could "correct" this to 1 hour and 15 minutes and initialize the Time object with these equivalent values. In other words, this code:

  ```
  Time classTime = new Time(0, 75, 0);
  Console.WriteLine($"{classTime.GetHours()} hours, {classTime.GetMinutes()} minutes");
  ```

  should produce the output "1 hours, 15 minutes", not "0 hours, 59 minutes"

- Here's a first attempt at writing the Time constructor:

    ```
    public Time(int hourParam, int minuteParam, int secondParam)
    {
        hours = (hourParam >= 0) ? hourParam : 0;
        if(minuteParam >= 60)
        {
            minutes = minuteParam % 60;
            hours += minuteParam / 60;
        }
        else if(minuteParam < 0)
        {
            minutes = 0;
        }
        else
        {
            minutes = minuteParam;
        }
        if(secondParam >= 60)
        {
            seconds = secondParam % 60;
            minutes += secondParam / 60;
        }
        else if(secondParam < 0)
        {
            seconds = 0;
        }
        else
        {
            seconds = secondParam;
        }
    }
    ```

    - First, we initialize `hours` using `hourParam`, unless `hourParam` is negative. There's no upper limit on the value of `hours`
    - If `minuteParam` is 60 or greater, we perform an integer division by 60 and add the result to `hours`, while using the remainder after dividing by 60 to initialize `minutes`. This separates the value into a whole number of hours and a remaining, valid, number of minutes. Since `hours` has already been initialized, it's important to use `+=` (to add to the existing value).
    - Similarly, if `secondParam` is 60 or greater, we divide it into a whole number of minutes and a remaining number of seconds, and add the number of minutes to `minutes`
    - With all three parameters, any negative value is replaced with 0

- This constructor has an error, however: If `minuteParam` is 59 and `secondParam` is 60 or greater, `minutes` will be initialized to 59, but then the second if-else-if statement will increase `minutes` to 60. There are two ways we can fix this problem.

    - One is to add a nested `if` statement that checks if `minutes` has been increased past 59 by `secondParam`:

      ```
      public Time(int hourParam, int minuteParam, int secondParam)
      {
          hours = (hourParam >= 0) ? hourParam : 0;
          if(minuteParam >= 60)
          {
              minutes = minuteParam % 60;
              hours += minuteParam / 60;
          }
          else if(minuteParam < 0)
          {
              minutes = 0;
          }
          else
          {
              minutes = minuteParam;
          }
          if(secondParam >= 60)
          {
              seconds = secondParam % 60;
              minutes += secondParam / 60;
              if(minutes >= 60)
              {
                  hours += minutes / 60;
                  minutes = minutes % 60;
              }
          }
          else if(secondParam < 0)
          {
              seconds = 0;
          }
          else
          {
              seconds = secondParam;
          }
      }
      ```

    - Another is to use the `AddMinutes` method we have already written to increase `minutes`, rather than the `+=` operator, because this method ensures that `minutes` stays between 0 and 59 and increments `hours` if necessary:

      ```
      public Time(int hourParam, int minuteParam, int secondParam)
      {
          hours = (hourParam >= 0) ? hourParam : 0;
          if(minuteParam >= 60)
          {
              AddMinutes(minuteParam);
          }
          else if(minuteParam < 0)
          {
              minutes = 0;
          }
          else
          {
              minutes = minuteParam;
          }
          if(secondParam >= 60)
          {
              seconds = secondParam % 60;
              AddMinutes(secondParam / 60);
          }
          else if(secondParam < 0)
          {
              seconds = 0;
          }
          else
          {
              seconds = secondParam;
          }
      }
      ```

      Note that we can also use `AddMinutes` in the first `if` statement, since it will perform the same integer division and remainder operations that we originally wrote for `minuteParam`.


# The Loan Class

This class and its associated Main method show how you can use classes, methods, constructors, decision structures, and user input validation all in the same program.

```
using System;

class Loan
{
    private string account;
    private char type;
    private int cscore;
    private decimal amount;
    private decimal rate;

    public Loan()
    {
        account = "Unknown";
        type = 'o';
        cscore = -1;
        amount = -1;
        rate = -1;
    }

    public Loan(string nameP, char typeP, int cscoreP, decimal needP, decimal downP)
    {
        account = nameP;
        type = typeP;
        cscore = cscoreP;
        if (cscore < 300)
        {
            Console.WriteLine("Sorry, we can't accept your application");
            amount = -1;
            rate = -1;
        }
        else
        {
            amount = needP - downP;

            switch (type)
            {
                case ('a'):
                    rate = .05M;
                    break;

                case ('h'):
                    if (cscore > 600 && amount < 1000000M)
                        rate = .03M;
                    else
                        rate = .04M;
                    break;
                case ('o'):
                    if (cscore > 650 || amount < 10000M)
                        rate = .07M;
                    else
                        rate = .09M;
                    break;

            }

        }
    }
    public override string ToString()
    {
        string typeName = "";
        switch (type)
        {
            case ('a'):
                typeName = "an auto";
                break;

            case ('h'):
                typeName = "a house";
                break;
            case ('o'):
                typeName = "another reason";
                break;

        }

        return "Dear " + account + $", you borrowed {amount:C} at {rate:P} for "
            + typeName + ".";
    }
}
```


```
using System;
class Program
{
    static void Main()
    {

        Console.WriteLine("What is your name?");
        string name = Console.ReadLine();

        Console.WriteLine("Do you want a loan for an Auto (A, a), a House (H, h), or for some Other (O, o) reason?");
        char type = Console.ReadKey().KeyChar; ;
        Console.WriteLine();

        string typeOfLoan;

        if (type == 'A' || type == 'a')
        {
            type = 'a';
            typeOfLoan = "an auto";
        }
        else if (type == 'H' || type == 'h')
        {
            type = 'h';
            typeOfLoan = "a house";
        }
        else
        {
            type = 'o';
            typeOfLoan = "some other reason";
        }

        Console.WriteLine($"You need money for {typeOfLoan}, great.\nWhat is your current credit score?");
        int cscore = int.Parse(Console.ReadLine());

        Console.WriteLine("How much do you need, total?");
        decimal need = decimal.Parse(Console.ReadLine());

        Console.WriteLine("What is your down payment?");
        decimal down = decimal.Parse(Console.ReadLine());

        Loan myLoan = new Loan(name, type, cscore, need, down);
        Console.WriteLine(myLoan);
    }

}
```
