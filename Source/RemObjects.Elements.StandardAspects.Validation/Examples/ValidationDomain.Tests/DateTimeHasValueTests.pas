namespace ValidationDomain.Tests;

interface

uses
  NUnit.Framework,
  System.Collections.Generic,
  System.Linq,
  System.Text;

type

  [aspect:RemObjects.Elements.StandardAspects.Validation.Aspects.Validation]
  ClassF = public class

  private
  public
    [aspect:RemObjects.Elements.StandardAspects.Validation.Aspects.DateTimeHasValue('SomeDateTime must have a value')]
    property SomeDateTime:DateTime;
  end;


  [TestFixture]
  DateTimeHasValueTests = public class
  private
  protected
  public
    [Test]
    method BasicTest();
  end;

implementation

method DateTimeHasValueTests.BasicTest();
begin
  var instance := new ClassF;

  Assert.IsFalse(instance.IsValid);

  instance.SomeDateTime := DateTime.Now;

  Assert.IsTrue(instance.IsValid);
end;

end.
