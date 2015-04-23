// File Package.cs.
// Package class - an object that can be prioritized.
//                 And stored in a priority queue.
using System;
namespace PriorityQueue
{
  //Package - an example of a prioritizable class that can be stored in.
  //          The priority queue; any class that implements.
  //          IPrioritizable would look something like Package.
  class Package : IPrioritizable
  {
    private Priorities priority;
    //Constructor.
    public Package(Priorities priority)
    {
      this.priority = priority;
    }

    //Priority - return package's priority.
    public Priorities Priority
    {
      get { return priority; }
    }
    // Plus ToAddress, FromAddress, Insurance, etc.
  }
}
