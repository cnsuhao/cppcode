using System.Windows;
using Chapter2.ViewModels;

namespace Chapter2.Controls
{
    /// <summary>
    /// Interaction logic for TextBlockAndLabel.xaml
    /// </summary>
    public partial class ComboBoxControl : Window
    {
        public ComboBoxControl()
        {
            InitializeComponent();
            DataContext = new ListbasedControlsViewModel();
        }

    }
}
