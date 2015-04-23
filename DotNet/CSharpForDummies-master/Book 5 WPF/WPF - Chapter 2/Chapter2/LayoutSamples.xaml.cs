using System.Windows;
using Chapter2.ViewModels;

namespace Chapter2
{
    /// <summary>
    /// Interaction logic for MainWindow.xaml
    /// </summary>
    public partial class LayoutSamples : Window
    {
        public LayoutSamples()
        {
            InitializeComponent();
            DataContext = new LaunchWindowViewModel();
        }

    }
}
