// SwitchSyntaxTest - Illustrates some of the possibilities in using the switch
//    statement and gives guidelines for good practice with switch.
using System;

namespace SwitchSyntaxTest
{
  class Program
  {
    static void Main(string[] args)
    {
      int unmarried = 0;
      int married = 1;
      int divorced = 2;
      int widowed = 3;
      int noneOfYourBusiness = 4;

      int maritalStatus = 3;  // Set maritalStatus to one of the values above ...

      switch (maritalStatus) // This is the "switch" that sends control down one path or another.
      {
        case 0:  // Keep in mind the possibility of a 0 condition.
          Console.WriteLine("Unmarried");  // Perform some action within the case.
          break; // Must have a break statement at end of each case to prevent "fall-through".
                 // But you can omit it if two or more cases have the same actions - see 2 & 3 below.
        case 1:
          // You can have any amount of content in each case ...
          Console.WriteLine("Married"); 
          break;
        case 2:  // An empty case with no break combines with next case so either performs the same action.
        case 3:
          // ... but keep cases short for readability ...
          Console.WriteLine("Divorced or Widowed");
          // ... Chapters 7 - 9 show how you can call custom methods here to ...
          break;
        case 4:
          // ... "factor out" some of the work. (That's good in if & loop constructs too.)
          Console.WriteLine("None of your business, bub.");
          break;
        default: // Called if none of the cases apply - almost always an error.
          // Make error messages clear and as helpful as possible.
          Console.WriteLine("Error: Marital status must be one of 0=unmarried, 1=married, 2=divorced, 3=widowed, 4=butt out");
          break; // Even the default case requires a break statement.
      }

      Console.WriteLine("\nPress Enter to terminate...");
      Console.Read();

    }
  }
}
