// exception.cpp
using namespace System;

int main()
{

try
{
     bool error = true;
     // other code

     if (error)
     {
          throw gcnew Exception();
     }
}
catch( Exception^ exception)
{
      Console::WriteLine("code to handle the exception");
}
}
