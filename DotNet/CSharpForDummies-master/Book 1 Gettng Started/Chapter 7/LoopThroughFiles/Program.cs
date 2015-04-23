// LoopThroughFiles - loop through all of the files contained in a directory; 
//    this time perform a hex dump, though it could have been anything.
using System;
using System.IO;

namespace LoopThroughFiles
{
  public class Program
  {
    public static void Main(string[] args)
    {
      // If no directory name provided...
      string directoryName;
      if (args.Length == 0)
      {
        // ...get the name of the current directory...
        directoryName = Directory.GetCurrentDirectory();
      }
      else
      {
        // ...otherwise, assume that the first argument
        // is the name of the directory to use.
        directoryName = args[0];
      }
      Console.WriteLine(directoryName);

      // Get a list of all of the files in that directory.
      FileInfo[] files = GetFileList(directoryName);

      // Now iterate through the files in that list,
      // performing a hex dump of each file.
      foreach(FileInfo file in files)
      {
        // Write out the name of the file.
        Console.WriteLine("\n\nhex dump of file {0}:", file.FullName);

        // Now "dump" the file to the console.
        DumpHex(file);

        // Wait before outputting next file.
        Console.WriteLine("\nenter return to continue to next file");
        Console.ReadLine();
      }

      // That's it!
      Console.WriteLine("\no files left");

      // Wait for user to acknowledge the results.
      Console.WriteLine("Press Enter to terminate...");
      Console.Read();
    }

    // GetFileList - Get a list of all of the files in the specified directory.
    public static FileInfo[] GetFileList(string directoryName)
    {
      // Start with an empy list.
      FileInfo[] files = new FileInfo[0];
      try
      {
        // Get directory information.
        DirectoryInfo di = new DirectoryInfo(directoryName);

        // That information object has a list of the contents.
        files = di.GetFiles();
      }
      catch(Exception e)
      {
        Console.WriteLine("Directory \"{0}\" invalid", directoryName);
        Console.WriteLine(e.Message);
      }
      return files;
    }

    // DumpHex - Given a file, dump out the contents of the file to the console.
    public static void DumpHex(FileInfo file)
    {
      // Open the file.
      FileStream fs;
      BinaryReader reader;
      try
      {
        fs = file.OpenRead(); 
        // Wrap the file stream in a BinaryReader.
        reader = new BinaryReader(fs);
      }
      catch(Exception e)
      {
        Console.WriteLine("\ncan't read from \"{0}\"", file.FullName);
        Console.WriteLine(e.Message);
        return;
      }

      // Iterate through the contents of the file one line at a time.
      for(int line = 1; true; line++)
      {
        // Read up another 10 bytes across (that's all that will fit in a single
        // line) - return when there isn't any more data.
        byte[] buffer = new byte[10];
        // Use the BinaryReader to read bytes.
        // Note: Using the bare FileStream would have been just as easy in this case.
        int numBytes = reader.Read(buffer, 0, buffer.Length);
        if (numBytes == 0)
        {
          return;
        }

        // Write out the data just read, in a single line preceded by line number.
        Console.Write("{0:D3} - ", line);
        DumpBuffer(buffer, numBytes);

        // Stop every 20 lines so the data doesn't scroll
        // off the top of the Console screen.
        if ((line % 20) == 0)
        {
          Console.WriteLine("Enter return to continue another 20 lines");
          Console.ReadLine();
        }
      }
    }

    // DumpBuffer - Write a buffer of characters as a single line in hex format.
    public static void DumpBuffer(byte[] buffer, int numBytes)
    {
      for(int index = 0; index < numBytes; index++)
      {
        byte b = buffer[index];
        Console.Write("{0:X2}, ", b);
      }
      Console.WriteLine();
    }
  }
}
