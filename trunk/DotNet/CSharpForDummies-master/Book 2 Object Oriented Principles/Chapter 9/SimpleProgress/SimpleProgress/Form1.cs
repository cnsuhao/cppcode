using System;
using System.Windows.Forms;  // For the graphical stuff.

namespace SimpleProgress
{
  public partial class Form1 : Form
  {
    // Declare the delegate. This one is void.
    delegate void UpdateProgressCallback();

    // Stuff that Windows requires.
    public Form1()
    {
      InitializeComponent();
    }

    // DoSomethingLengthy - Our work-horse method that takes a delegate.
    private void DoSomethingLengthy(UpdateProgressCallback updateProgress)
    {
      int duration = 2000;
      int updateInterval = duration / 10;
      for (int i = 0; i < duration; i++)
      {
        Console.WriteLine("Something or other");
        // Update every tenth of the duration.
        // Make sure the delegate passed in is not null.
        if ((i % updateInterval) == 0 && updateProgress != null)
        {
          updateProgress();  // Invoke the delegate instance passed in.
        }
      }
    }

    // DoUpdate - Our callback method.
    private void DoUpdate()
    {
      progressBar1.PerformStep();
    }

    // Button-click handlers. 

    // This one is for the "Click to Start" button.
    private void button1_Click(object sender, EventArgs e)
    {
      // If using a raw delegate, instantiate the delegate, telling it what method to call.
      // If you use a lambda expression (Ch 16), you don't need the delegate instantiation.
      // You could also use an anonymous method in DoSomethingLengthy() - see next section.
      UpdateProgressCallback callback = new UpdateProgressCallback(this.DoUpdate);

      // Do something that needs periodic progress reports.
      // This passes a delegate instance that knows how to update the bar.
      DoSomethingLengthy(callback);
      // Clear the bar so it can be used again.
      progressBar1.Value = 0;
    }

    // This one is for the "Close" button.
    private void button2_Click(object sender, EventArgs e)
    {
      this.Close();
    }
  }
}
