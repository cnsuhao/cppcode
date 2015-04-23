// PackageFactory - A factory to create randomly-prioritized
//    Package and Parcel items.
using System;
using System.Diagnostics;

namespace ProgrammingToAnInterface
{
  //PackageFactory - We need a class that knows how to
  //   create a new package of any desired type on 
  //   demand; such a class is called a factory class.
  // This is one of the few parts of the program that would
  // need to change if we add more package types. Hence, we
  // use the factory class to encapsulate variability.
  // Note: A generic factory would work here too.
  public class PackageFactory
  {
    //A random-number generator.
    Random _randGen = new Random();

    // CreatePackage - Call to create a package of random type with
    //    a random priority.
    public IPrioritizable CreatePackage(int priorities)
    {
      // Return a randomly selected package priority.
      // Loop until it's nonzero.
      int priority;
      do
      {
        priority = _randGen.Next(priorities);
      }
      while (priority <= 0);  // Exit on a nonzero priority.
      // Return a randomly selected package type.
      int type = _randGen.Next(100);
      IPrioritizable pack;
      if (type % 2 == 0)  // Even number.
      {
        Trace.WriteLine("*****TRACE: creating a Package - generated #" +
          type);
        // Create the package with random priority and default address.
        pack = new Package(priority, "Woodland Park, CO");
      }
      else  // Odd number.
      {
        Trace.WriteLine("*****TRACE: creating a Parcel - generated #" +
          type);
        // Create the parcel with random priority and default address.
        pack = new Parcel(priority, "Las Cruces, NM");
      }
      return pack;
    }

  }
}
