// ProgrammingToAnInterface - A much more flexible PriorityQueue,
//    designed to be resilient in the face of inevitable change.
//
// You've heard of "death and taxes," well change is the other big
// certainty in life. OOPs, Inc.'s management are sure to want to
// upgrade PriorityQueue as their business changes. Thus, to make
// the package-handling system as flexible as possible, we need to
// think about the most likely areas in which it could change.
//
// The chief things that could vary here are (1) the priority system,
// and (2) the kinds of packages handled. Suppose management wants to
// shift to five levels of priority instead of three: Urgent, High,
// Medium, Low, and Manana. We'd suddenly need five underlying queues
// in the PriorityQueue, not three. And suppose OOPs merges with Uh-Oh,
// Inc., whose software works in terms of Parcels, not Packages.
// And if you think those are likely to be the last changes we'll ever
// See, maybe I can interest you in some swampland in Florida.
//
// To meet these areas of variability, we need
// (1) a more versatile system of underlying queues--say, an array
// of them! and
// (2) a more flexible priority system.
//
// I considered various approaches to the priority levels and decided to
// drop the inflexible enum and simply use a numbering system: 1 - 5,
// meaning Manana (1) to Urgent (5). It's easy to add a new priority
// level, then. Just add another number. Now, when we call Create(),
// we specify the number of priority levels we're working with, and
// the factory uses that as the range from which it picks a random
// priority. And I changed the underlying queue system to an array of
// Queues. If the priority levels change, so does the number of actual
// underlying queues.
//
// As for package types, the PriorityQueue now handles any object that
// implements a special IPrioritizable interface. The program actually
// uses two interfaces. Besides IPrioritizable, the Package class
// implements the IPackage interface, which specifies the standard
// interface methods for any package type we might ever work with.
//
// (Look below the code in this file for additional notes.)
//
// The program contains Trace output calls (using class System
// Diagnostics.Trace) so you can run the app, wait to press Enter,
// open the Output window, and see the action unfold in some detail.
//
// This file contains Main(). See other files for other classes.

using System;
using System.Diagnostics;

namespace ProgrammingToAnInterface
{
  class Program
  {
    // Create a PriorityQueue that holds any object that
    // implements an IPrioritizable interface.
    static void Main(string[] args)
    {
      // Set the number of priority levels we're using.
      int numPriorities = 5;
      // Create a priority queue.
      // Note that we instantiate the PQ for IPrioritizable objects!
      PriorityQueue<IPrioritizable> pq =
        new PriorityQueue<IPrioritizable>(numPriorities);
      // Create a random number (0 - 50) of random
      // packages and parcels; add them to the priority queue.
      IPrioritizable pack;
      PackageFactory fact = new PackageFactory();
      // We want a random number less than 50.
      Random rand = new Random();
      // Get a random int from 0 - 50.
      int numToCreate = rand.Next(50);
      Trace.WriteLine("TRACE: Creating 50 packages");
      Console.WriteLine("Receiving packages:");
      for (int i = 0; i < numToCreate; i++)
      {
        // Generate a random package.
        pack = fact.CreatePackage(numPriorities);
        Trace.WriteLine(
          String.Format("\received a {0}", pack.ToString()));
        Console.WriteLine(
          "\tReceived package {0}: a {1}", i, pack.ToString());
        // Add it to the priority queue.
        pq.Enqueue(pack);
      }
      // See what we got.
      Trace.WriteLine(
        String.Format("Received {0} packages", pq.Count));
      Console.WriteLine("Packages received: {0}", pq.Count);
      Console.WriteLine("\tList:");
      // Display packages with priorities and ToAddresses.
      // Uses new PriorityQueue.GetEnumerator()
      foreach (IPrioritizable ip in pq)
      {
        if (ip != null)
        {
            Console.WriteLine("\t\ta {0} sent to {1}",
              ip.ToString(), ((IPackage)ip).ToAddress);
              // The parentheses above ensure that we first
              // extract the item, then convert it to IPackage,
              // and finally call ToAddress(), which would be
              // illegal this way: (IPackage)ip.ToAddress()
        }
      }

      // "Ship" all packages.
      int totalShipped = 0;
      Trace.WriteLine("TRACE: Before shipping, count = " + pq.Count);
      Console.WriteLine("\tshipping all packages (in priority order, of course):");
      int numToShip = pq.Count;
      // Dequeue the correct number of packages.
      // Another way to iterate the PriorityQueue.
      for(int i = 0; i < numToShip; i++)
      {
        IPrioritizable ipack = pq.Dequeue();
        if (ipack != null)
        {
          // Note you can call ToString() on any object, don't
          // need a cast for this one.
          Console.WriteLine("\tShipped a {0}", ipack.ToString());
          ++totalShipped;
        }
        Trace.WriteLine(
          String.Format("TRACE: Main() with {0} items to go", pq.Count));
      }
      // See how many we "shipped."
      Console.WriteLine("Shipped {0} packages", totalShipped);
      Trace.WriteLine(
        String.Format("TRACE: Terminating after shipping {0} packages",
        totalShipped));
      // Wait for user to acknowledge the results.
      Console.WriteLine("Press Enter to terminate...");
      Console.Read();
    }
  }
}
// Additional notes:
//
// This program design illustrates several important principles of
// good object-oriented design.
//
// (1) Find what varies in your design and encapsulate it. In this case,
// the variabilities are package types and priority levels. Rather
// than encapsulating priority levels in a class, I just simplified
// the way I represent a priority. (This approach loses something from
// the enum, and in a more professional app I might have tried harder
// to find a more object-centered approach.)
//
// (2) Program to an interface (or abstract class), not to a concrete
// class. The idea is to base changeable parts of your code on
// abstractions, such as the notion of "package," represented by the
// IPrioritizable interface, rather than on concrete implementations such
// as our Package and Parcel classes. Base those concrete classes on
// an interface.
// I'm using "interface" in a higher sense here: you
// can carry out this principle with a C# interface or with an abstract
// class. Use an abstract class if your concrete classes don't already
// derive from a base class other than Object, and if you want to
// supply some implementation to all subclasses (some methods that
// already do useful work). Otherwise, use an interface. Then refer
// in most parts of the code to the interface, not to concrete objects.
// Work on objects through the interfaces they implement. So, for.
// example, I instantiate the PriorityQueue for IPrioritizable objects,
// not for Package or Parcel objects. I manipulate those objects through
// the IPrioritizable interface.
//
// I encapsulated the variability in package types under the IPrioritizable
// interface. The code thus speaks in terms of IPrioritizable objects rather
// than the two concrete package types.
//
// Using these principles makes a program design more robust, flexible,
// and maintainable. It will now be easy to introduce new package
// types and priority levels without major code changes. I don't have
// room to discuss these principles (and others) more fully here, but
// I do recommend a few books that will help you become a more
// powerful OO programmer:
//    - Head First Design Patterns, Freeman & Freeman (O'Reilly, 2004).
//    - Design Patterns Explained, 2nd ed., Shalloway & Trott (Addison-
//      Wesley, 2005).
//    - Agile Principles, Practices, and Patterns, Martin & Martin 
//      (Prentice-Hall, 2007).
