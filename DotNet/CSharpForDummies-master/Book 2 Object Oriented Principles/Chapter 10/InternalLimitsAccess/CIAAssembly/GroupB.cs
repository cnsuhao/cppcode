using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace CIAAssembly
{
  public class GroupB
  {
    public void DoSomethingWithSecretX()
    {
      // Do something with Secret X, now that we can see it.
      GroupA groupA = new GroupA();
      Console.WriteLine("I know Secret X, which is {0} characters long, but " +
        "I'm not telling.", groupA.SecretX.Length);
    }
  }
}
