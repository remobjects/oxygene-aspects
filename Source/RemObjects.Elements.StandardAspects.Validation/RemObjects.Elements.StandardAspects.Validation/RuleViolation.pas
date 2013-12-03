namespace RemObjects.Elements.StandardAspects.Validation;

interface

uses
  System.Collections.Generic,
  System.Linq,
  System.Text;

type

  RuleViolation = public class
  public

    constructor (errorMessage:String);
    constructor (errorMessage:String; propertyName:String);

    property ErrorMessage:String read private write;
    property PropertyName:String read private write;


  end;
  
implementation

constructor RuleViolation(errorMessage:String);
begin
  self.ErrorMessage:=errorMessage;
end;

constructor RuleViolation(errorMessage:String; propertyName:String);
begin
  self.ErrorMessage:=errorMessage;
  self.PropertyName:=propertyName;
end;

end.