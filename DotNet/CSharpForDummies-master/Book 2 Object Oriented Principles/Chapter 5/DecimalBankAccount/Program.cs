// DecimalBankAccount - Create a bank account using a decimal
//     variable to store the account balance.
using System;

namespace DecimalBankAccount
{
  public class Program
  {
    public static void Main(string[] args)
    {
      // Open a bank account.
      Console.WriteLine("Create a bank account object");
      BankAccount ba = new BankAccount();
      ba.InitBankAccount();

      // Make a deposit.
      double deposit = 123.454;
      Console.WriteLine("Depositing {0:C}", deposit);
      ba.Deposit(deposit);

      // Account balance.
      Console.WriteLine("Account = {0}", ba.GetString());

      // Now add in a very small amount.
      double addition = 0.002;
      Console.WriteLine("Adding {0:C}", addition);
      ba.Deposit(addition);

      // Resulting balance.
      Console.WriteLine("Resulting account = {0}", ba.GetString());

      // Wait for user to acknowledge the results.
      Console.WriteLine("Press Enter to terminate...");
      Console.Read();
    }
  }

  // BankAccount - Define a class that represents a simple account.
  public class BankAccount
  {
    private static int _nextAccountNumber = 1000;
    private int _accountNumber;

    // Maintain the balance as a single decimal variable.
    private decimal _balance;

    // Init - Initialize a bank account with the next
    //    account id and a balance of 0.
    public void InitBankAccount()
    {
      _accountNumber = ++_nextAccountNumber;
      _balance = 0;
    }

    // GetBalance - Return the current balance.
    public double GetBalance()
    {
      return (double)_balance;
    }

    // AccountNumber.
    public int GetAccountNumber()
    {
      return _accountNumber;
    }

    public void SetAccountNumber(int accountNumber)
    {
      this._accountNumber = accountNumber;
    }

    // Deposit - Any positive deposit is allowed.
    public void Deposit(double amount)
    {
      if (amount > 0.0)
      {
        // Round off the double to the nearest cent before depositing.
        decimal temp = (decimal)amount;
        temp = Decimal.Round(temp, 2);

        _balance += temp;
      }

    }

    // Withdraw - You can withdraw any amount up to the
    //    balance; return the amount withdrawn.
    public double Withdraw(double withdrawal)
    {
      decimal decWithdrawal = (decimal)withdrawal;
      if (_balance <= decWithdrawal)
      {
        decWithdrawal = _balance;
      }

      _balance -= decWithdrawal;
      return (double)decWithdrawal;
    }

    // GetString - Return the account data as a string.
    public string GetString()
    {
      string s = String.Format("#{0} = {1:C}",
                               GetAccountNumber(),
                               GetBalance());
      return s;
    }
  }
}
