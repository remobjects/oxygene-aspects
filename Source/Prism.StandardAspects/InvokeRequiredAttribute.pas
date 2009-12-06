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

// This aspect can be applied on methods of a winform control (form, panel, ...)
// It will check if an invoke is required and if needed it will call the methods body using the .invoke method
// This allows that the method can be called safely from other threads.

// NOT YET FINISHED!!!!!

namespace Prism.StandardAspects;

interface

uses
  System.Windows.Forms,
  RemObjects.Oxygene.Cirrus,
  RemObjects.Oxygene.Cirrus.Values,
  RemObjects.Oxygene.Cirrus.Statements;

type
  [AttributeUsage(AttributeTargets.Method)]
  InvokeRequiredAttribute = public class(Attribute, IBaseAspect, IMethodImplementationDecorator, IMethodInterfaceDecorator)
  private
  public
    method HandleImplementation(Services: RemObjects.Oxygene.Cirrus.IServices; aMethod: RemObjects.Oxygene.Cirrus.IMethodDefinition);
    method HandleInterface(Services: RemObjects.Oxygene.Cirrus.IServices; aMethod: RemObjects.Oxygene.Cirrus.IMethodDefinition);
  end;

implementation

method InvokeRequiredAttribute.HandleImplementation(Services: RemObjects.Oxygene.Cirrus.IServices; aMethod: RemObjects.Oxygene.Cirrus.IMethodDefinition);
begin
  var selfVal := new SelfValue();
  if aMethod.Result = nil then //method has no return value
  begin
    aMethod.SetBody(Services, method begin
      var lAct: Action := method 
        begin 
          Aspects.OriginalBody;
        end;
      if unquote<Control>(selfVal).InvokeRequired then 
      begin       
        unquote<Control>(selfVal).Invoke(lAct);
      end
      else
      begin
        lAct;
      end;
    end);
  end
  else //method has a return value
  begin
    Services.EmitError('The InvokeRequired Attribute can only be used on methods that have no return value');
  end;
end;

method InvokeRequiredAttribute.HandleInterface(Services: RemObjects.Oxygene.Cirrus.IServices; aMethod: RemObjects.Oxygene.Cirrus.IMethodDefinition);
begin
  var controlClass := Services.GetType('System.Windows.Forms.Control');
  if not aMethod.Owner.IsAssignableTo(controlClass) then
  begin
    Services.EmitError('The InvokeRequired Attribute can only be used on methods of a System.Windows.Forms.Control or decendant class');
  end;
end;

end.
