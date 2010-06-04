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

  Page1 = public partial class(ChildWindow)
  public
    constructor;
  private
    method button1_Click(sender: System.Object; e: System.Windows.RoutedEventArgs);

  end;
  
implementation

constructor Page1;
begin
  InitializeComponent();
end;

method Page1.button1_Click(sender: System.Object; e: System.Windows.RoutedEventArgs);
begin
  self.DialogResult := true;
end;

end.