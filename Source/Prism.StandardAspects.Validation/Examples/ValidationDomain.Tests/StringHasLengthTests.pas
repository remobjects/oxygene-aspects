namespace ValidationDomain.Tests;

interface

uses
  NUnit.Framework,
  System.Collections.Generic,
  System.Linq,
  System.Text;

type

  [aspect:Prism.StandardAspects.Validation.Aspects.Validation]
  ClassE = public class

  private
  public
    [aspect:Prism.StandardAspects.Validation.Aspects.StringHasLength('',10)]
    property StringProperty:String;
    [aspect:Prism.StandardAspects.Validation.Aspects.StringHasLength('',5,10)]
    property AnotherStringProperty:String;

    constructor;
  end;

  [TestFixture]
  StringHasLengthTests = public class
  private
  protected
  public
    [Test]
    method AllTests;
  end;

implementation

method StringHasLengthTests.AllTests;
begin
  var instance := new ClassE;

  instance.StringProperty := '12345'; 
  instance.AnotherStringProperty := '123456'; 

  Assert.IsTrue(instance.IsValid);

  instance.StringProperty := '1234567891----'; 

  Assert.IsFalse(instance.IsValid);

  instance.StringProperty := '12345';

  Assert.IsTrue(instance.IsValid); // check valid again


  instance.AnotherStringProperty := '123456';
  Assert.IsTrue(instance.IsValid);

  instance.AnotherStringProperty := '123';
  Assert.IsFalse(instance.IsValid);

  instance.AnotherStringProperty := '1234344343434343434343434';
  Assert.IsFalse(instance.IsValid);

end;

constructor ClassE;
begin
  self.StringProperty := '';
  self.AnotherStringProperty := '';
end;

end.
