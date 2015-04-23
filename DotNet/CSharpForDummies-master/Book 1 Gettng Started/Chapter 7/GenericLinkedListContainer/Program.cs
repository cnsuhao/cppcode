// GenericLinkedListContainer - Demonstrate a "home grown" linked list.
//    This example  includes an iterator which implements the 
//    IEnumerator interface, so it can use foreach.

// This version is generic.
// Class LinkedList becomes LinkedList<T> and class LLNode becomes
// LLNode<T>; the GetEnumerator() method uses an iterator block.
// Compare this to System.Collections.Generic.LinkedList<T>, which
// is similar but looks a bit different. Prefer the built-in version.
using System;
using System.Collections;

namespace GenericLinkedListContainer
{
  // LLNode - Each LLNode forms a node in the list.
  //    Each LLNode node references a target object to be
  //    incorporated into the list.
  public class LLNode<T>
  {
    // References the object hanging from ("contained by") this node.
    // This is the data stored in the list node.
    internal T _linkedData = default(T); // Don't know "null" for T.

    // Forward and backward pointer.
    // Internal so LinkedList can access them directly.
    // These are real nulls because these are LLNode objects, not
    // the stored T type.
    internal LLNode<T> _forward  = null; // Next node in list.
    internal LLNode<T> _backward = null; // Previous node in list.
    // Constructor.
    internal LLNode(T linkedData)
    {
      this._linkedData = linkedData;
    }

    // Property to retrieve the data stored in this node.
    public T Data
    {
      get
      {
        return _linkedData;
      }
    }
  }

  // LinkedList - Implements a doubly linked list container.
  public class LinkedList<T>  // No longer need ": IEnumerable" here.
  {
    // The ends of the linked list.
    // Internal so iterator can access them directly.
    internal LLNode<T> _head = null;
    internal LLNode<T> _tail = null;
    // Need to track currentNode here - this used to be in the
    // homegrown LinkedListIterator class, which is now extinct.
    internal LLNode<T> _currentNode;

    // Here's the iterator, implemented as an iterator block.
    public IEnumerator GetEnumerator()
    {
      // Make sure the current node is legal.
      // If it's null, it hasn't yet been set to point into the list,
      // So point it at the head.
      if (_currentNode == null)
      {
        _currentNode = _head;
      }
      // Here's the iteration for the enumerator that
      // GetEnumerator() returns.
      while (_currentNode != null)
      {
        yield return _currentNode.Data;
        _currentNode = _currentNode._forward;
      }
    }

    // AddObject - Add an object to the end of list.
    public LLNode<T> AddObject(T toAdd)
    {
      return AddObject(_tail, toAdd);
    }

    // AddObject- Add an object to the list after previousNode.
    public LLNode<T> AddObject(LLNode<T> previousNode, T toAdd)
    {
      // Create a new node with the object attached.
      LLNode<T> newNode = new LLNode<T>(toAdd);

      // Start with the easiest case:
      // If the list is empty then...
      if (_head == null && _tail == null)
      {
        // ...start off with just the one node in the list.
        _head = newNode;
        _tail = newNode;
        return newNode;
      }

      // OK, are we adding the new node to the middle of the list?
      if (previousNode != null && previousNode._forward != null)
      {
        // Just switch the pointers around and we're done.
        LLNode<T> nextNode = previousNode._forward;

        // First, store the forward pointers.
        newNode._forward = nextNode;
        previousNode._forward = newNode;

        // Now the backward pointers.
        nextNode._backward = newNode;
        newNode._backward = previousNode;

        return newNode;
      }

      // Are we adding it to the beginning?
      if (previousNode == null)
      {
        // Make this the head man.
        LLNode<T> nextNode = _head;
        newNode._forward = nextNode;
        nextNode._backward = newNode;
        _head = newNode;
        return newNode;
      }

      // Must be the end of the list.
      newNode._backward = previousNode;
      previousNode._forward = newNode;
      _tail = newNode;
      return newNode;
    }

    // RemoveObject - Remove an object from the list.
    public void RemoveObject(LLNode<T> currentNode)
    {
      // Get the current node's neighbors.
      LLNode<T> previousNode = currentNode._backward;
      LLNode<T> nextNode     = currentNode._forward;

      // Remove the current object's pointers.
      currentNode._forward = currentNode._backward = null;

      // Now... if this was the last element in the list.
      if (_head == currentNode && _tail == currentNode)
      {
        _head = _tail = null;
        return;
      }

      // Ok, if this node is in the middle...
      if (_head != currentNode && _tail != currentNode)
      {
        previousNode._forward = nextNode;
        nextNode._backward = previousNode;
        return;
      }

      // At the front of the list?
      if (_head == currentNode && _tail != currentNode)
      {
        _head = nextNode;
        nextNode._backward = null;
        return;
      }

      // Must be at the end of the list.
      _tail = previousNode;
      previousNode._forward = null;
    }
  }

  // LinkedListIterator - No longer exists!


  public class Program
  {
    public static void Main(string[] args)
    {
      // Create a string container and add three elements to it.
      LinkedList<string> llc = new LinkedList<string>();
      LLNode<string> first = llc.AddObject("This is first string");
      LLNode<string> second = llc.AddObject("This is second string");
      LLNode<string> third = llc.AddObject("This is last string");

      // Add one at the beginning and one in the middle.
      LLNode<string> newfirst = llc.AddObject(null, "Insert before the first string");
      LLNode<string> newmiddle = llc.AddObject(second, "Insert between the second and third strings");

      // We can no longer manipulate the iterator "manually"
      // (who wants to?).
      // This old manual code no longer works: there's no
      // LinkedListIterator class, no MoveNext(), and no Current.
      // (Well, there is, but it's deep under the hood where you can't
      // get at it, but foreach can.)
//      Console.WriteLine("Iterate through the container manually");
//      LinkedListIterator lli = (LinkedListIterator)llc.GetEnumerator();
//      Lli.Reset();
//      While (lli.MoveNext())
//      {
//        String s = (string)lli.Current;
//        Console.WriteLine(s);
//      }

      // Iterate with foreach - the preferred way now.
      Console.WriteLine("Iterate string version using foreach");
      foreach(string s in llc)
      {
        Console.WriteLine(s);
      }

      // Instantiate for int.
      LinkedList<int> llci = new LinkedList<int>();
      LLNode<int> one = llci.AddObject(1);
      LLNode<int> two = llci.AddObject(2);
      // Insert a node between one and two.
      LLNode<int> newTwo = llci.AddObject(one, 3);

      Console.WriteLine("\nIterate int version using foreach");
      foreach (int i in llci)
      {
        Console.WriteLine(i.ToString());
      }

      // Wait for user to acknowledge the results.
      Console.WriteLine("Press Enter to terminate...");
      Console.Read();
    }
  }
}
