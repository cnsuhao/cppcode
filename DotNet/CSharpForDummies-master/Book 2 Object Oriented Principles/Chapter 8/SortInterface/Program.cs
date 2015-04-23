// SortInterface - Demonstrates how the interface concept can be used
//    to provide an enhanced degree of flexibility in factoring
//    and implementing classes.
using System;

namespace SortInterface
{
  // IDisplayable - An object that can convert itself into a displayable 
  //    string format. (This duplicates what you can do by overriding
  //    ToString(), but it helps me make a point.)
  interface IDisplayable
  {
    // Display - return a string representation of yourself.
    string Display();
  }

  class Program
  {
    public static void Main(string[] args)
    {
      // Sort students by grade...
      Console.WriteLine("Sorting the list of students");

      // Get an unsorted array of students.
      Student[] students = Student.CreateStudentList();

      // Use the IComparable interface to sort the array.
      Array.Sort(students);

      // Now the IDisplayable interface to display the results.
      DisplayArray(students);

      // Now sort an array of birds by name using the same routines even 
      // though the classes Bird and Student have no common base class.
      Console.WriteLine("\nsorting the list of birds");
      Bird[] birds = Bird.CreateBirdList();

      // Notice that it's not really necessary to cast the objects explicitly 
      // to an array of IDisplayables (and wasn't for Students either) ...
      Array.Sort(birds);
      DisplayArray(birds);

      // Wait for user to acknowledge the results.
      Console.WriteLine("Press Enter to terminate...");
      Console.Read();
    }

    // DisplayArray - Display an array of objects that
    //    implement the IDisplayable interface.
    public static void DisplayArray(IDisplayable[] displayables)
    {
			foreach(IDisplayable displayable in displayables)
			{
        Console.WriteLine("{0}", displayable.Display());
      }
    }
  }

  // ----------- Students - Sort students by grade -------
  // Student - Description of a student with name and grade.
  class Student : IComparable<Student>, IDisplayable
  {
    // Constructor - initialize a new student object.
    public Student(string name, double grade)
    {
      this.Name = name;
      this.Grade = grade;
    }

    // CreateStudentList - To save space here, just create
    // a fixed list of students.
    static string[] names = {"Homer", "Marge", "Bart", "Lisa", "Maggie"};
           
    static double[] grades = {0, 85, 50, 100, 30};
    public static Student[] CreateStudentList()
    {
      Student[] students = new Student[names.Length];
      for (int i = 0; i < names.Length; i++)
      {
        students[i] = new Student(names[i], grades[i]);
      }
      return students;
    }

    // Access read-only properties.
    public string Name { get; private set; }
    public double Grade { get; private set; }

    // Implement the IComparable interface:
    // CompareTo - Compare another object (in this case, Student objects) 
    //    and decide which one comes after the other in the sorted array.
    public int CompareTo(Student rightStudent)
    {
      // Compare the current Student (let's call her 'left') against 
      // the other student (we'll call her 'right').
      Student leftStudent = this;

      // Now generate a -1, 0 or 1 based upon the Sort criteria (the student's
      // grade). Double's CompareTo() method would work too.
      if (rightStudent.Grade < leftStudent.Grade)
      {
        return -1;
      }
      if (rightStudent.Grade > leftStudent.Grade)
      {
        return 1;
      }
      return 0;
    }

    // Implement the IDisplayable interface:
    // Display - Return a representation of the student.
    public string Display()
    {
      string padName = Name.PadRight(9);
      return String.Format("{0}: {1:N0}", padName, Grade);
    }
  }

  // -----------Birds - Sort birds by their names--------
  // Bird - Just an array of bird names.
  class Bird : IComparable<Bird>, IDisplayable
  {
    // Constructor - initialize a new Bird object.
    public Bird(string name) { Name = name; }

    // CreateBirdList - Return a list of birds to the caller;
    //    Use a canned list here to save space.
    static string[] birdNames =
       { "Oriole", "Hawk", "Robin", "Cardinal", "Bluejay", "Finch", "Sparrow"};
         
    public static Bird[] CreateBirdList()
    {
      Bird[] birds = new Bird[birdNames.Length];
      for(int i = 0; i < birds.Length; i++)
      {
        birds[i] = new Bird(birdNames[i]);
      }
      return birds;
    }

    // Access read-only property.
    public string Name { get; private set; }

    // Implement the IComparable interface:
    // CompareTo - Compare the birds by name; use the
    //    built-in String class compare method.
    public int CompareTo(Bird rightBird)
    {
      // We'll compare the "current" bird to the
      // "right hand object" bird.
      Bird leftBird = this;

      return String.Compare(leftBird.Name, rightBird.Name);
    }

    // Implement the IDisplayable interface:
    // Display - returns the name of the bird.
    public string Display() { return Name; }
  }
}
