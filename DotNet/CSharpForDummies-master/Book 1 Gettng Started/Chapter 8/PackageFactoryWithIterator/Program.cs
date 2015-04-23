// PackageFactoryWithIterator - Demonstrates a version of
//    the package factory that uses the C# iterator block.
using System;
using System.Collections.Generic;
namespace PackageFactoryWithIterator
{
   class Program
   {
      static void Main(string[] args)
      {
         // Fill the priority queue with packages, then remove a
         // random number of them.

         // Create a priority queue.
         PriorityQueue<Package> pq = new PriorityQueue<Package>();
         // Create a random number (0 - 20) of random packages.
         // Add them to the priority queue.
         Package pack;
         PackageFactory fact = new PackageFactory();
         // We want a random number less than 20.
         Random rand = new Random();
         // Get a random int from 0 - 20.
         int toCreate = rand.Next(20);
         // No longer need code like this, foreach works.
//      For (int i = 0; i < toCreate; i++)
//      {
//        Pack = fact.CreatePackage();
//        Pq.Enqueue(pack);
//      }
         // This invokes the iterator within PackageFactory.
         foreach (Package pkg in fact.CreatePackage(toCreate))
         {
            pq.Enqueue(pkg);
         }
         int countTotal = pq.Count();
         Console.WriteLine("Packages received: {0}", countTotal);
         // Remove a random number of packages.
         int toRemove = rand.Next(20);
         for (int i = 0; i < toRemove; i++)
         {
            pack = pq.Dequeue();
            if (pack != null)
            {
               Console.WriteLine("Shipped package with priority {0}",
                 pack.Priority());
            }
         }
         Console.WriteLine("Shipped {0} packages",
           countTotal - pq.Count());

         // Wait for user to acknowledge the results.
         Console.WriteLine("Press Enter to terminate...");
         Console.Read();
      }
   }

   // IPrioritizable - Define a custom interface: all classes
   //    that can be added to our PriorityQueue
   //    must implement this interface so they
   //    will have the right methods.
   interface IPrioritizable
   {
      bool HasHighPriority();
      bool HasLowPriority();
   }

   // PriorityQueue - A generic priority queue class
   //    types to be added to the queue must
   //    implement IPrioritizable interface.
   class PriorityQueue<T> where T : IPrioritizable
   {
      // The three underlying queues.
      private Queue<T> hiQ = new Queue<T>();
      private Queue<T> medQ = new Queue<T>();
      private Queue<T> loQ = new Queue<T>();

      public PriorityQueue()
      {
      }

      // Prioritize T and add it to correct queue.
      //  An item of type T must know its own priority.
      public void Enqueue(T item)
      {
         // Note that item must have these methods.
         //  That's why its type must implement IPrioritizable.
         if (item.HasHighPriority())
         {
            hiQ.Enqueue(item);
         }
         else if (item.HasLowPriority())
         {
            loQ.Enqueue(item);
         }
         else
         {
            medQ.Enqueue(item);
         }
      }

      // Get T from highest priority queue available.
      public T Dequeue()
      {
         // Anything in the high-priority queue?
         if (hiQ.Count > 0)
            return hiQ.Dequeue();
         // Anything in the medium-priority queue?
         if (medQ.Count > 0)
            return medQ.Dequeue();
         // Anything in the low-priority queue?
         if (loQ.Count > 0)
            return loQ.Dequeue();
         // If all queues empty, return null
         //  (we could throw an exception instead).
         // Note use of 'default(T)' - see discussion
         // in the chapter text.
         return default(T);
      }

      // Look at the highest priority T available
      // without removing it from its queue.
      public T Peek()
      {
         // Could return null, so check result.
         return TopQueue().Peek();
      }

      // What's the highest-priority underlying queue
      // that has items in it?
      private Queue<T> TopQueue()
      {
         if (hiQ.Count != 0)
            return hiQ;
         if (medQ.Count != 0)
            return medQ;
         if (loQ.Count != 0)
            return loQ;
         return null;
      }

      // Check whether there's anything to deqeue.
      public bool IsEmpty()
      {
         // True if all queues are empty.
         return (hiQ.Count == 0) & (medQ.Count == 0) & (loQ.Count == 0);
      }

      // How many items are in all queues combined?
      public int Count()
      {
         return hiQ.Count + medQ.Count + loQ.Count;
      }
   }

   // Instead of priorities like 1, 2, 3, ... we
   // give them names.
   enum Priorities
   {
      Low, Medium, High
   }

   // Package - An example of a prioritizable class that
   //    can be stored in the priority queue; any class 
   //    that implements IPrioritizable would look
   //    something like Package.
   class Package : IPrioritizable
   {
      public Package()
      {
      }

      public virtual Priorities Priority()
      {
         return Priorities.Medium;
      }

      public virtual bool HasHighPriority()
      {
         return false;
      }

      public virtual bool HasLowPriority()
      {
         return false;
      }

      // Plus ToAddress, FromAddress, Insurance, etc.
   }

   // Now two Package subclasses to cover the high
   // and low range of priorities; Package itself
   // represents the medium priority.

   // HighPriorityPackage - "Knows" its priority is
   //    High because it overrides the IPrioritizable 
   //    implementation in the base class, Package.
   class HighPriorityPackage : Package
   {
      public HighPriorityPackage()
      {
      }

      public override Priorities Priority()
      {
         return Priorities.High;
      }

      public override bool HasHighPriority()
      {
         return true;
      }

      public override bool HasLowPriority()
      {
         return false;
      }

      // And more stuff.
   }

   // LowPriorityPackage - "Knows" its priority is low.
   class LowPriorityPackage : Package
   {

      public LowPriorityPackage()
      {
      }

      public override Priorities Priority()
      {
         return Priorities.Low;
      }

      public override bool HasHighPriority()
      {
         return false;
      }

      public override bool HasLowPriority()
      {
         return true;
      }

      // And more stuff.

   }

   // PackageFactory - We need a class that knows how to create a new
   //    Package of any desired type on demand; such a class is called 
   //    a factory class. This one uses an iterator block.
   class PackageFactory
   {
      Random _randGen;

      public PackageFactory()
      {
         _randGen = new Random();
      }
      static int numCreated = 0;

      public System.Collections.IEnumerable CreatePackage(int numToCreate)
      {
         int rand = 0;
         for (rand = _randGen.Next(3); ; rand = _randGen.Next(3))
         {
            numCreated += 1;
            if (numCreated > numToCreate)
               yield break;
            switch (rand)
            {
               case 0:   // We let this represent Package.
                  yield return new Package();
                  break;
               case 1:   // While 1 & 2 represent packages ...
                  yield return new HighPriorityPackage();
                  break;
               case 2:   // With other priorities.
                  yield return new LowPriorityPackage();
                  break;
               default:  // Always cover the "it can't happen" case.
                  throw new InvalidOperationException();
            }
         }
      }
   }
   // Here's what we replaced with the code above.
   //    Public Package CreatePackage()
   //    {
   //      // Return a randomly selected package priority.
   //      //  Need a 0, 1, or 2 (values less than 3).
   //      Int rand = _randGen.Next(3);
   //      // Use that to generate a new package.
   //      Switch (rand)
   //      {
   //        Case 0:   // we let this represent Package.
   //          Return new Package();
   //        Case 1:   // While 1 & 2 represent packages ...
   //          Return new HighPriorityPackage();
   //        Case 2:   // With other priorities.
   //          Return new LowPriorityPackage();
   //        Default:  // Always cover the "it can't happen" case.
   //          Throw new InvalidOperationException();
   //      }
   //    }
   //  }
}
