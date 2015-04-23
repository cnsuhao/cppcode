using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.ComponentModel;

namespace BindingSample2
{
    public class Car : INotifyPropertyChanged, IDataErrorInfo
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

        public string Error
        {
            get { return null; }
        }

        public string this[string columnName]
        {
            get {
                string retvalue = null;
                if (columnName == "Make")
                {
                    if (String.IsNullOrEmpty(this._make) || this._make.Length < 3)
                    {
                        retvalue = "Car Make must be atleast 3 characters in length";
                    }
                }

                if (columnName == "Model")
                {
                    if (String.IsNullOrEmpty(this._model) || this._model.Length < 3)
                    {
                        retvalue = "Car Model must be atleast 3 characters in length";
                    }
                }

                return retvalue;
            }
        }
    }
}
