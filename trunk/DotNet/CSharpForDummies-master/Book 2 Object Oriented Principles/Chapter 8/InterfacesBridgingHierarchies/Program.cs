// InterfacesBridgingHierarchies - Demonstrates that objects in 
//    completely different class hierarchies can implement a common
//    C# interface, which enables working with those objects
//    as a group regardless of which hierarchy they're in.
using System;
using System.Collections.Generic;

namespace InterfacesBridgingHierarchies
{
  class Program
  {
    static void Main(string[] args)
    {
      // Working through a Cat object.
      Cat striper = new Cat("Striper");
      Console.WriteLine(striper);  // Writes cat's name via override of ToString().
      striper.AskForStrokes();
      striper.Breathe();
      striper.DoTricks();
      Console.WriteLine("{0} the cat has {1} legs.", striper.Name, striper.NumberOfLegs);
      striper.Eat("tuna");
      striper.Sleep(3);

      // Working through a subclass of Cat.
      Tabby emerson = new Tabby("Emerson");
      Console.WriteLine(emerson);  // Writes cat's name via inherited ToString().
      emerson.AskForStrokes();
      emerson.Breathe();
      emerson.DoTricks();
      Console.WriteLine("Emerson the tabby has {0} legs.", emerson.NumberOfLegs);
      emerson.Eat("salmon");
      emerson.Sleep(5);

      // Put all real cats in an array.
      Cat[] cats = { striper, emerson };
      Console.WriteLine("Cats:");
      foreach (Cat c in cats)
      {
        Console.WriteLine(c.Name);
      }

      // RoboCat as IPet - abilities limited to IPet abilities.
      IPet pete = new RoboCat("Pete");
      pete.AskForStrokes();
      pete.DoTricks();
      Console.WriteLine("RoboCat {0} has {1} legs.", pete.Name, pete.NumberOfLegs);

      // Casting IPet robo to RoboCat - has more abilities.
      RoboCat robocatPete = (RoboCat)pete;
      robocatPete.LiftObject(striper);
      robocatPete.Speak("purrrxxxx");
      
      // Treat real cats and robocats as pets.
      IPet stripes = striper;
      IPet em = emerson;
      List<IPet> pets = new List<IPet> { stripes, em, pete };
      Console.WriteLine("Pets:");
      foreach(IPet p in pets)
      {
        Console.WriteLine(p.Name);
      }

      // Wait for user to acknowledge results.
      Console.WriteLine("Press Enter to terminate...");
      Console.Read();
    }
  }

  abstract class Animal
  {
    abstract public void Eat(string food);
    abstract public void Sleep(int hours);
    public void Breathe() // A nonabstract method.
    {
      // Do breathing stuff.
      Console.WriteLine("Animal Breathe():  snsnsnsnsnnsnsnsnsn");
    }
    abstract public int NumberOfLegs { get; }
  }

  abstract class Robot
  {
    public virtual void Speak(string whatToSay)
    {
      // Do speaking stuff.
      Console.WriteLine("Robot Speak(): {0}", whatToSay);
    }

    abstract public void LiftObject(object o);
    abstract public int NumberOfLegs { get; }
  }

  interface IPet
  {
    // No implementations, equivalent to abstract.
    void AskForStrokes();
    void DoTricks();
    int NumberOfLegs { get; }
    string Name { get; set; }
  }

  // Cat - A concrete class that inherits (and partially
  //    implements) class Animal, and also implements
  //    interface IPet.
  class Cat : Animal, IPet
  {
    public Cat(string name)
    {
      Name = name;
    }

    // 1. Inherits and implements all Animal members.

    #region Animal Implementation

    public override void Eat(string food)
    {
      Console.WriteLine("Cat Eat(): Nibble, nibble, nibble");
    }

    public override void Sleep(int hours)
    {
      Console.WriteLine("Cat Sleep(): shhhhhhhhhhhh");
    }

    public override int NumberOfLegs { get { return 4; } }

    #endregion Animal Implementation

    // 2. Provides additional implementation for IPet.
    #region IPet Members

    public void AskForStrokes()
    {
      Console.WriteLine("Cat {0} AskForStrokes(): Purrrrr!", Name);
    }

    public void DoTricks()
    {
      Console.WriteLine("Cat {0} DoTricks(): Yawn.", Name);
    }

    public string Name { get; set; }

    // Inherits NumberOfLegs property, which meets
    // IPet's requirement for a NumberOfLegs property.

    #endregion IPet Members

    public override string ToString()
    {
      return Name;
    }
  }

  class Cobra : Animal
  {
    // 1. Inherits or overrides all Animal methods.
    #region Animal Implementation

    public override void Eat(string food)
    {
      Console.WriteLine("Cobra Eat(): Guuuulp!");
    }

    public override void Sleep(int hours)
    {
      Console.WriteLine("Cobra Sleep(): SSssssssss");
    }

    public override int NumberOfLegs { get { return 0; } }

    #endregion Animal Implementation
  }

  class Tabby : Cat
  {
    public Tabby(string name) : base(name) { }

    // 1. Inherits all Cat methods (hence Animal methods).
    // 2. Overrides nothing.
    // 3. Also inherits IPet implementation, so Tabby IS_A IPet.
  }

  class RoboZilla : Robot    // Not IPet.
  {
    // 1. Overrides Speak.

    public override void Speak(string whatToSay)
    {
      Console.WriteLine("RoboZilla Speak(): DESTROY ALL HUMANS!");
    }

    // 2. Implements LiftObject and NumberOfLegs. 

    public override void LiftObject(object o)
    {
      Console.WriteLine("RoboZilla LiftObject(): suuuuuuck");
    }

    public override int NumberOfLegs { get { return 2; } }
  }

  class RoboCat : Robot, IPet
  {
    public RoboCat(string name)
    {
      Name = name;
    }

    // 1. Doesn't eat, so no Eat method.
    // 2. Lifts small objects.
    public override void LiftObject(object so)
    {
      Console.WriteLine("RoboCat {0} LiftObject(): Heave hoooo!", Name);
    }

    // 3. Has 4 legs.
    public override int NumberOfLegs { get { return 4; } }

    #region IPet Members

    public void AskForStrokes()
    {
      Console.WriteLine("RoboCat {0} AskForStrokes(): Please stroke me!", Name);
    }

    public void DoTricks()
    {
      Console.WriteLine("RoboCat {0} DoTricks(): Backflip, frontflip, jump.");
    }

    public string Name { get; set; }

    #endregion
  }

}
