using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Windows.Forms;

namespace CribbageBoard
{
    public partial class CribbageBoard : Form
    {
        private int BillsLastTotal;
        private int GabriellesLastTotal;

        public CribbageBoard()
        {
            InitializeComponent();
        }

        private void CribbageBoard_Load(object sender, EventArgs e)
        {
            WinMessage.Text = "";
            PaintBoard(ref BillsPoints, ref GabriellesPoints);
        }

        private void HandleScore(TextBox scoreBox, Label points, Label otherPlayer)
        {
            try
            {
                if (0 > int.Parse(scoreBox.Text) | int.Parse(scoreBox.Text) > 27)
                {
                    ScoreCheck.SetError(scoreBox, "Score must be between 0 and 27");
                    scoreBox.Focus();
                }
                else
                {
                    ScoreCheck.SetError(scoreBox, "");
                    //Add the score written to the points
                    points.Text = (int.Parse(points.Text) + int.Parse(scoreBox.Text)).ToString();
                }
            }
            catch (System.InvalidCastException ext)
            {
                //Something other than a number
                if (scoreBox.Text.Length > 0)
                {
                    ScoreCheck.SetError(scoreBox, "Score must be a number");
                }
            }
            catch (Exception ex)
            {
                //Eek!
                MessageBox.Show("Something went wrong!  " + ex.Message);
            }
            //Check the score
            if (int.Parse(points.Text) > 120)
            {
                if (int.Parse(points.Text) / int.Parse(otherPlayer.Text) > 1.5)
                {
                    WinMessage.Text = scoreBox.Name.Substring(0, scoreBox.Name.Length - 6) + " Skunked 'em!!!";
                }
                else
                {
                    WinMessage.Text = scoreBox.Name.Substring(0, scoreBox.Name.Length - 6) + " Won!!";
                }
                WinMessage.Visible = true;
            }
        }
        private void CribbageBoard_Paint(object sender, PaintEventArgs e)
        {
            PaintBoard(ref BillsPoints, ref GabriellesPoints);
        }
        private void PaintBoard(ref Label Bill, ref Label Gabrielle)
        {
            Graphics palette = this.CreateGraphics();
            SolidBrush brownBrush = new SolidBrush(Color.Brown);
            palette.FillRectangle(brownBrush, new Rectangle(20, 20, 820, 180));
            //OK, now I need to paint the little holes.
            //There are 244 little holes in the board.
            //Three rows of 40 times two, with the little starts and stops on either end.
            //Let's start with the 240.
            int rows = 0;
            int columns = 0;
            int scoreBeingDrawn = 0;
            Pen blackPen = new Pen(System.Drawing.Color.Black, 1);
            SolidBrush blackBrush = new SolidBrush(Color.Black);
            SolidBrush redBrush = new SolidBrush(Color.Red);

            //There are 6 rows, then, at 24 and 40, 80 and 100, then 140 and 160.
            for (rows = 40; rows <= 160; rows += 60)
            {
                //There are 40 columns. They are every 20
                for (columns = 40; columns <= 820; columns += 20)
                {
                    //Calculate score being drawn
                    scoreBeingDrawn = ((columns - 20) / 20) + ((((rows + 20) / 60) - 1) * 40);
                    //Draw Bill
                    //If score being drawn = bill fill, otherwise draw
                    if (scoreBeingDrawn == int.Parse(Bill.Text))
                    {
                        palette.FillEllipse(blackBrush, columns - 2, rows - 2, 6, 6);
                    }
                    else if (scoreBeingDrawn == BillsLastTotal)
                    {
                        palette.FillEllipse(redBrush, columns - 2, rows - 2, 6, 6);
                    }
                    else
                    {
                        palette.DrawEllipse(blackPen, columns - 2, rows - 2, 4, 4);
                    }
                    //Draw Gabrielle
                    //If score being drawn = Gabrielle fill, otherwise draw
                    if (scoreBeingDrawn == int.Parse(Gabrielle.Text))
                    {
                        palette.FillEllipse(blackBrush, columns - 2, rows + 16, 6, 6);
                    }
                    else if (scoreBeingDrawn == GabriellesLastTotal)
                    {
                        palette.FillEllipse(redBrush, columns - 2, rows + 16, 6, 6);
                    }
                    else
                    {
                        palette.DrawEllipse(blackPen, columns - 2, rows + 16, 4, 4);
                    }
                }
            }
            palette.Dispose();
            brownBrush.Dispose();
            blackPen.Dispose();
        }

        private void BillPoints_TextChanged(object sender, EventArgs e)
        {
            HandleScore(BillPoints, BillsPoints, GabriellesPoints);
            BillsLastTotal = int.Parse(BillPoints.Text);
        }

        private void GabriellePoints_TextChanged(object sender, EventArgs e)
        {
            HandleScore(GabriellePoints, GabriellesPoints, BillsPoints);
            GabriellesLastTotal = int.Parse(GabriellePoints.Text);
        }
    }
}
