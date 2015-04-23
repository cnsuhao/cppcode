// ProtectedLimitsAccess - Demonstrate the use of the protected keyword
//    which limits access to subclasses.
using System;

namespace ProtectedLimitsAccess
{
  class Program
  {
    static void Main(string[] args)
    {
      Console.WriteLine("----- Use a standard BankAccount -----\n");
      BankAccount ba = new BankAccount();
      // Next line doesn't compile - protected set accessor of Balance not accessible here.
      //ba.Balance += 100;
      ba.Deposit(100);
      ba.Withdraw(50);
      // The get accessor does work.
      Console.WriteLine("In Main, standard BankAccount balance is {0}", ba.Balance);

      Console.WriteLine("\n----- Use a SavingsAccount in the same assembly -----\n");
      SavingsAccountSameAssembly sasa = new SavingsAccountSameAssembly();
      // Next line doesn't compile - protected set accessor of Balance not accessible here.
      //sasa.Balance += 100;
      sasa.Deposit(100);
      sasa.Withdraw(50);
      // The get accessor does work.
      Console.WriteLine("In Main, SavingsAccountSameAssembly balance is {0}", sasa.Balance);

      Console.WriteLine("\n----- Use a SavingsAccount in a different assembly -----\n");
      AnotherAssembly.SavingsAccountAnotherAssembly saaa = new AnotherAssembly.SavingsAccountAnotherAssembly();
      // Next line doesn't compile - protected set accessor of Balance not accessible here.
      //sasa.Balance += 100;
      saaa.Deposit(100);
      saaa.Withdraw(50);
      // The get accessor does work.
      Console.WriteLine("In Main, SavingsAccountSameAssembly balance is {0}", saaa.Balance);

      Console.WriteLine("\nPress Enter to terminate...");
      Console.Read();
    }
  }
}
