namespace RemObjects.Elements.StandardAspects.EnterpriseLibrary.Aspects;

interface

uses
  RemObjects.Oxygene.Cirrus.*,
  System.Collections.Generic,
  System.Text;

type

  PublicLoggingAttribute = public class (Attribute, ITypeImplementationDecorator)

  public
    constructor (Category:String);

    method HandleImplementation(Services: RemObjects.Oxygene.Cirrus.IServices; aType: RemObjects.Oxygene.Cirrus.ITypeDefinition);

    property Category:String;
  end;

  LoggingAttribute = public class(Attribute, IMethodImplementationDecorator)
  private
  protected
  public
    method HandleImplementation(Services: RemObjects.Oxygene.Cirrus.IServices; aMethod: RemObjects.Oxygene.Cirrus.IMethodDefinition);

    constructor (Category:String);
    constructor (message:String; Category:String);

    property Category:String;
    property Message:String;
  end;

  LoggingHelper = public static class
  public
    method AddLogging (Message:String; Category:String; Services: RemObjects.Oxygene.Cirrus.IServices; aMethod: RemObjects.Oxygene.Cirrus.IMethodDefinition);
  end;

implementation

method LoggingAttribute.HandleImplementation(Services: RemObjects.Oxygene.Cirrus.IServices; aMethod: RemObjects.Oxygene.Cirrus.IMethodDefinition);
begin
  LoggingHelper.AddLogging(Message, Category, Services, aMethod);
end;

constructor LoggingAttribute(Category:String);
begin
  self.Category := Category;
  self.Message := String.Empty;
end;

constructor LoggingAttribute(message:String; Category:String);
begin
  self.Category := Category;
  self.Message := Message;
end;

method PublicLoggingAttribute.HandleImplementation(Services: RemObjects.Oxygene.Cirrus.IServices; aType: RemObjects.Oxygene.Cirrus.ITypeDefinition);
begin

  // add logging of entering and exciting of public methods
  for x:Integer := 0 to aType.MethodCount -1 do
  begin
    var someMethod := aType.GetMethod(x);

    if(someMethod.Visibility = Visibility.Public)then
    begin
      LoggingHelper.AddLogging(String.Empty,Category, Services, someMethod);
    end;

  end;

end;

constructor PublicLoggingAttribute(Category:String);
begin
  self.Category := Category;
end;

method LoggingHelper.AddLogging (Message:String; Category:String; Services: RemObjects.Oxygene.Cirrus.IServices; aMethod: RemObjects.Oxygene.Cirrus.IMethodDefinition);
begin
  var current := new ProcValue(new TypeValue(Services.GetType('Microsoft.Practices.EnterpriseLibrary.Common.Configuration.EnterpriseLibraryContainer')),'get_Current');
  var instance := new ProcValue(current,'GetInstance',[Services.GetType('Microsoft.Practices.EnterpriseLibrary.Logging.LogWriter')]);

  var startMessage := '';

  if(String.IsNullOrEmpty(Message))then
  begin
    startMessage := String.Format('Entering {0} ', aMethod.Name);
  end
  else
  begin
    startMessage := String.Format('Entering {0} - {1}', aMethod.Name,message);
  end;

  var writeMethodStart := new ProcValue(instance,'Write',[new DataValue(startMessage), new DataValue(Category)]);

  if(String.IsNullOrEmpty(Message))then
  begin


    var stopMessage := String.Format('Exiting {0} ', aMethod.Name);

    var writeMethodEnd := new ProcValue(instance,'Write',[new DataValue(stopMessage), new DataValue(Category)]);
    var tryFinally := new TryStatement(new PlaceHolderStatement(), new StandAloneStatement(writeMethodEnd));

    var replaceWith := new BeginStatement();

    replaceWith.Add(new StandAloneStatement(writeMethodStart));
    replaceWith.Add(tryFinally);

    aMethod.ReplaceMethodBody(replaceWith);

  end
  else
  begin
    aMethod.SetBody(Services, method begin
      unquote(writeMethodStart);
      Aspects.OriginalBody;
    end);

  end;

  //var lw := EnterpriseLibraryContainer.Current.GetInstance<LogWriter>() as LogWriter;
  //lw.Write('This is a message', Global_asax.loggingCategory);

end;

end.
