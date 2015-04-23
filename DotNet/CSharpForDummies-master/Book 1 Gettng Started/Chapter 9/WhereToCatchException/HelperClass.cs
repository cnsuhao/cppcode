using System;

namespace WhereToCatchException
{
  internal class HelperClass
  {
    internal void TopMethod(int item)
    {
      try
      {
        LowerMethod(item);
      }
      catch (NotSupportedException nse)
      {
        // I've caught the lower exception here only in order to convert
        // it to an application-specific exception. This is how you'd 
        // do that. After converting, I throw the new exception.
        string message =
          string.Format("Changing exception type in TopMethod" +
               " from {0} to MyException.", nse.GetType().ToString());
        // Parameter list of a constructor doesn't take formatting
        // items like {0}, so I use string.Format() to construct the
        // message.
        throw new MyException(message, nse);
      }
    }

    private void LowerMethod(int item)
    {
      // Let exceptions go on by to my caller.
      EvenLowerMethod_Throws(item);
    }

    private void EvenLowerMethod_Throws(int item)
    {
      if (item == 1) // This causes the problem way down here.
      {
        throw new NotSupportedException("Thrown from HelperClass.LowerMethod_Throws.");
      }
      // We don't reach this line if the exception is thrown.
      Console.WriteLine("Executed EvenLowserMethod_Throws() successfully.");
    }
  }

  // A custom exception.

  [global::System.Serializable]
  public class MyException : Exception
  {
    //
    // For guidelines regarding the creation of new exception types, see
    //    http://msdn.microsoft.com/library/default.asp?url=/library/en-us/
    //      cpgenref/html/cpconerrorraisinghandlingguidelines.asp
    // and
    //    http://msdn.microsoft.com/library/default.asp?url=/library/en-us/
    //      dncscol/html/csharp07192001.asp
    //

    public MyException() { }
    public MyException(string message) : base(message) { }
    public MyException(string message, Exception inner) : base(message, inner) { }
    protected MyException(
    System.Runtime.Serialization.SerializationInfo info,
    System.Runtime.Serialization.StreamingContext context)
      : base(info, context) { }
  }
}
