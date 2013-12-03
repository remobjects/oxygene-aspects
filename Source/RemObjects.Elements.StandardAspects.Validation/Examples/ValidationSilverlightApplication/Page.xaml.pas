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
  MainPage = public partial class(System.Windows.Controls.UserControl)
  private
    employee: ValidationDomain.Employee;

    method button1_Click(sender: System.Object; e: System.Windows.RoutedEventArgs);

  public
    constructor;
  end;
  
implementation

constructor MainPage; 
begin
  InitializeComponent();

  employee := new ValidationDomain.Employee ( Id := 1, Firstname := 'John', Lastname := 'Moshakis', BirthDate := new DateTime(1970, 02,18));


  self.DataContext := employee;

end;

method MainPage.button1_Click(sender: System.Object; e: System.Windows.RoutedEventArgs);
begin

  if(employee.IsValid)then
  begin
    MessageBox.Show('Employee is valid !!!');
  end
  else
  begin
    using errorPage := new Page1 do
    begin
      errorPage.dataGrid1.ItemsSource := self.employee.GetRuleViolations;
      errorPage.Show;
    end;
  end;

end;

end.