      // ListCollection - Demonstrate the generic List<T> collection.
// ListCollection - Demonstrate numerous things you can do with a
//    List<T> collection class.
using System;
using System.Collections.Generic;
using System.Collections;   // For old-style ArrayList.

namespace ListCollection
{
  class Program
  {
    static void Main(string[] args)
    {
      // List<T>: note angle brackets plus parentheses in 
      // List<T> declaration; T is a "type parameter".
      // List<T> is a "parameterized type".
      // Instantiate for string type.
      List<string> nameList = new List<string>();

      nameList.Add("one");
      //nameList.Add(3);                            // Compiler error here!
      //nameList.Add(new Student("du Bois"));       // Compiler error here!

      // Instantiate for Object.
      List<object> objects = new List<object>();
      // The old-style ArrayList is equivalent to List<object>.
      // For both of ArrayList and List<object>, see Bonus Chapter 4 
      // on the problem of boxing and unboxing.
      ArrayList oldObjects = new ArrayList();

      // Instantiate for int.
      List<int> intList = new List<int>();
      intList.Add(3);                          // Fine.
      intList.Add(4);
      Console.WriteLine("Printing intList:");
      foreach (int i in intList)  // foreach just works for all collections.
      {
        Console.WriteLine("int i = " + i);
      }

      // Instantiate for Student.
      List<Student> studentList = new List<Student>();
      Student student1 = new Student("Vigil");
      Student student2 = new Student("Finch");
      studentList.Add(student1);
      studentList.Add(student2);
      Student[] students = { new Student("Mox"), new Student("Fox") };
      studentList.AddRange(students); // Add whole array to List.
      Console.WriteLine("Num students in studentList = " + studentList.Count);
      Student[] studentsFromList = studentList.ToArray();

      // Search with IndexOf().
      Console.WriteLine("Student2 at " + studentList.IndexOf(student2));
      string name = studentList[3].Name;  // Access list by index.
      if (studentList.Contains(student1))  // Search with Contains().
      {
        Console.WriteLine(student1.Name + " contained in list");
      }

      studentList.Sort(); // Assumes Student implements IComparable interface (Ch 14).
      studentList.Insert(3, new Student("Ross"));
      studentList.RemoveAt(3);  // Deletes the third element.
      Console.WriteLine("removed {0}", name);         // Name defined above.
      Student[] moreStudents = studentList.ToArray(); // Convert list to array.

      Console.WriteLine("Press Enter to terminate...");
      Console.Read();
    }
  }
  // Student - Description of a student with name and grade.
  // 
  // NOTE: This uses lots of things not covered in the book yet, but
  // it's necessary in order to use the Sort() method on Student objects.
  class Student : IComparable
  {
    private string _name;

    // Constructor - Initialize a new student object.
    public Student(string name)
    {
      this._name = name;
    }

    // Access read-only variables.
    public string Name
    {
      get { return _name; }
    }

    // Implement the IComparable interface:
    // CompareTo - Compare another object (in this case, Student
    //    objects) and decide which one comes after the
    //    other in the sorted array.
    public int CompareTo(object rightObject)
    {
      // Compare the current Student (let's call her
      // 'left') against the other student (we'll call
      // her 'right') - generate an error if both
      // Left and right are not Student objects.
      Student leftStudent = this;
      if (!(rightObject is Student))
      {
        Console.WriteLine("Compare method passed a nonStudent");
        return 0;
      }
      Student rightStudent = (Student)rightObject;

      // Now generate a -1, 0 or 1 based upon the
      // sort criteria (the student's name).
      // The Double class has a CompareTo() method
      // we could have used instead).
      if (string.Compare(rightStudent.Name, leftStudent.Name) < 0)
      {
        return -1;
      }
      if (string.Compare(rightStudent.Name, leftStudent.Name) > 0)
      {
        return 1;
      }
      return 0;
    }
  }
}
