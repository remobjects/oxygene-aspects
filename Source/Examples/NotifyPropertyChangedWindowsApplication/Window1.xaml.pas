namespace NotifyPropertyChangedWindowsApplication;

interface

uses
  NotifyPropertyChangedWindowsApplication.Domain,
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
  Window1 = public partial class(System.Windows.Window)
  private
    anEmployee:Employee;

  protected
    method ChangeAge_Click(sender: System.Object; e: System.Windows.RoutedEventArgs);
    method ShowAge_Click(sender: System.Object; e: System.Windows.RoutedEventArgs);

  public
    constructor;
  end;
  
implementation

constructor Window1;
begin
  InitializeComponent();

  anEmployee:= new Employee( Id:=1, FirstName:='John', LastName:= 'Smith', Age:= 45 );

  self.DataContext:=anEmployee;
end;

method Window1.ChangeAge_Click(sender: System.Object; e: System.Windows.RoutedEventArgs);
begin
  var age:Integer;

  if(Int32.TryParse(self.NewAge.Text, out age))then
  begin
    self.anEmployee.Age:=age;
  end;
end;

method Window1.ShowAge_Click(sender: System.Object; e: System.Windows.RoutedEventArgs);
begin
  MessageBox.Show(String.Format('Firstname {0} Lastname {1} Age {2}',self.anEmployee.Firstname,self.anEmployee.Lastname,self.anEmployee.Age));    
end;
  
end.