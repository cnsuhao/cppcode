// LettingExceptionsGoBy - Demonstrate how methods can catch
//    just the exceptions that they're prepared to handle.
using System;

namespace LettingExceptionsGoBy
{
  // Introduce some type of 'MyClass'.
  // We won't worry about its contents here, hence the empty body.
  public class MyClass{}

  // MyException -  Add a reference to MyClass to the standard
  //    exception class. We'll make things more interesting by
  //    giving the class a more exciting name than CustomException.
  public class MyException : Exception
  {
    private MyClass _myobject;

    // The three standard constructors.
    public MyException() : base() { }
    public MyException(string message) : base(message) { }
    public MyException(string message, Exception inner) 
      : base(message, inner) { }

    // A custom constructor that takes a MyClass.
    public MyException(string msg, MyClass mo) : base(msg)
    {
      _myobject = mo;
    }
    // You might also want a does-it-all constructor that takes a string, an
    // Exception, and a MyClass. Not shown.

    // Give outside classes access to an informative object.
    public MyClass MyCustomObject{ get {return _myobject;}}
  }

  public class Program
  {
    // M1 - Catch generic exception object.
    public void m1(bool exceptionType)
    {
      try
      {
        m2(exceptionType);
      }
      catch(Exception e)
      {
        Console.WriteLine("Caught a generic exception in m1()");
        Console.WriteLine(e.Message);
        // Always rethrow after catching a general exception -- except in 
        // Main()! Better to catch specific exception types.
        throw;
      }
    }

    // M2 - Be prepared to catch a MyException.
    public void m2(bool exceptionType)
    {
      try
      {
        m3(exceptionType);
      }
      catch(MyException me)  // Specific.
      {
        Console.WriteLine("Caught a MyException in m2()");
        Console.WriteLine(me.Message);
        // If you recover here, probably no need to rethrow.
      }
    }

    // M3 - Don't bother to 'try' any exceptions.
    public void m3(bool exceptionType)
    {
      m4(exceptionType);
    }

    // M4 - Throw one of two types of exceptions.
    public void m4(bool exceptionType)
    {
      // We're working with some local object.
      MyClass mc = new MyClass();

      if(exceptionType)
      {
        // Error occurs - Throw the object with the exception.
        throw new MyException("MyException thrown in m4()", mc);
      }
      throw new Exception("Generic Exception thrown in m4()");
    }

    public static void Main(string[] args)
    {
      try
      {
        // Now throw one of my exceptions.
        Console.WriteLine("Throw a specific exception first");
        new Program().m1(true);

        // Throw a generic exception first.
        Console.WriteLine("\nNow throw a generic exception");
        new Program().m1(false);
      }
      catch (Exception e)
      {
        Console.WriteLine("Last chance for a {0} exception.", e.ToString());
      }
      // Wait for user to acknowledge.
      Console.WriteLine("Press Enter to terminate...");
      Console.Read();
    }
  }
}
