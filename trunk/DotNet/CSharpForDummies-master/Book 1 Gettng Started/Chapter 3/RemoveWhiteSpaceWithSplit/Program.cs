// RemoveWhiteSpaceWithSplit - Get rid of special characters in
//    a string, like the RemoveWhiteSpace program, but use split 
//    this time, and put the interesting code in a method.
namespace RemoveWhiteSpace
{
 using System;

  public class Program
  {
    public static void Main(string[] strings)
    {
      // Define the white space characters.
      char[] whiteSpace = {' ', '\n', '\t'};

      // Start with a string embedded with whitespace.
      string s = " this is a\nstring";
      Console.WriteLine("before:" + s);

      // Output the string with the whitespace missing.
      Console.WriteLine("after:" +
                    RemoveSpecialChars(s, whiteSpace));

      // Wait for user to acknowledge the results.
      Console.WriteLine("Press Enter to terminate...");
      Console.Read();
    }

    // RemoveSpecialChars - Remove every occurrence of the
    //    specified characters from the string.
    public static string RemoveSpecialChars(string input,
                                            char[] targets)
    {
      // Split the input string up using the target
      // characters as the delimiters.
      string[] subStrings = input.Split(targets);

      // output will contain the eventual output information.
      string output = "";

      // Loop through the substrings originating from the split.
      foreach(string subString in subStrings)
      {
        output = String.Concat(output, subString);
      }
      return output;
    }
  }
}
