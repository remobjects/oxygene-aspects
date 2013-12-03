namespace RemObjects.Elements.StandardAspects.EnterpriseLibrary;

interface

uses
    Microsoft.Practices.EnterpriseLibrary.*;


extension method System.Web.HttpApplication.ConfigureLoggingAndExceptionHandling(loggingFolderName:String);

type

  HttpApplicationStatics = public static class
  public
  const
      loggingCategory:String = 'General';
      policyName:String = 'MyPolicy';

  end;


implementation

extension method System.Web.HttpApplication.ConfigureLoggingAndExceptionHandling(loggingFolderName:String);
begin

  var folder := Server.MapPath("");
  var folderNames := folder.Split(['\']);
  var lastFolder := folderNames[foldernames.Length-1];
  var lastFolderStart := folder.IndexOf('\'+lastFolder);
  var filename := folder.Substring(0,lastFolderStart) + String.Format('\{0}\{1}.log', loggingFolderName, lastFolder);

  var builder := new ConfigurationSourceBuilder();

  builder.ConfigureExceptionHandling()
       .GivenPolicyWithName(HttpApplicationStatics.policyName)
       .ForExceptionType<Exception>()
         .LogToCategory(HttpApplicationStatics.loggingCategory)
           .WithSeverity(System.Diagnostics.TraceEventType.Warning)
           .UsingEventId(9000)
         .WrapWith<InvalidOperationException>()
           .UsingMessage('MyMessage')
         .ThenNotifyRethrow();

  builder.ConfigureLogging()
       .WithOptions
         .DoNotRevertImpersonation()
       .LogToCategoryNamed(HttpApplicationStatics.loggingCategory)
         .SendTo.FlatFile("Security Log File")
           .FormatWith(new FormatterBuilder()
             .TextFormatterNamed("Text Formatter")
               .UsingTemplate("Timestamp: {timestamp}...{newline} {message}{newline}"))
             .ToFile(filename);



  var configSource := new DictionaryConfigurationSource();
  builder.UpdateConfigurationWithReplace(configSource);

  EnterpriseLibraryContainer.Current := EnterpriseLibraryContainer.CreateDefaultContainer(configSource);


end;

end.
