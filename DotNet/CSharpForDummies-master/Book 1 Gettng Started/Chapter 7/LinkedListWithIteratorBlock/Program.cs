// LinkedListWithIteratorBlock - A variation on our "home grown" linked list.
//       This version uses an iterator block to enumerate the collection.
using System;
using System.Collections;

namespace LinkedListWithIteratorBlock
{
  // LLNode - Each LLNode forms a node in the list.
  // Each LLNode node references a target object to be
  // incorporated into the list.
  public class LLNode
  {
    // References the object hanging from ("contained by") this node
    // this is the data stored in the list node.
    internal object linkedObject = null;

    // Forward and backward pointer.
    // Internal so LinkedList can access them directly.
    internal LLNode forward  = null; // Next node in list.
    internal LLNode backward = null; // Previous node in list.
    // Constructor.
    internal LLNode(object linkedObject)
    {
      this.linkedObject = linkedObject;
    }

    // Property to retrieve the data stored in this node.
    public object Object
    {
      get
      {
        return linkedObject;
      }
    }
  }

  // LinkedList - Implements a doubly linked list container.
  public class LinkedList  // No longer need ": IEnumerable" here.
  {
    // The ends of the linked list.
    // Internal so iterator can access them directly.
    internal LLNode _head = null;
    internal LLNode _tail = null;

    // Need to track currentNode here - this used to be in the
    // homegrown LinkedListIterator class, which is now extinct.
    internal LLNode _currentNode;

    // Here's the iterator, implemented as an iterator block.
    public IEnumerator GetEnumerator()
    {
      // Make sure the current node is legal.
      // If it's null, it hasn't yet been set to point into the list,
      // so point it at the head.
      if (_currentNode == null)
      {
        _currentNode = _head;
      }
      // Here's the iteration for the enumerator that
      // GetEnumerator() returns.
      while (_currentNode != null)
      {
        yield return _currentNode.Object;
        _currentNode = _currentNode.forward;
      }
    }

    // AddObject - Add an object to the end of list.
    public LLNode AddObject(object toAdd)
    {
      return AddObject(_tail, toAdd);
    }

    // AddObject- Add an object to the list.
    public LLNode AddObject(LLNode previousNode, object toAdd)

    {
      // Create a new node with the object attached.
      LLNode newNode = new LLNode(toAdd);

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
      if (previousNode != null && previousNode.forward != null)
      {
        // Just switch the pointers around and we're done.
        LLNode nextNode = previousNode.forward;

        // First, store the forward pointers.
        newNode.forward = nextNode;
        previousNode.forward = newNode;

        // Now the backward pointers.
        nextNode.backward = newNode;
        newNode.backward = previousNode;

        return newNode;
      }

      // Are we adding it to the beginning?
      if (previousNode == null)
      {
        // Make this the head man.
        LLNode nextNode = _head;
        newNode.forward = nextNode;
        nextNode.backward = newNode;
        _head = newNode;
        return newNode;
      }

      // Must be the end of the list.
      newNode.backward = previousNode;
      previousNode.forward = newNode;
      _tail = newNode;
      return newNode;
    }

    // RemoveObject - Remove an object from the list.
    public void RemoveObject(LLNode currentNode)
    {
      // Get the current node's neighbors.
      LLNode previousNode = currentNode.backward;
      LLNode nextNode     = currentNode.forward;

      // Remove the current object's pointers.
      currentNode.forward = currentNode.backward = null;

      // Now... if this was the last element in the list.
      if (_head == currentNode && _tail == currentNode)
      {
        _head = _tail = null;
        return;
      }

      // Ok, if this node is in the middle...
      if (_head != currentNode && _tail != currentNode)
      {
        previousNode.forward = nextNode;
        nextNode.backward = previousNode;
        return;
      }

      // At the front of the list?
      if (_head == currentNode && _tail != currentNode)
      {
        _head = nextNode;
        nextNode.backward = null;
        return;
      }

      // Must be at the end of the list.
      _tail = previousNode;
      previousNode.forward = null;
    }
  }

  // LinkedListIterator - No longer exists!

  public class Program
  {
    public static void Main(string[] args)
    {
      // Create a container and add three elements to it.
      LinkedList llc = new LinkedList();
      // AddObject returns a reference to the object added.
      LLNode first = llc.AddObject("This is first string");
      LLNode second = llc.AddObject("This is second string");
      LLNode third = llc.AddObject("This is last string");

      // Add one at the beginning and one in the middle.
      LLNode newfirst = llc.AddObject(null, "Insert before the first string");
      LLNode newmiddle = llc.AddObject(second, "Insert between the second and third strings");

      // We can no longer manipulate the iterator "manually"
      // (who wants to?)
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

      // Iterate with foreach.
      Console.WriteLine("Iterator using foreach");
      foreach(string s in llc)  // Foreach does the cast for you.
      {
          Console.WriteLine(s);
      }

      // Wait for user to acknowledge the results.
      Console.WriteLine("Press Enter to terminate...");
      Console.Read();
    }
  }
}
