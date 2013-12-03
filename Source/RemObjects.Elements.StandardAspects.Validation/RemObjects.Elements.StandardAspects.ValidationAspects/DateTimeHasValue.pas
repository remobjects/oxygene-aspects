namespace RemObjects.Elements.StandardAspects.Validation.Aspects;

interface

uses
  RemObjects.Oxygene.Cirrus.*,
  System.Collections.Generic,
  System.Linq,
  System.Text;

type

  DateTimeHasValueAttribute = public class(ValidateBaseAttribute,IPropertyInterfaceDecorator,IPropertyImplementationDecorator)
  private

  protected

  public

    method HandleInterface(Services: RemObjects.Oxygene.Cirrus.IServices; aProperty: RemObjects.Oxygene.Cirrus.IPropertyDefinition);
    method HandleImplementation(Services: RemObjects.Oxygene.Cirrus.IServices; aProperty: RemObjects.Oxygene.Cirrus.IPropertyDefinition; aRead: RemObjects.Oxygene.Cirrus.IMethodDefinition; aWrite: RemObjects.Oxygene.Cirrus.IMethodDefinition);

  end;

implementation

method DateTimeHasValueAttribute.HandleInterface(Services: RemObjects.Oxygene.Cirrus.IServices; aProperty: RemObjects.Oxygene.Cirrus.IPropertyDefinition);
begin
  var ruleViolationType := Services.GetType(RuleViolationType);

  var newRuleViolation := new NewValue(ruleViolationType, [new DataValue(self.BuildErrorMessage(aProperty.Name)),new DataValue(aProperty.Name)]);

  var dateTimeType:=Services.FindType('System.DateTime');

  var minValue := new StaticValue(dateTimeType, 'MinValue');


  if((aProperty.ImplicitField) and (not assigned(aProperty.ReadExpression)))then
  begin
    aProperty.CreateImplicitField;
  end;

  var readValue : Value := new ProcValue(new SelfValue(), 'get_'+aProperty.Name);

  var compareProc:= new ProcValue(new TypeValue(dateTimeType), 
    'Compare', [readValue,minValue]);

  var yieldInstance := new YieldStatement(newRuleViolation);

  var stringIfStatement := new IfStatement(new BinaryValue(compareProc, new DataValue(0), BinaryOperator.Equal) , yieldInstance );

  self.AddStatementForRuleViolation(aProperty.Owner.Fullname, stringIfStatement);

end;

method DateTimeHasValueAttribute.HandleImplementation(Services: RemObjects.Oxygene.Cirrus.IServices; aProperty: RemObjects.Oxygene.Cirrus.IPropertyDefinition; aRead: RemObjects.Oxygene.Cirrus.IMethodDefinition; aWrite: RemObjects.Oxygene.Cirrus.IMethodDefinition);
begin

  var methods:Array of IMethod := aProperty.Owner.GetMethods('get_Item');

  if(methods.length>0)then
  begin
    var getter := methods[0];

    var itemValidationValue := (getter as IMethodDefinition).GetLocal(ValidationAttribute.itemValidationValueName);

    var dateTimeType:=Services.FindType('System.DateTime');

    var minValue := new StaticValue(dateTimeType, 'MinValue');

    var readValue : Value := new ProcValue(new SelfValue(), 'get_'+aProperty.Name);

    var compareProc:= new ProcValue(new TypeValue(dateTimeType), 
      'Compare', [readValue,minValue]);


    var dateTimeBinaryValue := new BinaryValue(compareProc, new DataValue(0), BinaryOperator.Equal);


    var stringCompareProc := new ProcValue(new TypeValue(Services.FindType('System.String')), 'Compare', 
      [new DataValue(aProperty.Name), new ParamValue(0)]);


    var matchingPropertyAndDateTimeCompare := new BinaryValue(new BinaryValue(stringCompareProc, new DataValue(0), BinaryOperator.Equal),
            dateTimeBinaryValue,
            BinaryOperator.And);


    var ifStatement := new IfStatement(matchingPropertyAndDateTimeCompare, new AssignmentStatement(itemValidationValue, new DataValue(self.BuildErrorMessage(aProperty.Name)))); 

    (getter as IMethodDefinition).SetBody( Services, method
    begin
      unquote(ifStatement);
      Aspects.OriginalBody;
    end);

  end;

end;

end.
