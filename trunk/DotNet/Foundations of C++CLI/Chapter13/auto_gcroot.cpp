// auto_gcroot.cpp

#include "auto_gcroot.h"
#include <msclr/gcroot.h>
#include <msclr/auto_gcroot.h>
using namespace System;
using namespace msclr;

ref class R
{
   public:
     void f()
     {
        Console::WriteLine("managed member function");
     }

     ~R()
     {
        Console::WriteLine("destructor");
     }
     !R()
     {
        Console::WriteLine("finalizer");
     }
    
};

N::N()
{
    gcroot<R^> r_gcroot = gcnew R();
    r_gcroot->f();
    auto_gcroot<R^> r_auto_gcroot = gcnew R();
    r_auto_gcroot->f();
}

//int main()
//{
//   N n;
//   // when n gets destroyed, the destructor for the auto_gcroot object
//   // will be executed, but not the gcroot object
//}
