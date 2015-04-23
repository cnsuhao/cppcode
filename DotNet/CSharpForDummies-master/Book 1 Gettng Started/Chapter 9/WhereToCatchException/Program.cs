// WhereToCatchException - Demonstrate how an exception unwinds the
//    stack in search of a handler and how you should let it percolate
//    up to a level where there's enough information to deal with it.
using System;

namespace WhereToCatchException
{
  class Program
  {
    static void Main(string[] args)
    {
      // This is a last-chance exception handler with a more specific
      // handler nested inside it.
      try
      {
        int i = 1;
        // This loop, and the value of i, will help retry the operation
        // if it throws an exception. It will throw the first time; we
        // fix the problem; and it successfully executes the second time.
        for (; ; )
        {
          try
          {
            // This method (or one that it calls) could throw exceptions.
            LocalHelperMethod(i);
            break;  // We got here, meaning no exceptions occurred, so
                    // get out of the loop.
          }
          catch (MyException)
          {
            // You should generally only catch an exception if (and where) you 
            // have enough context to do something useful with it: fix the 
            // problem and try again, fall back to a previous good state and 
            // try again, convert the exception to a more general
            // (usually application-specific) exception, etc. 

            // "Fix" the problem.
            if (i == 1) i = 3;
            Console.WriteLine("Fixed MyException in Main()");
          }
          Console.WriteLine("In Main after fix: i = {0}", i);
        }
      }
      catch (Exception)
      {
        Console.WriteLine("Write a friendly message here and adios.");
      }
      // Wait for user to acknowledge results.
      Console.WriteLine("Press Enter to terminate...");
      Console.Read();
    }

    static void LocalHelperMethod(int item)
    {
      // Just let exceptions go on by to my caller.
      // I don't know enough here to do any good, so I
      // shouldn't catch exceptions here.
      PrimaryClass pc = new PrimaryClass();
      pc.BossMethod(item);
    }
  }

}
