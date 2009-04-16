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

// This aspect can be added to any method or property. It will insert code, that checks
// if a field "fIsDisposed" is true and raises an ObjectDisposedException if this is the
// case.
// 
// See also: Prism.StandardAspects.DisposableAttribute

namespace Prism.StandardAspects;

interface

uses 
  System.Windows.Forms, RemObjects.Oxygene.Cirrus,
  RemObjects.Oxygene.Cirrus.Values;

type
  [AttributeUsage(AttributeTargets.Method or AttributeTargets.Property)]
  CheckDisposedAttribute = public class(Attribute, IMethodImplementationDecorator, IPropertyImplementationDecorator)
  private
    method GetField(Services: RemObjects.Oxygene.Cirrus.IServices; aMethod : IMethodDefinition) : IField;
  public
    method HandleImplementation(Services: RemObjects.Oxygene.Cirrus.IServices; aMethod: RemObjects.Oxygene.Cirrus.IMethodDefinition);
    method HandleImplementation(Services: RemObjects.Oxygene.Cirrus.IServices; aProperty: RemObjects.Oxygene.Cirrus.IPropertyDefinition; aRead: RemObjects.Oxygene.Cirrus.IMethodDefinition; aWrite: RemObjects.Oxygene.Cirrus.IMethodDefinition);
  end;
  
implementation

method CheckDisposedAttribute.HandleImplementation(Services: RemObjects.Oxygene.Cirrus.IServices; aMethod: RemObjects.Oxygene.Cirrus.IMethodDefinition);
begin
  var theField := GetField(Services, aMethod);

  if theField <> nil then
  begin
    var fieldValue := new FieldValue(new SelfValue, theField);
    var objectName := new DataValue(aMethod.Owner.Name);

    aMethod.SetBody(Services, method begin
      if unquote<Boolean>(fieldValue) then
        raise new  ObjectDisposedException(unquote<String>(objectName));

      Aspects.OriginalBody;
    end);
  end;
end;

method CheckDisposedAttribute.HandleImplementation(Services: RemObjects.Oxygene.Cirrus.IServices; aProperty: RemObjects.Oxygene.Cirrus.IPropertyDefinition; aRead: RemObjects.Oxygene.Cirrus.IMethodDefinition; aWrite: RemObjects.Oxygene.Cirrus.IMethodDefinition);
begin
  var theField := iif(aRead <> nil, GetField(Services, aRead), GetField(Services, aWrite));
  var objectName := iif(aRead <> nil, aRead.Owner.Name, aWrite.Owner.Name);

  if theField <> nil then
  begin
    var fieldValue := new FieldValue(new SelfValue, theField);

    if aRead <> nil then
      aRead.SetBody(Services, method begin
        if unquote<Boolean>(fieldValue) then
          raise new  ObjectDisposedException(unquote<String>(objectName));

        Aspects.OriginalBody;
      end);

    if aWrite <> nil then
      aWrite.SetBody(Services, method begin
        if unquote<Boolean>(fieldValue) then
          raise new  ObjectDisposedException(unquote<String>(objectName));

        Aspects.OriginalBody;
      end);
  end;
end;

method CheckDisposedAttribute.GetField(Services: RemObjects.Oxygene.Cirrus.IServices; aMethod : IMethodDefinition) : IField;
begin
  result := aMethod.Owner.GetField('fIsDisposed');
  
  if result <> nil then
    if result.Type.Fullname <> 'System.Boolean' then
      Services.EmitError('fIsDisposed: Field must be of type System.Boolean');
end;

end.