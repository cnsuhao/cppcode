// startup_code.cpp
#include <stdio.h>

class Startup
{
   public:
   Startup()
   {
       // initialize
       printf("Initializing module.\n");
   }
};
class N
{
     static Startup startup;
public:
     N()
    {
         // make use of pre-initialized state
     }
};

Startup N::startup;

int main()
{
    return 0;
}
 