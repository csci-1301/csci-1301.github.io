class Room
{
    private string building;
    private int number;
    private bool computer;

    public bool GetComputer()
    {
        return computer;
    }

    public void SetComputer(bool compP)
    {
        computer = compP;
    }

    public string GetBuilding()
    {
        return building;
    }

    public Room(string bP, int nP, bool cP)
    {
        building = bP;
        if (nP > 0 && nP < 1000)
            number = nP;
        else
            number = 0;
        computer = cP;
    }

    public Room() { } //Empty Constructor

    /* GetCode
       Returns the code corresponding to the building:
         Allgood Hall -> AH
         University Hall -> UH
         ? -> Unknown
    */
    public string GetCode()
    {
        string code;
        switch (building)
        {
            case "Allgood Hall":
                code = "AH";
                break;
            case "University Hall":
                code = "UH";
                break;
            //Other Cases Here
            default:
                code = "Unknown";
                break;
        }
        return code;
    }

    public override string ToString()
    {
        //return $"This room is located in {building}({GetCode()}), {number}.{(computer ? "\nIt has a computer." : "")}";
        string result;
        result = $"This room is located in {building} ({GetCode()}), {number}.";
        if (computer)
            result += $"\nIt has a computer.";
        else
            result += "\nIt does not have a computer.";
        return result;
    }

    public bool InSameBuilding(Room roomP)
    {
        bool result = false;
        if (building == roomP.GetBuilding())
            result = true;

        /* Alt Version 1
         Does not work if building value in both objects are empty,
         since default GetCode is "Unknown"
         */
        /*
        if (GetCode() == roomP.GetCode())
        result = true;
        */
        return result;

        /* Alt Version 2, shorther: */
        //return building == roomP.GetBuilding();
    }

    //Method Idea: Tell the user how many floors to go up and how many rooms to go over based on number
    public string RoomRoute()
    {
        int floors = number / 100;
        int rooms = number - (floors * 100);
        string instructions = "";

        while (floors > 1)
        {
            instructions += "Going Up!\n";
            floors--;
        }
        while (rooms > 1)
        {
            instructions += "Next Room! ";
            rooms--;
        }
        instructions += "\nYou're Here!";

        return instructions;
    }
}
