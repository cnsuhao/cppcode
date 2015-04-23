// ConvertTemperatureWithFloat - This program prompts the user for
//    a temperature in degrees Fahrenheit. The program converts the 
//    temperature to degrees Celsius and outputs the result.
//    This version of the program avoids roundoff error by 
//    using floating point arithmetic.
using System;
namespace ConvertTemperatureWithFloat
{
  public class Program
  {
    public static int Main(string[] args)
    {
      // Prompt user to enter temperature.
      Console.Write("Enter temp in degrees Fahrenheit:");

      // Read the number entered.
      string fahrInput = Console.ReadLine();
      double fahr = Convert.ToDouble(fahrInput);

      // Convert that temperature into degrees Celsius.
      double celsius = (fahr - 32.0) * (5.0 / 9.0);

      // Output the result.
      Console.WriteLine("Temperature in degrees Celsius = "
                       + celsius);

      // Wait for user to acknowledge the results.
      Console.WriteLine("Press Enter to terminate...");
      Console.Read();
      return 0;
    }
  }
}
