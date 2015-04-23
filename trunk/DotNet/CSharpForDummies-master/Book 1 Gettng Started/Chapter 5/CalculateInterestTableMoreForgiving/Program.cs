// CalculateInterestTableMoreForgiving - Calculate the interest paid on a 
//    given principal over a period of years. This version gives the user 
//    multiple chances to input the legal principal and interest.
using System;
namespace CalculateInterestTableMoreForgiving
{
  using System;

  public class Program
  {
    public static void Main(string[] args)
    {
      // Define a maximum interest rate.
      int maximumInterest = 50;

      // Prompt user to enter source principal; keep prompting
      // until you get the correct value.
      decimal principal;
      while(true)
      {
        Console.Write("Enter principal: ");
        string principalInput = Console.ReadLine();
        principal = Convert.ToDecimal(principalInput);

        // Exit if the value entered is correct.
        if (principal >= 0)
        {
          break;
        }

        // Generate an error on incorrect input.
        Console.WriteLine("Principal cannot be negative");
        Console.WriteLine("Try again");
        Console.WriteLine();
      }

      // Now enter the interest rate.
      decimal interest;
      while(true)
      {
        Console.Write("Enter interest: ");
        string interestInput = Console.ReadLine();
        interest = Convert.ToDecimal(interestInput);

        // Don't accept interest that is negative or too large...
        if (interest >= 0 && interest <= maximumInterest)
        {
          break;
        }

        // ...generate an error message as well.
        Console.WriteLine("Interest cannot be negative " +
                          "or greater than " + maximumInterest);
        Console.WriteLine("Try again");
        Console.WriteLine();
      }

      // Both the principal and the interest appear to be
      // legal; finally, input the number of years.
      Console.Write("Enter number of years: ");
      string durationInput = Console.ReadLine();
      int duration = Convert.ToInt32(durationInput);

      // Verify the input.
      Console.WriteLine();  // Skip a line.
      Console.WriteLine("Principal     = " + principal);
      Console.WriteLine("Interest      = " + interest + "%");
      Console.WriteLine("Duration      = " + duration + " years");
      Console.WriteLine();


      // Now loop through the specified number of years.
      principal = OuputInterestTable(principal, interest, duration);

      // Wait for user to acknowledge the results.
      Console.WriteLine("Press Enter to terminate...");
      Console.Read();
    }

    private static decimal OuputInterestTable(decimal principal, decimal interest, int duration)
    {
      int year = 1;
      while (year <= duration)
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

        // Skip over to next year.
        year = year + 1;
      }
      return principal;
    }
  }
}
