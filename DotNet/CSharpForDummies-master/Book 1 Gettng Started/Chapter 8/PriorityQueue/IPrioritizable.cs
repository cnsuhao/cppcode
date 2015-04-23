// File IPrioritizable.cs.
// IPrioritizable interface - defines ability to prioritize.
using System;
namespace PriorityQueue
{
  //IPrioritizable - define a custom interface: classes that can be added to.
  //                 PriorityQueue must implement this interface.
  interface IPrioritizable
  {
    Priorities Priority { get; } // Example of a property in an interface.
  }
}
