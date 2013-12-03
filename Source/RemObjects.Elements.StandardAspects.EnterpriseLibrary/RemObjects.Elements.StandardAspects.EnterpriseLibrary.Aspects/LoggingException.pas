namespace RemObjects.Elements.StandardAspects.EnterpriseLibrary.Aspects;

interface

uses
  RemObjects.Oxygene.Cirrus.*;

type


  PublicLoggingExceptionAttribute = public class (Attribute, ITypeImplementationDecorator)

  public
    constructor (ExceptionType:String; PolicyName:String);

    method HandleImplementation(Services: RemObjects.Oxygene.Cirrus.IServices; aType: RemObjects.Oxygene.Cirrus.ITypeDefinition);

    property PolicyName:String;
    property ExceptionType:String;
  end;

  LoggingExceptionAttribute = public class(Attribute, IMethodImplementationDecorator)
  private
  protected
  public
    method HandleImplementation(Services: RemObjects.Oxygene.Cirrus.IServices; aMethod: RemObjects.Oxygene.Cirrus.IMethodDefinition);

    constructor (policyName:String);
    constructor (exceptionType:String; policyName:String);

    property PolicyName:String;
    property ExceptionType:String;
  end;

  LoggingExceptionHelper = public static class
  
  private
  public
    method AddLoggingException(PolicyName:String; ExceptionType:String; Services: RemObjects.Oxygene.Cirrus.IServices; aMethod: RemObjects.Oxygene.Cirrus.IMethodDefinition);
  end;

implementation

method LoggingExceptionAttribute.HandleImplementation(Services: RemObjects.Oxygene.Cirrus.IServices; aMethod: RemObjects.Oxygene.Cirrus.IMethodDefinition);
begin
  LoggingExceptionHelper.AddLoggingException(self.PolicyName, self.ExceptionType, Services, aMethod);
end;

constructor LoggingExceptionAttribute(policyName:String);
begin
  self.PolicyName := policyName;
  self.ExceptionType := 'System.Exception';
end;

constructor LoggingExceptionAttribute(exceptionType:String; policyName:String);
begin
  self.PolicyName := policyName;
  self.ExceptionType := exceptionType;
end;

constructor PublicLoggingExceptionAttribute(ExceptionType:String; PolicyName:String);
begin
  self.ExceptionType := ExceptionType;
  self.PolicyName := PolicyName;
end;

method PublicLoggingExceptionAttribute.HandleImplementation(Services: RemObjects.Oxygene.Cirrus.IServices; aType: RemObjects.Oxygene.Cirrus.ITypeDefinition);
begin
  for x:Integer := 0 to aType.MethodCount -1 do
  begin
    var someMethod := aType.GetMethod(x);

    if(someMethod.Visibility = Visibility.Public)then
    begin
      LoggingExceptionHelper.AddLoggingException(self.PolicyName, self.ExceptionType, Services, someMethod as IMethodDefinition);
    end;

  end;

end;

method LoggingExceptionHelper.AddLoggingException(PolicyName:String; ExceptionType:String; Services: RemObjects.Oxygene.Cirrus.IServices; aMethod: RemObjects.Oxygene.Cirrus.IMethodDefinition);
begin

// This is what we are attempting to build

  //try
    //raise new Exception('This is my raised exception');
  //except
    //on ex:Exception do
    //begin
      //var exManager := EnterpriseLibraryContainer.Current.GetInstance<ExceptionManager>() as ExceptionManager;
      //if(exManager.HandleException(ex, Global_asax.policyName))then
      //begin
      // raise
      //end
    //end;
  //end;


  var current := new ProcValue(new TypeValue(Services.GetType('Microsoft.Practices.EnterpriseLibrary.Common.Configuration.EnterpriseLibraryContainer')),'get_Current');
  var instance := new ProcValue(current,'GetInstance',[Services.GetType('Microsoft.Practices.EnterpriseLibrary.ExceptionHandling.ExceptionManager')]);


  // ExceptLocalValue doesn't work in the current build, NamedLocalValue does
  //var localExcept := new ExceptLocalValue();
  var localExcept := new NamedLocalValue('ex');

  var handleException := new ProcValue(instance, 'HandleException',[localExcept, new DataValue(PolicyName)]);

  var raiseIfStatement := new IfStatement(handleException, new RaiseStatement );

  var exceptStatement := new ExceptStatement([new ExceptStatementItem(raiseIfStatement,nil, 'ex',Services.GetType(ExceptionType))]);

  var tryException := new TryStatement(new PlaceHolderStatement, exceptStatement);

  aMethod.ReplaceMethodBody(tryException);

end;

end.
