namespace CribbageBoard
{
    partial class CribbageBoard
    {
        /// <summary>
        /// Required designer variable.
        /// </summary>
        private System.ComponentModel.IContainer components = null;

        /// <summary>
        /// Clean up any resources being used.
        /// </summary>
        /// <param name="disposing">true if managed resources should be disposed; otherwise, false.</param>
        protected override void Dispose(bool disposing)
        {
            if (disposing && (components != null))
            {
                components.Dispose();
            }
            base.Dispose(disposing);
        }

        #region Windows Form Designer generated code

        /// <summary>
        /// Required method for Designer support - do not modify
        /// the contents of this method with the code editor.
        /// </summary>
        private void InitializeComponent()
        {
            this.components = new System.ComponentModel.Container();
            this.PlayerOne = new System.Windows.Forms.Label();
            this.BillsPoints = new System.Windows.Forms.Label();
            this.BillPoints = new System.Windows.Forms.TextBox();
            this.GabriellePoints = new System.Windows.Forms.TextBox();
            this.label3 = new System.Windows.Forms.Label();
            this.GabriellesPoints = new System.Windows.Forms.Label();
            this.WinMessage = new System.Windows.Forms.Label();
            this.StartNewGame = new System.Windows.Forms.LinkLabel();
            this.ScoreCheck = new System.Windows.Forms.ErrorProvider(this.components);
            ((System.ComponentModel.ISupportInitialize)(this.ScoreCheck)).BeginInit();
            this.SuspendLayout();
            // 
            // PlayerOne
            // 
            this.PlayerOne.AutoSize = true;
            this.PlayerOne.Location = new System.Drawing.Point(36, 243);
            this.PlayerOne.Name = "PlayerOne";
            this.PlayerOne.Size = new System.Drawing.Size(20, 13);
            this.PlayerOne.TabIndex = 0;
            this.PlayerOne.Text = "Bill";
            // 
            // BillsPoints
            // 
            this.BillsPoints.AutoSize = true;
            this.BillsPoints.Location = new System.Drawing.Point(123, 243);
            this.BillsPoints.Name = "BillsPoints";
            this.BillsPoints.Size = new System.Drawing.Size(13, 13);
            this.BillsPoints.TabIndex = 1;
            this.BillsPoints.Text = "0";
            // 
            // BillPoints
            // 
            this.BillPoints.Location = new System.Drawing.Point(39, 260);
            this.BillPoints.Name = "BillPoints";
            this.BillPoints.Size = new System.Drawing.Size(103, 20);
            this.BillPoints.TabIndex = 2;
            this.BillPoints.TextChanged += new System.EventHandler(this.BillPoints_TextChanged);
            // 
            // GabriellePoints
            // 
            this.GabriellePoints.Location = new System.Drawing.Point(708, 260);
            this.GabriellePoints.Name = "GabriellePoints";
            this.GabriellePoints.Size = new System.Drawing.Size(103, 20);
            this.GabriellePoints.TabIndex = 5;
            this.GabriellePoints.TextChanged += new System.EventHandler(this.GabriellePoints_TextChanged);
            // 
            // label3
            // 
            this.label3.AutoSize = true;
            this.label3.Location = new System.Drawing.Point(759, 243);
            this.label3.Name = "label3";
            this.label3.Size = new System.Drawing.Size(48, 13);
            this.label3.TabIndex = 4;
            this.label3.Text = "Gabrielle";
            // 
            // GabriellesPoints
            // 
            this.GabriellesPoints.AutoSize = true;
            this.GabriellesPoints.Location = new System.Drawing.Point(712, 243);
            this.GabriellesPoints.Name = "GabriellesPoints";
            this.GabriellesPoints.Size = new System.Drawing.Size(13, 13);
            this.GabriellesPoints.TabIndex = 3;
            this.GabriellesPoints.Text = "0";
            // 
            // WinMessage
            // 
            this.WinMessage.AutoSize = true;
            this.WinMessage.Location = new System.Drawing.Point(400, 243);
            this.WinMessage.Name = "WinMessage";
            this.WinMessage.Size = new System.Drawing.Size(76, 13);
            this.WinMessage.TabIndex = 6;
            this.WinMessage.Text = "SomeoneWins";
            // 
            // StartNewGame
            // 
            this.StartNewGame.AutoSize = true;
            this.StartNewGame.Location = new System.Drawing.Point(409, 267);
            this.StartNewGame.Name = "StartNewGame";
            this.StartNewGame.Size = new System.Drawing.Size(60, 13);
            this.StartNewGame.TabIndex = 7;
            this.StartNewGame.TabStop = true;
            this.StartNewGame.Text = "New Game";
            // 
            // ScoreCheck
            // 
            this.ScoreCheck.ContainerControl = this;
            // 
            // CribbageBoard
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(847, 306);
            this.Controls.Add(this.StartNewGame);
            this.Controls.Add(this.WinMessage);
            this.Controls.Add(this.GabriellePoints);
            this.Controls.Add(this.label3);
            this.Controls.Add(this.GabriellesPoints);
            this.Controls.Add(this.BillPoints);
            this.Controls.Add(this.BillsPoints);
            this.Controls.Add(this.PlayerOne);
            this.Name = "CribbageBoard";
            this.Text = "Sempf Cribbage";
            this.Paint += new System.Windows.Forms.PaintEventHandler(this.CribbageBoard_Paint);
            ((System.ComponentModel.ISupportInitialize)(this.ScoreCheck)).EndInit();
            this.ResumeLayout(false);
            this.PerformLayout();

        }

        #endregion

        private System.Windows.Forms.Label PlayerOne;
        private System.Windows.Forms.Label BillsPoints;
        private System.Windows.Forms.TextBox BillPoints;
        private System.Windows.Forms.TextBox GabriellePoints;
        private System.Windows.Forms.Label label3;
        private System.Windows.Forms.Label GabriellesPoints;
        private System.Windows.Forms.Label WinMessage;
        private System.Windows.Forms.LinkLabel StartNewGame;
        private System.Windows.Forms.ErrorProvider ScoreCheck;
    }
}

