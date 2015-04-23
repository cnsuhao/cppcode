// NonrecursiveFactorial - Demonstrate a nonrecursive factorial
//    algorithm in contrast to the RecursiveFactorial example.
//    This one is essentially the same as the other Factorial
//    examples covered in Bonus Chapter 2.
using System;

namespace NonrecursiveFactorial
{
  class Program
  {
    static void Main(string[] args)
    {
      double result = Factorial(10);

      Console.WriteLine("The nonrecursively-obtained factorial of 10 is {0}", result);

      // Wait for user to acknowledge results.
      Console.WriteLine("Press Enter to terminate...");
      Console.Read();
    }

    public static double Factorial(int value)
    {
      // Don't allow negative numbers.
      if (value < 0)
      {
        // Report negative argument.
        string s = String.Format(
             "Illegal negative argument to Factorial {0}", value);

        throw new Exception(s);
      }

      // Begin with an "accumulator" of 1.
      double factorial = 1.0;

      // Loop from value down to one, each time multiplying.
      // The previous accumulator value by the result.
      do
      {
        factorial *= value;
      } while(--value > 1);

      // Return the accumulated value.
      return factorial;
    }
  }

}
