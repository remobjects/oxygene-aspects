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
// This aspect implements ICloneable on a class.
// You can exclude properies by tagging them with the ExcludeFromCloneableAspect attribute.

namespace Prism.StandardAspects;

interface

uses
  System.Collections.Generic,
  RemObjects.Oxygene.Cirrus,
  RemObjects.Oxygene.Cirrus.Values,
  RemObjects.Oxygene.Cirrus.Statements;

type
  [AttributeUsage(AttributeTargets.Class)]
  CloneableAttribute = public class(Attribute, IBaseAspect, ITypeImplementationDecorator)
  private
  protected
  public
    method HandleImplementation(Services: IServices; aType: ITypeDefinition);
  end;

  [AttributeUsage(AttributeTargets.Property)]
  ExcludeFromCloneableAspectAttribute = public class(Attribute)
  private
  public
  end;

implementation

method CloneableAttribute.HandleImplementation(Services: IServices; aType: ITypeDefinition);
begin
  var cloneableInterface := Services.GetType('System.ICloneable');
  if not aType.IsAssignableTo(cloneableInterface) then aType.AddInterface(cloneableInterface);  
  var cloneMethod := aType.AddMethod('Clone', nil, false);
  cloneMethod.Visibility := Visibility.Public;
  cloneMethod.Virtual := VirtualMode.Virtual;
  cloneMethod.Final := true;
  cloneMethod.Result := Services.GetType('System.Object');

  var lBegin := new BeginStatement(); // begin
  var lclone := new LocalVariable('localClone', aType); 
  lBegin.Locals.Add(lclone);
  var lcloneVal := new NamedLocalValue('localClone');
  lBegin.Add(new AssignmentStatement(lcloneVal, new NewValue(Services.GetType(aType.Fullname))));
  for i: Int32 := 0 to aType.PropertyCount - 1 do
  begin
    var includeProperty := true;
    var locVal := aType.GetProperty(i);
    for y: Int32 := 0 to locVal.AttributeCount - 1 do
    begin
      var att := locVal.GetAttribute(y);
      if att.Type = Services.GetType('Prism.StandardAspects.ExcludeFromCloneableAspectAttribute') then
      begin
        includeProperty := false;
      end;
    end;
    if includeProperty then
    begin
      if locVal.WriteMethod <> nil then
      begin
        if locVal.Type.IsAssignableTo(cloneableInterface) then
        begin
          lBegin.Add(new StandaloneStatement(new ProcValue(lcloneVal, locVal.WriteMethod,[new ProcValue(new ProcValue(new SelfValue(), locVal.ReadMethod), 'Clone')])));
        end
        else
        begin
          lBegin.Add(new StandaloneStatement(new ProcValue(lcloneVal, locVal.WriteMethod,[new ProcValue(new SelfValue(), locVal.ReadMethod)])));
        end;
      end;
    end;
  end;
  lBegin.Add(new AssignmentStatement(cloneMethod.GetResult, lcloneVal));
  cloneMethod.SetBody(Services, method 
  begin
    unquote(lBegin);        
  end);
end;

end.
