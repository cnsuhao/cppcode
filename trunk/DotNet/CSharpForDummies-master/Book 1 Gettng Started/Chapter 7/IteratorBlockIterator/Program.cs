// IteratorBlockIterator - Implements a separate iterator object as a
//    companion to a collection class, a la LinkedList, but
//    implements the actual iterator with an iterator block.
using System;
using System.Collections;
namespace IteratorBlockIterator
{
  class Program
  {
    // Create a collection and use two iterator objects to iterate
    // it independently (each using an iterator block)
    static void Main(string[] args)
    {
      string[] strs = new string[] { "Joe", "Bob", "Tony", "Fred" };
      MyCollection mc = new MyCollection(strs);
      // Create the first iterator and start the iteration.
      MyCollectionIterator mci1 = mc.GetEnumerator();
      foreach (string s1 in mci1)  // Uses the first iterator object.
      {
        // Do some useful work with each string.
        Console.WriteLine(s1);
        // Find Tony's boss.
        if (s1 == "Tony")
        {
          // In the middle of that iteration, start a new one, using.
          // A second iterator; this is repeated for each outer loop pass.
          MyCollectionIterator mci2 = mc.GetEnumerator();
          foreach (string s2 in mci2)  // Uses the second iterator object.
          {
            // Do some useful work with each string.
            if (s2 == "Bob")
            {
              Console.WriteLine("\t{0} is {1}'s boss", s2, s1);
            }
          }
        }
      }
      // Wait for user to acknowledge the results.
      Console.WriteLine("Press Enter to terminate...");
      Console.Read();
    }
    // A simple collection of strings.
    public class MyCollection
    {
      // Implement collection with an ArrayList.
      // Internal so separate iterator object can access the strings.
      internal ArrayList _list = new ArrayList();
      public MyCollection(string[] strs)
      {
        foreach (string s in strs)
        {
          _list.Add(s);
        }
      }
      // GetEnumerator - As in LinkedList, this returns one of our
      //    iterator objects.
      public MyCollectionIterator GetEnumerator()
      {
        return new MyCollectionIterator(this);
      }
    }
    // MyCollectionIterator - The iterator class for MyCollection.
    //    (MyCollection is in a separate file.)
    public class MyCollectionIterator
    {
      // Store a reference to the collection.
      private MyCollection _mc;
      public MyCollectionIterator(MyCollection mc)
      {
        this._mc = mc;
      }
      // GetEnumerator - This is the iterator block, which carries
      //    out the actual iteration for the iterator object.
      public System.Collections.IEnumerator GetEnumerator()
      {
        // Iterate the associated collection's underlying list,
        // which is accessible because it's declared internal.
        foreach (string s in _mc._list)
        {
          yield return s;   // The iterator block's heart.
        }
      }
    }
  }
}
