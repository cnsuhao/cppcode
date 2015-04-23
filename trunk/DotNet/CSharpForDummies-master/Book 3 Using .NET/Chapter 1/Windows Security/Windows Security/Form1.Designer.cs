namespace Windows_Security
{
    partial class Form1
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
            this.SalesButton = new System.Windows.Forms.Button();
            this.AccountingButton = new System.Windows.Forms.Button();
            this.ManagerButton = new System.Windows.Forms.Button();
            this.SuspendLayout();
            // 
            // SalesButton
            // 
            this.SalesButton.Location = new System.Drawing.Point(80, 24);
            this.SalesButton.Name = "SalesButton";
            this.SalesButton.Size = new System.Drawing.Size(125, 23);
            this.SalesButton.TabIndex = 0;
            this.SalesButton.Text = "Sales";
            this.SalesButton.UseVisualStyleBackColor = true;
            this.SalesButton.Visible = false;
            // 
            // AccountingButton
            // 
            this.AccountingButton.Location = new System.Drawing.Point(80, 86);
            this.AccountingButton.Name = "AccountingButton";
            this.AccountingButton.Size = new System.Drawing.Size(125, 23);
            this.AccountingButton.TabIndex = 1;
            this.AccountingButton.Text = "Accounting";
            this.AccountingButton.UseVisualStyleBackColor = true;
            this.AccountingButton.Visible = false;
            // 
            // ManagerButton
            // 
            this.ManagerButton.Location = new System.Drawing.Point(80, 149);
            this.ManagerButton.Name = "ManagerButton";
            this.ManagerButton.Size = new System.Drawing.Size(125, 23);
            this.ManagerButton.TabIndex = 2;
            this.ManagerButton.Text = "Manager";
            this.ManagerButton.UseVisualStyleBackColor = true;
            this.ManagerButton.Visible = false;
            // 
            // Form1
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(284, 262);
            this.Controls.Add(this.ManagerButton);
            this.Controls.Add(this.AccountingButton);
            this.Controls.Add(this.SalesButton);
            this.Name = "Form1";
            this.Text = "Form1";
            this.Load += new System.EventHandler(this.Form1_Load);
            this.ResumeLayout(false);

        }

        #endregion

        private System.Windows.Forms.Button SalesButton;
        private System.Windows.Forms.Button AccountingButton;
        private System.Windows.Forms.Button ManagerButton;
    }
}

