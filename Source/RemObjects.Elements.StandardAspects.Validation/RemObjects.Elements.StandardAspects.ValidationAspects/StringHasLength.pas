namespace RemObjects.Elements.StandardAspects.Validation.Aspects;

interface

uses
  RemObjects.Oxygene.Cirrus.*,
  System.Collections.Generic,
  System.Linq,
  System.Text;

type

  [AttributeUsage(AttributeTargets.Property)]
  StringHasLengthAttribute = public class(ValidateBaseAttribute,IPropertyInterfaceDecorator,IPropertyImplementationDecorator)
  private
  protected
    method ErrorMessage (aProperty: RemObjects.Oxygene.Cirrus.IPropertyDefinition):String;
  public
    method HandleInterface(Services: RemObjects.Oxygene.Cirrus.IServices; aProperty: RemObjects.Oxygene.Cirrus.IPropertyDefinition);
    method HandleImplementation(Services: RemObjects.Oxygene.Cirrus.IServices; aProperty: RemObjects.Oxygene.Cirrus.IPropertyDefinition; aRead: RemObjects.Oxygene.Cirrus.IMethodDefinition; aWrite: RemObjects.Oxygene.Cirrus.IMethodDefinition);

    constructor (message:String; min:Integer; max:Integer);
    constructor (message:String; max:Integer);

    property min:Integer;
    property max:Integer;
  end;

implementation

method StringHasLengthAttribute.HandleInterface(Services: RemObjects.Oxygene.Cirrus.IServices; aProperty: RemObjects.Oxygene.Cirrus.IPropertyDefinition);
begin
  var ruleViolationType := Services.GetType(RuleViolationType);


  var newRuleViolation := new NewValue(ruleViolationType, [new DataValue(ErrorMessage(aProperty)),new DataValue(aProperty.Name)]);

  
  var stringType:=Services.FindType('System.String');

  if((aProperty.ImplicitField) and (not assigned(aProperty.ReadExpression)))then
  begin
    aProperty.CreateImplicitField;
  end;

  var readValue := new ProcValue(new SelfValue, 'get_'+aProperty.Name);

  if(not assigned(readValue))then
  begin
    Services.EmitError('ReadExpression is not assigned');
  end;

  var lengthProc := new ProcValue(readValue, 'get_Length',[]);

  var yieldInstance := new YieldStatement(newRuleViolation);

  var stringIfStatement:IfStatement;
  
  if(min>0)then
  begin
    stringIfStatement := new IfStatement(
                      new BinaryValue(
        new BinaryValue(new ProcValue(new TypeValue(Services.FindType('System.String')), 'IsNullOrEmpty', [readValue]),new DataValue(false), BinaryOperator.Equal),
        new BinaryValue(new BinaryValue(lengthProc, new DataValue(min), BinaryOperator.LessEqual),new BinaryValue(lengthProc, new DataValue(max), BinaryOperator.GreaterEqual), BinaryOperator.Or), BinaryOperator.And),

        yieldInstance );

  end
  else
  begin
    stringIfStatement := new IfStatement(
                      new BinaryValue(
                        new BinaryValue(new ProcValue(new TypeValue(Services.FindType('System.String')), 'IsNullOrEmpty', [readValue]),new DataValue(false), BinaryOperator.Equal),
                        new BinaryValue(lengthProc, new DataValue(max), BinaryOperator.GreaterEqual),BinaryOperator.And), 
                        yieldInstance );
  end;

  self.AddStatementForRuleViolation(aProperty.Owner.Fullname, stringIfStatement);

end;

method StringHasLengthAttribute.HandleImplementation(Services: RemObjects.Oxygene.Cirrus.IServices; aProperty: RemObjects.Oxygene.Cirrus.IPropertyDefinition; aRead: RemObjects.Oxygene.Cirrus.IMethodDefinition; aWrite: RemObjects.Oxygene.Cirrus.IMethodDefinition);
begin

  var methods:Array of IMethod := aProperty.Owner.GetMethods('get_Item');

  if(methods.length>0)then
  begin
    var getter := methods[0];

    var itemValidationValue := (getter as IMethodDefinition).GetLocal(ValidationAttribute.itemValidationValueName);

    var stringType:=Services.FindType('System.String');

    var readValue := new ProcValue(new SelfValue, 'get_'+aProperty.Name);

    var lengthProc := new ProcValue(readValue, 'get_Length',[]);

    var rightBinaryValue: BinaryValue;

  
    if(min>0)then
    begin
        rightBinaryValue := new BinaryValue(
            new BinaryValue(new ProcValue(new TypeValue(Services.FindType('System.String')), 'IsNullOrEmpty', [readValue]),new DataValue(false), BinaryOperator.Equal),
            new BinaryValue(new BinaryValue(lengthProc, new DataValue(min), BinaryOperator.LessEqual),new BinaryValue(lengthProc, new DataValue(max), BinaryOperator.GreaterEqual), BinaryOperator.Or), BinaryOperator.And);

    end
    else
    begin
      rightBinaryValue := new BinaryValue(
                               new BinaryValue(new ProcValue(new TypeValue(Services.FindType('System.String')), 'IsNullOrEmpty', [readValue]),new DataValue(false), BinaryOperator.Equal),
                                new BinaryValue(lengthProc, new DataValue(max), BinaryOperator.GreaterEqual), BinaryOperator.And);
    end;


    var compareProc := new ProcValue(new TypeValue(Services.FindType('System.String')), 'Compare', 
      [new DataValue(aProperty.Name), new ParamValue(0)]);


    var matchingPropertyAndIsNullOrEmpty := new BinaryValue(new BinaryValue(compareProc, new DataValue(0), BinaryOperator.Equal),
            rightBinaryValue,
            BinaryOperator.And);


    var ifStatement := new IfStatement(matchingPropertyAndIsNullOrEmpty, new AssignmentStatement(itemValidationValue, new DataValue(ErrorMessage(aProperty)))); 

    (getter as IMethodDefinition).SetBody( Services, method
    begin
      unquote(ifStatement);
      Aspects.OriginalBody;
    end);

  end;

end;

constructor StringHasLengthAttribute(message:String; min:Integer; max:Integer);
begin
  inherited Constructor(message);
  self.min := min;
  self.max := max;
end;

constructor StringHasLengthAttribute(message:String; max:Integer);
begin
  inherited Constructor(message);
  self.min := 0;
  self.max := max;
end;

method StringHasLengthAttribute.ErrorMessage (aProperty: RemObjects.Oxygene.Cirrus.IPropertyDefinition): String;
begin
  var returnedMessage := '';

  if(self.min>0)then
  begin
    self.Message := '{0} must fall between {1} and {2}';

    returnedMessage:= BuildErrorMessage(aProperty.Name, min, max);
  end
  else
  begin
    self.Message := '{0} must be less than {1}';
    returnedMessage := BuildErrorMessage(aProperty.Name, max);
  end;
  result := returnedMessage;
end;

end.
