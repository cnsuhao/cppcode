namespace Apress.VisualCSharpRecipes.Chapter08
{
    partial class Recipe08_08
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
            this.SuspendLayout();
            // 
            // Recipe08_08
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(299, 273);
            this.Name = "Recipe08_08";
            this.Text = "Thumbnails";
            this.Paint += new System.Windows.Forms.PaintEventHandler(this.Recipe08_08_Paint);
            this.Load += new System.EventHandler(this.Recipe08_08_Load);
            this.ResumeLayout(false);

        }

        #endregion
    }
}

