// InheritingAConstructor - Demonstrate that the base class
//    constructor is invoked automatically.
using System;

namespace InheritingAConstructor
{
  public class Program
  {
    public static void Main(string[] args)
    {
      Console.WriteLine("Creating a BaseClass object");
      BaseClass bc = new BaseClass();

      Console.WriteLine("\now creating a SubClass object");
      SubClass sc = new SubClass();

      // Wait for user to acknowledge.
	 Console.WriteLine("Press Enter to terminate...");
	 Console.Read();
    }
  }

  public class BaseClass
  {
    public BaseClass()
    {
      Console.WriteLine("Constructing BaseClass");
    }
  }

  public class SubClass : BaseClass
  {
    public SubClass()
    {
      Console.WriteLine("Constructing SubClass");
    }
  }
}
