namespace ValidationDomain.Tests;

interface

uses
  NUnit.Framework.*,
  System.Collections.Generic,
  System.Linq,
  System.Text;

type

  [aspect:Prism.StandardAspects.Validation.Aspects.Validation]
  ClassD = public class
  private
  public
    [aspect:Prism.StandardAspects.Validation.Aspects.NumericHasValue('SomeValue must be greater than zero')]
    property SomeValue:Int32;
  end;


  [TestFixture]
  NumericHasValueTests = public class
  private
  protected
  public
    [Test]
    method Int32GreaterThanZeroTest;
    [Test]
    method Int32NotGreaterThanZeroTest;
  end;

implementation

method NumericHasValueTests.Int32GreaterThanZeroTest;
begin
  var instance := new ClassD (SomeValue := 5);

  Assert.IsTrue(instance.IsValid);
  Assert.IsTrue(instance.GetRuleViolations.Count=0);
end;

method NumericHasValueTests.Int32NotGreaterThanZeroTest;
begin
  var instance := new ClassD (SomeValue := -5);

  Assert.IsFalse(instance.IsValid);
  Assert.IsTrue(instance.GetRuleViolations.Count=1);

  instance.SomeValue:=0;

  Assert.IsFalse(instance.IsValid);
  Assert.IsTrue(instance.GetRuleViolations.Count=1);

end;

end.
