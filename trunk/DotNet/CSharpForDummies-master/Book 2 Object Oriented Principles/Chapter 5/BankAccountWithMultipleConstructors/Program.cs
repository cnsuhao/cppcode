// BankAccountWithMultipleConstructors - Provide our trusty bank account
//    with a number of constructors, one for every occasion.
using System;

namespace BankAccountWithMultipleConstructors
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

  // BankAccount - Simulate a simple bank account. A bit stripped down
  //    to emphasize the constructors.
  public class BankAccount
  {
    // Bank accounts start at 1000 and increase sequentially from there.
    private static int _nextAccountNumber = 1000;

    // Maintain the account number and _balance.
    private int _accountNumber;
    // Back to the double version - we don't care for this example since
    // it's just about the constructors.
    private double _balance;

    // Provide a series of constructors depending upon the need.
    public BankAccount()  // You create this one, not automatic.
    {
      _accountNumber = ++_nextAccountNumber;
      _balance = 0.0; 
    }

    public BankAccount(double initialBalance)
    {
      // Repeat some of the code from the default constructor.
      _accountNumber = ++_nextAccountNumber;

      // Now the code unique to this constructor.
      // Start with an initial balance as long as it's positive.
      if (initialBalance < 0)
      {
        initialBalance = 0;
      }
      _balance = initialBalance;
    }

    public BankAccount(int initialAccountNumber, double initialBalance)
    {
      // Ignore negative account numbers.
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
