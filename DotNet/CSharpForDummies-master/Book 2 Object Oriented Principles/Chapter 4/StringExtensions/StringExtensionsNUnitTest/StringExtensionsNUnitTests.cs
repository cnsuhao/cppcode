// NUnit tests for StringExtensions - These tests are written for
//    the NUnit testing framework. You can install NUnit from the
//    book's CD or download it fresh and up-to-date from the NUnit
//    Web site (free download) at nunit.com.
// To use NUnit to run these tests:
// 1. Make sure the program builds successfully.
// 2. Outside of Visual Studio, run the NUnit GUI (a graphical
//    program that puts up a window in which you can run tests.
// 3. In NUnit, choose File-->Open Project.
// 4. In the Open dialog, navigate to the location of your
//    NUnit-based test project. For StringExtensions, that's
//    in StringExtensions\StringExtensionsNUnitTest\bin\debug.
//    Double-click the file StringExtensionsNUnitTest.dll.
// 5. You should see a list of the tests below in NUnit.
// 6. Click the Run button in NUnit. The tests should all
//    pass, as indicated by the green markings.
// See my Web site at csharp102.info for more information 
//    about unit testing.
using System;
using NUnit.Framework;     // Need a reference to this for NUnit.
using StringExtensionsLib; // Need a reference to the StringExtensionsLib project.

namespace StringExtensionsNUnitTest
{
  // NUnit test class must be marked with this attribute:
  [TestFixture]
  public class StringExtensionsNUnitTests
  {
    private string _target = "0123456789";

    // Left method tests: Like VB's Left(4) method.

    // Each NUnit test method is marked with this attribute:
    [Test]
    public void LeftWithGoodArgument()
    {
      Assert.AreEqual("0123", _target.Left(4));
    }

    [Test, ExpectedException(typeof(ArgumentOutOfRangeException))]
    public void LeftWithArgumentTooBig()
    {
      string shouldThrow = _target.Left(_target.Length + 1);
    }

    [Test, ExpectedException(typeof(ArgumentOutOfRangeException))]
    public void LeftWithNegativeArgument()
    {
      string shouldThrow = _target.Left(-1);
    }

    [Test]
    public void LeftWithZeroArgumentReturnsEmptyString()
    {
      Assert.AreEqual(string.Empty, _target.Left(0));
    }

    // Right method tests: Like VB's Right(4) method.

    [Test]
    public void RightWithGoodArgument()
    {
      Assert.AreEqual("789", _target.Right(3));
    }

    [Test, ExpectedException(typeof(ArgumentOutOfRangeException))]
    public void RightWithArgumentTooBig()
    {
      string shouldThrow = _target.Right(_target.Length + 1);
    }

    [Test, ExpectedException(typeof(ArgumentOutOfRangeException))]
    public void RightWithNegativeArgument()
    {
      string shouldThrow = _target.Right(-1);
    }

    [Test]
    public void RightWithZeroArgumentReturnsEmptyString()
    {
      Assert.AreEqual(string.Empty, _target.Right(0));
    }

    // Mid method tests: Like VB's Mid(2, 3) method.

    [Test]
    public void MidWithGoodArguments()
    {
      Assert.AreEqual("234", _target.Mid(2, 3));
    }

    [Test, ExpectedException(typeof(ArgumentOutOfRangeException))]
    public void MidWithStartIndexArgumentOutOfBounds()
    {
      string shouldThrow = _target.Mid(-1, 3);
    }

    [Test, ExpectedException(typeof(ArgumentOutOfRangeException))]
    public void MidWithExcessiveNumberOfCharsToGetArgument()
    {
      string shouldThrow = _target.Mid(2, _target.Length);
    }

    [Test, ExpectedException(typeof(ArgumentOutOfRangeException))]
    public void MidWithNegativeNumberOfCharsToGetArgument()
    {
      string shouldThrow = _target.Mid(2, -3);
    }

    [Test]
    public void MidWithZeroNumberOfCharsToGetArgumentReturnsEmptyString()
    {
      Assert.AreEqual(string.Empty, _target.Mid(2, 0));
    }

    // Slice method tests: Like Ruby's Slice(1..3) method.

    [Test]
    public void SliceWithGoodPositiveStartIndexAndEndIndex()
    {
      // With a positive startIndex argument, second argument
      // is interpreted as an index, not a count, so
      // this asks for index 2 through index 4.
      int goodStartIndex = 2;
      int goodEndIndex = 4;
      Assert.AreEqual("234", _target.Slice(goodStartIndex, goodEndIndex));
    }

    [Test]
    public void SliceWithZeroStartIndexIsGood()
    {
      // Remember: If first param is not negative, second 
      // param is interpreted as an index, not a length.
      // We want "01": from index 0 to index 1.
      int zeroStartIndex = 0;
      int goodEndIndex = 1;
      Assert.AreEqual("01", _target.Slice(zeroStartIndex, goodEndIndex));
    }

    [Test]
    public void SliceWithGoodNegativeStartIndex()
    {
      Assert.AreEqual(2, _target.Slice(-3, 2).Length);
      Assert.AreEqual("78", _target.Slice(-3, 2));
    }

    [Test, ExpectedException(typeof(ArgumentOutOfRangeException))]
    public void SliceWithExcessivelyNegativeStartIndex()
    {
      // Start param exceeds _target's length. Index is
      // out of range at the left end of target.
      int startIndexWayNegative = -15;
      int numberOfCharsToGet = 2;
      string shouldThrow = _target.Slice(startIndexWayNegative, numberOfCharsToGet);
    }

    [Test]
    public void SliceWithJustAcceptableNegativeStartIndex()
    {
      // StartIndex param is the largest negative value it can be
      // without throwing an ArgumentOutOfRangeException.
      int maxNegativeStartIndex = -_target.Length;
      int numberOfCharsToGet = 2;
      Assert.AreEqual("01", _target.Slice(maxNegativeStartIndex, numberOfCharsToGet));
      int inBoundsNegativeStartIndex = -(_target.Length - 1);
      // Start param is well within bounds: we want "12".
      Assert.AreEqual("12", _target.Slice(inBoundsNegativeStartIndex, numberOfCharsToGet));
    }

    [Test, ExpectedException(typeof(ArgumentOutOfRangeException))]
    public void SliceWithExcessiveEndIndexArgument()
    {
      // Second param is an index out of range for the target.
      int startIndex = 3;
      int outOfBoundsEndIndex = _target.Length + 1;
      string shouldThrow = _target.Slice(startIndex, outOfBoundsEndIndex);
    }

  }
}
