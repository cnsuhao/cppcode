// CalculateInterestWithEmbeddedTest - Calculate the interest amount
//    paid on a given principal. If either the principal or the 
//    interest rate is negative, then generate an error message
//    and don't proceed with the calculation.
using System;

namespace CalculateInterestWithEmbeddedTest
{
  public class Program
  {
    public static void Main(string[] args)
    {
      // Define a maximum interest rate.
      int maximumInterest = 50;

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
      else  // Go here only if principal was > 0: thus valid.
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
        else  // Reach this point only if all’s well.
        {
          // Both the principal and the interest appear to be legal; 
          // calculate the value of the principal plus interest.
          decimal interestPaid;
          interestPaid = principal * (interest / 100);

          // Now calculate the total.
          decimal total = principal + interestPaid;

          // Output the result.
          Console.WriteLine();  // Skip a line.
          Console.WriteLine("Principal     = " + principal);
          Console.WriteLine("Interest      = " + interest + "%");
          Console.WriteLine();
          Console.WriteLine("Interest paid = " + interestPaid);
          Console.WriteLine("Total         = " + total);
        }
      }
      // Wait for user to acknowledge the results.
      Console.WriteLine("Press Enter to terminate...");
      Console.Read();
    }
  }
}
