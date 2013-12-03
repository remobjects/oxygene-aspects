namespace ValidationMVCApplication;

interface

uses
  System,
  System.Data,
  System.Configuration,
  System.Collections,
  System.Web,
  System.Web.Mvc,
  System.Web.Routing;

type
   Global_asax = public class(System.Web.HttpApplication)
   public
     method RegisterRoutes(routes : RouteCollection);
   protected
     method Application_Start(sender: object; e: EventArgs);
   end;

implementation

method Global_Asax.Application_Start(sender: object; e: EventArgs);
begin
  RegisterRoutes(RouteTable.Routes);  
end;

method Global_asax.RegisterRoutes(routes: RouteCollection);
begin
  routes.IgnoreRoute("{resource}.axd/{*pathInfo}");

  routes.MapRoute(
                "Default",                                                       // Route name
                "{controller}/{action}/{id}",                                    // URL with parameters
                new class (controller := 'Employee', action := 'Index', id := '' )  // Parameter defaults
            );

end;
end.