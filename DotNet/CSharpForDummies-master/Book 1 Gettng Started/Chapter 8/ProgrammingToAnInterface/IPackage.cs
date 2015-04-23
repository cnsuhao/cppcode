// IPackage - A separate interface to specify a contract for
//    members such as ToAddress, FromAddress, etc.

namespace ProgrammingToAnInterface
{
  public interface IPackage
  {
    // Package-specific methods.
    string ToAddress { get; }
    // Etc.
  }
}
