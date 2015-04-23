// AverageAndDisplay - Demonstrate argument passing.
using System;

namespace Example
{
  public class Program
  {
    public static void Main(string[] args)
    {
      // Access the member method.
      AverageAndDisplay("grade 1", 3.5, "grade 2", 4.0);

      // Wait for user to acknowledge.
      Console.WriteLine("Press Enter to terminate...");
      Console.Read();
    }

    // AverageAndDisplay - Average two numbers with their
    //    labels and display the results.
    public static void AverageAndDisplay(string s1, double d1,
                                         string s2, double d2)
    {
      double average = (d1 + d2) / 2;
      Console.WriteLine("The average of "  + s1
                      + " whose value is " + d1
                      + " and "            + s2
                      + " whose value is " + d2
                      + " is " + average);
    }
  }
}
