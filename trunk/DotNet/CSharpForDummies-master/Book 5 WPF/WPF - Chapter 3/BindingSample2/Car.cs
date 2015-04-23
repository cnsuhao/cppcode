using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.ComponentModel;

namespace BindingSample2
{
    public class Car : INotifyPropertyChanged
    {
        private string _make;

        public string Make
        {
            get { return _make; }
            set {
                if (_make != value)
                {
                    _make = value;
                    NotifyPropertyChanged("Make");
                }
            }
        }
        private string _model;

        public string Model
        {
            get { return _model; }
            set {
                if (_model != value)
                {
                    _model = value;
                    NotifyPropertyChanged("Model");
                }
            }
        }

        public Car() { }

        public event PropertyChangedEventHandler PropertyChanged;

        private void NotifyPropertyChanged(string propertyName)
        {
            if (PropertyChanged != null)
            {
                this.PropertyChanged(this, new PropertyChangedEventArgs(propertyName));
            }
        }
    }
}
