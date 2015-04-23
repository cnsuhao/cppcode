// HidingWithdrawal - Hide the withdraw method in the base 
//    class with a method in the subclass of the same name.
// Warning: Compiling this program gives you a warning that
// the Withdraw method in SavingsAccount "hides" that in
// BankAccount. You're advised to prefix the method with
// "new" - you should treat this and all compiler warnings
// as errors.
using System;

namespace HidingWithdrawal
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

    public decimal Withdraw(decimal amount)
    {
      // Good practice to avoid modifying an input parameter.
      // Modify a copy.
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
    public decimal Withdraw(decimal withdrawal)
    {
      // Take our $1.50 off the top.
      base.Withdraw(1.5M);

      // Now you can withdraw from what's left.
      return base.Withdraw(withdrawal);
    }
  }

  public class Program
  {
    public static void Main(string[] args)
    {
      BankAccount ba;
      SavingsAccount sa;

      // Create a bank account, withdraw $100, and
      // display the results.
      ba = new BankAccount(200M);
      ba.Withdraw(100M);

      // Try the same trick with a savings account.
      sa = new SavingsAccount(200M, 12);
      sa.Withdraw(100M);

      // Display the resulting balance.
      Console.WriteLine("When invoked directly:");
      Console.WriteLine("BankAccount balance is {0:C}", ba.Balance);
      Console.WriteLine("SavingsAccount balance is {0:C}", sa.Balance);

      // Wait for user to acknowledge the results.
      Console.WriteLine("Press Enter to terminate...");
      Console.Read();
    }
  }
}
