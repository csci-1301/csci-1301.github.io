/* 
 * Circle Class
 */

using System; // Needed for the Math.PI constant

class Circle
{
    private double radius; // Only attribute of a circle is its radius.
    public void SetRadius(double RadiusArgument) { radius = RadiusArgument; } // Setter for radius, takes a double as argument.
    public double GetRadius() { return radius; } // Getter for radius, returns a double.
    public double ComputeCircum() { return Math.PI * 2 * radius; } // Method to compute the circumference of the circle, returns a double.
    public double ComputeArea() { return Math.PI * radius * radius; } // Method to compute the area of the circle, returns a double. 
    public Circle(double radiusArgument) { radius = radiusArgument; } // Constructor for the Circle class, takes a double as an argument and sets the radius to its value.
    public Circle() { } // "No-args" Constructor for the Circle class.

    // NEW !
    public override string ToString()
    {
        return $"Your circle has\n\ta radius of {radius:N},\n\ta circumference of {ComputeCircum():N},\n\tan area of {ComputeArea():N}.";
    }

}
