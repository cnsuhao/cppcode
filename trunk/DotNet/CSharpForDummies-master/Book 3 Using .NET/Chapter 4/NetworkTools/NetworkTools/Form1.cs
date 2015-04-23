using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Windows.Forms;
using System.IO;
using System.Net;
using System.Net.NetworkInformation;

namespace NetworkTools
{
    public partial class Form1 : Form
    {
        public Form1()
        {
            InitializeComponent();
        }

        private void Form1_Load(object sender, EventArgs e)
        {
            if (NetworkInterface.GetIsNetworkAvailable())
            {
                toolStripStatusLabel1.Text = "Connected";
            }
            else
            {
                toolStripStatusLabel1.Text = "Disconnected";
            }

        }

        private void button1_Click(object sender, EventArgs e)
        {
            DownLoadFile(@"ftp://ftp.csharpfordummies.net/sampleFile.bmp", @"c:\sampleFile.bmp");
        }
        private void DownLoadFile(string remoteFile, string localFile)
        {
            FileStream localFileStream = new FileStream(localFile, FileMode.OpenOrCreate);
            FtpWebRequest ftpRequest = (FtpWebRequest)WebRequest.Create(remoteFile);
            ftpRequest.Method = WebRequestMethods.Ftp.DownloadFile;
            ftpRequest.Credentials = new NetworkCredential("Anonymous", "bill@sempf.net");
            //WebRequest webRequest = WebRequest.Create(remoteFile);
            //webRequest.Method = WebRequestMethods.Http.Get;
            //WebResponse webResponse = webRequest.GetResponse();
            WebResponse ftpResponse = ftpRequest.GetResponse();
            Stream ftpResponseStream = ftpResponse.GetResponseStream();
            byte[] buffer = new byte[1024];
            int bytesRead = ftpResponseStream.Read(buffer, 0, 1024);
            while (bytesRead > 0)
            {
                localFileStream.Write(buffer, 0, bytesRead);
                bytesRead = ftpResponseStream.Read(buffer, 0, 1024);
            }
            localFileStream.Close();
            ftpResponseStream.Close();
        }

    }
}
