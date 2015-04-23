// PassInterface - Given an object that implements two interfaces,
//    IBase and IDerived (which inherits IBase), can you
//    pass an IDerived object through an IBase parameter? Yes.
//    Can you add IDerived objects to an IBase collection? Yes.
//    Can you use polymorphism as you would with classes? No.
using System;
using System.Collections.Generic;

namespace PassInterface
{
  // Here's the base interface.
  public interface IBase
  {
    void SayHello();
  }

  // Here's a derived interface that "inherits" from IBase.
  public interface IDerived : IBase
  {
    int GetValue();
  }

  // Here's a class that implements both interfaces.
  public class Thing : IDerived  // Only need to mention the most derived interface type here.
  {
    public void SayHello()
    {
      Console.WriteLine("Hello");
    }
    public int GetValue()
    {
      return 1;
    }
  }

  public class ThingDerived : Thing  // Is also an IDerived and an IBase by inheritance.
  {
  }

  class Program
  {
    static void Main(string[] args)
    {
      // Create an IDerived reference to a Thing.
      // IDerived is an interface that "inherits" from IBase via
      // interface inheritance.
      Console.WriteLine("Pass a derived interface object "
        + "through a base interface parameter: ");
      IDerived id = (IDerived)new Thing();
      // Now try to pass id through a reference to IBase (not IDerived).
      TestInheritedInterfacePassing(id);

      Console.WriteLine("\nYou can add an IDerived object to an IBase collection.");
      List<IBase> bases = new List<IBase>();
      bases.Add(id);
      Console.WriteLine("After adding an IDerived item, collection length is {0}.",
        bases.Count);
      Console.WriteLine();

      // "Polymorphic" behavior is different for classes and interfaces.

      Console.WriteLine("\nDemonstrating class polymorphism.");
      Thing t = new Thing();
      // Install an instance of the derived class in t.
      t = new ThingDerived();
      // OK to call Thing method through Thing reference
      // even though the reference points to a ThingDerived object.
      // ThingDerived inherits Thing.SayHello().
      Console.Write("Calling base method through base class reference: ");
      t.SayHello();
      // Also OK to call ThingDerived method through Thing 
      // reference. 
      Console.WriteLine("Calling derived method through base class reference: {0}",
        t.GetValue());
      ThingDerived td = new ThingDerived();
      Console.Write("Calling base method through derived object: ");
      td.SayHello();
      Console.WriteLine("Calling derived method through derived object: {0}",
        td.GetValue());

      Console.WriteLine("\nDemonstrating interface 'polymorphism.'");
      // Thing implements IBase, so this cast is fine.
      IBase ib = (IBase)new Thing();
      // OK to call SayHello() through the interface because
      // Thing implements IBase's SayHello() method.
      Console.Write("Calling base method through derived interface reference: ");
      ib.SayHello();
      // Install an IDerived in the IBase reference.
      ib = (IDerived)ib;
      Console.Write("Attempting to call derived method through base reference ...");
      // The following doesn't compile because 
      // ib knows nothing about IDerived.GetValue().
      //ib.GetValue();
      Console.WriteLine(" fails.");
      // Cast the base reference to a derived reference.
      IDerived id2 = (IDerived)ib;
      // However, this works because IDerived defines GetValue().
      Console.WriteLine("Calling derived method through converted base reference: {0}",
        id2.GetValue());

      Console.WriteLine("Press Enter to terminate...");
      Console.Read();
    }

    // TestInheritedInterfacePassing - This method takes a parameter of type
    //    IBase, the base interface type. The code shows that you
    //    can pass an object of a derived interface type through this parameter.
    static void TestInheritedInterfacePassing(IBase ib)
    {
      ib.SayHello();
      Console.WriteLine("Yes, you can pass an IDerived reference via an IBase reference.");
      
      // But interface inheritance involves no polymorphism.
      // In class inheritance, the base class provides a public interface that all good
      // subclasses adhere to even if they override the inherited methods. Thus you
      // can call all public/protected methods (except any added in subclasses) 
      // in either base or derived classes. That's polymorphism.
      
      // But although the underlying Thing class has both interfaces' methods,
      // you can't call both sets through either of the interface references. 
      // The IBase interface exposes only the SayHello() method, and
      // the IDerived interface exposes only the GetValue() method. Looking at
      // the Thing underneath through either reference is like looking through a 
      // polarizing lens. You can only see what belongs to that interface.
      // If you could see both methods through either reference, you'd have
      // polymorphism here too. But you'd lose the ability to hide parts of the
      // underlying class's public interface by handing out selective interfaces.
      
      // Next call won't work because ib is an IBase reference, even though the
      // underlying object implements IDerived and has a GetValue() method.
      
      //Console.WriteLine(ib.GetValue());
      
      // However, the following does work:
      int value = ((IDerived)ib).GetValue(); // Note the fancy footwork with parentheses.
                                             // (IDerived)ib does the cast. Then the extra
                                             // parentheses wrap the cast object. 
                                             // That cast object is an IDerived reference.
                                             // That's what you call the method on.
      Console.WriteLine(value.ToString());
    }
  }

}
