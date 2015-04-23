// AccessorPropertyShortcuts - Demonstrate the new C# 3.0 capability for
//    the compiler to write routine C# properties for you.
using System;

namespace AccessorPropertyShortcuts
{
  class Program
  {
    static void Main(string[] args)
    {
      // Instantiate a class with some shortcut property declarations.
      MyClass mc = new MyClass();
      // Use one property's set accessor.
      mc.AnInt = 3;
      // Use both properties' get accessors in this WriteLine statement.
      Console.WriteLine("AnInt = {0}, AnotherInt = {1}", mc.AnInt.ToString(), mc.AnotherInt.ToString());
      // Try to use the private set accessor of a property.
      // mc.AnotherInt = 5;   // Compiler error.

      Console.WriteLine("\nPress Enter to terminate...");
      Console.Read();

    }
  }

  // MyClass - A class that defines two C# properties using the new property-definition syntax
  //    which lets the compiler write the boilerplate property code for you. In addition to
  //    the standard property code:
  //      public int AProperty
  //      {
  //        get { return _aProperty; }
  //      }
  //    the new shortcut syntax, shown below, adds a private variable for the property's data.
  //    Since you never see that variable and don't know what the compiler has called it, you
  //    necessarily have to use the property via its property name, never the underlying private
  //    variable.
  public class MyClass
  {
    // A property with public get and set accessors.
    public int AnInt { get; set; }
    // A property with a public get accessor but a private set accessor.
    public int AnotherInt { get; private set; }
    public MyClass()
    {
      AnInt = 2;       // OK because AnInt is public and both accessors are public.
      AnotherInt = 4;  // OK because although AnotherInt's set accessor is private, we're
                       // only calling it from inside MyClass.
    }
  }
}
