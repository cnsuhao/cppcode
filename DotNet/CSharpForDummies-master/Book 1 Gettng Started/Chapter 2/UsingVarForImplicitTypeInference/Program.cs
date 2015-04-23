// UsingVarForImplicitTypeInference - Demonstrate how you can use the new
//    C# 3.0 var keyword to let the compiler figure out the type of a
//    variable from its "initializer". That's what "implicit type inference"
//    means: "Let the compiler figure it out."
using System;

namespace UsingVarForImplicitTypeInference
{
  class Program
  {
    static void Main(string[] args)
    {
      Console.WriteLine("Examples of the var keyword:\n");

      // Implicitly declare an int with the value 5.
      var i = 5;        // Same as int i = 5;
      // Show that the value of i is 5.
      Console.Write(i.ToString() + " is a ");
      // Show that the type of i is int. The compiler figured this out
      // from the type of the numeric literal '5'.
      // This writes "System.Int32", the formal name for int:
      Console.WriteLine(i.GetType().ToString() + "\n"); 

      // Now use var for a string.
      var s = "Hello";  // Same as string s = "Hello";
      Console.Write(s + " is a ");
      // This writes "System.String".
      Console.WriteLine(s.GetType().ToString() + "\n");

      // And use var for a double value.
      var d = 1.0;      // Same as double d = 1.0;
      Console.Write("{0:f1} is a ", d);
      // This writes "System.Double".
      Console.WriteLine(d.GetType().ToString());
      Console.WriteLine();

      // You can also use var for many other kinds of variables that
      // I haven't introduced yet as of Chapter 2.

      // Wait for user to acknowledge results.
      Console.WriteLine("Press Enter to terminate...");
      Console.Read();
    }
  }
}
