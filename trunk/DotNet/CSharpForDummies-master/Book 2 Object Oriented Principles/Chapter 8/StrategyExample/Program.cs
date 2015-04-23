// StrategyExample - Demonstrate using the Strategy pattern
//    to make a class flexible in the face of change. We can
//    modify how a Robosnake moves without further editing the
//    code in the Robosnake class. Just add a new IPropulsion
//    class and install it in a Robosnake instance.
using System;

namespace StrategyExample
{
  class Program
  {
    static void Main(string[] args)
    {
      // The old way, slithering, is still quite possible.
      // Just create and install a Slithering movement object.
      Slithering slither = new Slithering();
      Robosnake slitheringSnake = new Robosnake(slither);
      slitheringSnake.Move(3, 3);

      // So does the new way, undulating.
      // Just create and install an Undulating movement object
      // instead of a Slithering movement object.
      Undulating undulate = new Undulating();
      Robosnake undulatingSnake = new Robosnake(undulate);
      undulatingSnake.Move(3, 3);

      // Wait for user to acknowledge results.
      Console.WriteLine("Press Enter to terminate...");
      Console.Read();
    }
  }

  // Here's our Robot class hierarchy.

  // Robot - The abstract base class.
  internal abstract class Robot
  {
    abstract internal void Move(int direction, int speed);
    // ...
  }

  // Robosnake - A concrete subclass.
  internal class Robosnake : Robot
  {
    // HAS_A via an interface reference.
    private IPropulsion _propel;

    // Constructor allows installing any propulsion method
    // that implements IPropulsion. This is "constructor injection."
    internal Robosnake(IPropulsion propulsionMethod)
    {
      // Now the snake will have the given propulsion method.
      _propel = propulsionMethod;
    }

    // Move - Carries out movement by delegating the work to the
    //    _propel object, whatever it may be.
    override internal void Move(int direction, int speed)
    {
      _propel.Movement(direction, speed);
    }
  }

  // Here's our set of propulsion classes, implementing the
  // Strategy pattern.

  // IPropulsion defines an abstraction: the concept of 
  // propulsion. We can use it as the basis for any kind
  // of propulsion we need.
  internal interface IPropulsion
  {
    // I called this method Movement instead of Move to help
    // keep the Robot.Move method distinct from IPropulsion.Movement.
    void Movement(int direction, int speed);
  }

  // Slithering - This class implements the old way of movement:
  // that is, slithering. We'd probably just move the old slithering
  // implementation code into this Movement method.
  internal class Slithering : IPropulsion
  {
    #region IPropulsion Members

    public void Movement(int direction, int speed)
    {
      Console.WriteLine("Robosnake: Slither.");
    }

    #endregion
  }

  // Undulating - This class implements the new way of movement:
  // that is, undulating. Here we write the code that really
  // implements undulating.
  internal class Undulating : IPropulsion
  {
    #region IPropulsion Members

    public void Movement(int direction, int speed)
    {
      Console.WriteLine("Robosnake: Undulate.");
    }

    #endregion
  }


}
