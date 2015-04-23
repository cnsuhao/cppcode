// AverageAndDisplayOverloaded - This version demonstrates that
//    the AverageAndDisplay method can be overloaded.
using System;

namespace AverageAndDisplayOverloaded
{
  public class Program
  {
    public static void Main(string[] args)
    {
      // Access the first version of the method.
      AverageAndDisplay("my GPA", 3.5, "your GPA", 4.0);
      Console.WriteLine();

      // Access the second version of the method.
      AverageAndDisplay(3.5, 4.0);

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
                      + " whose value is " + d1);
      Console.WriteLine("and "            + s2
                      + " whose value is " + d2
                      + " is " + average);
    }
    public static void AverageAndDisplay(double d1, double d2)
    {
      double average = (d1 + d2) / 2;
      Console.WriteLine("The average of " + d1
                      + " and "           + d2
                      + " is " + average);
    }
  }
}
