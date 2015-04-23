// PassByReference - Demonstrate pass-by-reference semantics.
using System;

namespace PassByReference
{
  public class Program
  {
    // Update - Try to modify the values of the arguments
    //    passed to it; note ref and out parameters.
    public static void Update(ref int i, out double d)
    {
      i = 10;
      d = 20.0;
    }

    public static void Main(string[] args)
    {
      // Declare two variables and initialize them.
      int i = 1;
      double d;
      Console.WriteLine("Before the call to Update(ref int, out double):");
      Console.WriteLine("i = " + i + ", d is not initialized");

      // Invoke the Update method.
      Update(ref i, out d);

      // Notice that i now equals 10 and d equals 20.
      Console.WriteLine("After the call to Update(ref int, out double):");
      Console.WriteLine("i = " + i + ", d = " + d);

      // Wait for user to acknowledge.
      Console.WriteLine("Press Enter to terminate...");
      Console.Read();
    }
  }
}
