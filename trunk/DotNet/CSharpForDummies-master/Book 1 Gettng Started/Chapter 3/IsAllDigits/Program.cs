// IsAllDigits - Demonstrate the IsAllDigits method.
using System;

namespace IsAllDigits
{
  class Program
  {
    public static void Main(string[] args)
    {
      // Input a string from the keyboard.
      Console.WriteLine("Enter an integer number");
      string s = Console.ReadLine();

      // First check to see if this could be a number.
      if (!IsAllDigits(s)) // Call our special method.
      {
        Console.WriteLine("Hey! That isn't a number");
      }
      else
      {
        // Convert the string into an integer.
        int n = Int32.Parse(s);

        // Now write out the number times 2.
        Console.WriteLine("2 * " + n + ", = " + (2 * n));
      }
      // Wait for user to acknowledge the results.
      Console.WriteLine("Press Enter to terminate...");
      Console.Read();
    }
    // IsAllDigits - Return true if all of the characters
    //    in the string are digits.
    public static bool IsAllDigits(string raw)
    {
      // First get rid of any benign characters
      // at either end; if there's nothing left
      // then we don't have a number.
      string s = raw.Trim();  // Ignore whitespace on either side.
      if (s.Length == 0)
      {
        return false;
      }

      // Loop through the string.
      for(int index = 0; index < s.Length; index++)
      {
        // A non-digit indicates that the string
        // is probably not a number.
        if (Char.IsDigit(s[index]) == false)
        {
          return false;
        }
      }

      // No non-digits found; it's probably OK.
      return true;
    }
  }
}
