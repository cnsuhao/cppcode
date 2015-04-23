// InvokeBaseConstructor - Demonstrate how a subclass can
//    invoke the base class constructor of its choice using 
//    the base keyword.
using System;

namespace InvokeBaseConstructor
{
  public class BaseClass
  {
    public BaseClass()
    {
      Console.WriteLine("Constructing BaseClass (default)");
    }
    public BaseClass(int i)
    {
      Console.WriteLine("Constructing BaseClass({0})", i);
    }
  }

  public class SubClass : BaseClass
  {
    public SubClass()
    {
      Console.WriteLine("Constructing SubClass (default)");
    }
    public SubClass(int i1, int i2) : base(i1)
    {
      Console.WriteLine("Constructing SubClass({0}, {1})", i1,  i2);
    }
  }

  public class Program
  {
    public static void Main(string[] args)
    {
      Console.WriteLine("Invoking SubClass()");
      SubClass sc1 = new SubClass();

      Console.WriteLine("\ninvoking SubClass(1, 2)");
      SubClass sc2 = new SubClass(1, 2);

      // Wait for user to acknowledge.
      Console.WriteLine("Press Enter to terminate...");
      Console.Read();
    }
  }
}
