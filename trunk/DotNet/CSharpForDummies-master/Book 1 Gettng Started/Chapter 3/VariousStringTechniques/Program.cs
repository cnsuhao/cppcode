// VariousStringTechniques - Demonstrate a variety of String class methods,
//    and show how to use a StringBuilder class to work efficiently with strings.
using System;
using System.Text;

namespace VariousStringTechniques
{
  class Program
  {
    static void Main(string[] args)
    {
      Console.WriteLine("String class examples using a " +
        "selection of the many String methods.\n");

      // Note here how to embed double quote marks in a 
      // quoted string using the 'escape sequence' \".
      // Prefixing a char in a string with \ outputs the literal item.
      // Note that the interior " marks in this example wouldn't compile 
      // without escaping them.
      Console.WriteLine("Manipulating the string \"cheeseburgers\":");

      // A string to use with many examples below.
      string favoriteFood = "cheeseburgers";

      // IndexOf().
      Console.WriteLine("\nIndexOf() method:");
      Console.WriteLine("First s in cheeseburgers at index {0}", 
        favoriteFood.IndexOf('s'));

      // IndexOfAny().
      Console.WriteLine("\nIndexOfAny() method:");
      char[] charsToLookFor = { 'a', 'b', 'c' };
      Console.WriteLine("First a, b, or c at index {0}", 
        favoriteFood.IndexOfAny(charsToLookFor));
      Console.WriteLine("First index of 'a', 'b', or 'c', shorter syntax: {0}", 
        favoriteFood.IndexOfAny(new char[] { 'a', 'b', 'c' }));

      // LastIndexOf().
      Console.WriteLine("\nLastIndexOf() method:");
      Console.WriteLine("Last index of 'b' is {0}", 
        favoriteFood.LastIndexOf('b'));

      // LastIndexOfAny().
      Console.WriteLine("\nLastIndexOfAny() method:");
      Console.WriteLine("Last index of any a, b, or c is {0}", 
        favoriteFood.LastIndexOfAny(charsToLookFor));

      // Contains().
      Console.WriteLine("\nContains() method:");
      Console.WriteLine("Cheeseburgers contains an r: {0}", 
        favoriteFood.Contains("r"));

      // Substring().
      Console.WriteLine("\nSubstring() method:");
      Console.WriteLine("Substring 'burgers' is: {0}", 
        favoriteFood.Substring(6, favoriteFood.Length - 6));

      // IsNullOrEmpty().
      Console.WriteLine("\nIsNullOrEmpty() method - note how this is called:");
      Console.WriteLine("'cheeseburgers' is an empty string: {0}", 
        string.IsNullOrEmpty(favoriteFood));
      string empty1 = string.Empty;  // One way to initialize an empty string.
      string empty2 = "";            // Another way.
      Console.WriteLine("empty1 is empty ({0}), empty2 is empty ({1})", 
        string.IsNullOrEmpty(empty1), string.IsNullOrEmpty(empty2));

      // Join().
      Console.WriteLine("\nJoin() method - concatenate strings with " +
        "divider chars - note how this is called:");
      string[] brothers = { "Chuck", "Bob", "Steve", "Mike" };
      string theBrothers = string.Join(":", brothers);
      Console.WriteLine("brothers: {0}", theBrothers);

      // Copy().
      Console.WriteLine("\nCopy() method - returns a copy of the initial string:");
      string jojo = "jojo";
      string jojoCopy = string.Copy(jojo);
      Console.WriteLine("Copy of 'jojo' is {0}", jojoCopy);

      // StartsWith() and EndsWith().
      Console.WriteLine("\nStartsWith() and EndsWith() methods:");
      Console.WriteLine("'jojo' starts with 'jo': {0}", jojo.StartsWith("jo"));
      Console.WriteLine("'jojo' ends with 'jo': {0}", jojo.EndsWith("jo"));

      // GetType().
      Console.WriteLine("\nGetType() method - call this on a " +
        "type to get a string containing its name:");
      Console.WriteLine("The string 'jojo' is of type {0}", jojo.GetType());
      Console.WriteLine("The int 3 is of type {0}", 3.GetType());
      Console.WriteLine("This class is of type {0}", new Program().GetType());

      // Insert().
      Console.WriteLine("\nInsert() method:");
      // Recall that "changing" a string doesn't change it - 
      // it just returns a new string with the changes.
      jojo = jojo.Insert(2, "bo");
      Console.WriteLine("Inserting 'bo' into 'jojo': {0}", jojo);

      // Remove().
      Console.WriteLine("\nRemove() method:");
      jojo = jojo.Remove(2, 2);  // Remove 2 chars starting at index 2.
      Console.WriteLine("Removing 'bo' from 'jobojo': {0}", jojo);

      // Replace().
      Console.WriteLine("\nReplace() method:");
      string cheeseburgerWithoutEs = favoriteFood.Replace('e', 'X');
      Console.WriteLine("After Replace('e', 'X'), cheeseburger becomes {0}", 
        cheeseburgerWithoutEs);

      // ToCharArray().
      Console.WriteLine("\nToCharArray() method - returns a " +
        "char[] with the string's chars:");
      string someChars = ";:?.,";
      char[] theChars = someChars.ToCharArray();
      Console.WriteLine("Splitting ';:?.,' into chars results in {0} chars: ", 
        theChars.Length);
      // Display the chars.
      foreach (char c in theChars)
      {
        Console.WriteLine(c);
      }
      Console.WriteLine();


      Console.WriteLine("\n\nStringBuilder class examples: " + 
        "Use StringBuilder for efficient string changing.\n");

      Console.WriteLine("\nUsing a StringBuilder to concatenate strings:");
      // Construct a new StringBuilder with initial contents "012", 
      // then append other strings to that.
      StringBuilder builder = new StringBuilder("012");
      builder.Append("34");
      builder.Append("56");
      Console.WriteLine("Extract the completed string from " +
        "the StringBuilder with ToString()");
      Console.WriteLine(builder.ToString()); // result = 0123456.

      Console.WriteLine("\nDefault StringBuilder has capacity for 16 chars:");
      // Default StringBuilder has 16 characters of capacity (but no initial content).
      StringBuilder builder2 = new StringBuilder();  // 16 characters.
      Console.WriteLine("Capacity of default StringBuilder: {0}, and contents = {1}", 
        builder2.Capacity, builder2.ToString());

      Console.WriteLine("\nYou can specify an initial capacity for the StringBuilder:");
      // StringBuilder with initial capacity of 256 can hold 
      // 256 characters, but is initially empty.
      StringBuilder builder3 = new StringBuilder(256);
      Console.WriteLine("capacity of 256-char StringBuilder: {0}, and contents = {1}", 
        builder3.Capacity, builder3.ToString());

      Console.WriteLine("\nStringBuilder is especially useful for " +
        "tasks like concatenating lots of strings:");
      // Use a StringBuilder to do a lengthy series of concatenations efficiently.
      string[] catNames = { "Striper", "Tippy", "Buji-san", "Sydney", 
                            "Booboo", "Peej", "Emerson", 
                            "Oso", "Patty", "Chewie", "Whisser" };
      StringBuilder builder4 = new StringBuilder(32000);  // Allocate a bunch.
      Console.WriteLine("Capacity of huge StringBuilder 32,000: " +
      "{0}, and contents = {1}", builder4.Capacity, builder4.ToString());
      for (int i = 0; i < catNames.Length; i++)
      {
        builder4.Append(catNames[i]);    // Same list of names as earlier.
      }
      // Retrieve the results: a long list of catnames.
      Console.WriteLine("ConCATenated CAT names: {0}", builder4.ToString());  

      Console.WriteLine("\nUse a StringBuilder to handle uppercasing " +
        "an individual char in a string:");
      StringBuilder builder5 = new StringBuilder("jones");
      builder5[0] = char.ToUpper(builder5[0]);
      string fixedString = builder5.ToString();
      Console.WriteLine(fixedString);

      Console.WriteLine("\nPress Enter to terminate...");
      Console.Read();
    }
  }
}
