// ModifyString - The methods provided by class String do 
//    not modify the object itself (s.ToUpper() does not
//    modify s; rather it returns a new string that has
//    been converted).
using System;

namespace ModifyString
{
  class Program
  {
    public static void Main(string[] args)
    {
      // Create a student object.
      Student s1 = new Student();
      s1.Name = "Jenny";

      // Now make a new object with the same name.
      Student s2 = new Student();
      s2.Name = s1.Name;

      // "Changing" the name in the s1 object does not
      // change the object itself because ToUpper() returns
      // a new string without modifying the original.
      s2.Name = s1.Name.ToUpper();

      Console.WriteLine("s1 - " + s1.Name + ", s2 - " + s2.Name);
                        
      // Wait for user to acknowledge the results.
      Console.WriteLine("Press Enter to terminate...");
      Console.Read();
    }
  }

  // Student - We just need a class with a string in it.
  class Student
  {
    public String Name;
  }
}
