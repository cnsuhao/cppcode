// DeadlyRecursion - Illustrates what happens when a recursion has
//    no "bottom" so that it never stops.
using System;

namespace DeadlyRecursion
{
  class Program
  {
    static void Main(string[] args)
    {
      // Make the first call . . .
      DoStuffRecursively();
    }

    private static void DoStuffRecursively()
    {
      // Now chase your tail:
      DoStuffRecursively();
    }
  }
}
