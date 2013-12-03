namespace AspectsUnitTest;

interface

uses
  RemObjects.Elements.StandardAspects,
  NUnit.Framework;

type
  [TestFixture]
  CloneableAspectTest = public class
  private
  protected
  public
    [Test]
    method TestClone;
  end;

  [Aspect:Cloneable]
  Class2 = public class
  private
  public
    property Test1: Int32;
    property Test2: String;
    property Test3: Boolean;
  end;

implementation

method CloneableAspectTest.TestClone;
begin
  var a := new Class2;
  a.Test1 := 55;
  a.Test2 := 'Test';
  a.Test3 := true;
  var b := a.Clone as Class2;
  Assert.AreEqual(a.Test1, b.Test1);
  Assert.AreEqual(a.Test2, b.Test2);
  Assert.AreEqual(a.Test3, b.Test3);
end;

end.
