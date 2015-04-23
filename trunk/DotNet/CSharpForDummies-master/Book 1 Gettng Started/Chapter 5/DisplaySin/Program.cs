// DisplaySin - Generates a sine wave on the console
//    by iterating through the angles from 0 to
//    360, and displaying '*' when j = sin(i).
// Note: This program is not discussed in the book.
using System;

namespace DisplaySin
{
  public class Program
  {
    public static void Main(string[] args)
    {
      // We'll need this constant later.
      double twoPI = 2.0 * Math.PI;

      // Enter the loop which iterates through the angle
      // from 1 to 360 deqrees (step 15 degrees at a time).
      for(double degrees = 0.0; degrees <= 360.0; degrees += 15.0)
      {
        // Now convert that angle into radian measure.
        double radian = twoPI * (degrees / 360.0);

        // Convert that angle into a sin which ranges
        // from -1 to 1.
        double sin = Math.Sin(radian);

        // Finally convert that into a percentage that ranges
        // from 0 to 1.
        double percentage = (sin + 1.0) / 2.0;

        // Let's plot that by placing a '*' at the location
        // from left to right that best fits our angle.
        int widthInColumns = 79;
        int target = (int)(widthInColumns * percentage);
        for (int j = 0; j <= widthInColumns; j++)
        {
          char c = ' ';
          if (j == target)
          {
            c = '*';
          }
          Console.Write(c);
        }
        Console.WriteLine();
      }

      // Wait for user to acknowledge the results.
      Console.WriteLine("Press Enter to terminate...");
      Console.Read();
    }
  }
}
