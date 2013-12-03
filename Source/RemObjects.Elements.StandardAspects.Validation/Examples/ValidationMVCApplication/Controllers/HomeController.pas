namespace ValidationMVCApplication.Controllers;

interface

uses
  System, 
  System.Collections.Generic,
  System.Linq, 
  System.Web, 
  System.Web.Mvc;

type

[HandleError]
HomeController = public class(Controller)

    { Methods }
    public 
      method About: ActionResult;
      method _Index: ActionResult;
end;

 
implementation

method HomeController.About: ActionResult;
begin
    result := View
end;

method HomeController._Index: ActionResult;
begin
    ViewData['Message'] := 'Welcome to ASP.NET MVC!';
    result := View
end;

end.