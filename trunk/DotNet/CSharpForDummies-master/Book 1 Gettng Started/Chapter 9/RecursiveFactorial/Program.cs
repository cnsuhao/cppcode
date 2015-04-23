// RecursiveFactorial - Compute the factorial of 10 using a 
//    recursive implementation. For a nonrecursive version, see
//    the NonrecursiveFactorial example.
using System;

namespace RecursiveFactorial
{
  class Program
  {
    static void Main(string[] args)
    {
      int result = Factorial(10);

      Console.WriteLine("The factorial of 10 is {0}", result);

      // Wait for user to acknowledge results.
      Console.WriteLine("Press Enter to terminate...");
      Console.Read();
    }

    // Factorial - A recursively implemented version.
    private static int Factorial(int num)
    {
      // This is the "bottom-out" test that stops the recursion when
      // num becomes zero.
      if (num <= 1)
      {
        return 1;
      }
      // If we haven't bottomed out, continue computing: recursively.
      return num * Factorial(num - 1);
    }
  }
}
