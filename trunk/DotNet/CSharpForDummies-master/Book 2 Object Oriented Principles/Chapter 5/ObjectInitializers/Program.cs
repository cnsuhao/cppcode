// ObjectInitializers - Demonstrate using the new object initializer feature
//    in C# 3.0.
using System;

namespace ObjectInitializers
{
  class Program
  {
    static void Main(string[] args)
    {
      // The old way of initializing a Student's properties.
      Student nicholas = new Student();
      nicholas.Name = "Nicholas";
      nicholas.Address = "809087 Some Lost Street, Las Vegas, NM 89000";
      nicholas.GradePointAverage = 3.51;
      PrintStudentInfo(nicholas);

      // The new object initializer syntax: new X { P1 = a, P2 = b, ... };
      Student randal = new Student
      { // Property names with initializers.
        Name = "Randal",  
        Address = "123 Elm Street, Truth Or Consequences, NM 00000",
        GradePointAverage = 3.51
      };
      PrintStudentInfo(randal);

      // Another simple example of the new syntax.
      LatitudeLongitude latLong = new LatitudeLongitude() { Latitude = 35.3, Longitude = 104.9 };
      Console.WriteLine("Latitude {0}, Longitude {1}", latLong.Latitude, latLong.Longitude);

      // A more complex class whose properties are themselves class objects.
      // Here we use the new syntax for Rectangle and for its two Point properties.
      Rectangle rect = new Rectangle
      {
        UpperLeftCorner = new Point { X = 3, Y = 4 },
        LowerRightCorner = new Point { X = 5, Y = 6 }
      };
      Console.WriteLine("Rectangle with upper left corner at ({0},{1}) and "
        + "lower right corner at ({2},{3})", rect.UpperLeftCorner.X, rect.UpperLeftCorner.Y,
        rect.LowerRightCorner.X, rect.LowerRightCorner.Y);

      // Wait for user to acknowledge results.
      Console.WriteLine("Press Enter to terminate...");
      Console.Read();
    }

    private static void PrintStudentInfo(Student student)
    {
      Console.WriteLine("Name: {0}\nAddress: {1}\nGPA: {2}",
        student.Name, student.Address, student.GradePointAverage);
    }
  }

  public class Student
  {
    public string Name { get; set; }
    public string Address { get; set; }
    public double GradePointAverage { get; set; }
  }

  public class LatitudeLongitude
  {
    public double Latitude { get; set; }
    public double Longitude { get; set; }
  }

  public class Point
  {
    public int X { get; set; }
    public int Y { get; set; }
  }

  public class Rectangle
  {
    public Point UpperLeftCorner { get; set; }
    public Point LowerRightCorner { get; set; }
  }
}
