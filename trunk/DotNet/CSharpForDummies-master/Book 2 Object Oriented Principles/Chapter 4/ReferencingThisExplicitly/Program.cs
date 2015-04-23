// ReferencingThisExplicitly - Demonstrate how to explicitly use 
//    the reference to 'this'.
using System;

namespace ReferencingThisExplicitly
{
  public class Program
  {
    public static void Main(string[] strings)
    {
      // Create a student.
      Student student = new Student();
      student.Init("Stephen Davis", 1234);

      // Now enroll the student in a course.
      Console.WriteLine
             ("Enrolling Stephen Davis in Biology 101");
      student.Enroll("Biology 101");

      // Display student course.
      Console.WriteLine("Resulting student record:");
      student.DisplayCourse();

      // Wait for user to acknowledge the results.
      Console.WriteLine("Press Enter to terminate...");
      Console.Read();
    }
  }

  // Student - Our class for university students.
  public class Student
  {
    // All students have a name and id.
    public string _name;  // Note this naming convention for 
    public int _id;       // class data members.

    // The course in which the student is enrolled.
    CourseInstance _courseInstance;  // Convention is optional.

    // Init - Initialize the student object.
    public void Init(string name, int id)
    {
      this._name = name; // With the naming convention, _name,
      this._id = id;     // 'this' is no longer needed.

      _courseInstance = null;
    }

    // Enroll - Enroll the current student in a course.
    public void Enroll(string courseID)
    {
      _courseInstance = new CourseInstance();
      _courseInstance.Init(this, courseID);
    }

    // Display the name of the student and the course.
    public void DisplayCourse()
    {
      Console.WriteLine(_name);
      _courseInstance.Display();
    }
  }

  // CourseInstance - A combination of a student with
  //    a university course.
  public class CourseInstance
  {
    public Student _student;
    public string _courseID;

    // Init - Tie the student to the course.
    public void Init(Student student, string courseID)
    {
      _student = student;   // 'this' not needed.
      _courseID = courseID; // Names are distinct.
    }

    // Display - Output the name of the course.
    public void Display()
    {
      Console.WriteLine(_courseID);
    }
  }
}
