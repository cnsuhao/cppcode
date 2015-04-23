using System.Windows;
using System.Windows.Controls;

namespace Chapter2.Layouts
{
    /// <summary>
    /// Interaction logic for StackPanel.xaml
    /// </summary>
    public partial class StackPanelSample : Window
    {
        public StackPanelSample()
        {
            InitializeComponent();
        }

        void cmdOrientation_Click(object sender, RoutedEventArgs e)
        {
            var button = sender as Button;
            if (button.Content.ToString() == "Set Vertical")
            {
                pnlStack.Orientation = Orientation.Vertical;
                button.Content = "Set Horizontal";
                Title = "Stack Panel - Vertical";
            }
            else
            {
                pnlStack.Orientation = Orientation.Horizontal;
                button.Content = "Set Vertical";
                Title = "Stack Panel - Horizontal";
            }
        }
    }
}