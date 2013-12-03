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
  Window1 = public partial class(System.Windows.Window)
  private
    fEmployee:ValidationDomain.Employee;
    method button1_Click(sender: System.Object; e: System.Windows.RoutedEventArgs);
  public
    constructor;
  end;
  
implementation

constructor Window1;
begin
  InitializeComponent();

  fEmployee := new ValidationDomain.Employee ( Id := 1, Firstname := 'John', Lastname := 'Moshakis', BirthDate := new DateTime(1970, 02,18));
  self.DataContext := fEmployee;
end;
  
method Window1.button1_Click(sender: System.Object; e: System.Windows.RoutedEventArgs);
begin
  if(fEmployee.IsValid)then
  begin
    MessageBox.Show('Employee is valid !!!');
  end
  else
  begin
    using errors := new Window2 do
    begin
      errors.ErrorList.ItemsSource := fEmployee.GetRuleViolations;
      errors.ShowDialog;
    end;
  end;
  
end;

end.
