using System;

namespace MainBankAccountAssembly
{
  public class AnotherClass
  {
    public decimal AccessBalance()
    {
      SavingsAccountSameAssembly sasa = new SavingsAccountSameAssembly();
      // The Balance set accessor _is_ accessible here because this class is in the same
      // assembly as BankAccount, and Balance 'set' is marked internal (protected internal, actually).
      sasa.Balance += 3;
      // The get accessor is accessible: both it and the overall property are public.
      Console.WriteLine("In MainBankAccountAssembly.AnotherClass, balance is {0}", sasa.Balance);
      return sasa.Balance;
    }
  }
}
