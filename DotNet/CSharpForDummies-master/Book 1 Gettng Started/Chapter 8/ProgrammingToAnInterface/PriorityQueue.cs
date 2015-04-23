// PriorityQueue - A structure to hold prioritized objects.
using System;
using System.Collections.Generic;
using System.Diagnostics;

namespace ProgrammingToAnInterface
{
  //PriorityQueue - A generic priority queue class.
  //   Types to be added to the queue *must*
  //   implement IPrioritizable interface.
  public class PriorityQueue<T> where T : IPrioritizable
  {
    private int numQueues;  // Number of underlying queues.

    // Queues - The underlying queues: all generic!
    // Q: why an array? Why not a generic List<T>?
    // Because the type stored in these queues is Queue<T>,
    // Not T! Why not an ArrayList? Because ArrayList
    // holds Objects, and C# doesn't permit casting an Object
    // to a Queue<T>.
    Queue<T>[] queues;

    //Constructor.
    public PriorityQueue(int priorities)
    {
      // Create the array of queues.
      numQueues = priorities;
      queues = new Queue<T>[numQueues];

      // Create the required number of queues - fill queues array.
      for (int i = 0; i < numQueues; i++)
      {
        Trace.WriteLine("TRACE: Creating underlying queue " + i);
        queues[i] = CreateQueue();
      }
      Trace.WriteLine("TRACE: Total number of queues created: " + numQueues);
    }

    // CreateQueue - create a new queue to store in the list.
    private Queue<T> CreateQueue()
    {
      Queue<T> queueNew = new Queue<T>();
      return queueNew;
    }

    //Enqueue - prioritize T and add it to correct queue.
    //               An item of type T must know its own priority.
    public void Enqueue(T item)
    {
      // Note that item must have a Priority method.
      // That's why its type must implement IPrioritizable.
      // We use the array indexer to grab a particular queue.
      // Based on the int Priority value.
      Trace.WriteLine(
        String.Format("TRACE: Enqueuing a {0}", item.ToString()));
      queues[item.Priority].Enqueue(item);
    }

    //Dequeue - get T from highest priority queue available.
    public T Dequeue()
    {
      // Find highest-priority queue with items.
      Queue<T> queueTop = TopQueue();
      // If a non-empty queue found.
      if (queueTop != null & queueTop.Count > 0)
      {
        Trace.WriteLine(
          String.Format("TRACE: Dequeue returning a {0} from " +
          "a queue containing {1} items", queueTop.Peek().ToString(),
          queueTop.Count));
        // Return its front item.
        T item = queueTop.Dequeue();
        return item;
      }
      else
      {
        // If all queues empty, return null
        // (we could throw an exception instead).
        // Note use of 'default(T)' - see PriorityQueue
        // discussion in the Bonus Chapter 7 text.
        return default(T);
      }
    }

    //Peek - look at the highest priority T available
    //   without removing it from its queue.
    public T Peek()
    {
      // Find highest-priority queue with items.
      Queue<T> queueTop = TopQueue();
      // If a non-empty queue found.
      if (queueTop != null && queueTop.Count > 0)
      {
        // Peek at its front item.
        return queueTop.Peek();
      }
      else
      {
        // If all queues empty, return null
        // (we could throw an exception instead).
        // Note use of 'default(T)' - see discussion
        // in the Bonus Chapter 7 text.
        return default(T);
      }
    }

    //TopQueue - What's the highest-priority underlying
    //   queue that has items in it?
    private Queue<T> TopQueue()
    {
      // Starting with the highest queue in queues array,
      // Work backward through queues looking for a
      // Non-empty queue.
      // Create an empty queue to return if all queues empty.
      Queue<T> queue = CreateQueue();
      for (int i = queues.Length - 1; i >= 0; i--)
      {
        if (queues[i].Count > 0)
        {
          Trace.WriteLine(
            String.Format("TRACE: TopQueue returning queue {0} with {1} items",
            i, queues[i].Count));
          queue = queues[i];
        }
      }
      return queue;
    }

    //IsEmpty - Check whether there's anything in
    //   the PriorityQueue to dequeue.
    public bool IsEmpty()
    {
      // True if all queues are empty.
      for (int i = 0; i < queues.Length; i++)
      {
        // If any queue not empty, IsEmpty is false.
        if (queues[i].Count > 0) return false;
      }
      return true;
    }

    //Count - How many items are in all queues combined?
    public int Count  // Implement this one as a read-only property.
    {
      get
      {
        // Add up number in each queue.
        int sumCounts = 0;
        for (int i = 0; i < queues.Length; i++)
        {
          int count = queues[i].Count;
          Trace.WriteLine(
            String.Format("TRACE: items in queue {0} = {1}", i, count));
          sumCounts += count;
        }
        return sumCounts;
      }
    }

    // GetEnumerator - Implemented with an iterator block.
    public IEnumerator<T> GetEnumerator()
    {
      Trace.WriteLine("TRACE: At start of enumerator, count is " + Count);
      int item = 0;
      // Iterate the underlying queues.
      foreach(Queue<T> q in queues)
      {
        // Iterate items in this queue.
        foreach(T t in q)
        {
          Trace.WriteLine(
            String.Format("\tTRACE: Iterator returning package {0}, a {1}",
              item, t.ToString()));
          yield return t;
          ++item;
        }
      }
    }
  }
}
