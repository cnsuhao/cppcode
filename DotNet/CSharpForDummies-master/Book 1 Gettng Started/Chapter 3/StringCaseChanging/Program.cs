// StringCaseChanging - Demonstrate approaches to changing case in
//    strings, as well as other common string operations such as
//    - converting an array of bytes to a string
//    - converting a string to an array of bytes or chars
//    - using 'cultures' for accurate String comparisons.
// Some of this is more advanced than the techniques in Chapter 6.
using System;
using System.Text;                // Need for type UTF8Encoding.
using System.Globalization;       // Need for cultures.

namespace StringCaseChanging
{
  class Program
  {
    static void Main(string[] args)
    {
      // --- Various conversions between strings and arrays of char or byte. ---

      // Converting a string to an array of chars.
      Console.WriteLine("Convert a string to an array of chars.");
      string custName = "Pam III Sphar";
      char[] custNameChars = custName.ToCharArray();
      foreach (char c in custNameChars)
      {
        Console.Write(c);
      }
      Console.WriteLine();

      // Converting an array of chars to a string.
      Console.WriteLine("\nConvert an array of chars to a string.");
      char[] chars = { 'a', 'b', 'c', 'd' };
      string charsAsString = new String(chars);
      Console.WriteLine("Chars a - d as a string: {0}", charsAsString);

      // Converting an array of bytes to a string.
      Console.WriteLine("\nUse an 'encoding' to convert an array "
        + "of bytes to a string.");
      byte[] bytes = { 80, 97, 109, 32, 73, 73, 73, 32, 
                       83, 112, 104, 97, 114 };
      UTF8Encoding encoding = new UTF8Encoding();
      string name = encoding.GetString(bytes, 0, bytes.Length);
      Console.WriteLine(name);

      // Converting a string to a byte array.
      Console.WriteLine("\nConvert a string to a byte array.");
      int numBytesInString = encoding.GetByteCount(custName); // 13.
      // Note: WriteLine() lets you specify 'placeholders,' {0}, {1},
      // and so on. It fills the placehoders with the variables or values
      // listed after the quoted string containing the placeholders.
      // See the Tip in the section "Formatting Your Strings Precisely"
      // in Chapter 6.
      Console.WriteLine("custName 'Pam III Sphar' has {0} chars.", 
        numBytesInString);
      byte[] theBytes = encoding.GetBytes(custName);
      Console.WriteLine("Retrieved {0} bytes from custName 'Pam III Sphar'.", 
        theBytes.Length);
      // List the bytes in a row.
      foreach (byte b in theBytes)
      {
        Console.Write(b + " ");
      }
      Console.WriteLine();

      // --- Using "cultures" ---

      // Using a 'culture' to make string comparison more accurate.
      Console.WriteLine("\nSpecifying a \"culture\" in string comparison.");
      // A culture tells the Compare() method how to understand strings from 
      // a particular culture, such as 'en-US' (American), 'en-GB' (British), 
      // 'fr-FR' (French in France), etc. Such strings may use various  
      // diacritical marks such as umlauts, cedillas, and 'enyas'. Cultures
      // also govern currency, number, and date formatting. Using cultures
      // helps you write versions of your software suitable for use in various
      // countries and language communities, a process called "localizing" your code.
      // This is the briefest and barest introduction to cultures. See Help.
      Console.WriteLine("Is the string 'SOME STUFF' already uppercase?");
      string line = "SOME STUFF";
      // "InvariantCulture" means a culture specific to English (wthout reference to
      // any regional variants) and is used is the general default culture in many
      // cases. Look up "CultureInfo class" in the Help index for more information.)
      if (string.Compare(line.ToUpper(CultureInfo.InvariantCulture), line, false) == 0) 
        Console.WriteLine("yes 1");
      if (string.Compare(line, "line", StringComparison.InvariantCultureIgnoreCase) == 0) 
        Console.WriteLine("yes 2");

      // --- Techniques for uppercasing the first char of a string ---

      // Uppercasing the first char in a string without StringBuilder.
      Console.WriteLine("\nUppercase the first char of a string in various ways:");
      // Use a combination of char and string methods.
      name = "chuck";
      string properName = char.ToUpper(name[0]).ToString() + 
        name.Substring(1, name.Length - 1);
      Console.WriteLine("{0} becomes {1}", name, properName);

      // Uppercasing the first char with a StringBuilder.
      Console.WriteLine("\nUse a StringBuilder to solve the problem of uppercasing "
        + "just the first char of a string.");
      StringBuilder sb = new StringBuilder("jones");
      sb[0] = char.ToUpper(sb[0]);
      string fixedString = sb.ToString();
      Console.WriteLine("{0} becomes {1}", "jones", fixedString);

      Console.WriteLine("\nPress Enter to terminate...");
      Console.Read();
    }
  }
}
