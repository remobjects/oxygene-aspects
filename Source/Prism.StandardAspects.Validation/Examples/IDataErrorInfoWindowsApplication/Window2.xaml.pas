namespace IDataErrorInfoWindowsApplication;

interface

uses
  System.Collections.Generic,
  System.Linq,
  System.Windows,
  System.Windows.Controls,
  System.Windows.Data,
  System.Windows.Documents,
  System.Windows.Media,
  System.Windows.Navigation,
  System.Windows.Shapes;

type
  Window2 = public partial class(Window)
  private
    method button1_Click(sender: System.Object; e: System.Windows.RoutedEventArgs);
  public
    constructor;
  end;
  
implementation

constructor Window2;
begin
  InitializeComponent();
end;
  
method Window2.button1_Click(sender: System.Object; e: System.Windows.RoutedEventArgs);
begin
  
end;

end.
