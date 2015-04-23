// DemonstrateConstructorWithInitializer - Demonstrate the use of
//    data member initializers instead of using constructor.
using System;

namespace DemonstrateConstructorWithInitializer
{
  // MyObject - Create a class with a noisy constructor
  //    and an internal object.
  public class MyObject
  {
    // This member is a property of the class (it's static).
    private static MyOtherObject _staticObj = new MyOtherObject();

    // This member is a property of each instance.
    private MyOtherObject _dynamicObj = new MyOtherObject();

    // Constructor (a real chatterbox).
    public MyObject()
    {
      Console.WriteLine("MyObject constructor starting");
      Console.WriteLine(
        "(Both static data members initialized before this constructor)");
      // _dynamicObj construction was here, now moved up.
      Console.WriteLine("MyObject constructor ending");
    }
  }

  // MyOtherObject - This class also has a noisy constructor
  //    but no internal members.
  public class MyOtherObject
  {
    public MyOtherObject()
    {
      Console.WriteLine("MyOtherObject constructing");
    }
  }

  public class Program
  {
    public static void Main(string[] args)
    {
      Console.WriteLine("Main() starting");
      Console.WriteLine("Creating a local MyObject in Main():");
      MyObject localObject = new MyObject();

      // Wait for user to acknowledge the results.
      Console.WriteLine("Press Enter to terminate...");
      Console.Read();
    }
  }
}
