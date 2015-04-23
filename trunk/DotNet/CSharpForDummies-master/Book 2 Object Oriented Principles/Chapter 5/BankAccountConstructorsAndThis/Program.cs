// BankAccountContructorsAndThis - "Chain" the three
//    constructors to localize all initialization.
using System;

namespace BankAccountContructorsAndThis
{
  using System;

  public class Program
  {
    public static void Main(string[] args)
    {
      // Create three bank accounts with valid initial values.
      BankAccount ba1 = new BankAccount();
      Console.WriteLine(ba1.GetString());

      BankAccount ba2 = new BankAccount(100);
      Console.WriteLine(ba2.GetString());

      BankAccount ba3 = new BankAccount(1234, 200);
      Console.WriteLine(ba3.GetString());

      // Wait for user to acknowledge the results.
      Console.WriteLine("Press Enter to terminate...");
      Console.Read();
    }
  }

  // BankAccount - Simulate a simple bank account.
  public class BankAccount
  {
    // Bank accounts start at 1000 and increase sequentially from there.
    private static int _nextAccountNumber = 1000;

    // Maintain the account number and balance.
    private int _accountNumber;
    private double _balance;

    // Invoke the more specific constructor by providing
    // default values for the missing arguments.
    public BankAccount() : this(0, 0) {}

    public BankAccount(double initialBalance) : this(0, initialBalance) {}

    // The most specific constructor does all of the real work.
    public BankAccount(int initialAccountNumber, double initialBalance)
    {
      // Ignore negative account numbers; a zero account
      // number indicates that we should use the next available.
      if (initialAccountNumber <= 0)
      {
        initialAccountNumber = ++_nextAccountNumber;
      }
      _accountNumber = initialAccountNumber;

      // Start with an initial balance as long as it's positive.
      if (initialBalance < 0)
      {
        initialBalance = 0;
      }
      _balance = initialBalance;
    }

    public string GetString()
    {
      return String.Format("#{0} = {1:N}", _accountNumber, _balance);

    }
  }
}
