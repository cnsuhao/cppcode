// ConstructorSavingsAccount - Implement a SavingsAccount as
//    a form of BankAccount; don't use any virtual methods but
//    do implement the constructors properly. (I cover virtual
//    methods in Ch 13.)
using System;

namespace ConstructorSavingsAccount
{
  // BankAccount - Simulate a bank account, each of which carries an 
  //    account ID (which is assigned upon creation) and a balance.
  public class BankAccount
  {
    // Bank accounts start at 1000 and increase sequentially from there.
    public static int _nextAccountNumber = 1000;

    // Maintain the account number and balance for each object.
    public int _accountNumber;
    public decimal _balance;

    // Constructors.
    public BankAccount() : this(0)
    {
    }
    public BankAccount(decimal initialBalance)
    {
      _accountNumber = ++_nextAccountNumber;
      _balance = initialBalance;
    }

    public decimal Balance
    {
      get { return _balance; }
      // Protected setter lets subclass use Balance property to set.
      protected set { _balance = value; }
    }

    // Deposit - Any positive deposit is allowed.
    public void Deposit(decimal amount)
    {
      if (amount > 0)
      {
        Balance += amount;
      }
    }

    // Withdraw - You can withdraw any amount up to the
    //    balance; return the amount withdrawn.
    public decimal Withdraw(decimal withdrawal)
    {
      if (Balance <= withdrawal)
      {
        withdrawal = Balance;
      }

      Balance -= withdrawal;
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
  public class SavingsAccount : BankAccount
  {
    public decimal _interestRate;

    // InitSavingsAccount - Input the rate expressed as a
    //    rate between 0 and 100.
    public SavingsAccount(decimal interestRate) : this(interestRate, 0) { }
    public SavingsAccount(decimal interestRate, decimal initial) : base(initial)
    {
      this._interestRate = interestRate / 100;
    }

    // AccumulateInterest - Invoke once per period.
    public void AccumulateInterest()
    {
      // Use protected setter and public getter via Balance property.
      Balance = Balance + (decimal)(Balance * _interestRate);
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
    // DirectDeposit - Deposit my paycheck automatically.
    public static void DirectDeposit(BankAccount ba, decimal pay)
    {
      ba.Deposit(pay);
    }

    public static void Main(string[] args)
    {
      // Create a bank account and display it.
      BankAccount ba = new BankAccount(100);
      DirectDeposit(ba, 100);
      Console.WriteLine("Account {0}", ba.ToBankAccountString());

      // Now a savings account.
      SavingsAccount sa = new SavingsAccount(12.5M);
      DirectDeposit(sa, 100);
      sa.AccumulateInterest();
      Console.WriteLine("Account {0}", sa.ToSavingsAccountString());

      // Wait for user to acknowledge the results.
      Console.WriteLine("Press Enter to terminate...");
      Console.Read();
    }
  }
}
