// NewspaperEvents - Demonstrate using an event to notify multiple
//    subscribing objects when there's an interesting occurrence.
//    This example calls its classes Publisher and Subscriber, but
//    you can make any class a publisher and any class(es) the subscriber(s)
//    (including the class that contains Main(), as here).
using System;

namespace NewspaperEvents
{
  class Program
  {
    static void Main(string[] args)
    {
      Publisher dailyNoise = new Publisher();
      // Register a couple of subscribers.
      Subscriber joe = new Subscriber("Joe", "Ah, the paper's in my rose bush again!");
      joe.Subscribe(dailyNoise);
      Subscriber moe = new Subscriber("Moe", "Dang! Soggy paper again!");
      moe.Subscribe(dailyNoise);

      // Also subscribe from Main() itself.
      Console.WriteLine("Main() subscribes.");
      dailyNoise.NewEdition += DailyNoise_NewEdition;

      // Put out a new edition.
      dailyNoise.Publish(DateTime.Today, "Latest Celebrity Arrest!");

      // Unsubscribe joe.
      joe.UnSubscribe(dailyNoise);

      // Put out another edition.
      dailyNoise.Publish(new DateTime(2008, 1, 22), "Perp Walks!");

      // Unsubscribe moe.
      moe.UnSubscribe(dailyNoise);

      // Put out another edition.
      dailyNoise.Publish(new DateTime(4008, 1, 22), "Busted again?!?");

      Console.WriteLine("Main() unsubscribes.");
      dailyNoise.NewEdition -= DailyNoise_NewEdition;

      // Wait for user to acknowledge results.
      Console.WriteLine("Press Enter to terminate...");
      Console.Read();
    }

    // Main()'s handler method for the NewEdition event.
    static void DailyNoise_NewEdition(object sender, EventArgs e)
    {
      // Cast sender if you need information from the sending object.
      Publisher pub = (Publisher)sender;
      // Cast e if you need additional arguments with the event.
      NewEditionEventArgs ne = (NewEditionEventArgs)e;
      Console.WriteLine("({0}) {1}: {2} - {3}", ne.PubDate, ne.Head, 
        pub.Name, "Ah, the paper's on my roof again!");
    }
  }

  // Publisher - A class (not necessarily with this name) that needs to
  //    alert subscribers when some interesting event occurs.
  class Publisher
  {
    // Here's the event declaration.
    public event EventHandler<NewEditionEventArgs> NewEdition;

    // OnNewEdition - This method takes the correct steps to
    //    safely raise the NewEdition event.
    //    Note: Always provide an OnXXX event raiser method.
    protected virtual void OnNewEdition(NewEditionEventArgs e)
    {
      // Save a copy (for safety in multithreaded programs).
      EventHandler<NewEditionEventArgs> temp = NewEdition;
      // Make sure there are subscribers to the event.
      if (temp != null)
      {
        // Actually raise the event.
        // 'this' is the Publisher object.
        temp(this, e);
      }
    }

    // Publish - Put out a new edition of the DailyNoise.
    //    This causes the NewEdition event to be raised.
    public void Publish(DateTime date, string majorHeadline)
    {
      Console.WriteLine("Publication: {0}, {1}", date, majorHeadline);
      // Set up the event arguments.
      NewEditionEventArgs e = new NewEditionEventArgs(date, majorHeadline);
      // Call our "event raiser" method.
      OnNewEdition(e);
    }

    public string Name { get { return "DailyNoise"; } }
  }

  // NewEditionEventArgs - A custom subclass of EventArgs designed to
  //    carry useful information about NewEdition events.
  class NewEditionEventArgs : EventArgs
  {
    // Good to provide this constructor.
    public NewEditionEventArgs(DateTime date, string majorHeadline)
    {
      PubDate = date;
      Head = majorHeadline;
    }
    // See Chapter 12 for this shorthand property notation.
    // Only class NewEditionEventArgs can set these properties.
    public DateTime PubDate { get; private set; }
    public string Head { get; private set; }
  }

  // Subscriber - Some class (not necessarily with this name) that wants to
  //    be notified of the NewEdition event.
  class Subscriber
  {
    public Subscriber(string name, string gripe)
    {
      Name = name;
      Gripe = gripe;
    }

    // Subscribe - Call this method to add this Subscriber to the list of
    //    subscribers to the NewEdition event.
    public void Subscribe(Publisher p)
    {
      Console.WriteLine("{0} subscribes.", Name);
      p.NewEdition += new EventHandler<NewEditionEventArgs>(this.NewEditionPublished);
    }

    // UnSubscribe - Call this method to remove this Subscriber from the list of
    //    subscribers to the NewEdition event.
    public void UnSubscribe(Publisher p)
    {
      Console.WriteLine("{0} unsubscribes.", Name);
      // Note: instead of 'new EventHandler<NewEditionEventArgs>(this.NewEditionPublished)', 
      // you can use this shorthand form: just give the method name. Compare to Subscribe().
      // (You can even put a lambda expression here: see Chapter 16 on lambda expressions.)
      p.NewEdition -= this.NewEditionPublished;   
    }

    // NewEditionPublished - Handler method for the NewEdition event.
    //    Note that the method matches the event's signature.
    void NewEditionPublished(object sender, EventArgs e)
    {
      // Must cast e to get at its contents.
      NewEditionEventArgs ne = (NewEditionEventArgs)e;
      Console.WriteLine("({0}) {1}: {2} - {3}", ne.PubDate, ne.Head, 
        Name, Gripe);
    }

    // See Chapter 12 for this shorthand property notation.
    public string Name { get; private set; }
    public string Gripe { get; private set; }
  }
}
