// DelegateExamples - Demonstrate various uses of raw delegates,
//    anonymous methods, and the equivalent new lambda expressions (Ch 16).
using System;
using System.Collections.Generic;

namespace DelegatesExamples
{
  class Program
  {
    // -------- Delegate definitions --------

    // Delegates are types, so define them either in a namespace or inside a class.
    // They can't be declared inside a method.

    // Define a delegate just as you would any object. This one takes a string and has no return type.
    delegate void DoIt(string msg);
    // This one takes an int and returns an int.
    delegate int AgeIsNothing(int n);
    // This one takes two ints and returns an int.
    delegate int HandleTwo(int n, int m);

    static void Main(string[] args)
    {
      // -------- Most of the examples work with these lists --------

      List<int> numbers = new List<int>() { 0, 1, 2, 3, 4, 5, 6, 7, 8, 9 };
      List<string> words = new List<string> { "one", "two", "three", "four", "five" };
      Console.WriteLine("Our starting numbers list:");
      foreach (int item in numbers)
      {
        Console.Write("{0}, ", item);
      }
      Console.WriteLine();
      Console.WriteLine("Our starting words list:");
      foreach (string item in words)
      {
        Console.Write("{0}, ", item);
      }
      Console.WriteLine();

      // -------- Delegate examples --------

        // -------- Doing the same thing with a "raw" delegate, an anonymous methd, and a lambda expression --------

      Console.WriteLine("\nThe following three examples do essentially the same task using "
        + "C# 1.x's raw delegates, C# 2.0's anonymous methods, and C# 3.0's lambda expressions (Ch 16):");

      // Example 1a. Invoke the delegate the C# 1.x (1.0 and 1.1) way: with a "raw" delegate.
      Console.WriteLine("\n1a. Using a plain old raw delegate:");
      DoIt doSomethingOld = new DoIt(PrintThis);  // Pass callback method name to delegate instantiation.
      if (doSomethingOld != null)
      {
        doSomethingOld("\tThe C# 1.x way: Hello, I'm your standard old delegate!");  // Invoke the delegate.
      }

      // Example 1b. Invoke the delegate the simpler C# 2.0 way: with an anonymous method.
      Console.WriteLine("\n1b. Using a newer anonymous method: ");
      // This example creates the delegate, then invokes it.
      DoIt doSomethingNewer = delegate(string msg) { Console.WriteLine(msg); };
      if (doSomethingNewer != null)
      {
        doSomethingNewer("\tThe C# 2.0 way: Hello, I'm a cool anonymous method.");  // Invoke the delegate.
      }

      // Example 1c. Invoke the delegate the really simple 3.0 way: with a lambda expression.
      Console.WriteLine("\n1c. Using a lambda expression: ");
      DoIt doSomethingReallyNew = new DoIt(msg => Console.WriteLine(msg));
      if (doSomethingReallyNew != null)
      {
        // Invoke the delegate.
        doSomethingReallyNew("\tThe new C# 3.0 way: Pay no attention to the old-fashioned dudes. I'm a hot new lambda expression.");
      }

      // Doing the do-to-each problem using raw delegates, anonymous methods, and lambdas.
      // See Chapter 16 for the do-to-each problem.
      Console.WriteLine("\n2. A few do-to-each examples (not discussed in the Delegates and Events chapter):");
      Console.Write("\t2a. First, find numbers > 5 in a list with a raw delegate: ");
      int firstNumberGreaterThanFive = numbers.Find(NumberGT5);
      Console.WriteLine(firstNumberGreaterThanFive.ToString());

      Console.Write("\t2b. Next, find numbers > 7 in a list with an anonymous method: ");
      int firstNumberGreaterThanSeven = numbers.Find(delegate(int num) { return num > 7; });
      Console.WriteLine(firstNumberGreaterThanSeven);

      Console.WriteLine("\t2c. Last, find numbers > 5 and < 8 in a list with a lambda expression: ");
      List<int> allNumbersGT5AndLT8 = numbers.FindAll(num => num > 5 && num < 8);
      foreach (int n in allNumbersGT5AndLT8)
      {
        Console.WriteLine("\t{0}", n.ToString());
      }
      Console.WriteLine();

      // -------- Anonymous methods vs. lambda expressions --------

      Console.WriteLine("\n3a. Do an action on numbers list using an anonymous method:");
      numbers.ForEach(delegate(int num) { Console.WriteLine("Number before {0} is {1}", num, num - 1); });

      Console.WriteLine("\n3b. Do an action on numbers list using a lambda expression:");
      // You can also make a compact loop with this kind of code.
      numbers.ForEach(i => Console.WriteLine("I'm {0}; my square is {1}", i, i * i));

      // Use an anonymous method to supply an on-the-fly delegate instance to a work-horse method that
      // takes a delegate-type parameter. The delegate is called HandleTwo - see delegate definitions.
      // Instead of creating the delegate, then invoking it, this example simply creates it in the
      // process of passing a delegate instance to a method.
      Console.WriteLine("\n4. Another Anonymous Method Example: ");
      int result = Multiply(2, 3, delegate(int n, int m) { return n * m; });
      Console.WriteLine("\tProduct of {0} * {1} is {2}", 2, 3, result);

      // Now do the same as above, but with a lambda expression.
      // Note: This is an example of a lambda that takes multiple parameters.
      // That's because it's based on a delegate that takes two parameters, the HandleTwo delegate
      // (technically, the lambda gets resolved to a delegate similar to HandleTwo).
      Console.WriteLine("\n5. Previous example but with a lambda expression: ");
      int result3 = Multiply(2, 3, (n, m) => n * m);
      Console.WriteLine("\tProduct of {0} * {1} is {2}", 2, 3, result3);

      Console.WriteLine("\n6. Try invoking a null delegate: Oops!");
      try
      {
        int result4 = Multiply(2, 3, null);
      }
      catch (ArgumentNullException e)
      {
        Console.WriteLine(e.Message);
      }
      Console.WriteLine("\nPress Enter to terminate...");
      Console.Read();
    }

    // -------- Methods to be supplied to raw delegates --------

    // A method conforming to the DoIt delegate signature.
    static void PrintThis(string message)
    {
      Console.WriteLine(message);
    }

    // A method conforming to the Predicate<T> delegate signature.
    static bool NumberGT5(int num)
    {
      return num > 5;
    }

    // A method conforming to the Action<T> delegate signature.
    static int NumberAfterMeIs(int number)
    {
      return number + 1;
    }

    // A method requiring a HandleTwo delegate argument.
    static int Multiply(int x, int y, HandleTwo proc)
    {
      // Always check the delegate for null before trying to
      // invoke it.
      if (proc == null)
      {
        // Oops! Delegate no good.
        // See Bonus Chapter 2 for exceptions.
        throw new ArgumentNullException("Null delegate passed.");
      }
      return proc(x, y);
    }

  }
}
