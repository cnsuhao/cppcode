// ClassLibrary driver program.
// File Program.cs in ClassLibraryDriver project.
using System;
using ClassLibrary;
namespace ClassLibraryDriver
{
  class Program
  {
    static void Main(string[] args)
    {
      // Create a library object and use its methods.
      MyLibrary ml = new MyLibrary();
      ml.LibraryFunction1();
      // Call its static functions through the class.
      int result = MyLibrary.LibraryFunction2(27);
      Console.WriteLine(result.ToString());
      // Wait for user to acknowledge the results.
      Console.WriteLine("Press Enter to terminate...");
      Console.Read();
    }
  }
}
