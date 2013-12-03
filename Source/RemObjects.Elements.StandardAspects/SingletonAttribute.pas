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

//
// The Singleton Aspect checks if the targeted class only has one, parameterless,
// public constructor. If this is the case, it applies the Singleton pattern to
// the targeted class by making the constructor private, adding a static field to
// hold a unique instance of the class and create a static property to the class
// which will instanciate the class whenever accessed first and returns this instance
// on any other subsequent access.
//
// provided by Sebastian Gingter
// 

namespace RemObjects.Elements.StandardAspects;

interface

uses
  RemObjects.Oxygene.Cirrus.*;

type
  
  [AttributeUsage(AttributeTargets.Class)]
  SingletonAttribute = public class (Attribute,
    ITypeInterfaceDecorator, IMethodImplementationDecorator)
  private
    const instanceFieldName = 'theInstance';
    const instanceGetterName = 'getInstance';
    const instancePropertyName = 'Instance';
    method CheckForSingleNoParameterConstructor(Services: IServices; ctors: Array of IMethod): Boolean;
    method CheckForAvailableFieldGetterAndPropertyNames(Services: IServices; aType: ITypeDefinition): Boolean;
  public
    method HandleInterface(Services: IServices; aType: ITypeDefinition);
    method HandleImplementation(Services: IServices; aMethod: IMethodDefinition);
  end;
  
implementation

method SingletonAttribute.HandleInterface(Services: IServices; aType: ITypeDefinition);
begin
  if not CheckForAvailableFieldGetterAndPropertyNames(Services, aType) then
    exit;

  var constructors: Array of IMethod := aType.GetConstructors();
  if not CheckForSingleNoParameterConstructor(Services, constructors) then
    exit;

  IMethodDefinition(constructors[0]).Visibility := Visibility.Private;
  aType.AddField(instanceFieldname, aType, true);
  var instanceGetter: IMethodDefinition := aType.AddMethod(instanceGetterName, aType, true);
  instanceGetter.Visibility := Visibility.Public;

  var instanceProperty: IPropertyDefinition := aType.AddProperty(instancePropertyName, aType, true);
  instanceProperty.Visibility := Visibility.Public;
  instanceProperty.ReadMethod := instanceGetter;
end;

method SingletonAttribute.HandleImplementation(Services: IServices; aMethod: IMethodDefinition);
begin
  if aMethod.Name = instanceGetterName then
  begin
    aMethod.SetBody(Services, method
    begin
      if not Assigned(unquote<Object>(new StaticValue(aMethod.Owner, instanceFieldName))) then
      begin
         unquote(new StaticValue(aMethod.Owner, instanceFieldName)) := unquote(new NewValue(aMethod.Owner));
      end;
      exit unquote(new StaticValue(aMethod.Owner, instanceFieldName));
    end);
  end;
end;


method SingletonAttribute.CheckForSingleNoParameterConstructor(Services: IServices; ctors: Array of IMethod): Boolean;
begin
  if not (ctors.Length = 1) then
  begin
    Services.EmitError('Singleton Aspect can only be applied to classes with a single constructor.');
    exit false;
  end;

  if not (ctors[0].Visibility = Visibility.Public) then
  begin
    Services.EmitError('Singleton Aspect can only be applied to classes with a public constructor.');
    exit false;
  end;

  if not (ctors[0].ParameterCount = 0) then
  begin
    Services.EmitError('Singleton Aspect can only be applied to classes with a parameterless constructor.');    
    exit false;
  end;

  exit true;
end;

method SingletonAttribute.CheckForAvailableFieldGetterAndPropertyNames(Services: IServices; aType: ITypeDefinition): Boolean;
begin
  if Assigned(aType.GetStaticField(instanceFieldName)) then
  begin
    Services.EmitError(String.Format('Singleton Aspect can only be applied to classes without a field called "{0}".', instanceFieldName));
    exit false;
  end;

  if (aType.GetStaticMethods(instanceGetterName).Length > 0)
    or (aType.GetMethods(instanceGetterName).Length > 0) then
  begin
    Services.EmitError(String.Format('Singleton Aspect can only be applied to classes without a method called "{0}".', instanceGetterName));
    exit false;
  end;

  if (aType.GetProperties(instancePropertyName).Length > 0)
    or (aType.GetStaticProperties(instancePropertyName).Length > 0) then
  begin
    Services.EmitError(String.Format('Singleton Aspect can only be applied to classes without a property called "{0}".', instancePropertyName));
    exit false;
  end;

  exit true;
end;

end.