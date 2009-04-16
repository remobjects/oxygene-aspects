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

// This aspect can be added to a method called "Dispose". This method can have a
// "disposing : Boolean" parameter, but need not to. In the method you implement your
// code for doing the disposing.
//
// The aspect will do the following:
// 1. If the method has no parameter, it will add it.
// 2. It will make the method protected and virtual. If the class is a descendant of a
//    class which is IDisposable, the method will be marked "override".
// 3. If the parent is not IDisposable, the interface will be added and a parameter-less
//    public, final method "Dispose" will be added. This method will call the Dispose(Boolean)
//    method and then GC.SuppressFinalize.
// 4. A finalizer will be added, too.
// 5. If not present, a protected field "fIsDisposed" will be created. The Dispose-method
//    will be rewritten to only do something, if this field is false. And of course set the
//    field to true. The inherited Dispose(Boolean) method will be called, if present.
//
// See also: Prism.StandardAspects.CheckDisposedAttribute

namespace Prism.StandardAspects;

interface

uses
  System.Linq,
  RemObjects.Oxygene.Cirrus,
  RemObjects.Oxygene.Cirrus.Values;

type
  [AttributeUsage(AttributeTargets.Method)]
  DisposableAttribute = public class(Attribute, IMethodImplementationDecorator, IMethodInterfaceDecorator)
  public    
    method HandleImplementation(Services: RemObjects.Oxygene.Cirrus.IServices; aMethod: RemObjects.Oxygene.Cirrus.IMethodDefinition);
    method HandleInterface(Services: RemObjects.Oxygene.Cirrus.IServices; aMethod: RemObjects.Oxygene.Cirrus.IMethodDefinition);
  end;
  
implementation

method DisposableAttribute.HandleImplementation(Services: RemObjects.Oxygene.Cirrus.IServices; aMethod: RemObjects.Oxygene.Cirrus.IMethodDefinition);
begin
  if aMethod.ParameterCount = 0 then
    aMethod.AddParameter('disposing', ParameterModifier.In, Services.GetType('System.Boolean'));

  aMethod.Visibility := Visibility.Protected;

  //That's us
  var this := new SelfValue;

  //The IDisposable interface
  var disposableInterface := Services.GetType(typeOf(IDisposable).FullName);

  //Ensure the field is present
  var theField := aMethod.Owner.GetField('fIsDisposed');
  if theField = nil then
  begin    
    theField := aMethod.Owner.AddField('fIsDisposed', Services.GetType('System.Boolean'), false); 
    IFieldDefinition(theField).Visibility := Visibility.AssemblyOrProtected;
  end else
    if theField.Type.Fullname <> 'System.Boolean' then
      Services.EmitError('fIsDisposed: Field must be of type System.Boolean');

  var fIsDisposed := new FieldValue(this, theField);
  
  //If the parent type implements IDisposable, we don't add another public Dispose method
  //and don't create another finalizer. But we have to call the inherited Dispose(Boolean) method!
  var inheritedDispose : ProcValue;
  if aMethod.Owner.ParentType.IsAssignableTo(disposableInterface) then
    inheritedDispose := new ProcValue(this, 'Dispose', true, new ParamValue(0))
  else begin
    //Create finalizer
    var disposeWithParam := new ProcValue(this, aMethod, false, false);
    var theFinalizer := aMethod.Owner.AddFinalizer();
    theFinalizer.SetBody(Services, method begin
      unquote(disposeWithParam);
    end);

    //Implement public Dispose method
    disposeWithParam := new ProcValue(this, aMethod, false, true);

    var newMethod := aMethod.Owner.AddMethod('Dispose', nil, false);
    newMethod.Visibility := Visibility.Public;
    newMethod.Virtual := VirtualMode.Virtual;
    newMethod.Final := true;

    newMethod.SetBody(Services, method begin
      unquote(disposeWithParam);
      GC.SuppressFinalize(unquote<Object>(this));
    end);
  end;

  if inheritedDispose <> nil then
    aMethod.SetBody(Services, method begin
      unquote(inheritedDispose);
      Aspects.OriginalBody;
    end); 

  aMethod.SetBody(Services, method begin
    if not unquote<Boolean>(fIsDisposed) then 
    begin       
      Aspects.OriginalBody;   
      unquote<Boolean>(fIsDisposed) := true;
    end
  end)
end;

method DisposableAttribute.HandleInterface(Services: RemObjects.Oxygene.Cirrus.IServices; aMethod: RemObjects.Oxygene.Cirrus.IMethodDefinition);
begin
  //Check some things and perhaps add the parameter
  if aMethod.Name <> 'Dispose' then
    Services.EmitError('Has to be applied to the Dispose method');
  
  if aMethod.ParameterCount > 1 then
    Services.EmitError('Method is not allowed to have more than one parameter');
  
  if (aMethod.ParameterCount = 1) and (aMethod.GetParameter(0).Type.Fullname <> 'System.Boolean') then
    Services.EmitError('Parameter has to be of type boolean');

  //Do we have to add the interface?
  var disposableInterface := Services.GetType(typeOf(IDisposable).FullName);
  if not aMethod.Owner.IsAssignableTo(disposableInterface) then //also true, if parent class implements IDisposable
    aMethod.Owner.AddInterface(disposableInterface);  
  
  //If the parent type implements IDisposable, we have to override its method
  if aMethod.Owner.ParentType.IsAssignableTo(disposableInterface) then
    aMethod.Virtual := VirtualMode.Override
  else  
    aMethod.Virtual := VirtualMode.Virtual; 
end;

end.