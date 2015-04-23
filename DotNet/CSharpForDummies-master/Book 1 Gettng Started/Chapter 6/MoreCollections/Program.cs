// MoreCollections - Demonstrate initializing a List<T> from
//    an array, another List<T>, a Stack<T>, a Queue<T>, or a HashSet<T>.
using System;
using System.Collections.Generic;

namespace MoreCollections
{
  class Program
  {
    static void Main(string[] args)
    {
      Console.WriteLine("Start with an array of integers: ");
      int[] numbers = { 1, 2, 3 };
      foreach (int i in numbers)
      {
        Console.WriteLine(i);
      } 
      Console.WriteLine("\nInitialize a List<int> from the array: ");
      List<int> numList = new List<int>(numbers); // Initializing from an array, or...
      Console.WriteLine("Add the same array again via AddRange() method: ");
      // After this call, the list contains duplicate items - that's allowed.
      numList.AddRange(numbers);                  // Using AddRange.	
      Console.WriteLine("Resulting list: ");
      foreach (int i in numList)
      {
        Console.WriteLine(i);
      }

      Console.WriteLine("\nInitialize a List<int> from another List<int>: ");
      List<int> numList2 = new List<int>(numList);
      Console.WriteLine("Resulting list: ");
      foreach (int i in numList2)
      {
        Console.WriteLine(i);
      }

      Console.WriteLine("\nYou can't add a dictionary to a list.");
      // The following won't compile.
      //Dictionary<string, string> dict = new Dictionary<string, string> { { "one", "nine" }, { "two", "eight" } };
      //List<string> strList = new List<string>(dict);

      Console.WriteLine("\nInitialize a List<string> from a Stack<string>: ");
      Stack<string> stack = new Stack<string>();
      stack.Push("one");  // To add to a stack, Push the item (ends up on the top).
      stack.Push("two");
      stack.Push("three");
      string topItemOnStack = stack.Pop();  // Remove by Popping the stack.
      // Add the stack to a List.
      List<string> strList = new List<string>(stack);
      Console.WriteLine("Resulting list: ");
      foreach (string s in strList)
      {
        Console.WriteLine(s);
      }

      Console.WriteLine("\nInitialize a List<string> from a Queue<string>: ");
      Queue<string> que = new Queue<string>();
      que.Enqueue("three");  // Add to a queue by Enqueing items.
      que.Enqueue("four");   // Enqueued items are added to the "back" of the queue.
      que.Enqueue("five");
      // To remvove an item from a queue, call Dequeue(). You can only
      // remove the item currently at the "front" of the queue.
      string frontItemFromQueue = que.Dequeue();
      // Add the queue to a List.
      List<string> strList2 = new List<string>(que);
      Console.WriteLine("Resulting list: ");
      foreach (string s in strList2)
      {
        Console.WriteLine(s);
      }

      Console.WriteLine("\nInitialize a List<string> from a HashSet<string>: ");
      HashSet<string> set = new HashSet<string> { "five", "six", "seven" };
      set.Add("eight");   // Adding a non-duplicate succeeds.
      set.Add("six");     // Duplicate is not added, but no error occurs.
      // Add the set to a List.
      List<string> strList3 = new List<string>(set);
      Console.WriteLine("Resulting list: ");
      foreach (string s in strList3)
      {
        Console.WriteLine(s);
      }

      // Note: You can also initialize stacks, queues, hashsets, and lists each from
      // any of the others. This is a very useful property. See the HashSetExample for
      // an illustration of this - the example initializes a HashSet from a List in order
      // to screen out duplicate items from the list.

      // Wait for user to acknowledge results.
      Console.WriteLine("Press Enter to terminate...");
      Console.Read();

    }
  }
}
