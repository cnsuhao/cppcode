using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace BindingSample1
{
    public class Car
    {
        private string _make;

        public string Make
        {
            get { return _make; }
            set { _make = value; }
        }
        private string _model;

        public string Model
        {
            get { return _model; }
            set { _model = value; }
        }

        public Car() { }
    }
}
