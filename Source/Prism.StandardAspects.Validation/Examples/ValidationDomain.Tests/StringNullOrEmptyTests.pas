namespace ValidationDomain.Tests;

interface

uses
  NUnit.Framework.*,
  System.Collections.Generic,
  System.Linq,
  System.Text;

type

  [aspect:Prism.StandardAspects.Validation.Aspects.Validation]
  ClassB = public class 


  public
    [aspect:Prism.StandardAspects.Validation.Aspects.StringNullOrEmpty('SomeStringValue must have a value')]
    property SomeStringValue:String;
  end;

  [TestFixture]
  StringNullOrEmptyTests = public class
  private
  protected
  public
    [Test]
    method ValidStringTest;
    [Test]
    method InValidStringTest;
  end;

implementation

method StringNullOrEmptyTests.ValidStringTest;
begin
  var instance := new ClassB(SomeStringValue := 'value');

  Assert.IsTrue(instance.IsValid);
  Assert.IsTrue(instance.GetRuleViolations.Count=0);

end;

method StringNullOrEmptyTests.InValidStringTest;
begin
  var instance := new ClassB;

  Assert.IsFalse(instance.IsValid);
  Assert.IsTrue(instance.GetRuleViolations.Count=1);
end;

end.
