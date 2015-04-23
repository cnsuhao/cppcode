// MyStringExtensions class - Provides four extension methods for
//    class String.
using System;

namespace StringExtensionsLib
{
  // Class containing the extension methods must be static.
  public static class MyStringExtensions
  {
    // Each extension method must be static.
    // First parameter defines the class to extend and
    // is preceded with 'this' keyword.

    // Left - Return a specified number of chars from the left end of
    //    a target string. Call like this: target.Left(3);
    // Parameters: numberOfCharsToGet = number of chars to return.
    // Exceptions: Can throw ArgumentOutOfRangeException if numberOfCharsToGet
    // is greater than the target's length.
    public static string Left(this string target, int numberOfCharsToGet)
    {
      return target.Substring(0, numberOfCharsToGet);
    }

    // Right - Return a specified number of chars from the right end of
    //    a target string. Call like this: target.Right(3);
    // Parameters: numberOfCharsToGet = number of chars to return.
    // Exceptions: Can throw ArgumentOutOfRangeException if numberOfCharsToGet
    // is greater than the target's length.
    public static string Right(this string target, int numberOfCharsToGet)
    {
      return target.Substring(target.Length - numberOfCharsToGet, numberOfCharsToGet);
    }

    // Mid - Return a specified number of chars from the middle of
    //    a target string. Call like this: target.Mid(3, 3);
    //    which means "return 3 chars starting at index 3.
    // Parameters: start = starting index.
    //             numberOfCharsToGet = number of chars to return.
    // Exceptions: Can throw ArgumentOutOfRangeException if start is
    // less than 0 or numberOfCharsToGet is greater than the target's length.
    public static string Mid(this string target, int startIndex, int numberOfCharsToGet)
    {
      // Since Mid calls Slice, we have to screen out negative startIndex
      // because a negative startIndex fits the semantics of Slice but not
      // of Mid.
      if (startIndex < 0)
      {
        throw new ArgumentOutOfRangeException("Mid: Negative start parameter.");
      }
      return target.Slice(startIndex, startIndex + numberOfCharsToGet - 1);
    }

    // Slice - Return a specified range of chars from the middle of
    //    a target string. Call like this: target.Slice(3, 5);
    // Parameters: startIndex = starting index.
    //             endIndex = ending index (this is not a character count) unless
    //                   startIndex is negative, in which case it's interpreted
    //                   as a count = numberOfCharsToGet.
    // Exceptions: Can throw ArgumentOutOfRangeException if startIndex is
    // less than 0 or endIndex is greater than the target's length.
    public static string Slice(this string target, int startIndex, int endIndex)
    {
      // Handle case where startIndex is negative, indicating a slice
      // relative to the end of target rather than the beginning.
      if (startIndex < 0)
      {
        // Interpret 'endIndex' as a count, not an index.
        return target.Substring(target.Length - System.Math.Abs(startIndex), endIndex);
      }
      // Handle the normal case where startIndex is positive or zero,
      // indicating a slice relative to the beginning of target.
      return target.Substring(startIndex, endIndex - startIndex + 1);
    }


  }
}
