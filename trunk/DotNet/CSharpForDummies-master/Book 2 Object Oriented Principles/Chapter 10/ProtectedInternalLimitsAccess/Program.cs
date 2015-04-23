// ProtectedInternalLimitsAccess - Demonstrate accessibility via the protected internal
//    keyword combination. Anything marked protected internal is accessible from only three
//    places:
//    - Inside the class that contains the protected internal item - even private items are
//      accessible inside their own classes.
//    - Inside a subclass of the containing base class - that's the protected part.
//    - Inside _any_ class within the same assembly as the item - that's the internal part.
//
//    BankAccount's Balance get is public, set is protected internal.
using System;
using MainBankAccountAssembly;
using AnotherAssembly;

namespace ProtectedInternalLimitsAccess
{
  class Program
  {
    static void Main(string[] args)
    {
      // Main() attempts access to the protected internal set accessor of BankAccount's
      // Balance property in a variety of ways:
      // 1. From Main() itself, Balance set is never accessible. Balance get is accessible from anywhere.
      // 2. Through BankAccount itself. _Inside_ BankAccount, Balance set is accessible, of course.
      // 3. Through a BankAccount subclass in the same assembly as BankAccount. _Inside_ the subclass, 
      //    Balance set is accessible due to the protected keyword.
      // 4. Through a BankAccount subclass in a different assembly from BankAccount. Again Balance set is 
      //    accessible _inside_ the subclass due to protected keyword.
      // 5. Inside a non-BankAccount class in the same assembly, Balance set is accessible because
      //    of the internal keyword on Balance set.
      // 6. Inside a non-BankAccount class in a different assembly, Balance set is not accessible.

      Console.WriteLine("----- Working with the BankAccount base class -----\n");
      BankAccount ba = new BankAccount();
      // The next line won't compile because Balance's set accessor isn't accessible from here.
      //ba.Balance += 3M;
      ba.Deposit(100M);
      ba.Withdraw(50M);  // Balance now 50.
      Console.WriteLine("In Main(), accessing Balance through property get {0}", ba.Balance);  // Prints 50.

      Console.WriteLine("\n----- Working with a subclass in the same assembly -----\n");
      SavingsAccountSameAssembly sasa = new SavingsAccountSameAssembly();
      // The next line won't compile because Balance's set accessor isn't accessible from here.
      //sasa.Balance += 3M;
      sasa.Deposit(100M);
      sasa.Withdraw(50M);
      // But this next line works because Balance's get accessor is public.
      Console.WriteLine("In Main(), accessing Balance through property get {0}", sasa.Balance); // 50.
      // The next line won't compile because the Balance set accessor is not public and Main() isn't in
      // either of the privileged places: a subclass of BankAccount or the same assembly as BankAccount.
      //sasa.Balance = 200M;

      Console.WriteLine("\n----- Working with a subclass in a different assembly -----\n");
      SavingsAccountAnotherAssembly saaa = new SavingsAccountAnotherAssembly();
      // Same problem with next line.
      //saaa.Balance += 3M;
      saaa.Deposit(100M);
      saaa.Withdraw(50M);
      // Even from a subclass in a different assembly, this works just because Balance get is public.
      Console.WriteLine("In Main(), accessing Balance through property  get {0}", saaa.Balance); // 50.
      // Now try to change Balance.
      // Again, the next line won't compile because the set accessor to Balance is non-public.
      //saaa.Balance = 300M;

      Console.WriteLine("\n----- Working with a non-BankAccount class in a different assembly -----\n");
      AnotherAssembly.AnotherClass ac1 = new AnotherAssembly.AnotherClass();
      // Inside ac1, only Balance get is accessible because its class is neither a subclass of BankAccount, nor
      // in the same assembly as BankAccount.
      Console.WriteLine("In Main(), getting balance via AnotherClass: {0}", ac1.AccessBalance());  // Prints a balance of 0.
      // Main() can't get at the Balance because ac2 uses an internally constructed instance of an account.

      Console.WriteLine("\n----- Working with a non-BankAccount class in the same assembly -----\n");
      MainBankAccountAssembly.AnotherClass ac2 = new MainBankAccountAssembly.AnotherClass();
      // Inside ac2, both Balance get and Balance set are accessible due to the internal keyword.
      Console.WriteLine("In Main(), getting balance via AnotherClass: {0}", ac2.AccessBalance());  // Prints a balance of 3.
      // Main() can't get at the Balance because ac2 uses an internally constructed instance of an account.
      
      Console.WriteLine("\nPress Enter to terminate...");
      Console.Read();

    }
  }
}
