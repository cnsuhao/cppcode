// HashSetExample - Using a new C# 3.0 HashSet<T> collection.
using System;
using System.Collections.Generic;

namespace HashSetExample
{
  class Program
  {
    static void Main(string[] args)
    {
      Console.WriteLine("Combining two collections with no duplicates:");
      List<string> colors = new List<string> { "red", "orange", "yellow" };
      string[] moreColors = { "orange", "yellow", "green", "blue", "violet" };
      // Want to combine but without any duplicates.
      // Following is just the first stage ...
      HashSet<string> combined = new HashSet<string>(colors);
      // ... now for the second stage.
      // UnionWith() collects items in both lists that aren't duplicated,
      // resulting in a combined collection whose members are all unique.
      combined.UnionWith(moreColors);
      foreach (string color in combined)
      {
        Console.WriteLine(color);
      }
      Console.WriteLine("\nConverting the combined set to a list:");
      // Initialize a new List from combined.
      List<string> spectrum = new List<string>(combined);
      foreach(string color in spectrum)
      {
        Console.WriteLine("{0}", color);
      }

      Console.WriteLine("\nFinding the overlap in two lists:");
      List<string> presidentialCandidates = 
        new List<string> { "Clinton", "Edwards", "Giuliani", 
          "McCain", "Obama", "Romney" };
      List<string> senators = new List<string> { "Alexander", "Boxer", 
        "Clinton", "McCain", "Obama", "Snowe" };
      // Following set hasn't yet weeded out non-Senators ...
      HashSet<string> senatorsRunning = 
        new HashSet<string>(presidentialCandidates);
      // ... but IntersectWith() collects items that appear only in both lists,
      // effectively eliminating the non-Senators.
      senatorsRunning.IntersectWith(senators);
      foreach (string senator in senatorsRunning)
      {
        Console.WriteLine(senator);
      }

      Console.WriteLine("\nExcluding items from a list:");
      // Initialize a Queue from an array.
      Queue<int> queue = 
        new Queue<int>(new int[] { 0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 17 });
      // Create a set containing small prime numbers. This is stage 1 of 2.
      HashSet<int> unique = 
        new HashSet<int> { 1, 3, 5, 7, 9, 11, 13, 15 };
      // ExceptWith() removes any items in remainder that are 
      // also in queue: 1, 3, 5, 7,
      // leaving remainder with 9, 11, 13, 15. Stage 2 of 2.
      unique.ExceptWith(queue);
      foreach (int n in unique)
      {
        Console.WriteLine(n.ToString());
      }

      Console.WriteLine("\nFinding just the non-overlapping items in two lists:");
      Stack<int> stackOne = new Stack<int>(new int[] { 1, 2, 3, 4, 5, 6, 7, 8 });
      Stack<int> stackTwo = new Stack<int>(new int[] { 2, 4, 6, 7, 8, 10, 12 });
      HashSet<int> nonoverlapping = new HashSet<int>(stackOne);
      // SymmetricExceptWith() collects items that are in one collection but not
      // the other: the items that don't overlap.
      nonoverlapping.SymmetricExceptWith(stackTwo);
      foreach(int n in nonoverlapping)
      {
        Console.WriteLine(n.ToString());
      }

      Console.WriteLine("Press Enter to terminate...");
      Console.Read();
    }
  }
}
