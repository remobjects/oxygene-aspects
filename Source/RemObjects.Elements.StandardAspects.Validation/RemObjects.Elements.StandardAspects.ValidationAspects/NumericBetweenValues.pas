namespace RemObjects.Elements.StandardAspects.Validation.Aspects;

interface

uses
  RemObjects.Oxygene.Cirrus.*,
  System.Collections.Generic,
  System.Linq,
  System.Text;

type

  [AttributeUsage(AttributeTargets.Property)]
  NumericBetweenValuesAttribute<T> = public class(ValidateBaseAttribute,IPropertyInterfaceDecorator, IPropertyImplementationDecorator)
  private

  protected
    method ErrorMessage (aProperty: RemObjects.Oxygene.Cirrus.IPropertyDefinition): String;


  public
    method HandleInterface(Services: RemObjects.Oxygene.Cirrus.IServices; aProperty: RemObjects.Oxygene.Cirrus.IPropertyDefinition);
    method HandleImplementation(Services: RemObjects.Oxygene.Cirrus.IServices; aProperty: RemObjects.Oxygene.Cirrus.IPropertyDefinition; aRead: RemObjects.Oxygene.Cirrus.IMethodDefinition; aWrite: RemObjects.Oxygene.Cirrus.IMethodDefinition);

    constructor (bottomValue:T; topValue:T; message:String);

    property BottomValue:T;
    property TopValue:T;

  end;

  Int32BetweenValuesAttribute = public class(NumericBetweenValuesAttribute<Int32>)

  private
  public

  end;

  Int64BetweenValuesAttribute = public class(NumericBetweenValuesAttribute<Int64>)

  private
  public

  end;

  DoubleBetweenValuesAttribute = public class(NumericBetweenValuesAttribute<System.Double>)
  private
  public

  end;


implementation


method NumericBetweenValuesAttribute<T>.HandleInterface(Services: RemObjects.Oxygene.Cirrus.IServices; aProperty: RemObjects.Oxygene.Cirrus.IPropertyDefinition);
begin

  // validation failure
  var ruleViolationType := Services.GetType(RuleViolationType);

  var newRuleViolation := new NewValue(ruleViolationType, [new DataValue(ErrorMessage(aProperty)),new DataValue(aProperty.Name)]);

  var yieldInstance := new YieldStatement(newRuleViolation);

  if((not assigned(aProperty.ReadExpression)) and (aProperty.ImplicitField))then
  begin
    aProperty.CreateImplicitField;
  end;

  var readValue := new ProcValue(new SelfValue, 'get_'+aProperty.Name);

  var lessThanBinaryValue := new BinaryValue(readValue, new DataValue(self.BottomValue), BinaryOperator.Less);


  var greaterThanBinaryValue := new BinaryValue(readValue, new DataValue(self.TopValue), BinaryOperator.Greater);

  var failedValidationIf := new IfStatement(
                      new BinaryValue(lessThanBinaryValue, greaterThanBinaryValue,BinaryOperator.Or),
                      yieldInstance);



  self.AddStatementForRuleViolation(aProperty.Owner.Fullname, failedValidationIf);


end;

method NumericBetweenValuesAttribute<T>.HandleImplementation(Services: RemObjects.Oxygene.Cirrus.IServices; aProperty: RemObjects.Oxygene.Cirrus.IPropertyDefinition; aRead: RemObjects.Oxygene.Cirrus.IMethodDefinition; aWrite: RemObjects.Oxygene.Cirrus.IMethodDefinition);
begin

  var methods:Array of IMethod := aProperty.Owner.GetMethods('get_Item');

  if(methods.length>0)then
  begin
    var getter := methods[0];

    var itemValidationValue := (getter as IMethodDefinition).GetLocal(ValidationAttribute.itemValidationValueName);

    var compareProc := new ProcValue(new TypeValue(Services.FindType('System.String')), 'Compare', 
      [new DataValue(aProperty.Name), new ParamValue(0)]);


    var readValue := new ProcValue(new SelfValue, 'get_'+aProperty.Name);


    var failedValidationIf := new IfStatement(
          new BinaryValue(new BinaryValue(compareProc, new DataValue(0), BinaryOperator.Equal),
                      new BinaryValue(new BinaryValue(readValue, new DataValue(self.BottomValue), BinaryOperator.Less),
                      new BinaryValue(readValue, new DataValue(self.TopValue), BinaryOperator.Greater),BinaryOperator.Or), BinaryOperator.And),
                      new AssignmentStatement(itemValidationValue, new DataValue(self.ErrorMessage(aProperty))));


    (getter as IMethodDefinition).SetBody( Services, method
    begin
      unquote(failedValidationIf);
      Aspects.OriginalBody;
    end);

  end;

end;


constructor NumericBetweenValuesAttribute<T>(bottomValue:T; topValue:T; message:String);
begin
  inherited constructor (message);

  self.BottomValue := bottomValue;
  self.TopValue := topValue;

end;

method NumericBetweenValuesAttribute<T>.ErrorMessage (aProperty: RemObjects.Oxygene.Cirrus.IPropertyDefinition): String;
begin
  self.Message := '{0} must fall between {1} and {2}';
  exit BuildErrorMessage(aProperty.Name, self.BottomValue, self.TopValue);
end;


end.
