namespace ValidationDomain.Tests;

interface

uses
  NUnit.Framework.*,
  System.Collections.Generic,
  System.Linq,
  System.Text;

type

  [aspect:RemObjects.Elements.StandardAspects.Validation.Aspects.Validation]
  ClassA = public class 


  private
    method ValidateSomeDate:Boolean;
  public
    [aspect:RemObjects.Elements.StandardAspects.Validation.Aspects.ValidationMethodForProperty('ValidateSomeDate','SomeDate must be greater than 1/1/1970')]
    property SomeDate:DateTime;
  end;

  [TestFixture]
  ValidationMethodForPropertyTests = public class
  public
    [Test]
    method DatePropertyIsInvalidTest;
    [Test]
    method DatePropertyIsValidTest;
  end;

implementation

method ClassA.ValidateSomeDate: Boolean;
begin
  result := (DateTime.Compare(self.SomeDate, new DateTime(1970,1,1))>=0);
end;

method ValidationMethodForPropertyTests.DatePropertyIsInvalidTest;
begin
  var instance := new ClassA(SomeDate := new DateTime(1969,10,1));

  Assert.IsFalse(instance.IsValid);
  Assert.IsTrue(instance.GetRuleViolations.Count=1);
  
end;

method ValidationMethodForPropertyTests.DatePropertyIsValidTest;
begin
  var instance := new ClassA(SomeDate := new DateTime(1989,10,1));

  Assert.IsTrue(instance.IsValid);
  Assert.IsTrue(instance.GetRuleViolations.Count=0);
end;

end.
