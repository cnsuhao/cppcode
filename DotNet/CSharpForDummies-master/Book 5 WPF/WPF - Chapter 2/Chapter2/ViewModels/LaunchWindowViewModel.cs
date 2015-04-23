using System.Windows.Input;
using Chapter2.Commands;

namespace Chapter2.ViewModels
{
    public class LaunchWindowViewModel
    {
        ICommand _launchWindowCmd;

        public ICommand LaunchWindowCmd
        {
            get
            {
                if (_launchWindowCmd == null)
                {
                    _launchWindowCmd = new LaunchWindowCommand();
                }
                return _launchWindowCmd;
            }
            set { _launchWindowCmd = value; }
        }
    }
}


