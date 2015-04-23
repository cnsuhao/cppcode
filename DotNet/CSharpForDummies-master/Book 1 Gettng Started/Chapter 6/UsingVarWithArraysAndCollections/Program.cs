// UsingVarWithArraysAndCollections - Demonstrate the use of the new
//    C# 3.0 var keyword with more data types: arrays and collections.
using System;
using System.Collections.Generic;

namespace UsingVarWithArraysAndCollections
{
  class Program
  {
    static void Main(string[] args)
    {
      // Use var for an array.
      // Note the use of the new implicitly typed array syntax.
      // The compiler looks at the initialization list and infers that the
      // array type you want is int[].
      var numbers = new[] { 1, 2, 3 };
      Console.WriteLine("Array initializer: ");
      foreach (int n in numbers)
      {
        Console.WriteLine(n.ToString());
      }
      // This writes "System.Int32[]".
      Console.WriteLine(numbers.GetType().ToString());
      Console.WriteLine();

      // Use var for a generic list type.
      // Note the use of the new collection initializer syntax, too.
      var names = new List<string> { "Chuck", "Bob", "Steve", "Mike" };
      Console.WriteLine("List of names: ");
      foreach (string s in names)
      {
        Console.WriteLine(s);
      }
      // This writes "System.Collections.Generic.List`1[System.String]".
      // Note that the compiler calls any List<T> a List`1.
      // To look up List<T> in the documentation, specify "List<T>".
      Console.WriteLine(names.GetType().ToString());
      Console.WriteLine();

      // Wait for user to acknowledge results.
      Console.WriteLine("Press Enter to terminate...");
      Console.Read();
    }
  }
}
