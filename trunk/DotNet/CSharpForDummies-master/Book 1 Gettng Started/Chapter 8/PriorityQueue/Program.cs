// PriorityQueue - Demonstrates using lower-level queue collection objects
//    (generic ones at that) to implement a higher-level generic
//    Queue that stores objects in priority order.
using System;
using System.Collections.Generic;
namespace PriorityQueue
{
  class Program
  {
    // Main - Fill the priority queue with packages, then
    // remove a random number of them.
    static void Main(string[] args)
    {
      Console.WriteLine("Create a priority queue:");
      PriorityQueue<Package> pq = new PriorityQueue<Package>();
      Console.WriteLine(
        "Add a random number (0 - 20) of random packages to queue:");
      Package pack;
      PackageFactory fact = new PackageFactory();
      // We want a random number less than 20.
      Random rand = new Random();
      int numToCreate = rand.Next(20); // Random int from 0 - 20.
      Console.WriteLine("\tCreating {0} packages: ", numToCreate);
      for (int i = 0; i < numToCreate; i++)
      {
        Console.Write("\t\tGenerating and adding random package {0}", i);
        pack = fact.CreatePackage();
        Console.WriteLine(" with priority {0}", pack.Priority);
        pq.Enqueue(pack);
      }
      Console.WriteLine("See what we got:");
      int total = pq.Count;
      Console.WriteLine("Packages received: {0}", total);

      Console.WriteLine("Remove a random number of packages (0-20): ");
      int numToRemove = rand.Next(20);
      Console.WriteLine("\tRemoving up to {0} packages", numToRemove);
      for (int i = 0; i < numToRemove; i++)
      {
        pack = pq.Dequeue();
        if (pack != null)
        {
          Console.WriteLine("\t\tShipped package with priority {0}",
              pack.Priority);
        }
      }
      // See how many we "shipped"
      Console.WriteLine("Shipped {0} packages", total - pq.Count);

      // Wait for user to acknowledge the results.
      Console.WriteLine("Press Enter to terminate...");
      Console.Read();
    }
  }
  // Priority enumeration - Defines a set of priorities
  //    instead of priorities like 1, 2, 3, ... these have names.
  //    See Bonus Chapter 5 on enumerations.
  enum Priority
  {
    Low, Medium, High
  }
  // IPrioritizable interface - Defines ability to prioritize
  //    define a custom interface: classes that can be added to
  //    PriorityQueue must implement this interface.
  interface IPrioritizable
  {
    Priority Priority { get; } // Example of a property in an interface.
  }

  //PriorityQueue - A generic priority queue class.
  //   Types to be added to the queue *must* implement IPrioritizable interface.
  class PriorityQueue<T> where T : IPrioritizable
  {
    //Queues - the three underlying queues: all generic!
    private Queue<T> _queueHigh = new Queue<T>();
    private Queue<T> _queueMedium = new Queue<T>();
    private Queue<T> _queueLow = new Queue<T>();

    //Enqueue - Prioritize T and add it to correct queue; an item of type T.
    //   The item must know its own priority.
    public void Enqueue(T item)
    {
      switch (item.Priority) // Require IPrioritizable to ensure this property.
      {
        case Priority.High:
          _queueHigh.Enqueue(item);
          break;
        case Priority.Medium:
          _queueMedium.Enqueue(item);
          break;
        case Priority.Low:
          _queueLow.Enqueue(item);
          break;
        default:
          throw new ArgumentOutOfRangeException(
            item.Priority.ToString(),
            "bad priority in PriorityQueue.Enqueue");
      }
    }

    //Dequeue - Get T from highest priority queue available.
    public T Dequeue()
    {
      // Find highest-priority queue with items.
      Queue<T> queueTop = TopQueue();
      // If a non-empty queue found.
      if (queueTop != null & queueTop.Count > 0)
      {
        return queueTop.Dequeue(); // Return its front item.
      }
      // If all queues empty, return null (we could throw exception).
      return default(T); // What's this? see discussion.
    }

    //TopQueue - What's the highest-priority underlying queue with items?
    private Queue<T> TopQueue()
    {
      if (_queueHigh.Count > 0)   // Anything in high priority queue?
        return _queueHigh;
      if (_queueMedium.Count > 0) // Anything in medium priority queue?
        return _queueMedium;
      if (_queueLow.Count > 0)    // Anything in low priority queue?
        return _queueLow;
      return _queueLow;           // All empty, so return an empty queue.
    }

    //IsEmpty - Check whether there's anything to deqeue.
    public bool IsEmpty()
    {
      // True if all queues are empty.
      return (_queueHigh.Count == 0) & (_queueMedium.Count == 0) &
          (_queueLow.Count == 0);
    }

    //Count - How many items are in all queues combined?
    public int Count  // Implement this one as a read-only property.
    {
      get { return _queueHigh.Count + _queueMedium.Count + _queueLow.Count; }
    }
  }

  //Package - An example of a prioritizable class that can be stored in
  //   the priority queue; any class that implements
  //   IPrioritizable would look something like Package.
  class Package : IPrioritizable
  {
    private Priority _priority;
    //Constructor.
    public Package(Priority priority)
    {
      this._priority = priority;
    }

    //Priority - Return package's priority - read-only.
    public Priority Priority
    {
      get { return _priority; }
    }
    // Plus ToAddress, FromAddress, Insurance, etc.
  }

  //PackageFactory - We need a class that knows how to create a new
  //   Package of any desired type on demand; such a class
  //   is called a factory class.
  class PackageFactory
  {
    //A random-number generator.
    Random _rand = new Random();

    //CreatePackage - The factory method selects a random priority,
    //   then creates a package with that priority.
    //   Could implement this as iterator block (Bonus Chapter 8).
    public Package CreatePackage()
    {
      // Return a randomly selected package priority.
      // Need a 0, 1, or 2 (values less than 3)
      int randNum = _rand.Next(3);
      // Use that to generate a new package.
      // Casting int to enum is klunky, but it saves
      // having to use ifs or a switch statement.
      return new Package((Priority)randNum);
    }
  }
}
