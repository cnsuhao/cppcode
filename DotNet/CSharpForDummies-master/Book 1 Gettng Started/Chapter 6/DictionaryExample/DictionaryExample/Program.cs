// DictionaryExample - Demonstrate using a Dictionary<TKey, TValue> collection class.
using System;
using System.Collections.Generic;

namespace DictionaryExample
{
  class Program
  {
    static void Main(string[] args)
    {
      // Create a dictionary in which both keys and values are strings.
      Dictionary<string, string> dict = new Dictionary<string, string>();
      // Add some items to the dictionary: each has a key and a value.
      dict.Add("C#", "cool");
      dict.Add("C++", "like writing Sanskrit poetry in Morse code");
      dict.Add("VB", "a simple but wordy language");
      dict.Add("Java", "not C#");
      dict.Add("Fortran", "ANCNT");  // 6-letters-max variable name for "ancient".
      dict.Add("Cobol", "even more wordy and verbose than VB");

      // See if the dictionary contains a particular key.
      Console.WriteLine("Contains key C# " + dict.ContainsKey("C#"));
      Console.WriteLine("Contains key Ruby " + dict.ContainsKey("Ruby"));

      // Iterate the dictionary's contents with foreach.
      // Note that you're iterating pairs of keys and values,
      // using the KeyValuePair<T,U> type.
      Console.WriteLine("\nContents of the dictionary:");
      foreach (KeyValuePair<string, string> pair in dict)
      {
        // Because the key is a string, I can call string methods on it (see ch 6).
        Console.WriteLine("Key: " + pair.Key.PadRight(8) + "Value: " + pair.Value);
      }

      // List the keys, which are in no particular order.
      Console.WriteLine("\nJust the keys:");
      // Dictionary<TKey, TValue>.KeyCollection is a collection of just the keys,
      // in this case strings. So here's how to retrieve the keys:
      Dictionary<string, string>.KeyCollection keys = dict.Keys;
      foreach(string key in keys)
      {
        Console.WriteLine("Key: " + key);
      }

      // List the values, which are in same order as key collection above.
      Console.WriteLine("\nJust the values:");
      Dictionary<string, string>.ValueCollection values = dict.Values;
      foreach (string value in values)
      {
        Console.WriteLine("Value: " + value);
      }
      Console.Write("\nNumber of items in the dictionary: " + dict.Count);

      Console.WriteLine("\nPress Enter to terminate...");
      Console.Read();
    }
  }
}
