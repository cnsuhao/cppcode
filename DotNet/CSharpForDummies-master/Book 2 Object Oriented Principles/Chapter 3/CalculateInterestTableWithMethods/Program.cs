// CalculateInterestTableWithMethods - Generate an interest table
//    much like the other interest table programs, but this time using a
//    reasonable division of labor among several methods.
using System;

namespace CalculateInterestTableWithMethods
{
  public class Program
  {
    public static void Main(string[] args)
    {
      // Input the data you will need to create the table.
      decimal principal = 0M;
      decimal interest = 0M;
      decimal duration = 0M;
      InputInterestData(ref principal, ref interest, ref duration);

      // Verify the data by mirroring it back to the user.
      Console.WriteLine();  // Skip a line.
      Console.WriteLine("Principal     = " + principal);
      Console.WriteLine("Interest      = " + interest + "%");
      Console.WriteLine("Duration      = " + duration + " years");
      Console.WriteLine();

      // Finally, output the interest table.
      OutputInterestTable(principal, interest, duration);

      // Wait for user to acknowledge the results.
      Console.WriteLine("Press Enter to terminate...");
      Console.Read();
    }

    // InputInterestData - Retrieve from the keyboard the
    //    principal, interest and duration information needed 
    //    to create the future value table.
    public static void InputInterestData(ref decimal principal,
                                         ref decimal interest,
                                         ref decimal duration)
    {
      // Retrieve the principal.
      principal = InputPositiveDecimal("principal");

      // Now enter the interest rate.
      interest = InputPositiveDecimal("interest");

      // Finally, the duration.
      duration = InputPositiveDecimal("duration");
    }

    // InputPositiveDecimal - Return a positive decimal number 
    //    from the keyboard.
    public static decimal InputPositiveDecimal(string prompt)
    {
      // Keep trying until the user gets it right.
      while(true)
      {
        // Prompt the user for input.
        Console.Write("Enter " + prompt + ":");

        // Retrieve a decimal value from the keyboard.
        string input = Console.ReadLine();
        decimal value = Convert.ToDecimal(input);

        // Exit the loop if the value entered is correct.
        if (value >= 0)
        {
          // Return the valid decimal value entered by the user.
          return value;
        }

        // Otherwise, generate an error on incorrect input.
        Console.WriteLine(prompt + " cannot be negative");
        Console.WriteLine("Try again");
        Console.WriteLine();
      }
    }

    // OutputInterestTable - Given the principal and interest
    //    generate a future value table for the number of periods 
    //    indicated in duration.
    public static void OutputInterestTable(decimal principal,
                                           decimal interest,
                                           decimal duration)
    {
      for (int year = 1; year <= duration; year++)
      {
        // Calculate the value of the principal plus interest.
        decimal interestPaid;
        interestPaid = principal * (interest / 100);

        // Now calculate the new principal by adding
        // the interest to the previous principal.
        principal = principal + interestPaid;

        // Round off the principal to the nearest cent.
        principal = decimal.Round(principal, 2);

        // Output the result.
        Console.WriteLine(year + "-" + principal);
      }
    }
  }
}
