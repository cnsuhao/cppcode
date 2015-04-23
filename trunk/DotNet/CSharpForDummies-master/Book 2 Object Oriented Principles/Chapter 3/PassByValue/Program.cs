// PassByValue - Demonstrate pass-by-value semantics.
using System;

namespace PassByValue
{
  public class Program
  {
    // Update - Try to modify the values of the arguments
    //    passed to it; note that you can declare methods
    //    in any order in a class.
    public static void Update(int i, double d)
    {
      i = 10;
      d = 20.0;
    }

    public static void Main(string[] args)
    {
      // Declare two variables and initialize them.
      int i = 1;
      double d = 2.0;
      Console.WriteLine("Before the call to Update(int, double):");
      Console.WriteLine("i = " + i + ", d = " + d);

      // Invoke the Update method.
      Update(i, d);

      // Notice that the values 1 and 2.0 have not changed.
      Console.WriteLine("After the call to Update(int, double):");
      Console.WriteLine("i = " + i + ", d = " + d);

      // Wait for user to acknowledge.
      Console.WriteLine("Press Enter to terminate...");
      Console.Read();
    }
  }
}
