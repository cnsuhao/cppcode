// StringExtensions - Demonstrate the extension methods feature new
//    in C# 3.0.
// Note: I put the MyStringExtensions class in a class library project
// called StringExtensionsLib so I could access the extensions from unit
// tests that give the extensions a good workout. See Bonus Chapter 1
// for information on class libraries. See my Web site for information
// on unit testing. The purpose of the unit tests is to exercise the
// extension methods with every conceivable input, in order to obtain
// a high degree of confidence that the methods are correctly written.
//
// Notes on running the unit tests:
// If you have Visual Studio 2008 Professional or Team System, both
// of which include built-in unit testing facilities, 
// you can load the example in Visual Studio,
// right-click and choose Run Tests within the StringExtensionsTests.cs
// file (but not inside a test method), and view the test results in
// Visual Studio's Test Results window. 
// If you have Visual Studio 2008 Standard or Visual Studio 2008 Express,
// you'll have to convert the tests in StringExtensionsTests.cs from
// Visual Studio's notation to the notation used in NUnit and run the
// tests in NUnit. I include NUnit on the book's CD, and you can find
// guidance on the simple steps needed to convert the test formats on
// my Web site at csharp102.info under "unit testing." There's also
// a short version of the instructions in the file StringExtensionNUnitTests.cs.
using System;
using StringExtensionsLib;

namespace StringExtensions
{
  class Program
  {
    static void Main(string[] args)
    {
      Console.WriteLine("Extending class String\n");
      string target = "0123456789";
      Console.WriteLine("Original target string: {0}", target);

      // Use extension method Left to get chars from start of target.
      Console.WriteLine("Left 3 chars (012): {0}", target.Left(3));

      // Use extension method Right to get chars from end of target.
      Console.WriteLine("Right 3 chars (789): {0}", target.Right(3));

      // Use extension method Mid to get chars from middle of target.
      // Note that Mid takes a start index and a count of chars to return.
      Console.WriteLine("Mid for 3 chars starting at index 4 in target (456): {0}", 
        target.Mid(4, 3));

      // Use extension method Slice to get chars from middle of target.
      Console.WriteLine("Take a slice equivalent to previous Mid() call: {0}",
        target.Slice(4, 6));

      // Wait for user to acknowledge results.
      Console.WriteLine("Press Enter to terminate...");
      Console.Read();
    }    
  }
}
