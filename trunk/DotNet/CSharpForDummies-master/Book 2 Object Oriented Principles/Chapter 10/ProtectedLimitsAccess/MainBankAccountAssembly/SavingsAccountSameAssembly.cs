using System;

namespace ProtectedLimitsAccess
{
  // When you subclass a base class in the same assembly, the base class's
  // members that you need to access must be declared at least protected.
  // The protected internal combination is ok too.
  public class SavingsAccountSameAssembly : BankAccount
  {
    public override void Deposit(decimal amount)
    {
      // First, increase balance by 1, showing we can use Balance's set accessor here.
      this.Balance += 1M;
      // Second, display the modified balance, showing we can use Balance's get accessor here.
      Console.WriteLine("In SavingsAccountSameAssembly.Deposit, balance is {0} before depositing", Balance);
      base.Deposit(amount);
    }

    public override decimal Withdraw(decimal amount)
    {
      // First, decrease balance by 1, showing we can use Balance's set accessor here.
      this.Balance -= 1M;
      // Second, display the modified balance, showing we can use Balance's get accessor here.
      Console.WriteLine("In SavingsAccountSameAssembly.Withdraw, balance is {0} before withdrawing", Balance);
      return base.Withdraw(amount);
    }
  }
}
