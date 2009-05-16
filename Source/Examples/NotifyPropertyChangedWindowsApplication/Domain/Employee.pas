namespace NotifyPropertyChangedWindowsApplication.Domain;

interface

uses
  Prism.StandardAspects,
  System.Collections.Generic,
  System.Linq,
  System.Text;

type

  [aspect:NotifyPropertyChanged]
  Employee = public class
  public
    property Id:Integer;
    property Firstname:String;
    property Lastname:String;
    property Age:Integer;
  end;
  
implementation

end.