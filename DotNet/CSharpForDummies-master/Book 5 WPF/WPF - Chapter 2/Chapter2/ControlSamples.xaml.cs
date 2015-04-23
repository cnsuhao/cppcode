using System.Windows;
using Chapter2.ViewModels;

namespace Chapter2
{
    /// <summary>
    /// Interaction logic for Controls.xaml
    /// </summary>
    public partial class ControlSamples : Window
    {
        public ControlSamples()
        {
            InitializeComponent();
            DataContext = new LaunchWindowViewModel();
        }
    }
}
