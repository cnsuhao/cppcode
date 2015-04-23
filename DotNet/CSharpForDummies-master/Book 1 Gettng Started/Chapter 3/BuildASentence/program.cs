// BuildASentence - The following program constructs sentences
//   by concatenating user input until the user enters one of the
//   termination characters. This program shows when you need to
//    look for string equality.
using System;
namespace BuildASentence
{
  public class Program
  {
    public static void Main(string[] args)
    {
      Console.WriteLine("Each line you enter will be "
                      + "added to a sentence until you "
                      + "enter EXIT or QUIT");
      // Ask the user for input; continue concatenating
      // the phrases input until the user enters exit or
      // quit (start with an empty sentence).
      string sentence = "";
      for (; ; )
      {
        // Get the next line.
        Console.WriteLine("Enter a string ");
        string line = Console.ReadLine();
        // Exit the loop if line is a terminator.
        string[] terms = { "EXIT", "exit", "QUIT", "quit" };
        // Compare the string entered to each of the
        // legal exit commands.
        bool quitting = false;
        foreach (string term in terms)
        {
          // Break out of the for loop if you have a match.
          if (String.Compare(line, term) == 0)
          {
            quitting = true;
          }
        }
        if (quitting == true)
        {
          break;
        }
        // Otherwise, add it to the sentence.
        sentence = String.Concat(sentence, line);
        // Let the user know how she's doing.
        Console.WriteLine("\nyou've entered: " + sentence);
      }
      Console.WriteLine("\ntotal sentence:\n" + sentence);
      // Wait for user to acknowledge the results.
      Console.WriteLine("Press Enter to terminate...");
      Console.Read();
    }
  }
}
