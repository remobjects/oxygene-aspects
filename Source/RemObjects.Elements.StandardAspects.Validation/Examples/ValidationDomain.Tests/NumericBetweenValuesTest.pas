namespace ValidationDomain.Tests;

interface

uses
  NUnit.Framework.*,
  System.Collections.Generic,
  System.Linq,
  System.Text;

type

  [aspect:RemObjects.Elements.StandardAspects.Validation.Aspects.Validation]
  ClassC = public class
  private
  public

    [aspect:RemObjects.Elements.StandardAspects.Validation.Aspects.Int32BetweenValues(5,10,'SomeValue is not in range')]
    property SomeValue:Int32;
  end;

  [TestFixture]
  NumericBetweenValuesTest = public class
  private
  protected
  public
    [Test]
    method Int32BetweenValuesValidTest;
    [Test]
    method Int32BetweenValuesNotValidTest;
  end;

implementation

method NumericBetweenValuesTest.Int32BetweenValuesValidTest;
begin
  var instance := new ClassC(SomeValue := 7);

  Assert.IsTrue(instance.IsValid);
  Assert.IsTrue(instance.GetRuleViolations.Count=0);

end;

method NumericBetweenValuesTest.Int32BetweenValuesNotValidTest;
begin
  var instance := new ClassC(SomeValue := 1);

  Assert.IsFalse(instance.IsValid);
  Assert.IsTrue(instance.GetRuleViolations.Count=1);
end;

end.
