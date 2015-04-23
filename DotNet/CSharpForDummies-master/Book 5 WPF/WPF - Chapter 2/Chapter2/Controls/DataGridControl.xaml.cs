using System.Windows;
using Chapter2.ViewModels;

namespace Chapter2.Controls
{
    /// <summary>
    /// Interaction logic for DataGridControl.xaml
    /// </summary>
    public partial class DataGridControl : Window
    {
        public DataGridControl()
        {
            InitializeComponent();
            DataContext = new ListbasedControlsViewModel();
        }
    }
}
