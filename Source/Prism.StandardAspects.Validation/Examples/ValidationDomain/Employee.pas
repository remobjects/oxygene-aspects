namespace ValidationDomain;

interface


type

  [aspect:Prism.StandardAspects.Validation.Aspects.Validation]
  Employee=public class

  private
    method ValidateBirthDate:Boolean;

  public

    [aspect:Prism.StandardAspects.Validation.Aspects.NumericHasValue('An Id is Required')]
    property Id:Integer;
    [aspect:Prism.StandardAspects.Validation.Aspects.StringNullOrEmpty()]
    property Firstname:String;
    [aspect:Prism.StandardAspects.Validation.Aspects.StringNullOrEmpty('You must fill in the employees lastname')]
    property Lastname:String;
    [aspect:Prism.StandardAspects.Validation.Aspects.ValidationMethodForProperty('ValidateBirthDate','The date of birth must be valid')]
    property BirthDate:DateTime;

    property Salary:Decimal;

    [aspect:Prism.StandardAspects.Validation.Aspects.Int32BetweenValues(5,10,'Must been between ranges')]
    property SomeNumber:Int32;

    [aspect:Prism.StandardAspects.Validation.Aspects.ValidationMethod('We are not paying this employee')]
    method IsSalaryValid():Boolean;

    [aspect:Prism.StandardAspects.Validation.Aspects.DoubleBetweenValues(5.5, 5.9,'Must been between ranges')]
    property SomeDoubleNumber:Double;

    [aspect:Prism.StandardAspects.Validation.Aspects.Int64BetweenValues(100,200,'Must been between ranges')]
    property SomeInt64Number:Int64;
  end;

implementation


method Employee.IsSalaryValid(): Boolean;
begin
  var value:decimal := 5.5;
  result := (Salary > 0);
end;

method Employee.ValidateBirthDate: Boolean;
begin
  result:= (DateTime.Compare(self.BirthDate, new DateTime(1970, 1,1))>0);
end;


end.
