namespace EnterpriseLibraryWebApplication;

interface

uses
  System.ServiceModel.*;

type

  [ServiceContract]
  IRestService = public interface

    [OperationContract]
    [WebGet(ResponseFormat := WebMessageFormat.Json)]
    method SomeMethod:String;
    [OperationContract]
    [WebGet(ResponseFormat := WebMessageFormat.Json)]
    method AnotherMethod:String;
    [OperationContract]
    [WebGet(ResponseFormat := WebMessageFormat.Json)]
    method ThisRaisesAnException:String;

  end;


implementation

end.
