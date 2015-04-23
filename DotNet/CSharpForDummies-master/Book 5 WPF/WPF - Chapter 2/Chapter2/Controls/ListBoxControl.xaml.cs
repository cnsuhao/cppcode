using System.Windows;
using Chapter2.ViewModels;

namespace Chapter2.Controls
{
    /// <summary>
    /// Interaction logic for ListBoxCcntrol.xaml
    /// </summary>
    public partial class ListBoxControl : Window
    {
        public ListBoxControl()
        {
            InitializeComponent();
            DataContext = new ListbasedControlsViewModel();
        }

    }
}
