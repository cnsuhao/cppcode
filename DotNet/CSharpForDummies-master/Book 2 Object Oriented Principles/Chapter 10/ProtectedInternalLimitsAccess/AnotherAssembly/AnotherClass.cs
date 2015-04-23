using System;

namespace AnotherAssembly
{
  public class AnotherClass
  {
    public decimal AccessBalance()
    {
      SavingsAccountAnotherAssembly saaa = new SavingsAccountAnotherAssembly();
      // The Balance set accessor isn't accessible here.
      //saaa.Balance += 3;
      // But the get accessor is because both it and the overall property are public.
      Console.WriteLine("In AnotherAssembly.AnotherClass, balance is {0}", saaa.Balance);
      return saaa.Balance;
    }
  }
}
