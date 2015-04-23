using System;
using System.Windows;
using System.Windows.Input;

namespace Chapter2.Commands
{
    public class LaunchWindowCommand : ICommand
    {
        public void Execute(object parameter)
        {
            try
            {
                Window winToLaunch;
                if ((winToLaunch = WindowFactory.CreateWindow((string)parameter)) != null)
                {
                    winToLaunch.Show();
                }
            }
            catch (Exception)
            {
                MessageBox.Show("An Error Occurred Loading the Window");
            }
        }

        public bool CanExecute(object parameter)
        {
            return true;
        }

        public event EventHandler CanExecuteChanged
        {
            add { CommandManager.RequerySuggested += value; }
            remove { CommandManager.RequerySuggested -= value; }
        }
    }
}