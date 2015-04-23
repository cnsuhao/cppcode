// FactorialWithError - Create and exercise a factorial
//    method that has no error checks at all.
using System;

namespace FactorialWithError
{
  // MyMathFunctions - A collection of mathematical functions
  //    we created (it's not much to look at yet).
  public static class MyMathFunctions
  {
    // Factorial - Return the factorial of the provided value.
    public static double Factorial(double value)
    {
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
        // Display the result of each pass.
        Console.WriteLine("i = {0}, factorial = {1}",
                           i, MyMathFunctions.Factorial(i));
      }

      // Wait for user to acknowledge.
      Console.WriteLine("Press Enter to terminate...");
      Console.Read();
    }
  }
}
