// GenericMethod - A method that can process different data types.
using System;
namespace GenericMethod
{
  class Program
  {
    // Main - Tests two versions of a generic method; one lives in
    //    this class on same level as Main(); other lives in
    //    a generic class.
    static void Main(string[] args)
    {
      Console.WriteLine("Generic method in non-generic class:\n");

      Console.WriteLine("\tFirst, test it for int arguments");
      int one = 1;
      int two = 2;
      Console.WriteLine("\t\tBefore swap: one = {0}, two = {1}", one, two);
      // Next line instantiates Swap for ints and calls the method.
      Swap<int>(ref one, ref two);
      Console.WriteLine("\t\tAfter swap: one = {0}, two = {1}", one, two);

      Console.WriteLine("\tSecond, test it for string arguments");
      string oneStr = "one";
      string twoStr = "two";
      Console.WriteLine("\t\tBefore swap: oneStr = {0}, twoStr = {1}", oneStr, twoStr);
      Swap<string>(ref oneStr, ref twoStr); // Generic instantiation for string.
      Console.WriteLine("\t\tAfter swap: oneStr = {0}, twoStr = {1}", oneStr, twoStr);

      Console.WriteLine("\nGeneric method in a generic class:\n");

      Console.WriteLine("\tFirst, test it for int and call");
      Console.WriteLine("\t  GenericClass.Swap with int arguments");
      one = 1;
      two = 2;
      GenericClass<int> genClassInt = new GenericClass<int>();
      Console.WriteLine("\t\tBefore swap: one = {0}, two = {1}", one, two);
      genClassInt.Swap(ref one, ref two);
      Console.WriteLine("\t\tAfter swap: one = {0}, two = {1}", one, two);

      Console.WriteLine("\tSecond, test it for string and call");
      Console.WriteLine("\t  GenericClass.Swap with string arguments");
      oneStr = "one";
      twoStr = "two";
      GenericClass<string> genClassString = new GenericClass<string>();
      Console.WriteLine("\t\tBefore swap: oneStr = {0}, twoStr = {1}", oneStr, twoStr);
      genClassString.Swap(ref oneStr, ref twoStr);
      Console.WriteLine("\t\tAfter swap: oneStr = {0}, twoStr = {1}", oneStr, twoStr);

      // Wait for the user to acknowledge.
      Console.WriteLine("Press Enter to terminate...");
      Console.Read();
    }

    //Static Swap - This is a generic method in a nongeneric class.
    //   Note the presence of <T>.
    public static void Swap<T>(ref T leftSide, ref T rightSide)
    {
      T temp;
      temp = leftSide;
      leftSide = rightSide;
      rightSide = temp;
    }
  }

  //GenericClass - A generic class with its own Swap method.
  class GenericClass<T>
  {
    //Swap - This method is generic because it takes a T parameter;
    //   Note that we can't use Swap<T> or we get a
    //   compiler warning about duplicating the
    //   parameter on the class itself.
    public void Swap(ref T leftSide, ref T rightSide)
    {
      T temp;
      temp = leftSide;
      leftSide = rightSide;
      rightSide = temp;
    }
  }
}
