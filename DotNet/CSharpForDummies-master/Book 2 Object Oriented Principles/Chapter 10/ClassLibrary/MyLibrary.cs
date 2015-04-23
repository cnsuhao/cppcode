// ClassLibrary - A simple class library and its driver program.

// File: ClassLibrary.cs in ClassLibrary project.
using System;
namespace ClassLibrary
{
  public class MyLibrary
  {
    public void LibraryFunction1()
    {
      Console.WriteLine("This is LibraryFunction1()");
    }
    public static int LibraryFunction2(int input)
    {
      Console.WriteLine("This is LibraryFunction2(), returning {0}", input);
      return input;  // Just parrot the input.
    }
  }
}
