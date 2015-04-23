// InternalLimitsAccess - Demonstrate how you can use the internal keyword
//    to limit access to classes and methods so that only other classes in
//    the same assembly can access them.
using System;
using CIAAssembly;

namespace InternalLimitsAccess
{
  class Congress
  {
    static void Main(string[] args)
    {
      // Code to oversee CIA.
      // The following line won't compile because GroupA isn't accessible outside
      // the CIAAssembly. Congress can't get at GroupA over at CIA at all.

      // CIAAssembly.GroupA groupA = new CIAAssembly.GroupA();

      // Class Congress can access GroupB because it's declared public.
      // GroupB is willing to admit to knowing the secret, but they're
      // not telling ... except for a small hint.
      GroupB groupB = new GroupB();
      groupB.DoSomethingWithSecretX();

      // Wait for user to acknowledge results.
      Console.WriteLine("Press Enter to terminate...");
      Console.Read();
    }
  }
}
