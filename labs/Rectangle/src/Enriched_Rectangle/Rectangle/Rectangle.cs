/*
 * CSCI 1301
 * A class: the Rectangle class
 * 
 * Solution File: see lines 56 and up.
 * UML diagram:
    |======================================|
    |             **Rectangle**            |
    | ------------------------------------ |
    | - width: `int`                       |
    | - length: `int`                      |
    | ------------------------------------ |
    | + SetLength(lengthParameter: `int`)  |
    | + GetLength(): `int`                 |
    | + SetWidth(widthParameter: `int`)    |
    | + GetWidth(): `int`                  |
    | + ComputeArea(): `int`               |
    | + ComputePerimeter(): `int`          |
    | + DoubleRectangle(): `void`          |
    | + Swap(): `void`                     |
    |======================================|
 */

class Rectangle
{
    /*
     * Declaration of the two instance variables / attributes / fields
     */
    private int length;
    private int width;

    /*
     * Accessors for the Length
     */

    // "Setter" (or "mutator") for the Length:
    public void SetLength(int lengthParameter)
    {
        length = lengthParameter;
    }
    // "Getter" (or "accessor") for the Length:
    public int GetLength()
    {
        return length;
    }

    /*
     * Accessors for the Width
     */

    // "Setter" (or "mutator") for the Width:
    public void SetWidth(int widthParameter)
    {
        width = widthParameter;
    }
    // "Getter" (or "accessor") for the Width:
    public int GetWidth()
    {
        return width;
    }

    /*
     * Method to compute the area of a rectangle
     */
    public int ComputeArea()
    {
        return length * width;

    }

    /*
     * Method to compute the perimeter of a rectangle
     */
    public int ComputePerimeter()
    {
        return length * 2 + width * 2;
    }

    /*
     * Method to double the height and the width of the calling object.
     */
    public void DoubleRectangle()
    {
        width *= 2;
        length *= 2;
    }

    /*
     * Method to swap the height and the width of the calling object.
     */
    public void Swap()
    {
        int temp;
        temp = length;
        length = width;
        width = temp;
    }
}
