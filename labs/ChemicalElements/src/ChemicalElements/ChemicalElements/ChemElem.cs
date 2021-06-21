class ChemElem
{
    // Attributes:
    private int atomicNumber;   // Atomic number of the chemical element
    private string name;        // Name of the chemical element
    private decimal melt;       // Melting point (in Kelvin) of the chemical element

    // Constructor:
    public ChemElem(int atomicNumberParam, string nameParam, decimal meltParam)
    {
        atomicNumber = atomicNumberParam;
        name = nameParam;
        melt = meltParam;
    }

    /* To convert from Kelvin to Celsius
     * Cf. conversion rules at https://en.wikipedia.org/wiki/Kelvin
     *                  from kelvins 	            to kelvins
     * Celsius 	        [°C] = [K] − 273.15 	    [K] = [°C] + 273.15
     * Fahrenheit 	    [°F] = [K] × ​9⁄5 − 459.67 	[K] = ([°F] + 459.67) × ​5⁄9
     */

    public static decimal FromKelvinToCelsius(decimal kelvinParam)
    {
        return (kelvinParam - 273.15M);
    }
    
    public decimal MeltingInCelsius()
    {
        return FromKelvinToCelsius(melt);
    }

    public override string ToString()
    {
        return name + "'s atomic number is " + atomicNumber + "\n"
               + "It melts at " + melt + "K (" + MeltingInCelsius() +
               "°C).\n";
    }
}