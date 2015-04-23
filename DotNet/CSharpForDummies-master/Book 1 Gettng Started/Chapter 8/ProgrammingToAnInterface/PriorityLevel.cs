using System;
using System.Collections.Generic;
namespace IPackageExample2
{
   public class PriorityLevel
   {
      private int priority;
      public PriorityLevel(int priority)
      {
         this.priority = priority;
      }

      public int Priority
      {
         get { return priority; }
      }
   }
   // Here's the old enum.
   //  Public enum Priorities.
   //  {
   //    // Equivalent to 0, 1, 2, 3, 4.
   //    // Given Priorites p = Priorities.Manana,
   //    // The cast (int)p == 0.
   //    // (a bit of a hack)
   //    Manana, Low, Medium, High, Urgent.
   //  }
}
