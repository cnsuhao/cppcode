// AlignOutput - Left justify and align a set of strings
//    to improve the appearance of program output.
namespace AlignOutput
{
  using System;
  using System.Collections.Generic;

  class Program
  {
    public static void Main(string[] args)
    {
      List<string> names = new List<string> {"Christa  ",
                                             "  Sarah",
                                             "Jonathan",
                                             "Sam",
                                             " Schmekowitz "};

      // First output the names as they start out.
      Console.WriteLine("The following names are of "
                        + "different lengths");

      foreach(string s in names)
      {
        Console.WriteLine("This is the name '" + s + "' before");
      }
      Console.WriteLine();

      // This time, fix the strings so they are
      // left justified and all the same length.

      // First, copy the source array into an array that you can manipulate.
      List<string> stringsToAlign = new List<string>();

      // At the same time, remove any unnecessary spaces from either end
      // of the names.
      for (int i = 0; i < names.Count; i++)
      {
        string trimmedName = names[i].Trim();
        stringsToAlign.Add(trimmedName);
      }

      // Now find the length of the longest string so that
      // all other strings line up with that string.
      int maxLength = 0;
      foreach (string s in stringsToAlign)
      {
        if (s.Length > maxLength)
        {
          maxLength = s.Length;
        }
      }

      // Now justify all the strings to the length of the maximum string.
      for (int i = 0; i < stringsToAlign.Count; i++)
      {
        stringsToAlign[i] = stringsToAlign[i].PadRight(maxLength + 1);
      }

      // Finally output the resulting padded, justified strings.
      Console.WriteLine("The following are the same names "
                      + "normalized to the same length");
      foreach(string s in stringsToAlign)
      {
        Console.WriteLine("This is the name '" + s + "' afterwards");
      }

      // Wait for user to acknowledge.
      Console.WriteLine("\nPress Enter to terminate...");
      Console.Read();
    }
  }
}
