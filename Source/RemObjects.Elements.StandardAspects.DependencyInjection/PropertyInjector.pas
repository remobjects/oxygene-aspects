// Permission is hereby granted, free of charge, to any person obtaining a copy
// of this software and associated documentation files (the "Software"), to deal
// in the Software without restriction, including without limitation the rights
// to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies
// of the Software, and to permit persons to whom the Software is furnished to do
// so, subject to the following conditions:
// 
// The above copyright notice and this permission notice shall be included in all
// copies or substantial portions of the Software.
// 
// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED,
// INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A
// PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT
// HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF
// CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE
// OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

namespace RemObjects.Elements.StandardAspects.DependencyInjection;

interface

uses
  RemObjects.Oxygene.Cirrus;

type

  [AttributeUsage(AttributeTargets.Property)]
  PropertyDependencyInjectorAttribute=public class(System.Attribute,IPropertyInterfaceDecorator)

  private

    injectedFieldValue:RemObjects.Oxygene.Cirrus.Values.FieldValue;
    newFieldValue:RemObjects.Oxygene.Cirrus.Values.FieldValue;

  public
    method HandleInterface(Services: IServices; aProperty: IPropertyDefinition);

  end;


implementation

uses
  RemObjects.Oxygene.Cirrus.Statements,
  RemObjects.Oxygene.Cirrus.Values,
  StructureMap,
  System.Text;



method PropertyDependencyInjectorAttribute.HandleInterface(Services: IServices; aProperty: IPropertyDefinition);
begin
  var injectedFieldDefinition:=aProperty.Owner.AddField('@p_'+aProperty.Name+'_injected', Services.FindType('System.Boolean'),aProperty.Static);
  injectedFieldDefinition.InitialValue:=false;

  injectedFieldValue:= new FieldValue(new SelfValue(), injectedFieldDefinition);

  var newRealFieldDefinition:=aProperty.Owner.AddField('@p_'+aProperty.Name+'_real', aProperty.Type, aProperty.Static);

  newFieldValue := new FieldValue(new SelfValue(), newRealFieldDefinition);


  if(not aProperty.ImplicitField)then
  begin
    Services.EmitError(String.Format('The property {0} is not implict',aProperty.Name));
  end;

  { setter }

  var newSetterName:=String.Format('set_{0}',aProperty.Name);

  var newSetterMethod:=aProperty.Owner.AddMethod(newSetterName, nil, false);
  newSetterMethod.AddParameter('value',ParameterModifier.In,aProperty.Type);

  var setterParamValue:=new ParamValue(0);

  var localAssignment:=new AssignmentStatement(newFieldValue, setterParamValue);

  newSetterMethod.SetBody(Services,method
    begin
      unquote<Boolean>(injectedFieldValue) := true;
      unquote(localAssignment);
    end
  );

  { getter }

  var newGetterName:=String.Format('get_{0}',aProperty.Name);

  var newGetterMethod:=aProperty.Owner.AddMethod(newGetterName,aProperty.Type,false);

  var objectFactoryType:=Services.FindType('StructureMap.ObjectFactory');
  var objectType := new TypeValue(aProperty.Type);
  var typeOfObject := new TypeOfValue(aProperty.Type);

  var getInstanceProc:= new ProcValue(new TypeValue(objectFactoryType), 'GetInstance', [typeOfObject.Type]);

  var objectFactoryAssignment:=new AssignmentStatement(newFieldValue, getInstanceProc);

  newGetterMethod.SetBody(Services, method
  begin
    if not unquote<Boolean>(injectedFieldValue) then
    begin
      unquote(objectFactoryAssignment);
      unquote<Boolean>(injectedFieldValue) := true;
    end;
    exit unquote(newFieldValue);

  end);

  aProperty.WriteMethod:=newSetterMethod;
  aProperty.ReadMethod:=newGetterMethod;

  var originalField:=aProperty.Owner.GetField('@p_'+aProperty.Name);
  if(assigned(originalField))then
  begin
    //aProperty.Owner.RemoveField(originalField as IFieldDefinition);
  end;

end;

end.