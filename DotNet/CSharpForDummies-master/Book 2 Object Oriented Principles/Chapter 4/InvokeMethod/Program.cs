// InvokeMethod - Invoke a member method through the object.
using System;

namespace InvokeMethod
{
  class Student
  {
    // The name information to describe a student.
    public string firstName;
    public string lastName;

    // SetName - Save name information.
    public void SetName(string fName, string lName)
    {
      firstName = fName;
      lastName  = lName;
    }

    // ToNameString - Convert the student object into a
    //    string for display.
    public string ToNameString()
    {
      string s = firstName + " " + lastName;
      return s;
    }
  }

  public class Program
  {
    public static void Main()
    {
      Student student = new Student();

      student.SetName("Stephen", "Davis");

      Console.WriteLine("Student's name is "
                       + student.ToNameString());

      // Wait for user to acknowledge.
      Console.WriteLine("Press Enter to terminate...");
      Console.Read();
    }
  }
}
