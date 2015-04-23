using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Data;
using System.Windows.Documents;
using System.Windows.Input;
using System.Windows.Media;
using System.Windows.Media.Imaging;
using System.Windows.Navigation;
using System.Windows.Shapes;

namespace EventRouting
{
    /// <summary>
    /// Interaction logic for MainWindow.xaml
    /// </summary>
    public partial class MainWindow : Window
    {
        public MainWindow()
        {
            InitializeComponent();
            //this.Window.AddHandler(UIElement.KeyDownEvent, new KeyEventHandler(Generic_KeyDown), true);
        }

     

        private void Generic_KeyDown(object sender, KeyEventArgs e)
        {
            FrameworkElement element = sender as FrameworkElement;
            //if (element.Name.Equals("TextBox"))
            //    e.Handled = true;
            bool handled = e.Handled;
            FrameworkElement originalSource = e.OriginalSource as FrameworkElement;
            FrameworkElement source = e.Source as FrameworkElement;
            MessageBox.Show("Bubbling - Element Responding (sender): " + element.Name +
                            "\nEvent Handled: "+ handled +
                            "\nOriginal Source: "+ originalSource.Name +
                            "\nSource: "+ source.Name);
        }

        private void Generic_PreviewKeyDown(object sender, KeyEventArgs e)
        {
            FrameworkElement element = sender as FrameworkElement;
            bool handled = e.Handled;
            FrameworkElement originalSource = e.OriginalSource as FrameworkElement;
            FrameworkElement source = e.Source as FrameworkElement;
            MessageBox.Show("Tunneling - Element Responding (sender): " + element.Name +
                            "\nEvent Handled: " + handled +
                            "\nOriginal Source: " + originalSource.Name +
                            "\nSource: " + source.Name);
        }
    }
}
