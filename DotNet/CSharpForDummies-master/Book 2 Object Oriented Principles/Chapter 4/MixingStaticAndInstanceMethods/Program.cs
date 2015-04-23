// MixingStaticAndInstanceMethods - Mixing class (static) methods
//    and instance (nonstatic) methods can cause problems.
using System;

namespace MixingStaticAndInstanceMethods
{
  public class Student
  {
    public string _firstName;
    public string _lastName;

    // InitStudent - Initialize the student object.
    public void InitStudent(string firstName, string lastName)
    {
      this._firstName = firstName;
      this._lastName = lastName;
    }

    // OutputBanner (static) - Output the introduction.
    public static void OutputBanner()
    {
      Console.WriteLine("Aren't we clever:");
      // Console.WriteLine(? what student do we use ?);
    }

    // OutputBannerAndName (nonstatic) - Output intro.
    public void OutputBannerAndName()
    {
      // The class Student is implied but no this
      // object is passed to the static method.
      OutputBanner();

      // The current Student object is passed explicitly.
      OutputName(this);
    }

    // OutputName - Output the student's name.
    public static void OutputName(Student student)
    {
      // Here the Student object is referenced explicitly.
      Console.WriteLine("Student's name is {0}", student.ToNameString());              
    }

    // ToNameString - Fetch the student's name.
    public string ToNameString()
    {
      // Here the current object is implicit -
      // this could have been written:
      // return this._firstName + " " + this._lastName;
      return _firstName + " " + _lastName;
    }
  }

  public class Program
  {
    public static void Main(string[] args)
    {
      Student student = new Student();
      student.InitStudent("Madeleine", "Cather");
      // Output the banner and name statically.
      Student.OutputBanner();
      Student.OutputName(student);
      Console.WriteLine();
      Console.WriteLine();
      // Output the banner and name again using instance.
      student.OutputBannerAndName();

      // Wait for user to acknowledge.
      Console.WriteLine("Press Enter to terminate...");
      Console.Read();
    }
  }
}
