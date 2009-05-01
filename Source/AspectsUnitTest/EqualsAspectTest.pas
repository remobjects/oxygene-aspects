namespace AspectsUnitTest;

interface

uses
  Prism.StandardAspects,
  NUnit.Framework;

type
  [TestFixture]
  EqualsAspectTest = public class
  private
  protected
  public
    [Test]
    method TestEquals;
  end;

  [Aspect:Equals]
  Class1 = assembly class
  private
  protected
  public
    property TestProp1: Int32 := 44;
    property TestProp2: String := 'Test';
    property TestProp3: Boolean := true;
  end;
  
implementation

method EqualsAspectTest.TestEquals;
begin
  var testObj1 := new Class1;
  var testObj2 := new Class1;
  Assert.IsTrue(testObj1.Equals(testObj2), 'Equals method nor working properly');
  testObj2.TestProp2 := 'other string';
  Assert.IsFalse(testObj1.Equals(testObj2), 'Equals method nor working properly');
end;

end.