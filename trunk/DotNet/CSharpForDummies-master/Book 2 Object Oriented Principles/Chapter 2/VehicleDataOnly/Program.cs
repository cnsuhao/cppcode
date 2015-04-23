// VehicleDataOnly - Create a Vehicle object, populate its
//    members from the keyboard and then write it back out.
using System;

namespace VehicleDataOnly
{
  public class Vehicle
  {
    public string model;         // Name of the model.
    public string manufacturer;  // Ditto.
    public int numOfDoors;       // The number of doors on the vehicle.
    public int numOfWheels;      // You get the idea.
  }

  public class Program
  {
    // This is where the program starts.
    static void	Main(string[] args)
    {
      // Prompt	user to enter her name.
      Console.WriteLine("Enter the properties of your vehicle");

      // Create an instance of Vehicle.
      Vehicle myCar = new Vehicle();

      // Populate a data member via a temporary variable.
      Console.Write("Model name = ");
      string s = Console.ReadLine();
      myCar.model = s;

      // Or you can populate the data member directly.
      Console.Write("Manufacturer name = ");
      myCar.manufacturer = Console.ReadLine();

      // Enter the remainder of the data.
      // A temp is useful for reading ints.
      Console.Write("Number of doors = ");
      s = Console.ReadLine();
      myCar.numOfDoors	= Convert.ToInt32(s);

      Console.Write("Number of wheels = ");
      s = Console.ReadLine();
      myCar.numOfWheels = Convert.ToInt32(s);

      // Now display the results.
      Console.WriteLine("\nYour vehicle is a ");
      Console.WriteLine(myCar.manufacturer + " " + myCar.model);
      Console.WriteLine("with " + myCar.numOfDoors + " doors, "
                      + "riding on " + myCar.numOfWheels
                      + " wheels.");

      // Wait for user to acknowledge the results.
      Console.WriteLine("Press Enter to terminate...");
      Console.Read();
    }
  }
}
