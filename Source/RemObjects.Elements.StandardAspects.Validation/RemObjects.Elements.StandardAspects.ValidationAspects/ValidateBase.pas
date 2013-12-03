namespace RemObjects.Elements.StandardAspects.Validation.Aspects;

interface

uses
  RemObjects.Oxygene.Cirrus.*,
  System.Collections.Generic,
  System.Linq,
  System.Text;

type

  ValidateBaseAttribute = public class(Attribute)
  public
    const RuleViolationType:String = 'RemObjects.Elements.StandardAspects.Validation.RuleViolation';
  private
  protected
    method AddStatementForIDataErrorInfo(fullName:String; propertyName:String; someStatement:Statement);
    method AddStatementForRuleViolation(fullName:String; someStatement:RemObjects.Oxygene.Cirrus.Statements.Statement);

  public
    constructor (message:String);

    property Message:String private read write;

    method BuildErrorMessage(PropertyName:String):String;
    method BuildErrorMessage(param1, param2:Object):String;
    method BuildErrorMessage(param1, param2, param3:Object):String;
  end;

implementation

constructor ValidateBaseAttribute(message:String);
begin
  self.Message := message;
end;

method ValidateBaseAttribute.AddStatementForIDataErrorInfo(fullName:String; propertyName:String; someStatement:Statement);
begin
  var statementsByPropertyName : List<StatementGrouping>;
  var matchingGrouping:StatementGrouping;

  if(not StatementStorage.StatementsForIDataErrorInfo.TryGetValue(fullName,out statementsByPropertyName))then
  begin
    statementsByPropertyName:= new List<StatementGrouping>;
    StatementStorage.StatementsForIDataErrorInfo.Add(fullname, statementsByPropertyName);
  end;

  for someGrouping:StatementGrouping in statementsByPropertyName do
  begin
    if(someGrouping.PropertyName = propertyName)then
    begin
      matchingGrouping:=someGrouping;
      break;
    end;
  end;

  if(not assigned(matchingGrouping))then
  begin
    matchingGrouping:= new StatementGrouping(PropertyName:=propertyName);
    statementsByPropertyName.Add(matchingGrouping);
  end;

  matchingGrouping.Statements.Add(someStatement);

end;

method ValidateBaseAttribute.AddStatementForRuleViolation(fullName:String; someStatement:RemObjects.Oxygene.Cirrus.Statements.Statement);
begin
  var statements:List<Statement>;

  if(not StatementStorage.Statements.TryGetValue(fullName,out statements))then
  begin
    statements:= new List<Statement>;
    StatementStorage.Statements.Add(fullname, statements);
  end;

  statements.Add(someStatement);
end;

method ValidateBaseAttribute.BuildErrorMessage(PropertyName:String): String;
begin
  var builtMessage := '';
  if(Message.Contains('{0}'))then
  begin
    builtMessage := String.Format(Message, PropertyName);
  end
  else
  begin
    builtMessage := Message;
  end;

  exit builtMessage;
end;

method ValidateBaseAttribute.BuildErrorMessage(param1, param2:Object): String;
begin
  if(Message.Contains('{0}')) then
  begin
    exit String.Format(Message, param1, param2);
  end
  else
  begin
    exit Message;
  end;
end;

method ValidateBaseAttribute.BuildErrorMessage(param1, param2, param3:object): String;
begin
  if(Message.Contains('{0}')) then
  begin
    exit String.Format(Message, param1, param2, param3);
  end
  else
  begin
    exit Message;
  end;

end;

end.
