namespace EnterpriseLibraryWebApplication;

interface

type

  [aspect:Prism.StandardAspects.EnterpriseLibrary.Aspects.PublicLogging(EnterpriseConstants.loggingCategory)]
  [aspect:Prism.StandardAspects.EnterpriseLibrary.Aspects.PublicLoggingException('System.Exception',EnterpriseConstants.policyName)]
  RestService = public class(IRestService)


  private
  public

    method SomeMethod: System.String;
    method AnotherMethod: System.String;
    method ThisRaisesAnException: System.String;
  end;


implementation

method RestService.AnotherMethod: System.String;
begin
  exit 'This is a string';
end;

method RestService.SomeMethod: System.String;
begin
  exit 'This is another string';
end;

method RestService.ThisRaisesAnException: System.String;
begin
  raise new ApplicationException('crappy code');
end;

end.
