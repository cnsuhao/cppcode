// ConvertTemperatureWithRoundOff - This program prompts the user for
//    a temperature in degrees Fahrenheit. The program converts the 
//    temperature to degrees Celsius and outputs the result;
//    However, the use of integer roundoff causes the program to 
//    output incorrect results.
using System;
namespace ConvertTemperatureWithRoundOff
{
  class Program
  {
    static void Main(string[] args)
    {
      // Prompt user to enter temperature.
      Console.Write("Enter temp in degrees Fahrenheit:");

      // Read the number entered.
      string fahrInput = Console.ReadLine();
      int fahr = Convert.ToInt32(fahrInput);

      // Convert that temperature into degrees Celsius.
      int celsius;
      celsius = (fahr - 32) * (5 / 9);

      // Output the result.
      Console.WriteLine(
          "Incorrect temperature in degrees Celsius = "
        + celsius);

      // Wait for user to acknowledge.
      Console.WriteLine("Press Enter to terminate...");
      Console.Read();
    }
  }
}
