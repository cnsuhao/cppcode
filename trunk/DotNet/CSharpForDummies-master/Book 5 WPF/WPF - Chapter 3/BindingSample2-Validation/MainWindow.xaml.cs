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

namespace BindingSample2
{
    /// <summary>
    /// Interaction logic for MainWindow.xaml
    /// </summary>
    public partial class MainWindow : Window
    {
        public MainWindow()
        {
            InitializeComponent();
            GenerateData();
        }

        private void GenerateData()
        {
            Car car1 = new Car() { Make = "Athlon", Model = "XYZ" };
            this.DataContext = car1;
        }

        private void btnShowDataContextValue_Click(object sender, RoutedEventArgs e)
        {
            Car dc = this.DataContext as Car;
            MessageBox.Show("Car Make: " + dc.Make + "\nCar Model: " 
                        + dc.Model);
        }

        private void btnChangeDataContextValue_Click(object sender, RoutedEventArgs e)
        {
            Car dc = this.DataContext as Car;
            dc.Make = "Changed Make";
            dc.Model = "Changed Model";
        }
    }
}
