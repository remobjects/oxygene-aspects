namespace ValidationDomain.Tests;

interface

uses
  NUnit.Framework,
  System.Collections.Generic,
  System.Linq,
  System.Text;

type


  [aspect:RemObjects.Elements.StandardAspects.Validation.Aspects.Validation]
  ClassG = public class

  ///
  /// Tests that both getters and implicit fields work 
  /// in validation framework
  /// to pass tests project must compile
  ///
  private
    FSomeDateTime:DateTime;
    FSomeOtherValue:Int32;
    FSomeOtherStringValue:String;
    FHasLengthStringValue:String;

  public
    method get_SomeDateTime:DateTime;
    method set_SomeDateTime(Value:DateTime);
    method set_SomeOtherValue(Value:Int32);
    method get_SomeOtherValue:Int32;
    method get_SomeOtherStringValue:String;
    method set_SomeOtherStringValue(Value:String);
    method get_HasLengthStringValue:String;
    method set_HasLengthStringValue(Value:String);

    [aspect:RemObjects.Elements.StandardAspects.Validation.Aspects.DateTimeHasValue('SomeDateTime needs a value')]
    property SomeDateTime:DateTime read get_SomeDateTime write set_SomeDateTime;
    [aspect:RemObjects.Elements.StandardAspects.Validation.Aspects.DateTimeHasValue('SomeOtherDateTime needs a value')]
    property SomeOtherDateTime:DateTime;

    [aspect:RemObjects.Elements.StandardAspects.Validation.Aspects.Int32BetweenValues(5,10,'SomeValue is not in range')]
    [aspect:RemObjects.Elements.StandardAspects.Validation.Aspects.NumericHasValue('SomeValue must be greater than zero')]
    property SomeValue:Int32;

    [aspect:RemObjects.Elements.StandardAspects.Validation.Aspects.Int32BetweenValues(5,10,'SomeOtherValue is not in range')]
    [aspect:RemObjects.Elements.StandardAspects.Validation.Aspects.NumericHasValue('SomeOtherValue must be greater than zero')]
    property SomeOtherValue:Int32 read get_SomeOtherValue write set_SomeOtherValue;

    [aspect:RemObjects.Elements.StandardAspects.Validation.Aspects.StringHasLength('',10)]
    [aspect:RemObjects.Elements.StandardAspects.Validation.Aspects.StringNullOrEmpty('SomeStringValue must have a value')]
    property SomeStringValue:String;

    [aspect:RemObjects.Elements.StandardAspects.Validation.Aspects.StringHasLength('',10)]
    [aspect:RemObjects.Elements.StandardAspects.Validation.Aspects.StringNullOrEmpty('SomeOtherStringValue must have a value')]
    property SomeOtherStringValue:String read get_SomeOtherStringValue write set_SomeOtherStringValue;


    [aspect:RemObjects.Elements.StandardAspects.Validation.Aspects.StringHasLength('',5, 10)]
    [aspect:RemObjects.Elements.StandardAspects.Validation.Aspects.StringNullOrEmpty('SomeOtherStringValue must have a value')]
    property HasLengthStringValue:String read get_HasLengthStringValue write set_hasLengthStringValue;


  end;

  [NUnit.Framework.TestFixture]
  GetterTests = public class
  private
  protected
  public
    [Test]
    method ValidateObjectWithGettersTest;
  end;

implementation

method GetterTests.ValidateObjectWithGettersTest;
begin

  var instance := new ClassG (SomeDateTime := DateTime.Now);

  try

    Assert.IsFalse(instance.IsValid);

  except
    on E:Exception do
    begin
      raise;
    end;

  end;
end;

method ClassG.get_SomeDateTime: DateTime;
begin
  exit FSomeDateTime;
end;

method ClassG.set_SomeDateTime(Value:DateTime);
begin
  self.FSomeDateTime := value;
end;

method ClassG.set_SomeOtherValue(Value:Int32);
begin
  self.FSomeOtherValue := value;
end;

method ClassG.get_SomeOtherValue: Int32;
begin
  exit self.FSomeOtherValue;
end;

method ClassG.get_SomeOtherStringValue: String;
begin
  exit self.FSomeOtherStringValue;
end;

method ClassG.set_SomeOtherStringValue(Value:String);
begin
  self.FSomeOtherStringValue := Value;
end;

method ClassG.get_HasLengthStringValue: String;
begin
  exit self.FHasLengthStringValue;
end;

method ClassG.set_HasLengthStringValue(Value:String);
begin
  self.FHasLengthStringValue := value;
end;

end.
