// PolymorphicInheritance - Hide a method in the
//    base class polymorphically. Shows how to use
//    the virtual and override keywords.
using System;

namespace PolymorphicInheritance
{
  // BankAccount - A very basic bank account.
  public class BankAccount
  {
    protected decimal _balance;

    public BankAccount(decimal initialBalance)
    {
      _balance = initialBalance;
    }

    public decimal Balance
    {
      get { return _balance; }
    }

    public virtual decimal Withdraw(decimal amount)
    {
      Console.WriteLine("In BankAccount.Withdraw() for ${0}...", amount);

      decimal amountToWithdraw = amount;
      if (amountToWithdraw > Balance)
      {
        amountToWithdraw = Balance;
      }
      _balance -= amountToWithdraw;
      return amountToWithdraw;
    }
  }

  // SavingsAccount - A bank account that draws interest.
  public class SavingsAccount : BankAccount
  {
    public decimal _interestRate;

    // SavingsAccount - Input the rate expressed as a
    //    rate between 0 and 100.
    public SavingsAccount(decimal initialBalance, decimal interestRate)
                           : base(initialBalance)
    {
      _interestRate = interestRate / 100;
    }

    // AccumulateInterest - Invoke once per period.
    public void AccumulateInterest()
    {
      _balance = Balance + (Balance * _interestRate);
    }

    // Withdraw - You can withdraw any amount up to the
    //    balance; return the amount withdrawn.
    override public decimal Withdraw(decimal withdrawal)
    {
      Console.WriteLine("In SavingsAccount.Withdraw()...");
      Console.WriteLine("Invoking base-class Withdraw twice...");
      // Take our $1.50 off the top.
      base.Withdraw(1.5M);

      // Now you can withdraw from what's left.
      return base.Withdraw(withdrawal);
    }
  }

  public class Program
  {
    public static void MakeAWithdrawal(BankAccount ba, decimal amount)
    {
      ba.Withdraw(amount);
    }

    public static void Main(string[] args)
    {
      BankAccount ba;
      SavingsAccount sa;

      // Display the resulting balance.
      Console.WriteLine("Withdrawal: MakeAWithdrawal(ba, ...)");
      ba = new BankAccount(200M);
      MakeAWithdrawal(ba, 100M);
      Console.WriteLine("BankAccount balance is {0:C}", ba.Balance);

      Console.WriteLine("Withdrawal: MakeAWithdrawal(sa, ...)");
      sa = new SavingsAccount(200M, 12);
      MakeAWithdrawal(sa, 100M);
      Console.WriteLine("SavingsAccount balance is {0:C}", sa.Balance);

      // Wait for user to acknowledge the results.
      Console.WriteLine("Press Enter to terminate...");
      Console.Read();
    }
  }
}
