namespace ValidationMVCApplication.Controllers;

interface

uses 
  System,
  System.Collections.Generic,
  System.Linq,
  System.Web,
  System.Web.Mvc,
  System.Web.Mvc.Ajax, ValidationDomain;

type
  EmployeeController = public class(Controller)
  private
  protected
  public
    method &Index : ActionResult;
    method Details(Id: Integer): ActionResult;
    method &Create() : ActionResult;
    [AcceptVerbs(HttpVerbs.Post)]
    method &Create(someEmployee:ValidationDomain.Employee): ActionResult;
    method Edit(Id: Integer): ActionResult;
    [AcceptVerbs(HttpVerbs.Post)]
    method Edit(someEmployee:ValidationDomain.Employee): ActionResult;
  end;

implementation

//
// GET: /Employee/

method EmployeeController.&Index(): ActionResult;
begin
  var repository := new EmployeeRepository;

  result := View(repository.All);
end;

//
// GET: /Employee/Details/5

method EmployeeController.Details(Id: Integer): ActionResult;
begin
  result := View();
end;

//
// GET: /Employee/Create

method EmployeeController.&Create(): ActionResult;
begin
  result := View();
end;

//
// POST: /Employee/Create

method EmployeeController.&Create(someEmployee:ValidationDomain.Employee): ActionResult;
begin
  try
    // TODO: Add insert logic here

    result := RedirectToAction("Index");
  except
    exit(View());
  end;
end;

//
// GET: /Employee/Edit/5

method EmployeeController.Edit(Id: Integer): ActionResult;
begin

  var repository := new EmployeeRepository;

  result := View(repository.Get(Id));
end;

//
// POST: /Employee/Edit/5

method EmployeeController.Edit(someEmployee:ValidationDomain.Employee): ActionResult;
begin
  try
    // TODO: Add update logic here

    if (not ModelState.IsValid)then
    begin
      exit View(someEmployee);
    end;

    { Save employee here }


    result := RedirectToAction("Index");
  except
    result := View();
  end;
end;

end.
