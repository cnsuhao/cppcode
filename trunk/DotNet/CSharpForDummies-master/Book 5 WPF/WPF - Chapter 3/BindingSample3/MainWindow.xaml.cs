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

namespace BindingSample3
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
            ServerStatus ss = new ServerStatus() { 
                ServerName = "HeadquartersApplicationServer1",
                NumberOfConnectedUsers = 983,
                IsServerUp = true
            };

            ServerStatus ss2 = new ServerStatus()
            {
                ServerName = "HeadquartersFileServer1",
                NumberOfConnectedUsers = 0,
                IsServerUp = false
            };

            ServerStatus ss3 = new ServerStatus()
            {
                ServerName = "HeadquartersWebServer1",
                NumberOfConnectedUsers = 0,
                IsServerUp = false
            };

            ServerStatus ss4 = new ServerStatus()
            {
                ServerName = "HQDomainControllerServer1",
                NumberOfConnectedUsers = 10235,
                IsServerUp = true
            };

            List<ServerStatus> serverList = new List<ServerStatus>();
            serverList.Add(ss);
            serverList.Add(ss2);
            serverList.Add(ss3);
            serverList.Add(ss4);
            
            this.DataContext = serverList;
        }
    }
}
