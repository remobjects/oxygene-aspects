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

// This aspect can be applied on methods of a WPF control (form, Button, ...)
// It will check if an invoke is required and if needed it will call the methods body using the .invoke method
// This allows that the method can be called safely from other threads.

namespace RemObjects.Elements.StandardAspects;

interface

uses
  System.Windows.Threading,
  RemObjects.Oxygene.Cirrus,
  RemObjects.Oxygene.Cirrus.Values,
  RemObjects.Oxygene.Cirrus.Statements;

type
  [AttributeUsage(AttributeTargets.Method)]
  WPFInvokeRequiredAttribute = public class(Attribute, IBaseAspect, IMethodImplementationDecorator, IMethodInterfaceDecorator)
  private
  public
    method HandleImplementation(Services: RemObjects.Oxygene.Cirrus.IServices; aMethod: RemObjects.Oxygene.Cirrus.IMethodDefinition);
    method HandleInterface(Services: RemObjects.Oxygene.Cirrus.IServices; aMethod: RemObjects.Oxygene.Cirrus.IMethodDefinition);
  end;

implementation

method WPFInvokeRequiredAttribute.HandleImplementation(Services: RemObjects.Oxygene.Cirrus.IServices; aMethod: RemObjects.Oxygene.Cirrus.IMethodDefinition);
begin
  var selfVal := new SelfValue();
  if aMethod.Result = nil then //method has no return value
  begin
    aMethod.SetBody(Services, method 
    begin
      var lAct: Action := method 
        begin 
          Aspects.OriginalBody;
        end;
      if unquote<DispatcherObject>(selfVal).Dispatcher.CheckAccess then 
      begin       
        lAct;
      end
      else
      begin   
        unquote<DispatcherObject>(selfVal).Dispatcher.BeginInvoke(lAct);
      end;
    end);
  end
  else //method has a return value
  begin
    var retVal := new ResultValue;
    var prms := aMethod.GetParameterArrayValue;
    aMethod.SetBody(Services, method 
    begin
      if unquote<DispatcherObject>(selfVal).Dispatcher.CheckAccess then 
      begin 
        Aspects.OriginalBody;     
      end
      else
      begin
        var temp := unquote<DispatcherObject>(selfVal).Dispatcher.Invoke(unquote<&Delegate>(new ProcPtrValue(selfVal, aMethod.Name)), unquote<ObjectArray>(prms)); 
        unquote(new AssignmentStatement(retval, new UnaryValue(new NamedLocalValue('temp'), UnaryOperator.Cast, aMethod.Result)));  
      end;
    end);
  end;
end;

method WPFInvokeRequiredAttribute.HandleInterface(Services: RemObjects.Oxygene.Cirrus.IServices; aMethod: RemObjects.Oxygene.Cirrus.IMethodDefinition);
begin
  var dispatcherClass := Services.GetType('System.Windows.Threading.DispatcherObject');
  if not aMethod.Owner.IsAssignableTo(dispatcherClass) then
  begin
    Services.EmitError('The WPFInvokeRequired Attribute can only be used on methods of a System.Windows.Threading.DispatcherObject or decendant class');
  end;
end;

end.
