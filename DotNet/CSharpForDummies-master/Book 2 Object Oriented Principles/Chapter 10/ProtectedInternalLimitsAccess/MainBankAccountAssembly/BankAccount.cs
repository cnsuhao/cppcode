using System;

namespace MainBankAccountAssembly
{
  // A class with a protected internal member.
  public class BankAccount
  {
    private decimal _balance;

    public BankAccount()
    {
      _balance = 0.0M;
    }

    // Note the use of protected internal here.
    public decimal Balance { get; protected internal set; }

    public virtual void Deposit(decimal amount)
    {
      Balance += amount;
      Console.WriteLine("In BankAccount: Depositing {0}; new balance {1}", amount, Balance);
    }

    public virtual decimal Withdraw(decimal amount)
    {
      if (amount <= Balance)
      {
        Balance -= amount;
        Console.WriteLine("In BankAccount: Withdrawing {0}; remaining balance {1}", amount, Balance);
        return amount;
      }
      return Balance;
    }
  }
}
