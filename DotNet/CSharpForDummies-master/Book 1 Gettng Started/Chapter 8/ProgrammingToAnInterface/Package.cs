// Package - One kind of shippable object.
using System;

namespace ProgrammingToAnInterface
{
  // Package - Implements both interfaces.
  public class Package : IPrioritizable, IPackage
  {
    private int priority;
    private string toAddress;

    public Package(int priority, string toAddress)
    {
      this.priority = priority;
      this.toAddress = toAddress;
    }

    // Implement IPrioritizable.
    // Return PriorityLevel as an int.
    public int Priority
    {
      get { return priority; }
    }

    // ToString - Display package essentials.
    public override string ToString()
    {
      return String.Format("Package (priority {0})", Priority);
    }

    // ToAddress - Get/set the address of package recipient.
    public string ToAddress
    {
      get { return toAddress; }
      set { toAddress = value; }
    }

    // Other stuff: FromAddress, Insurance, etc.
  }
}
