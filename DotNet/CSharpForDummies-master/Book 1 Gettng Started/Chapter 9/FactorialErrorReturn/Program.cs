// FactorialErrorReturn - Create a factorial program that returns an
//    error indication when something goes wrong.
using System;

namespace FactorialErrorReturn
{
  // MyMathFunctions - A collection of mathematical functions
  //    we created (it's not much to look at yet)
  public class MyMathFunctions
  {
    // The following constants represent illegal values.
    public const int NEGATIVE_NUMBER = -1;
    public const int NON_INTEGER_VALUE = -2;

    // Factorial - return the factorial of the provided value.
    public static double Factorial(double value)
    {
      // Don't allow negative numbers.
      if (value < 0)
      {
        return NEGATIVE_NUMBER;
      }

      // Check for non-integer.
      int valueAsInt = (int)value;
      if (valueAsInt != value)
      {
        return NON_INTEGER_VALUE;
      }

      // Begin with an "accumulator" of 1.
      double factorial = 1.0;

      // Loop from value down to one, each time multiplying
      // the previous accumulator value by the result.
      do
      {
        factorial *= value;

        value -= 1.0;
      } while(value > 1);

      // Return the accumulated value.
      return factorial;
    }
  }

  public class Program
  {
    public static void Main(string[] args)
    {
      // Call factorial in a loop from 6 down to -6.
      for (int i = 6; i > -6; i--)
      {
        // Calculate the factorial of the number.
        double factorial = MyMathFunctions.Factorial(i);
        if (factorial == MyMathFunctions.NEGATIVE_NUMBER)
        {
          Console.WriteLine
                      ("Factorial() passed a negative number");
          break;
        }

        if (factorial == MyMathFunctions.NON_INTEGER_VALUE)
        {
          Console.WriteLine
                      ("Factorial() passed a non-integer number");
          break;
        }

        // Display the result of each pass.
        Console.WriteLine("i = {0}, factorial = {1}",
                           i, factorial);
      }

      // Wait for user to acknowledge.
      Console.WriteLine("Press Enter to terminate...");
      Console.Read();
    }
  }
}
