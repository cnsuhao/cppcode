// Parcel - A different type of package.
using System;
using System.Collections.Generic;
namespace ProgrammingToAnInterface
{
  // Parcel - Another class similar to Package (but unrelated).
  //    Implements both interfaces.
  public class Parcel : IPrioritizable, IPackage
  {
    private int _priority;
    private string _toAddress;

    public Parcel(int priority, string toAddress)
    {
      this._priority = priority;
      this._toAddress = toAddress;
    }

    // Implement IPrioritizable.
    // Return PriorityLevel as an int.
    public int Priority
    {
      get { return _priority; }
    }

    // ToString - Display package essentials.
    public override string ToString()
    {
      return String.Format("Parcel (priority {0})", Priority);
    }

    // ToAddress - Get/set the address of package's recipient.
    public string ToAddress
    {
      get { return _toAddress; }
      set { _toAddress = value; }
    }

    // Other stuff: FromAddress, Insurance, etc.
  }
}
