namespace Prism.StandardAspects.Validation.Aspects;

interface

uses
  RemObjects.Oxygene.Cirrus.*,
  System.Collections.Generic,
  System.Linq,
  System.Text;

type

  [AttributeUsage(AttributeTargets.Method)]
  ValidationMethodAttribute = public class(ValidateBaseAttribute, IMethodInterfaceDecorator, IMethodImplementationDecorator)
  private
  protected
  public
    method HandleInterface(Services: RemObjects.Oxygene.Cirrus.IServices; aMethod: RemObjects.Oxygene.Cirrus.IMethodDefinition);
    method HandleImplementation(Services: RemObjects.Oxygene.Cirrus.IServices; aMethod: RemObjects.Oxygene.Cirrus.IMethodDefinition);

    constructor (message:String);

  end;

implementation

method ValidationMethodAttribute.HandleInterface(Services: RemObjects.Oxygene.Cirrus.IServices; aMethod: RemObjects.Oxygene.Cirrus.IMethodDefinition);
begin


  if(aMethod.ParameterCount>0)then
  begin
    Services.EmitError('Validation methods must not have parameters');
  end;

  if (string.Compare(aMethod.Result.Fullname,typeof(System.Boolean).Fullname)<>0)then
  begin
    Services.EmitError('Validation method must return System.Boolean');
  end;


  // validation failure

  var messageValue := new LocalVariable(String.Format('messageFor{0}',aMethod.Name),Services.FindType('System.String'));

  var methodIfBegin := new BeginStatement([messageValue],[]);

  var messageAssign := new AssignmentStatement(new BeginLocalValue(messageValue), new DataValue(self.BuildErrorMessage(aMethod.Name)));

  methodIfBegin.Add(messageAssign);

  var newRuleViolation := new NewValue(Services.GetType(RuleViolationType), [new BeginLocalValue(messageValue),new DataValue(aMethod.Name)]);

  methodIfBegin.Add(new YieldStatement(newRuleViolation));

  var ifValidStatement := new IfStatement(new BinaryValue( new ProcValue (new SelfValue, aMethod) , new DataValue(true),BinaryOperator.NotEqual), methodIfBegin );


  self.AddStatementForRuleViolation(aMethod.Owner.Fullname, ifValidStatement);

end;

method ValidationMethodAttribute.HandleImplementation(Services: RemObjects.Oxygene.Cirrus.IServices; aMethod: RemObjects.Oxygene.Cirrus.IMethodDefinition);
begin
end;

constructor ValidationMethodAttribute(message:String);
begin
  self.Message := message;
end;

end.
