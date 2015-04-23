// GenericDelegateExample - Demonstrate using a generic delegate.
using System;

namespace GenericDelegate
{
  class Program
  {
    // A generic delegate specifying methods with a return type and a
    // single parameter.
    delegate T MyAction<T, U>(U aParam);

    static void Main(string[] args)
    {
      // Instantiate the delegate for an int return and a string parameter.
      // Point to a method, AMethod, that matches that signature.
      MyAction<int, string> act = new MyAction<int, string>(Program.AMethod);
      // Invoke the delegate with an argument of the appropriate type.
      int result = act("antidisestablishmentarianism");
      Console.WriteLine("Length of word is {0}", result);

      // Instantiate the delegate for a Student return and a string parameter.
      // Point to a method, Method2, with that signature (note the alternative
      // way to specify the method (in boldface) - much more convenient).
      MyAction<Student, string> act2 = Program.Method2;
      // Invoke the delegate.
      Student aStudent = act2("Marco");
      Console.WriteLine("Student's name is {0}", aStudent.Name);

      // Invoke the delegate using an anonymous method.
      MyAction<int, int> act3 = delegate(int param) { return param; };
      Console.WriteLine("Result is {0}", act3(4));

      // Call a method that takes a MyAction<string, int> delegate.
      // Pass a lambda expression (Chapter 16) for the delegate.
      string name = GetNumberName(4, (n) => "four" );
      Console.WriteLine("Number name for number 4 = {0}", name);

      // Wait for user to acknowledge results.
      Console.WriteLine("Press Enter to terminate...");
      Console.Read();
    }

    // AMethod - Matches delegate signature of <int, string>.
    static int AMethod(string itsOneParam)
    {
      return itsOneParam.Length;
    }

    // Method2 - Matches delegate signature of <Student, string>.
    static Student Method2(string name)
    {
      Student s = new Student();
      s.Name = name;
      return s;
    }

    // GetNumberName - Given a number and a delegate, carries out the delegate
    //    action on the number and returns the result as a string.
    static string GetNumberName(int number, MyAction<string, int> act)
    {
      return act(number);
    }
  }

  public class Student
  {
    public string Name { get; set; }
  }
}
