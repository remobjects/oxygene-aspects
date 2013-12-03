namespace AspectsUnitTest;

interface

uses
  System.Windows.Forms,
  RemObjects.Elements.StandardAspects,
  NUnit.Framework;

type
  [TestFixture]
  InvokeRequiredAspectTest = public class
  private
  protected
  public
    [Test]
    method TestInvokeRequired1;
    [Test]
    method TestInvokeRequired2;
  end;

  InvokeTestClass = public class(Form)
  private
  public
    [aspect:InvokeRequired]
    method Test1(aParam: Int32);
    [aspect:InvokeRequired]
    method Test2(aParam: Int32): String;
  end;

implementation

method InvokeTestClass.Test2(aParam: Int32): String;
begin
  result := aParam.ToString();
end;

method InvokeTestClass.Test1(aParam: Int32);
begin
  Console.WriteLine(aParam.ToString());
end;

method InvokeRequiredAspectTest.TestInvokeRequired2;
begin
  var t := new InvokeTestClass;
  t.Test2(45);
end;

method InvokeRequiredAspectTest.TestInvokeRequired1;
begin
  var t := new InvokeTestClass;
  t.Test1(45);
end;

end.
