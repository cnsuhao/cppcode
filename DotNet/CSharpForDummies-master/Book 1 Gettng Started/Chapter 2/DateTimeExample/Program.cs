// DateTimeExample - Put the DateTime data type through
//    its paces to manipulate dates and times.
using System;

namespace DateTimeExample
{
  class Program
  {
    static void Main(string[] args)
    {
      // January 1, 2007:
      DateTime thisYear = new DateTime(2007, 1, 1);   
      // Notice how you call IsLeapYear():
      Console.WriteLine("Is {0} a leap year? {1}", 
        thisYear, DateTime.IsLeapYear(thisYear.Year));
      // February 29, 2008:
      DateTime nextYear = new DateTime(2008, 2, 29);  
      Console.WriteLine("Is {0} a leap year? {1}", 
        nextYear, DateTime.IsLeapYear(nextYear.Year));

      // Get "now" and the day of week now.
      DateTime thisMoment = DateTime.Now;
      DayOfWeek dayOfWeek = DateTime.Now.DayOfWeek;
      Console.WriteLine("Today (right now) is {0}, {1}", 
        dayOfWeek, thisMoment); // e.g. "Sunday, 7/15/2007 2:24:37 PM".
      Console.WriteLine("This year is {0}", thisMoment.Year);
      
      // Get just the date part ...
      DateTime date = DateTime.Today;   
      // ... or do it this way:
      DateTime date1 = thisMoment.Date;
      // Either version gives "7/15/07 12:00:00 AM" <--- (midnight this morning)
      Console.WriteLine("Today is {0}", date);
      // Note that the following result is a "TimeSpan": a duration.
      TimeSpan time = thisMoment.TimeOfDay;    
      Console.WriteLine("The time of day is {0}", 
        time); // e.g. "2:43:29.4672181"  <--- (time plus fraction)

      // Specify a time duration in days, hours, minutes, seconds.
      TimeSpan duration = new TimeSpan(3, 0, 0, 0); 
      DateTime threeDaysFromNow = thisMoment.Add(duration);
      Console.WriteLine("Three days from now is {0}", 
        threeDaysFromNow);  // If today is 7/15/07, this gives 7/18/07 ....

      TimeSpan duration1 = new TimeSpan(1, 0, 0);  // One hour later.
      // Since Today gives 12:00:00 AM (midnight), the following gives 1:00:00 AM:
      DateTime anHourAfterMidnight = DateTime.Today.Add(duration1);  
      Console.WriteLine("An hour from midnight will be {0}", anHourAfterMidnight);
      // And the next takes it back to midnight.
      DateTime midnight = anHourAfterMidnight.Subtract(duration1);
      Console.WriteLine("An hour before 1 AM is {0}", midnight);

      Console.WriteLine("\nPress Enter to terminate...");
      Console.Read();
    }
  }
}
