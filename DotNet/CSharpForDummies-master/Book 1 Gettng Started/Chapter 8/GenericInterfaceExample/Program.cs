// GenericInterfaceExample - Demonstrate using a simple generic interface.
using System;

namespace GenericInterface
{
  class Program
  {
    static void Main(string[] args)
    {
      Student s = new Student();
      // s has a Category property thanks to the interface.
      s.Category = GradeLevel.Freshman;
      Console.WriteLine("Sudent is a {0}", s.Category);

      Employee e = new Employee();
      // e has a Category property thanks to the interface.
      e.Category = EmployeeCategory.GrandPoobah;
      Console.WriteLine("Employee is a {0}", e.Category);

      Console.WriteLine("Press Enter to terminate...");
      Console.Read();
    }

    /// <summary>
    /// An implementing object can be marked with its category
    /// label, such as Freshman, Sophomore, Junior, .... You 
    /// supply the set of possible categories (as an enum)
    /// when you instantiate the interface on the implementing
    /// class.
    /// </summary>
    /// <typeparam name="T">An enumeration type that specifies
    /// a set of mutually exclusive categories, such as
    /// grade levels in a university: Freshman, Sophomore, etc.
    /// </typeparam>
    /// <remarks>Although technically T can be any value
    /// type, such as int or double, the intention here is to
    /// limit T to any enumeration (enum) type.</remarks>
    interface ICategorizable<T> where T : struct
    {
      // Gets or sets an object's category.
      T Category { get; set; }
    }

    // Student classifications at a college.
    enum GradeLevel
    {
      Freshman, Sophomore, Junior, Senior, Graduate, Playboy
    }

    // Student - A simple Student class that implements
    //    the interface for the GradeLevel enum.
    class Student : ICategorizable<GradeLevel>
    {
      #region ICategorizable<GradeLevel> Members.

      public GradeLevel Category { get; set; }

      #endregion ICategorizable<GradeLevel> Members.
    }

    // Employee categories.
    enum EmployeeCategory
    {
      FullTime, PartTime, Intern, Manager, Executive, GrandPoobah
    }

    // Employee - A simple Employee class that implements
    //    the interface for the EmployeeCategory enum.
    class Employee : ICategorizable<EmployeeCategory>
    {
      #region ICategorizable<EmployeeCategory> Members.

      public EmployeeCategory Category { get; set; }

      #endregion ICategorizable<EmployeeCategory> Members.
    }
  }
}
