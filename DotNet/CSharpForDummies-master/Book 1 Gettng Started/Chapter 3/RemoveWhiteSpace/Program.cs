// RemoveWhiteSpace - The RemoveSpecialChars method removes every 
//    occurrence of the specified characters from the string.
namespace RemoveWhiteSpace
{
 using System;

  public class Program
  {
    public static void Main(string[] args)
    {
      // Define the white space characters.
      char[] whiteSpace = {' ', '\n', '\t'};

      // Start with a string embedded with whitespace.
      string s = " this is a\nstring"; // Contains spaces & newline.
      Console.WriteLine("before:" + s);

      // Output the string with the whitespace missing.
      Console.Write("after:");

      // Start looking for the white space characters.
      for(;;)
      {
        // Find the offset of the character; exit the loop
        // if there are no more.
        int offset = s.IndexOfAny(whiteSpace);
        if (offset == -1)
        {
          break;
        }

        // Break the string into the part prior to the
        // character and the part after the character.
        string before = s.Substring(0, offset);
        string after  = s.Substring(offset + 1);

        // Now put the two substrings back together with the
        // character in the middle missing.
        s = String.Concat(before, after);
        // Loop back up to find next whitespace char in 
        // this modified s.
      }
      Console.WriteLine(s);

      // Wait for user to acknowledge the results.
      Console.WriteLine("Press Enter to terminate...");
      Console.Read();
    }
  }
}
