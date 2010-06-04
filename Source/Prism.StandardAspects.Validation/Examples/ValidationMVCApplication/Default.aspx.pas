namespace ValidationMVCApplication;

interface

uses
  System.Linq,
  System.Web,
  System.Web.UI,
  System.Web.Mvc;

type
  _Default = public partial class(System.Web.UI.Page)
  public
     method Page_Load(sender: Object; e: EventArgs);
  end;

implementation
method _Default.Page_Load(sender: Object; e: EventArgs);
begin
  // Change the current path so that the Routing handler can correctly interpret
  // the request, then restore the original path so that the OutputCache module
  // can correctly process the response (if caching is enabled).

  var originalPath : String := Request.Path;
  HttpContext.Current.RewritePath(Request.ApplicationPath, false);
  var httpHandler : IHttpHandler := new MvcHttpHandler();
  httpHandler.ProcessRequest(HttpContext.Current);
  HttpContext.Current.RewritePath(originalPath, false);
end;

end.