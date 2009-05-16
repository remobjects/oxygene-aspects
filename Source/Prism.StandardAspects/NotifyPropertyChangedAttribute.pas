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
// Implements INotifyPropertyChanged allowing two way databinding in WPF
//
// Adds an event called PropertyChanged and modifies setters so that the event
// is fired each time the property is changed
//

namespace Prism.StandardAspects;

interface

uses
  RemObjects.Oxygene.Cirrus.*,
  System.Collections.Generic,
  System.Linq,
  System.Text;

type


  [AttributeUsage(AttributeTargets.Class)]
  NotifyPropertyChangedAttribute = public class(System.Attribute, IBaseAspect, ITypeInterfaceDecorator)
  private
  protected
  public
    method HandleInterface(Services: RemObjects.Oxygene.Cirrus.IServices; aType: RemObjects.Oxygene.Cirrus.ITypeDefinition);
  end;
  
implementation

method NotifyPropertyChangedAttribute.HandleInterface(Services: RemObjects.Oxygene.Cirrus.IServices; aType: RemObjects.Oxygene.Cirrus.ITypeDefinition);
begin
  var eventDefinition:=aType.AddEvent('PropertyChanged',Services.GetType('System.ComponentModel.PropertyChangedEventHandler'),false);
  eventDefinition.Visibility:=Visibility.Public;

  var fieldDefinition:=aType.AddField('@e_PropertyChanged',Services.GetType('System.ComponentModel.PropertyChangedEventHandler'),false);
  fieldDefinition.Visibility:=Visibility.Private;

  eventDefinition.SetMember(fieldDefinition,true);

  aType.AddInterface(Services.GetType('System.ComponentModel.INotifyPropertyChanged'));



  for p:Integer := 0 to aType.PropertyCount-1 do
  begin
    var propertyDefinition:=aType.GetProperty(p);

    var fireMethod:=(eventDefinition as IEvent).RaiseMethod;

    var newArg:=new NewValue(Services.GetType('System.ComponentModel.PropertyChangedEventArgs'),
      [new DataValue(PropertyDefinition.Name)]);

    var fireCall:=new ProcValue(new SelfValue(),fireMethod,
      [new SelfValue(),newArg]); 

    if((not propertyDefinition.ReadOnly)and(propertyDefinition.ElementKind=ElementKind.Property))then
    begin

      var setValue:=new ParamValue(0);

      propertyDefinition.WriteMethod.SetBody(services,method
        begin
          Aspects.OriginalBody;
          if(assigned(unquote<Object>(setValue)))then
          begin
            unquote(fireCall);
          end;
        end);
    end;
  end;

end;


end.