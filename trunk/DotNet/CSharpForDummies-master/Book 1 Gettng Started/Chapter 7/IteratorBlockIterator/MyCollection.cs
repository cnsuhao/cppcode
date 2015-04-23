// MyCollection class and its companion iterator, MyCollectionIterator.
//     The iterator uses an iterator block.
using System;
using System.Collections.Generic;
namespace IteratorBlockIterator
{
  // A simple collection of strings.
  public class MyCollection
  {
    // Implement collection with an ArrayList.
    // Internal so separate iterator object can access the strings.
    internal List<string> _list = new List<string>();
    public MyCollection(string[] strs)
    {
      foreach(string s in strs)
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
  public class MyCollectionIterator
  {
    // Store a reference to the collection.
    private MyCollection _mc;
    public MyCollectionIterator(MyCollection mc)
    {
      this._mc = mc;
    }
    // GetEnumerator -This is the iterator block, which carries
    //    out the actual iteration for the iterator object.
    public System.Collections.IEnumerator GetEnumerator()
    {
      // Iterate the associated collection's underlying list.
      // Which is accessible because it's declared internal.
      foreach (string s in _mc._list)
      {
        yield return s;   // The iterator block's heart.
      }
    }
  }
}
