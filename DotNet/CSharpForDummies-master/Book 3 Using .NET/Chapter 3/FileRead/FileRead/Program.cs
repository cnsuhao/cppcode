// FileRead - Read a text file and write it out to the Console.
using System;
using System.IO;

namespace FileRead
{
    public class Program
    {
        public static void Main(string[] args)
        {
            // We'll need a file reader object.
            StreamReader sr = null;
            string fileName = "";

            try
            {
                // Get a filename from the user.
                sr = GetReaderForFile(fileName);

                // Read the contents of the file.
                ReadFileToConsole(sr);
            }
            catch (IOException ioErr)
            {
                //TODO: Before release, replace this with a more user friendly message.
                Console.WriteLine("{0}\n\n", ioErr.Message);
            }
      finally  // Clean up.
            {
                if (sr != null) // Guard against trying to Close()a null object.
                {
                    sr.Close();   // Takes care of flush as well.
                    sr = null;
                }
            }

            // Wait for user to acknowledge the results.
            Console.WriteLine("Press Enter to terminate...");
            Console.Read();
        }

        // GetReaderForFile - Open the file and return a StreamReader for it.
        private static StreamReader GetReaderForFile(string fileName)
        {
            StreamReader sr;
            // Enter input filename.
            Console.Write("Enter the name of a text file to read:");
            fileName = Console.ReadLine();

            // User didn't enter anything; throw an exception
            // to indicate that this is not acceptable.
            if (fileName.Length == 0)
            {
                throw new IOException("You need to enter a filename.");
            }

            // Got a name - open a file stream for reading; don't create the
            // file if it doesn't already exist.
            FileStream fs = File.Open(fileName, FileMode.Open, FileAccess.Read);

            // Wrap a StreamReader around the stream - this will use
            // the first three bytes of the file to indicate the
            // encoding used (but not the language).
            sr = new StreamReader(fs, true);
            return sr;
        }

        // ReadFileToConsole - Read lines from the file represented
        //    by sr and write them out to the console.
        private static void ReadFileToConsole(StreamReader sr)
        {
            Console.WriteLine("\nContents of file:");
            // Read one line at a time.
            while (true)
            {
                // Read a line.
                string input = sr.ReadLine();

                // Quit when we don't get anything back.
                if (input == null)
                {
                    break;
                }

                // Write whatever we read to the console.
                Console.WriteLine(input);
            }
        }
    }
}
