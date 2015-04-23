using System;

namespace AnotherAssembly
{
  // You can subclass a class in a different assembly.
  // Note that base class's members that you want to access from the subclass must
  // be declared at least protected in this situation. The protected internal
  // combination is fine too.
  public class SavingsAccountAnotherAssembly : ProtectedLimitsAccess.BankAccount
  {
    public override void Deposit(decimal amount)
    {
      // First, increase balance by 1, showing we can use Balance's set accessor here.
      this.Balance += 1M;
      // Second, display the modified balance, showing we can use Balance's get accessor here.
      Console.WriteLine("In SavingsAccountAnotherAssembly.Deposit, balance is {0} before depositing", Balance);
      base.Deposit(amount);
    }

    public override decimal Withdraw(decimal amount)
    {
      // First, decrease balance by 1, showing we can use Balance's set accessor here.
      this.Balance -= 1M;
      // Second, display the modified balance, showing we can use Balance's get accessor here.
      Console.WriteLine("In SavingsAccountAnotherAssembly.Withdraw, balance is {0} before withdrawing", Balance);
      return base.Withdraw(amount);
    }
  }
}
