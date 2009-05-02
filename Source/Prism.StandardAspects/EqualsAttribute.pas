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

// This aspect will override the Equals method and use all properties to calculate it.
// When you apply the ExcludeFromEqualsAspectAttribute on a property it will not be included in the Equals calculation.
// When you apply the IncludeParentInEqualsAspectAttribute on the class it will include the parents Equal method. (TODO)

// TODO: Differentiate between value properties and reference properties ( = vs .Equals) 
// TODO: Add inherited call to GetHashCode (when IncludeParentInEqualsAspectAttribute is applied)

namespace Prism.StandardAspects;

interface

uses
  System.Collections.Generic,
  RemObjects.Oxygene.Cirrus,
  RemObjects.Oxygene.Cirrus.Values,
  RemObjects.Oxygene.Cirrus.Statements;

type
  [AttributeUsage(AttributeTargets.Class)]
  EqualsAttribute = public class(Attribute, ITypeImplementationDecorator)
  private
    [Aspect:AutoInjectIntoTarget]
    method fCombineHashCode(objectMembers: array of Object): Int32;
    [Aspect:AutoInjectIntoTarget]
    method fEqualsAndNotNil(object1, object2: System.Object): Boolean;
  protected
  public
    method HandleImplementation(Services: RemObjects.Oxygene.Cirrus.IServices; aType: RemObjects.Oxygene.Cirrus.ITypeDefinition);
  end;

  [AttributeUsage(AttributeTargets.Property)]
  ExcludeFromEqualsAspectAttribute = public class(Attribute)
  private
  public
  end;

  [AttributeUsage(AttributeTargets.Class)]
  IncludeParentInEqualsAspectAttribute = public class(Attribute)
  private
  public
  end;

implementation

method EqualsAttribute.fCombineHashCode(objectMembers: array of Object): Int32;
begin
  result := 23;
  if assigned(objectMembers) then
  begin
    {for each om in objectMembers do  //this does not work
    begin
      if om <> nil then
      begin
        result := result * 37 + om.GetHashCode;
      end
      else
      begin
        result := result * 37;
      end;
    end;}

    for i: Int32 := 0 to objectMembers.Length - 1 do
    begin
      var om := objectMembers[i];
      if om <> nil then
      begin
        result := result * 37 + om.GetHashCode;
      end
      else
      begin
        result := result * 37;
      end;
    end;
  end;
end;

method EqualsAttribute.HandleImplementation(Services: RemObjects.Oxygene.Cirrus.IServices; aType: RemObjects.Oxygene.Cirrus.ITypeDefinition);
begin
  //GetHashcode
  var hashCodeMethod := aType.AddMethod('GetHashcode', Services.GetType('System.Int32'), false);
  hashCodeMethod.Visibility := Visibility.Public;
  hashCodeMethod.Virtual := VirtualMode.Override;
  var hashCodeMethodBegin := new BeginStatement(); // begin
  var larrayValue := new ArrayValue();
  hashCodeMethodBegin.Add(new AssignmentStatement(hashCodeMethod.GetResult, 23));
  for i: Int32 := 0 to aType.PropertyCount - 1 do
  begin
    var includeProperty := true;
    var locVal := aType.GetProperty(i);
    for y: Int32 := 0 to locVal.AttributeCount - 1 do
    begin
      var att := locVal.GetAttribute(y);
      if att.Type = Services.GetType('Prism.StandardAspects.ExcludeFromEqualsAspectAttribute') then
      begin
        includeProperty := false;
      end;
    end;
    if includeProperty then
    begin
      larrayValue.Add(new ProcValue(new SelfValue(), locVal.ReadMethod));
    end;
  end;
  hashCodeMethodBegin.Add(new AssignmentStatement(hashCodeMethod.GetResult, new ProcValue(new SelfValue, 'fCombineHashCode', larrayValue)));
  hashCodeMethod.SetBody(Services, method 
                                 begin  
                                   unquote(hashCodeMethodBegin);
                                 end);
  //Equals
  var equalsMethod := aType.AddMethod('Equals', Services.GetType('System.Boolean'), false);
  var equalsMethodParam := equalsMethod.AddParameter('obj', ParameterModifier.In, Services.GetType('System.Object'));
  equalsMethod.Visibility := Visibility.Public;
  equalsMethod.Virtual := VirtualMode.Override;
  var lBegin := new BeginStatement(); // begin
  var lOtherObject := new LocalVariable('otherObject', aType); 
  lBegin.Locals.Add(lOtherObject);
  lBegin.Add(new AssignmentStatement(equalsMethod.GetResult, true));
  lBegin.Add(new AssignmentStatement(new BeginLocalValue(lOtherObject),
             new UnaryValue(equalsMethod.getParameter('obj'), UnaryOperator.Cast, aType)));
  lBegin.Add(new IfStatement(new BinaryValue(new NamedLocalValue('otherObject'), new NilValue() ,BinaryOperator.Equal), 
                             new ExitStatement(False)));
  for i: Int32 := 0 to aType.PropertyCount - 1 do
  begin
    var includeProperty := true;
    var locVal := aType.GetProperty(i);
    for y: Int32 := 0 to locVal.AttributeCount - 1 do
    begin
      var att := locVal.GetAttribute(y);
      if att.Type = Services.GetType('Prism.StandardAspects.ExcludeFromEqualsAspectAttribute') then
      begin
        includeProperty := false;
      end;
    end;
    if includeProperty then
    begin
      {lBegin.Add(new IfStatement(new BinaryValue(new ProcValue(new SelfValue(), locVal.ReadMethod),
                                                 new ProcValue(new NamedLocalValue('otherObject'), locVal.ReadMethod),
                                                 BinaryOperator.NotEqual), 
                                                 new ExitStatement(False)));}
      lBegin.Add(new IfStatement(new ProcValue(new SelfValue(), 'fEqualsAndNotNil', [new ProcValue(new SelfValue(), locVal.ReadMethod), new ProcValue(new NamedLocalValue('otherObject'), locVal.ReadMethod)]), nil, new ExitStatement(False)));
    end;
  end;
  for i: Int32 := 0 to aType.AttributeCount - 1 do
  begin
    var att := aType.GetAttribute(i);
    if att.Type = Services.GetType('Prism.StandardAspects.IncludeParentInEqualsAspectAttribute') then
    begin
      lBegin.Add(new AssignmentStatement(equalsMethod.GetResult, new ProcValue(new SelfValue(), equalsMethod, true, [equalsMethod.getParameter('obj')])));  
    end;
  end;
  equalsMethod.SetBody(Services, method 
                                 begin  
                                   unquote(lBegin);
                                 end);
end;
method EqualsAttribute.fEqualsAndNotNil(object1, object2: System.Object): Boolean;
begin
  if object1 <> nil then 
  begin
    if object2 = nil then exit(false);
    exit(object1.Equals(object2));
  end
  else
  begin
    if object2 = nil then exit(true);
  end;
end;

end.