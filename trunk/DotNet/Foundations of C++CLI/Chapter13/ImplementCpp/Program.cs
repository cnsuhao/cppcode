using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace ImplementCpp
{
    class hehe : ITest
    {
        public virtual void F() { }
        public virtual void G() { }
    }
    class Programe
    {
        static void Main(string[] args)
        {
            ITest nimei = new hehe();
            nimei.F();
            nimei.G();
        }
    }
}
