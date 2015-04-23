// FactorialException - Create a factorial program that reports illegal
//    Factorial() arguments using an Exception.
using System;

namespace FactorialException
{
  // MyMathFunctions - A collection of mathematical functions
  //    we created (it's not much to look at yet).
  public class MyMathFunctions
  {
    // Note: Put <exception> inside the <summary> block to get your
    // exception list to appear in Visual Studio tool tips.
    /// <summary>
    /// Factorial - Return the factorial of the provided value.
    /// (Note: This is an XML comment. See Bonus Chapter 5.)
    /// <exception>Throws ArgumentException if value is negative.</exception>
    /// </summary>
    /// <param name="value">A number whose factorial you want.</param>
    /// <returns>The factorial.</returns>
    public static int Factorial(int value)
    {
      // Don't allow negative numbers.
      if (value < 0)
      {
        // Report negative argument.
        string s = String.Format(
             "Illegal negative argument to Factorial {0}", value);

        throw new ArgumentException(s);
      }

      // Begin with an "accumulator" of 1.
      int factorial = 1;

      // Loop from value down to one, each time multiplying
      // the previous accumulator value by the result.
      do
      {
        factorial *= value;
      } while(--value > 1);

      // Return the accumulated value.
      return factorial;
    }
  }

  public class Program
  {
    public static void Main(string[] args)
    {
      try
      {
        // Call factorial in a loop from 6 down to -6.
        for (int i = 6; i > -6; i--)
        {
          // Calculate the factorial of the number.
          int factorial = MyMathFunctions.Factorial(i);

          // Display the result of each pass.
          Console.WriteLine("i = {0}, factorial = {1}",
                            i, factorial);
        }
      }
      catch(ArgumentException e)
      {
        // This is a "last-chance" exception handler - the buck stops at Main().
        // Probably all you can do here is alert the user before quitting.
        Console.WriteLine("Fatal error:");
        // When you're ready to release the program, change this 
        // output to something in plain English, preferably with guide-
        // lines for what to do about the problem.
        Console.WriteLine(e.ToString());
      }

      // Wait for user to acknowledge.
      Console.WriteLine("Press Enter to terminate...");
      Console.Read();
    }
  }
}
