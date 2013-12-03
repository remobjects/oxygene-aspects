namespace AspectsUnitTest;

interface

uses
  System.Reflection,
  RemObjects.Elements.StandardAspects,
  NUnit.Framework;

type
  [TestFixture]
  SingletonAspectTest = public class
  public
    [Test]
    method TestNoPublicConstructor;
    [Test]
    method TestInstancesAreSame;
    [Test]
    method TestInstanceIsNotNull;
  end;

  [Aspect:Singleton]
  Singleton = public class
  end;

implementation

method SingletonAspectTest.TestNoPublicConstructor;
begin
  var singletonType := typeof(Singleton);
  var constructors := singletonType.GetConstructors();
  var hasPublicConstructor := false;

  for each &constructor: ConstructorInfo in constructors do
  begin
     if &constructor.IsPublic then
     begin
       hasPublicConstructor := true;
       break;
     end;
  end;

  Assert.IsFalse(hasPublicConstructor);
end;

method SingletonAspectTest.TestInstancesAreSame;
begin
  var s1 := Singleton.Instance;
  var s2 := Singleton.Instance;

  Assert.AreSame(s1, s2);
end;

method SingletonAspectTest.TestInstanceIsNotNull;
begin
  var instance := Singleton.Instance;

  Assert.IsNotNull(instance);
end;


end.