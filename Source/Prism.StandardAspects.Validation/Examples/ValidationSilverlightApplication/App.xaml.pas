namespace ValidationSilverlightApplication;

interface

uses
  System,
  System.Collections.Generic,
  System.Linq,
  System.Windows,
  System.Windows.Controls,
  System.Windows.Documents,
  System.Windows.Ink,
  System.Windows.Input,
  System.Windows.Media,
  System.Windows.Media.Animation,
  System.Windows.Shapes;

type
  App = public partial class(System.Windows.Application)
  private
    method ReportErrorToDOM(e: ApplicationUnhandledExceptionEventArgs);
    method Application_Startup(sender: object; e: StartupEventArgs);
    method Application_Exit(sender: object; e: EventArgs);
    method Application_UnhandledException(sender: object; e: ApplicationUnhandledExceptionEventArgs);
  public
    constructor;
  end;
  
implementation

constructor App; 
begin
  self.Startup += self.Application_Startup;
  self.Exit += self.Application_Exit;
  self.UnhandledException += self.Application_UnhandledException;

  InitializeComponent();
end;

method App.Application_Startup(sender: object; e: StartupEventArgs);
begin
  // Load the main control
  self.RootVisual := new MainPage();
end;

method App.Application_Exit(sender: object; e: EventArgs);
begin

end;

method App.Application_UnhandledException(sender: object; e: ApplicationUnhandledExceptionEventArgs);
begin
  if not System.Diagnostics.Debugger.IsAttached then begin
    // NOTE: This will allow the application to continue running after an exception has been thrown
    // but not handled. 
    // For production applications this error handling should be replaced with something that will 
    // report the error to the website and stop the application.
    e.Handled := true;
		Deployment.Current.Dispatcher.BeginInvoke(method begin 
        ReportErrorToDOM(e);
      end);
  end;
end;

method App.ReportErrorToDOM(e: ApplicationUnhandledExceptionEventArgs);
begin
  try
    var errorMsg := e.ExceptionObject.Message + e.ExceptionObject.StackTrace;
    errorMsg := errorMsg.Replace('"', '\"').Replace(#13#10, '\n');

    System.Windows.Browser.HtmlPage.Window.Eval('throw new Error("Unhandled Error in Silverlight Application " + errorMsg + "\");');
  except
  end;
end;


end.