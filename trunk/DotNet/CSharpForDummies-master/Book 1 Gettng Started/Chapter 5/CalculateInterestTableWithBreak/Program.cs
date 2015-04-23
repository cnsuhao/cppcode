// CalculateInterestTableWithBreak - Calculate the interest paid on a 
//    given principal over a period of years. The program terminates 
//    prematurely if a certain value is reached.      
using System;
namespace CalculateInterestTableWithBreak
{
  using System;

  public class Program
    {
    public static void Main(string[] args)
    {
      // Define a maximum interest rate.
      int maximumInterest = 50;

      // Maximum multiplier.
      int maxPower = 10;

      // Prompt user to enter source principal.
      Console.Write("Enter principal: ");
      string principalInput = Console.ReadLine();
      decimal principal = Convert.ToDecimal(principalInput);

      // If the principal is negative...
      if (principal < 0)
      {
        //...generate an error message...
        Console.WriteLine("Principal cannot be negative");
      }
      else
      {
        // ...otherwise, enter the interest rate.
        Console.Write("Enter interest: ");
        string interestInput = Console.ReadLine();
        decimal interest = Convert.ToDecimal(interestInput);

        // If the interest is negative or too large...
        if (interest < 0 || interest > maximumInterest)
        {
          // ...generate an error message as well.
          Console.WriteLine("Interest cannot be negative " +
                            "or greater than " + maximumInterest);
          interest = 0;
        }
        else
        {
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
          Console.WriteLine("Quit if a multiplier of " + maxPower +
                            " is reached");
          Console.WriteLine();


          // Now loop through the specified number of years.
          decimal originalPrincipal = principal;
          int year = 1;
          while(year <= duration)
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

            // Quit if we reach a certain profit level.
            if (principal > (maxPower * originalPrincipal))
            {
              break;
            }

            // Skip over to next year.
            year = year + 1;
          }
        }
      }
      // Wait for user to acknowledge the results.
      Console.WriteLine("Press Enter to terminate...");
      Console.Read();
    }
  }
}
