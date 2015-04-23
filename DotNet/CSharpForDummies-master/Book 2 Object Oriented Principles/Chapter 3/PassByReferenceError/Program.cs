// PassByReferenceError - Demonstrate a potential error situation
//    when calling a method using reference arguments.
using System;

namespace PassByReferenceError
{
  public class Program
  {
    // Update - Try to modify the values of the arguments
    //    passed to it by reference.
    public static void DisplayAndUpdate(ref int var1, ref int var2)
    {
      Console.WriteLine("The initial value of var1 is " + var1);
      var1 = 10;

      Console.WriteLine("The initial value of var2 is " + var2);
      var2 = 20;
    }

    public static void Main(string[] args)
    {
      // Declare two variables and initialize them.
      int n = 1;
      Console.WriteLine("Before the call to Update(ref n, ref n):");
      Console.WriteLine("n = " + n);
      Console.WriteLine();

      // Invoke the method.
      DisplayAndUpdate(ref n, ref n);

      // Notice that n changes in an unexpected way.
      Console.WriteLine();
      Console.WriteLine("After the call to Update(ref n, ref n):");
      Console.WriteLine("n = " + n);

      // Wait for user to acknowledge.
      Console.WriteLine("Press Enter to terminate...");
      Console.Read();
    }
  }
}
