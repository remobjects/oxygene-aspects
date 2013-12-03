namespace EnterpriseLibraryWebApplication;

interface

uses
  System.Web,
  System.Web.UI;

type

  EnterpriseConstants = public class

  private
  public
    const loggingCategory:String = 'General';
    policyName:String = 'MyPolicy';
  end;

  _Default = public partial class(System.Web.UI.Page)
  protected 
    method SomeMethod;
  public
    [aspect:RemObjects.Elements.StandardAspects.EnterpriseLibrary.Aspects.Logging(EnterpriseConstants.loggingCategory)]
    [aspect:RemObjects.Elements.StandardAspects.EnterpriseLibrary.Aspects.LoggingException(EnterpriseConstants.policyName)]
    method OnLoad(e: EventArgs); override;
  end;

implementation

method _Default.OnLoad(e: EventArgs);
begin

  var folder := Server.MapPath("");
  var folderNames := folder.Split(['\']);

  var lastFolder := folderNames[foldernames.Length-1];

  var lastFolderStart := folder.IndexOf('\'+lastFolder);

  var filename := folder.Substring(0,lastFolderStart) + String.Format('\_database\{0}.log', lastFolder);

  self.Label1.Text := filename;

  SomeMethod;
end;

method _Default.SomeMethod;
begin
  //raise new ApplicationException('This is buggy code');
end;

end.
