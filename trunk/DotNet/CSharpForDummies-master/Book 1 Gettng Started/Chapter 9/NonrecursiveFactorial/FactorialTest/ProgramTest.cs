using NonrecursiveFactorial;
//using Microsoft.VisualStudio.TestTools.UnitTesting;
using NUnit.Framework;

namespace FactorialTest
{
    
    
    /// <summary>
    ///This is a test class for ProgramTest and is intended
    ///to contain all ProgramTest Unit Tests
    ///</summary>
  [TestFixture]
  public class ProgramTest
  {
    #region Additional test attributes
    // 
    //You can use the following additional attributes as you write your tests:
    //
    //Use TestInitialize to run code before running each test
    [SetUp]
    public void MyTestInitialize()
    {
    }
    //
    //Use TestCleanup to run code after each test has run
    [TearDown]
    public void MyTestCleanup()
    {
    }
    //
    #endregion


    /// <summary>
    ///A test for Factorial
    ///</summary>
    [Test]
    public void FactorialTest()
    {
      int value = 10; // TODO: Initialize to an appropriate value
      double expected = 3628800F; // TODO: Initialize to an appropriate value
      double actual;
      actual = Program.Factorial(value);
      Assert.AreEqual(expected, actual);
      //Assert.Inconclusive("Verify the correctness of this test method.");
    }
  }
}
