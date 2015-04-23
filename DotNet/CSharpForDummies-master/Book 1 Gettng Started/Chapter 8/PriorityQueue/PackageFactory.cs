// File PackageFactory.cs.
// PackageFactory class - defines a simple factory for.
//               Creating Package objects with random.
//               Priorities.
using System;
namespace PriorityQueue
{
  //PackageFactory - we need a class that knows how to.
  //               Create a new package of any desired.
  //               Type on demand; such a class is.
  //               Called a factory class.
  class PackageFactory
  {
    //A random-number generator.
    Random rand = new Random();

    //CreatePackage - the factory method.
    //               Selects a random priority, then.
    //               Creates a package with that priority.
    //               Could implement this as iterator block.
    public Package CreatePackage()
    {
      // Return a randomly selected package priority.
      //  Need a 0, 1, or 2 (values less than 3)
      int rand = rand.Next(3);
      // Use that to generate a new package.
      // Casting int to enum is klunky, but it saves.
      // Having to use ifs or a switch statement.
      return new Package((Priorities)rand);
    }
  }
}
