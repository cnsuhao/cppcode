// StudentClassWithMethods - Demonstrate putting methods that
//    operate on a class's data inside the class. A class is
//    responsible for its own data and any operations on it.
using System;

namespace StudentClassWithMethods
{
  // Now the OutputName and SetName methods are members of
  // class Student, not class Program.
  public class Student
  {
    public string name;

    // OutputName - Output the student's name.
    public static void OutputName(Student student)
    {
      // Output current student's name.
      Console.WriteLine("Student's name is {0}", student.name);
    }

    // SetName - Modify the student object's name.
    public static void SetName(Student student, string name)
    {
      student.name = name;
    }
  }

  public class Program
  {
    public static void Main(string[] args)
    {
      Student student = new Student();

      // Set the name by accessing it directly.
      Console.WriteLine("The first time:");
      student.name = "Madeleine";
      Student.OutputName(student); // Method now belongs to Student.

      // Change the name using a method.
      Console.WriteLine("After being modified:");
      Student.SetName(student, "Willa");
      Student.OutputName(student);

      // Wait for user to acknowledge.
      Console.WriteLine("Press Enter to terminate...");
      Console.Read();
    }
  }
}
