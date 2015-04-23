// VehicleAndMotor - Create a car and attach a motor. Demonstrate 
//    how to access members of the Vehicle and the motor.
using System;

namespace VehicleAndMotor
{
  public class Program
  {
    public static void Main(string[] args)
    {
      // First create a Motor.
      Motor largerMotor = new Motor();
      largerMotor.power = 230;
      largerMotor.displacement = 4.0;

      // Now create the car.
      Vehicle sonsCar = new Vehicle();
      sonsCar.model = "Cherokee Sport";
      sonsCar.manufacturer = "Jeep";
      sonsCar.numOfDoors = 2;
      sonsCar.numOfWheels = 4;

      // Attach the motor to the car.
      sonsCar.motor = largerMotor;

      Motor m = sonsCar.motor;
      Console.WriteLine("The motor displacement is "
                       + m.displacement);

      Console.WriteLine("The motor displacement is "
                       + sonsCar.motor.displacement);

      // Wait for user to acknowledge the results.
      Console.WriteLine("Press Enter to terminate...");
      Console.Read();
    }
  }
  public class Motor
  {
    public int power;
    public double displacement;    // Engine displacement [liter]
  }
  public class Vehicle
  {
    public string model;           // Name of the model.
    public string manufacturer;    // Ditto.
    public int numOfDoors;         // The number of doors on the vehicle.
    public int numOfWheels;        // You get the idea.
    public Motor motor;
  }
}
