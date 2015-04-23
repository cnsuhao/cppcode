// SimpleSavingsAccount - Implement a SavingsAccount as a form of
//    BankAccountbank account; don't use any virtual methods
//    (Chapter 13 explains virtual methods).

using System;
namespace SimpleSavingsAccount
{
  // BankAccount - Simulate a bank account, each of which
  //    carries an account ID (which is assigned
  //    upon creation) and a balance.
  public class BankAccount    // The base class.
  {
    // Bank accounts start at 1000 and increase sequentially from there.
    public static int _nextAccountNumber = 1000;
    // Maintain the account number and balance for each object.
    public int _accountNumber;
    public decimal _balance;
    // Init - Initialize a bank account with the next account ID and the
    //     specified initial balance (default to zero).
    public void InitBankAccount()
    {
      InitBankAccount(0);
    }
    public void InitBankAccount(decimal initialBalance)
    {
      _accountNumber = ++_nextAccountNumber;
      _balance = initialBalance;
    }
    // Balance property.
    public decimal Balance
    {
      get { return _balance;}
    }
    // Deposit - any positive deposit is allowed.
    public void Deposit(decimal amount)
    {
      if (amount > 0)
      {
        _balance += amount;
      }
    }
    // Withdraw - You can withdraw any amount up to the
    //    balance; return the amount withdrawn.
    public decimal Withdraw(decimal withdrawal)
    {
      if (Balance <= withdrawal) // Use Balance property.
      {
        withdrawal = Balance;
      }
      _balance -= withdrawal;
      return withdrawal;
    }
    // ToString - Stringify the account.
    public string ToBankAccountString()
    {
      return String.Format("{0} - {1:C}",
        _accountNumber, Balance);
    }
  }
  // SavingsAccount - A bank account that draws interest.
  public class SavingsAccount : BankAccount   // The subclass.
  {
    public decimal _interestRate;
    // InitSavingsAccount - Input the rate expressed as a
    //    rate between 0 and 100
    public void InitSavingsAccount(decimal interestRate)
    {
      InitSavingsAccount(0, interestRate);
    }
    public void InitSavingsAccount(decimal initialBalance, decimal interestRate)
    {
      InitBankAccount(initialBalance);  // Note call to base class.
      this._interestRate = interestRate / 100;
    }
    // AccumulateInterest - Invoke once per period.
    public void AccumulateInterest()
    {
      _balance = Balance + (decimal)(Balance * _interestRate);
    }
    // ToString - Stringify the account.
    public string ToSavingsAccountString()
    {
      return String.Format("{0} ({1}%)",
        ToBankAccountString(), _interestRate * 100);
    }
  }
  public class Program
  {
    public static void Main(string[] args)
    {
      // Create a bank account and display it.
      BankAccount ba = new BankAccount();
      ba.InitBankAccount(100M); // M suffix indicates decimal.
      ba.Deposit(100M);
      Console.WriteLine("Account {0}", ba.ToBankAccountString());
      // Now a savings account.
      SavingsAccount sa = new SavingsAccount();
      sa.InitSavingsAccount(100M, 12.5M); 
      sa.AccumulateInterest();
      Console.WriteLine("Account {0}", sa.ToSavingsAccountString());
      // Wait for user to acknowledge the results.
      Console.WriteLine("Press Enter to terminate...");
      Console.Read();
    }
  }
}
