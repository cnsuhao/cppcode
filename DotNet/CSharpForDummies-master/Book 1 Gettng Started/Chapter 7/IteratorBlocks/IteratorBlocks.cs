// IteratorBlocks - Demonstrates using C# 2.0's iterator
//    block approach to writing collection iterators.
using System;
namespace IteratorBlocks
{
  class IteratorBlocks
  {
    //Main - Demonstrate five different applications of
    //   iterator blocks.
    static void Main(string[] args)
    {
      // Instantiate a MonthDays "collection" class.
      MonthDays md = new MonthDays();
      // Iterate it.
      Console.WriteLine("Stream of months:\n");
      foreach (string month in md)
      {
        Console.WriteLine(month);
      }

      // Instantiate a StringChunks "collection" class.
      StringChunks sc = new StringChunks();
      // Iterate it: prints pieces of text.
      // This iteration puts each chunk on its own line.
      Console.WriteLine("\nstream of string chunks:\n");
      foreach (string chunk in sc)
      {
        Console.WriteLine(chunk);
      }
      // And this iteration puts it all on one line.
      Console.WriteLine("\nstream of string chunks on one line:\n");
      foreach (string chunk in sc)
      {
        Console.Write(chunk);
      }
      Console.WriteLine();

      // Instantiate a YieldBreakEx "collection" class.
      YieldBreakEx yb = new YieldBreakEx();
      // Iterate it, but stop after 13.
      Console.WriteLine("\nstream of primes:\n");
      foreach (int prime in yb)
      {
        Console.WriteLine(prime);
      }


      // Instantiate an EvenNumbers "collection" class.
      EvenNumbers en = new EvenNumbers();
      // Iterate it: prints even numbers from 10 down to 4.
      Console.WriteLine("\nstream of descending evens :\n");
      foreach (int even in en.DescendingEvens(11, 3))
      {
        Console.WriteLine(even);
      }

      // Instantiate a PropertyIterator "collection" class.
      PropertyIterator prop = new PropertyIterator();
      // Iterate it: produces one double at a time.
      Console.WriteLine("\nstream of double values:\n");
      foreach (double db in prop.DoubleProp)
      {
        Console.WriteLine(db);
      }

      // Wait for the user to acknowledge.
      Console.WriteLine("Press enter to terminate...");
      Console.Read();

    }
  }

  //MonthDays - Define an iterator that returns the months
  //   and their lengths in days - sort of a "collection" class.
  class MonthDays
  {
    // Here's the "collection"
    string[] months =
            { "January 31", "February 28", "March 31",
              "April 30", "May 31", "June 30", "July 31",
              "August 31", "September 30", "October 31",
              "November 30", "December 31" };

    //GetEnumerator - Here's the iterator - see how it's invoked 
    //   in Main() with foreach.
    public System.Collections.IEnumerator GetEnumerator()
    {
      foreach (string month in months)
      {
        // Return one month per iteration.
        yield return month;
      }
    }
  }

  //StringChunks - Define an iterator that returns chunks of text, 
  //   one per iteration - another oddball "collection" class.
  class StringChunks
  {
    //GetEnumerator - This is an iterator; see how it's invoked 
    //   (twice) in Main.
    public System.Collections.IEnumerator GetEnumerator()
    {
      // Return a different chunk of text on each iteration.
      yield return "Using iterator ";
      yield return "blocks ";
      yield return "isn't all ";
      yield return "that hard";
      yield return ".";
    }
  }

  //YieldBreakEx - Another example of the yield break keyword.
  class YieldBreakEx
  {
    int[] primes = { 2, 3, 5, 7, 11, 13, 17, 19, 23 };
    //GetEnumerator - Returns a sequence of prime numbers
    //   Demonstrates yield return and yield break.
    public System.Collections.IEnumerator GetEnumerator()
    {
      foreach (int prime in primes)
      {
        if (prime > 13) yield break;
        yield return prime;
      }
    }
  }

  //EvenNumbers - Define a named iterator that returns even numbers 
  //   from the "top" value you pass in DOWN to the "stop" value.
  //   Another oddball "collection" class.
  class EvenNumbers
  {
    //DescendingEvens - This is a "named iterator."
    //   Also demonstrates the yield break keyword.
    //   See how it's invoked in Main() with foreach.
    public System.Collections.IEnumerable DescendingEvens(int top,
                                                          int stop)
    {
      // Start top at nearest lower even number.
      if (top % 2 != 0) // If remainder after top / 2 isn't 0.
        top -= 1;
      // Iterate from top down to nearest even above stop.
      for (int i = top; i >= stop; i -= 2)
      {
        if (i < stop)
          yield break;
        // Return the next even number on each iteration.
        yield return i;
      }
    }
  }

  //PropertyIterator - Demonstrate implementing a class
  //   property's get accessor as an iterator block.
  class PropertyIterator
  {
    double[] doubles = { 1.0, 2.0, 3.5, 4.67 };
    // DoubleProp - A "get" property with an iterator block.
    public System.Collections.IEnumerable DoubleProp
    {
      get
      {
        foreach (double db in doubles)
        {
          yield return db;
        }
      }
    }
  }
}
