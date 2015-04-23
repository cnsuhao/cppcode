// LinkedListContainer - Demonstrate a "home grown" linked list.
//    This container implements IEnumerable to support operators such 
//    as foreach. This example also includes an iterator which
//    implements the IEnumerator interface. Note that I haven't
//    tried to make this generic, though undoubtedly it should be.
//    (See the GenericLinkedListContainer example for that.)
using System;
using System.Collections;

namespace LinkedListContainer
{
  // LLNode class - Each LLNode forms a node in the list.
  //    Each LLNode node references a target data object to be
  //    incorporated into the list.
  public class LLNode
  {
    // References the object hanging from ("contained by") this node.
    // This is the data stored in the list node.
    internal object _linkedData = null;

    // Forward and backward pointer.
    // Marked internal so LinkedList can access them directly.
    internal LLNode _forward  = null; // Next node in list.
    internal LLNode _backward = null; // Previous node in list.

    // Constructor.
    internal LLNode(object linkedData)
    {
      this._linkedData = linkedData;
    }

    // Retrieve the data stored in this node.
    public object Data
    {
      get
      {
        return _linkedData;
      }
    }
  }

  // LinkedList class - Implements a doubly linked list container.
  public class LinkedList : IEnumerable
  {
    // The ends of the linked list.
    // Internal so iterator can access them directly.
    internal LLNode _head = null;  // "Front" of list.
    internal LLNode _tail = null;  // "End" of list.

    public IEnumerator GetEnumerator()
    {
      // LinkedListIterator is defined below.
      return new LinkedListIterator(this);
    }

    // AddObject - Add an object to the end of list.
    public LLNode AddObject(object toAdd)
    {
      return AddObject(_tail, toAdd);
    }

    // AddObject- Add an object to the list after a particular node.
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
      if (previousNode != null && previousNode._forward != null)
      {
        // Just switch the pointers around and we're done.
        LLNode nextNode = previousNode._forward;

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
        LLNode nextNode = _head;
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
    public void RemoveObject(LLNode currentNode)
    {
      // Get the current node's neighbors.
      LLNode previousNode = currentNode._backward;
      LLNode nextNode     = currentNode._forward;

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

  // LinkedListIterator class - Give application access to LinkedList lists.
  //    This is the object returned by LinkedList's GetEnumerator() method.
  public class LinkedListIterator : IEnumerator
  {
    // The linked list we're iterating.
    private LinkedList _linkedList;

    // The "current" and "next" linked list elements.
    // Private to prevent any outside direct access.
    private LLNode _currentNode = null;
    private LLNode _nextNode = null;

    //LinkedListIterator - Constructor.
    public LinkedListIterator(LinkedList linkedList)
    {
      this._linkedList = linkedList;
      Reset();
    }

    // Current- Return the data object at the current location.
    public object Current
    {
      get
      {
        if (_currentNode == null)
        {
          return null;
        }
        return _currentNode._linkedData;
      }
    }

    //  Reset - Move the iterator back to immediately prior
    //     to the first node in the list.
    public void Reset()
    {
      _currentNode = null;
      _nextNode = _linkedList._head;
    }

    // MoveNext - Move to the next item in the list unless we
    //    have already reached the end.
    public bool MoveNext()
    {
      _currentNode = _nextNode;
      if (_currentNode == null)
      {
        return false;
      }

      _nextNode = _nextNode._forward;
      return true;
    }
  }

  public class Program
  {
    public static void Main(string[] args)
    {
      // Create a container and add three elements to it.
      LinkedList llc = new LinkedList();
      LLNode first = llc.AddObject("This is first string");
      LLNode second = llc.AddObject("This is second string");
      LLNode third = llc.AddObject("This is last string");

      // Add one at the beginning and one in the middle.
      LLNode newfirst = llc.AddObject(null, "Insert before the first string");
      LLNode newmiddle = llc.AddObject(second, "Insert between the second and third strings");

      // We can manipulate the iterator "manually"
      Console.WriteLine("Iterate through the container manually:");
      LinkedListIterator lli = (LinkedListIterator)llc.GetEnumerator();
      lli.Reset();
      while(lli.MoveNext())
      {
        string s = (string)lli.Current;
        Console.WriteLine(s);
      }

      // Or we can let foreach do it for us.
      Console.WriteLine("\nIterator using foreach:");
      foreach(string s in llc)
      {
        Console.WriteLine(s);
      }

      // Wait for user to acknowledge the results.
      Console.WriteLine("Press Enter to terminate...");
      Console.Read();
    }
  }
}
