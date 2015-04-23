using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace BindingSample3
{
    public class ServerStatus
    {
        private string _serverName;

        public string ServerName
        {
            get { return _serverName; }
            set { _serverName = value; }
        }
        private bool _isServerUp;

        public bool IsServerUp
        {
            get { return _isServerUp; }
            set { _isServerUp = value; }
        }
        private int _numberOfConnectedUsers;

        public int NumberOfConnectedUsers
        {
            get { return _numberOfConnectedUsers; }
            set { _numberOfConnectedUsers = value; }
        }

        public ServerStatus() { }
    }
}
