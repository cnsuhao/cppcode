// BankAccountContructorsAndMethod - Call an initialization method from
//    each constructor.
using System;

namespace BankAccountContructorsAndMethod
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

    // Maintain the account number and _balance.
    private int _accountNumber;
    private double _balance;

    // Place all the real initialization code in a separate,
    // conventional method, called from constructors.
    public BankAccount() // You create this one, not automatic.
    {
      Init(++_nextAccountNumber, 0.0);
    }

    public BankAccount(double initialBalance)
    {
      Init(++_nextAccountNumber, initialBalance);
    }

    public BankAccount(int initialAccountNumber, double initialBalance)
    {
      // Really should validate initialAccountNumber here so it (a) doesn't  
      // duplicate existing numbers and (b) is 1000 or greater.
      Init(initialAccountNumber, initialBalance);
    }

    // All three constructors call this initialization method.
    private void Init(int initialAccountNumber, double initialBalance)
    {
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
