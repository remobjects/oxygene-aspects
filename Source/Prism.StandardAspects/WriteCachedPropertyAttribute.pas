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
// Implements a caching mechanism to write properties or setter methods.
//
// This will make sure then if you write the same value to a setter it will only execute the first time.
// This is nice when the setter is slow (a web service or access to hardware over a slow bus)
//

namespace Prism.StandardAspects;

interface

uses
  RemObjects.Oxygene.Cirrus.*,
  System.Collections.Generic,
  System.Linq,
  System.Text;

type
  [AttributeUsage(AttributeTargets.Method or AttributeTargets.Property)]
  WriteCachedPropertyAttribute = public class(System.Attribute, IBaseAspect, IPropertyImplementationDecorator, IMethodImplementationDecorator)
  private
  protected
  public
    method HandleImplementation(Services: RemObjects.Oxygene.Cirrus.IServices; aProperty: RemObjects.Oxygene.Cirrus.IPropertyDefinition; aRead: RemObjects.Oxygene.Cirrus.IMethodDefinition; aWrite: RemObjects.Oxygene.Cirrus.IMethodDefinition);
    method HandleImplementation(Services: RemObjects.Oxygene.Cirrus.IServices; aMethod: RemObjects.Oxygene.Cirrus.IMethodDefinition);
  end;

implementation

method WriteCachedPropertyAttribute.HandleImplementation(Services: RemObjects.Oxygene.Cirrus.IServices; aProperty: RemObjects.Oxygene.Cirrus.IPropertyDefinition; aRead: RemObjects.Oxygene.Cirrus.IMethodDefinition; aWrite: RemObjects.Oxygene.Cirrus.IMethodDefinition);
begin
  var cachedVal := aProperty.Owner.AddField('__writeCached_' + aProperty.Name, aProperty.Type, false);
  var cachedBool := aProperty.Owner.AddField('__writeCached_' + aProperty.Name + '_FirstTimeDone', Services.GetType('System.Boolean'), false);
  var cachedBoolValue := new FieldValue(new SelfValue(), cachedBool);
  var cachedValValue := new FieldValue(new SelfValue(), cachedVal);
  if aProperty.WriteMethod.ParameterCount <> 1 then Services.EmitError('The WriteCachedProperty Attribute can only be used on set methods with one parameter');
  var firstParamValue := new ParamValue(0);
  aProperty.WriteMethod.SetBody(services, method
  begin
    if unquote<Boolean>(cachedBoolValue) then 
    begin
      if unquote<Object>(firstParamValue) = unquote<Object>(cachedValValue) then
      begin
        exit;
      end;
    end
    else
    begin
      unquote<Boolean>(cachedBoolValue) := true;
    end;
    Aspects.OriginalBody;
    unquote<Object>(cachedValValue) := unquote<Object>(firstParamValue);
  end);
end;

method WriteCachedPropertyAttribute.HandleImplementation(Services: RemObjects.Oxygene.Cirrus.IServices; aMethod: RemObjects.Oxygene.Cirrus.IMethodDefinition);
begin
  if aMethod.ParameterCount <> 1 then Services.EmitError('The WriteCachedProperty Attribute can only be used on methods with one parameter');
  var firstParamValue := new ParamValue(0);
  var cachedVal := aMethod.Owner.AddField('__writeCached_' + aMethod.Name, aMethod.GetParameter(0).Type, false);
  var cachedBool := aMethod.Owner.AddField('__writeCached_' + aMethod.Name + '_FirstTimeDone', Services.GetType('System.Boolean'), false);
  var cachedBoolValue := new FieldValue(new SelfValue(), cachedBool);
  var cachedValValue := new FieldValue(new SelfValue(), cachedVal);
  aMethod.SetBody(services, method
  begin
    if unquote<Boolean>(cachedBoolValue) then 
    begin
      if unquote<Object>(firstParamValue) = unquote<Object>(cachedValValue) then
      begin
        exit;
      end;
    end
    else
    begin
      unquote<Boolean>(cachedBoolValue) := true;
    end;
    Aspects.OriginalBody;
    unquote<Object>(cachedValValue) := unquote<Object>(firstParamValue);
  end);
end;

end.
