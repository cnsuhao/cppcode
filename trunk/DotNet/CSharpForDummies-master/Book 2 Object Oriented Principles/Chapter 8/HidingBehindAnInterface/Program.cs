// HidingBehindAnInterface - Demonstrate using an interface to conceal
//    parts of a class that you don't want (certain) users to call.
using System;

namespace HidingBehindAnInterface
{
  class Program
  {
    // Robozilla - Contains both safe and dangerous operations.
    //    By making the safe ones an implementation of the
    //    IRobozillaSafe interface, we make it possible to 
    //    create objects that don't permit calling the dangerous
    //    operations.
    public class Robozilla : IRobozillaSafe
    {
      public void ClimbStairs()                        // Safe.
      {
        Console.WriteLine("Robozilla: Climbing stairs.");
      }

      public void PetTheRobodog()                      // Safe? Might break it.
      {
        Console.WriteLine("Robozilla: Petting the nice doggie.");
      }

      // Implementation details not shown.
      public void Charge() { }                         // Maybe not safe.
      public void SearchAndDestroy() { }               // Dangerous.
      public void LaunchGlobalThermonuclearWar() { }   // Catastrophic.

      // CreateRobozilla - Call this to create a new safe Robozilla.
      public static IRobozillaSafe CreateRobozilla()
      {
        return (IRobozillaSafe)new Robozilla();
      }
    }

    // IRobozillaSafe - An interface behind which we can hide
    //    unsafe operations.
    public interface IRobozillaSafe
    {
      void ClimbStairs();
      void PetTheRobodog();
    }

    static void Main(string[] args)
    {
      // Create an object accessible only through the interface.
      IRobozillaSafe myZilla = Robozilla.CreateRobozilla();
      // Carry out safe operations with it.
      myZilla.ClimbStairs();
      myZilla.PetTheRobodog();

      // Try to carry out a dangerous operation.
      // The following dangerous operation won't compile.
      //myZilla.LaunchGlobalThermonuclearWar();

      // Wait for user to acknowledge results.
      Console.WriteLine("Press Enter to terminate...");
      Console.Read();
    }
  }
}
