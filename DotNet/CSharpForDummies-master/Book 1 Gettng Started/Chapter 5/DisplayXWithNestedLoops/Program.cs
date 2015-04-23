// DisplayXWithNestedLoops - Use a pair of nested loops to
//    create an X pattern: some very primitive graphics.
//    Think of drawing an X to connect the corners of a box,
//    from top-left to bottom-right and from bottom-left to
//    top-right. Further, think of the box being divided into
//    a grid of one-character cells. This program uses nested
//    loops to calculate the coordinates (horizontal and vertical)
//    of each cell in which to place a mark.
// Note: For a more mathematically oriented "graphics" example,
// see the DisplaySin program, which also isn't discussed in the book.
using System;

namespace DisplayXWithNestedLoops
{
  public class Program
  {
    public static void Main(string[] args)
    {
      int consoleWidth = 40;

      // Iterate through the rows of the "box".
      for(int rowNum = 0;
          rowNum < consoleWidth;
          rowNum += 2)
      {
        // Now iterate through the columns.
        for (int columnNum = 0; columnNum < consoleWidth; columnNum++)
        {
          // The default character is a space.
          char c = ' ';

          // If the column number and row number are the same...
          if (columnNum == rowNum)
          {
            // ...replace the space with a backslash.
            c = '\\';
          }

          // If the column is on the opposite side of the row...
          int mirrorColumn = consoleWidth - rowNum;
          if (columnNum == mirrorColumn)
          {
            // ...replace the space with a slash.
            c = '/';
          }

          // Output the current character at the current
          // row and column.
          Console.Write(c);
        }
        Console.WriteLine();
      }

      // Wait for user to acknowledge the results.
      Console.WriteLine("Press Enter to terminate...");
      Console.Read();
    }
  }
}
