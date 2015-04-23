// Unit tests for StringExtensions using NUnit.
//    See the StringExtensionsNUnitTest project for an alternative
//    to these Visual Studio-based tests, which can't be used with
//    all versions of Visual Studio 2008 (just Professional and up).
//    See my Web site at csharp102.info for more information 
//    about unit testing.
using System;
using Microsoft.VisualStudio.TestTools.UnitTesting;
using StringExtensionsLib;

namespace StringExtensionsTest
{
  /// <summary>
  /// StringExtensions Unit Tests.
  /// </summary>
  [TestClass]
  public class StringExtensionsTests
  {
    private string _target = "0123456789";

    // Left method tests: Like VB's Left(4) method.

    [TestMethod]
    public void LeftWithGoodArgument()
    {
      Assert.AreEqual("0123", _target.Left(4));
    }

    [TestMethod, ExpectedException(typeof(ArgumentOutOfRangeException))]
    public void LeftWithArgumentTooBig()
    {
      string shouldThrow = _target.Left(_target.Length + 1);
    }

    [TestMethod, ExpectedException(typeof(ArgumentOutOfRangeException))]
    public void LeftWithNegativeArgument()
    {
      string shouldThrow = _target.Left(-1);
    }

    [TestMethod]
    public void LeftWithZeroArgumentReturnsEmptyString()
    {
      Assert.AreEqual(string.Empty, _target.Left(0));
    }

    // Right method tests: Like VB's Right(4) method.

    [TestMethod]
    public void RightWithGoodArgument()
    {
      Assert.AreEqual("789", _target.Right(3));
    }

    [TestMethod, ExpectedException(typeof(ArgumentOutOfRangeException))]
    public void RightWithArgumentTooBig()
    {
      string shouldThrow = _target.Right(_target.Length + 1);
    }

    [TestMethod, ExpectedException(typeof(ArgumentOutOfRangeException))]
    public void RightWithNegativeArgument()
    {
      string shouldThrow = _target.Right(-1);
    }

    [TestMethod]
    public void RightWithZeroArgumentReturnsEmptyString()
    {
      Assert.AreEqual(string.Empty, _target.Right(0));
    }

    // Mid method tests: Like VB's Mid(2, 3) method.

    [TestMethod]
    public void MidWithGoodArguments()
    {
      Assert.AreEqual("234", _target.Mid(2, 3));
    }

    [TestMethod, ExpectedException(typeof(ArgumentOutOfRangeException))]
    public void MidWithStartIndexArgumentOutOfBounds()
    {
      string shouldThrow = _target.Mid(-1, 3);
    }

    [TestMethod, ExpectedException(typeof(ArgumentOutOfRangeException))]
    public void MidWithExcessiveNumberOfCharsToGetArgument()
    {
      string shouldThrow = _target.Mid(2, _target.Length);
    }

    [TestMethod, ExpectedException(typeof(ArgumentOutOfRangeException))]
    public void MidWithNegativeNumberOfCharsToGetArgument()
    {
      string shouldThrow = _target.Mid(2, -3);
    }

    [TestMethod]
    public void MidWithZeroNumberOfCharsToGetArgumentReturnsEmptyString()
    {
      Assert.AreEqual(string.Empty, _target.Mid(2, 0));
    }

    // Slice method tests: Like Ruby's Slice(1..3) method.

    [TestMethod]
    public void SliceWithGoodPositiveStartIndexAndEndIndex()
    {
      // With a positive startIndex argument, second argument
      // is interpreted as an index, not a count, so
      // this asks for index 2 through index 4.
      int goodStartIndex = 2;
      int goodEndIndex = 4;
      Assert.AreEqual("234", _target.Slice(goodStartIndex, goodEndIndex));
    }

    [TestMethod]
    public void SliceWithZeroStartIndexIsGood()
    {
      // Remember: If first param is not negative, second 
      // param is interpreted as an index, not a length.
      // We want "01": from index 0 to index 1.
      int zeroStartIndex = 0;
      int goodEndIndex = 1;
      Assert.AreEqual("01", _target.Slice(zeroStartIndex, goodEndIndex));
    }

    [TestMethod]
    public void SliceWithGoodNegativeStartIndex()
    {
      Assert.AreEqual(2, _target.Slice(-3, 2).Length);
      Assert.AreEqual("78", _target.Slice(-3, 2));
    }

    [TestMethod, ExpectedException(typeof(ArgumentOutOfRangeException))]
    public void SliceWithExcessivelyNegativeStartIndex()
    {
      // Start param exceeds _target's length. Index is
      // out of range at the left end of target.
      int startIndexWayNegative = -15;
      int numberOfCharsToGet = 2;
      string shouldThrow = _target.Slice(startIndexWayNegative, numberOfCharsToGet);
    }

    [TestMethod]
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

    [TestMethod, ExpectedException(typeof(ArgumentOutOfRangeException))]
    public void SliceWithExcessiveEndIndexArgument()
    {
      // Second param is an index out of range for the target.
      int startIndex = 3;
      int outOfBoundsEndIndex = _target.Length + 1;
      string shouldThrow = _target.Slice(startIndex, outOfBoundsEndIndex);
    }

  }
}
