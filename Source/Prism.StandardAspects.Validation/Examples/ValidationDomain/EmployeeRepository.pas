namespace ValidationDomain;

interface

uses
  System.Collections.Generic,
  System.Linq,
  System.Text;

type

  EmployeeRepository = public class
  private
    employees : List<Employee>;
  protected
  public
    constructor;

    method All:List<Employee>;
    method Get(Id:Integer):Employee;
  end;

implementation

constructor EmployeeRepository;
begin

  self.employees := new List<Employee>;

  self.employees.Add(new Employee( Id := 1, Firstname := 'Frank', Lastname := 'Jones'));
  self.employees.Add(new Employee( Id := 2, Firstname := 'William', Lastname := 'Albertson'));
  self.employees.Add(new Employee( Id := 3, Firstname := 'Peter', Lastname := 'Swiddle'));
  self.employees.Add(new Employee( Id := 4, Firstname := 'Eddie', Lastname := 'Williamson'));
  self.employees.Add(new Employee( Id := 5, Firstname := 'Paul', Lastname := 'Smith'));

end;

method EmployeeRepository.All: List<Employee>;
begin
  result:= self.employees;
end;

method EmployeeRepository.Get(Id:Integer): Employee;
begin
  var foundEmployee:Employee;

  for employee in self.employees do
  begin
    if employee.Id = Id then
    begin
      foundEmployee:=employee;
      break;
    end;
  end;

  result:=foundEmployee;
end;

end.
