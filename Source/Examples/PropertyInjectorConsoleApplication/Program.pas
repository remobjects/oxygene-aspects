namespace PropertyInjectorConsoleApplication;

interface

uses
  Prism.StandardAspects.DependencyInjection,
  System.Collections.Generic,
  System.Linq;


type

  IRepository<T> = public interface
    where T is Object;

    method Find(id:Integer):T;
    method FindAll():List<T>;
  end;

  {$HIDE PW12}
  Invoice=public class

  private

  public
    constructor(Id:Integer);

    property Id:Integer read write;

  end;

  LineItem=public class
  private
  public
    property Quantity:Integer;
  end;

  InvoiceRepository=public class(IRepository<Invoice>)

  private
  public
    constructor;

    method FindAll: System.Collections.Generic.List<Invoice>;
    method Find(id: System.Int32): Invoice;
  end;

  LineItemRepository=public class(IRepository<LineItem>)

  private
  public

    method FindAll: System.Collections.Generic.List<LineItem>;
    method Find(id: System.Int32): LineItem;
  end;

  InvoiceService=public class

  public


    [aspect:PropertyDependencyInjector]
    property ItemRepository:LineItemRepository;

    [aspect:PropertyDependencyInjector]
    property InvoiceRepository:InvoiceRepository;

    method GetAllInvoices:List<Invoice>;

  end;


  ConsoleApp = class
  public
    class method Main;
  end;

implementation

uses
  StructureMap;

class method ConsoleApp.Main;
begin
  try

    StructureMapConfiguration.BuildInstancesOf<IRepository<Invoice>>().TheDefaultIsConcreteType<InvoiceRepository>();
    StructureMapConfiguration.BuildInstancesOf<IRepository<LineItem>>().TheDefaultIsConcreteType<LineItemRepository>();

    var service:=new InvoiceService;

    if(assigned(service.InvoiceRepository))then
    begin
      var allInvoices:=service.InvoiceRepository.FindAll;

      if(allInvoices.Count=1)then
      begin
        Console.WriteLine(String.Format('Invoice Id{0}', allInvoices[0].Id));
      end
      else
      begin
        Console.WriteLine('No invoices ?');
      end;
    end
    else
    begin
      Console.WriteLine('No invoice repository');
    end;


  except
    on E:Exception do
    begin
      System.Console.WriteLine('An exception was raised');
    end;
  end;
end;

method InvoiceRepository.Find(id: System.Int32): Invoice;
begin
end;

method InvoiceRepository.FindAll: System.Collections.Generic.List<Invoice>;
begin
  var invoices:= new List<Invoice>();
  invoices.Add(new Invoice(44));
  result:=invoices;
end;

constructor InvoiceRepository;
begin

end;

method LineItemRepository.Find(id: System.Int32): LineItem;
begin
end;

method LineItemRepository.FindAll: System.Collections.Generic.List<LineItem>;
begin
end;

constructor Invoice(Id:Integer);
begin
  self.Id:=Id;
end;

method InvoiceService.GetAllInvoices: List<Invoice>;
begin
  result:=self.InvoiceRepository.FindAll;
end;


end.