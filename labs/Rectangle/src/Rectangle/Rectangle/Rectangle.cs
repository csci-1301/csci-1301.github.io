/*
 * CSCI 1301
 * A class: the Rectangle class
 * 
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
}
