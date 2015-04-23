using System.Windows;

namespace Chapter2.Controls
{
    /// <summary>
    /// Interaction logic for TextBlockAndLabel.xaml
    /// </summary>
    public partial class BasicInputControls : Window
    {
        public BasicInputControls()
        {
            InitializeComponent();
        }

        private void Button_Click(object sender, RoutedEventArgs e)
        {
            MessageBox.Show("Hello World");
        }
    }
}
