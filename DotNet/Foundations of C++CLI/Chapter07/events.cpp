// events.cpp
using namespace System;
using namespace System::Threading;

ref class Events
{
   public:
      event EventHandler^ Start;

      event EventHandler^ Exit;

      // Function calls to raise the events from outside the class.
      void RaiseStartEvent()
      {
          Start(this, gcnew EventArgs());
      }

      void RaiseExitEvent()
      {
          Exit(this, gcnew EventArgs());
      }
};

ref class Receiver
{
public:
      // event handler for Start event
      void OnStart(Object^ sender, EventArgs^ args)
      {
         Console::WriteLine("Starting");
      }

      // event handler for Exit event
      void OnExit(Object^ sender, EventArgs^ args)
      {
          Console::WriteLine("Exiting");
      }
};

void f(Events^ e)
{
   // raise event for starting this function
   e->RaiseStartEvent();

   Console::WriteLine("Doing something.");

   // raise event for exiting this function
   e->RaiseExitEvent();
}

int main()
{

    Events^ events = gcnew Events();
    Receiver^ receiver = gcnew Receiver();
    // add the event handlers for Start and Exit
    events->Start += gcnew EventHandler(receiver, &Receiver::OnStart);
    events->Exit += gcnew EventHandler(receiver, &Receiver::OnExit);

    f(events);

    // remove the event handlers
    events->Start -= gcnew EventHandler(receiver, &Receiver::OnStart);
    events->Exit -= gcnew EventHandler(receiver, &Receiver::OnExit);
}
