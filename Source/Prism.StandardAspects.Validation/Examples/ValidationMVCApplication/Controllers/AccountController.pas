namespace ValidationMVCApplication.Controllers;

interface

uses 
  System.Collections.Generic, 
  System.Globalization, 
  System.Linq, 
  System.Security.Principal, 
  System.Web, 
  System.Web.Mvc, 
  System.Web.Security, 
  System.Web.UI;

type
  AccountController = public class(Controller)

    { Methods }
    public 
      constructor;
      constructor(iFormsAuth: IFormsAuthentication; service: IMembershipService);
      [Authorize]
      method ChangePassword: ActionResult;
      [Authorize, AcceptVerbs(HttpVerbs.Post)]
      method ChangePassword(currentPassword: String; newPassword: String; confirmPassword: String): ActionResult;
      method ChangePasswordSuccess: ActionResult;
      [AcceptVerbs(HttpVerbs.Post)]
      method Register(userName: String; email: String; password: String; confirmPassword: String): ActionResult;
      method LogOff: ActionResult;
      method LogOn: ActionResult;
      [AcceptVerbs(HttpVerbs.Post)]
      method LogOn(userName: String; password: String; rememberMe: Boolean; returnUrl: String): ActionResult;
      method Register: ActionResult;
    
    protected 
      method OnActionExecuting(filterContext: ActionExecutingContext); override;
        
    private 
      method ValidateChangePassword(currentPassword: String; newPassword: String; confirmPassword: String): Boolean;
      method ValidateLogOn(userName: String; password: String): Boolean;
      method ValidateRegistration(userName: String; email: String; password: String; confirmPassword: String): Boolean;
      class method ErrorCodeToString(createStatus: MembershipCreateStatus): String;

    { Properties }
    public
      property FormsAuth: IFormsAuthentication read private write;
      property MembershipService: IMembershipService read private write;

  end;

type
  IFormsAuthentication = public interface

    { Methods }
    method SignIn(userName: String; createPersistentCookie: Boolean);
    method SignOut;
end;

  // The FormsAuthentication type is sealed and contains static members, so it is difficult to
  // unit test code that calls its members. The interface and helper class below demonstrate
  // how to create an abstract wrapper around such a type in order to make the AccountController
  // code unit testable.
type
  FormsAuthenticationService = public class (IFormsAuthentication)

    { Methods }
    public
      method SignIn(userName: String; createPersistentCookie: Boolean);
      method SignOut;
end;

type
  IMembershipService = public interface

    { Methods }
    method ChangePassword(userName: String; oldPassword: String; newPassword: String): Boolean;
    method CreateUser(userName: String; password: String; email: String): MembershipCreateStatus;
    method ValidateUser(userName: String; password: String): Boolean;

    { Properties }
    property MinPasswordLength: Int32 read;
end;

type
  AccountMembershipService = public class (IMembershipService)

    { Fields }
    private _provider: MembershipProvider;

    { Methods }
    public 
      constructor;
      constructor(provider: MembershipProvider);
      method ChangePassword(userName: String; oldPassword: String; newPassword: String): Boolean;
      method CreateUser(userName: String; password: String; email: String): MembershipCreateStatus;
      method ValidateUser(userName: String; password: String): Boolean;

    { Properties }
      property MinPasswordLength: Int32 read _provider.MinRequiredPasswordLength;
end;

implementation 

// This constructor is used by the MVC framework to instantiate the controller using
// the default forms authentication and membership providers.

constructor AccountController;
begin
  constructor(nil, nil);
end;

// This constructor is not used by the MVC framework but is instead provided for ease
// of unit testing this type. See the comments at the end of this file for more
// information.

constructor AccountController(iFormsAuth: IFormsAuthentication; service: IMembershipService);
begin
  inherited constructor;
  FormsAuth := coalesce(iFormsAuth, new FormsAuthenticationService);
  MembershipService := coalesce(service, new AccountMembershipService);
end;
    
method AccountController.ChangePassword: ActionResult;
begin
  ViewData['PasswordLength'] := MembershipService.MinPasswordLength;

  result := View
end;

method AccountController.ChangePassword(currentPassword: String; newPassword: String; confirmPassword: String): ActionResult;
begin
  ViewData['PasswordLength'] := MembershipService.MinPasswordLength;
  if not ValidateChangePassword(currentPassword, newPassword, confirmPassword) then 
    begin
      result := View; exit
    end;
  try
    if MembershipService.ChangePassword(User.Identity.Name, currentPassword, newPassword) then 
    begin
      result := RedirectToAction('ChangePasswordSuccess'); exit
    end
    else
    begin
      ModelState.AddModelError('_FORM', 'The current password is incorrect or the new password is invalid.');
      result := View; exit
    end
  except
    begin
      ModelState.AddModelError('_FORM', 'The current password is incorrect or the new password is invalid.');
      result := View; exit
    end
  end
end;

method AccountController.ChangePasswordSuccess: ActionResult;
begin
  result := View
end;

class method AccountController.ErrorCodeToString(createStatus: MembershipCreateStatus): String;
begin
  case createStatus of 
    MembershipCreateStatus.InvalidUserName: 
    begin
      result := 'The user name provided is invalid. Please check the value and try again.';
      exit
    end;
    MembershipCreateStatus.InvalidPassword:
    begin
      result := 'The password provided is invalid. Please enter a valid password value.';
      exit
    end;
    MembershipCreateStatus.InvalidQuestion:
    begin
      result := 'The password retrieval question provided is invalid. Please check the value and try again.';
      exit
    end;
    MembershipCreateStatus.InvalidAnswer:
    begin
      result := 'The password retrieval answer provided is invalid. Please check the value and try again.';
      exit
    end;
    MembershipCreateStatus.InvalidEmail:
    begin
      result := 'The e-mail address provided is invalid. Please check the value and try again.';
      exit
    end;
    MembershipCreateStatus.DuplicateUserName:
    begin
      result := 'Username already exists. Please enter a different user name.';
      exit
    end;
    MembershipCreateStatus.DuplicateEmail:
    begin
      result := 'A username for that e-mail address already exists. Please enter a different e-mail address.';
      exit
    end;
    MembershipCreateStatus.UserRejected:
    begin
      result := 'The user creation request has been canceled. Please verify your entry and try again. If the problem persists, please contact your system administrator.';
      exit
    end;
    MembershipCreateStatus.ProviderError:
    begin
      result := 'The authentication provider returned an error. Please verify your entry and try again. If the problem persists, please contact your system administrator.';
      exit
    end;
    else
      result := 'An unknown error occurred. Please verify your entry and try again. If the problem persists, please contact your system administrator.';
  end; //case
end;

method AccountController.LogOff: ActionResult;
begin
  FormsAuth.SignOut;

  result := RedirectToAction('_Index', 'Home')
end;

method AccountController.LogOn: ActionResult;
begin
  result := View
end;

method AccountController.LogOn(userName: String; password: String; rememberMe: Boolean; returnUrl: String): ActionResult;
begin
  if not ValidateLogOn(userName, password) then 
  begin
    result := View; exit
  end;
  
  FormsAuth.SignIn(userName, rememberMe);

  if not String.IsNullOrEmpty(returnUrl) then 
    result := self.Redirect(returnUrl)
  else
    result := RedirectToAction('_Index', 'Home');
end;

method AccountController.OnActionExecuting(filterContext: ActionExecutingContext);
begin
  if (filterContext.HttpContext.User.Identity is WindowsIdentity) then 
  raise new InvalidOperationException('Windows authentication is not supported.')
end;

method AccountController.Register: ActionResult;
begin
  ViewData['PasswordLength'] := MembershipService.MinPasswordLength;

  result := View
end;

method AccountController.Register(userName: String; email: String; password: String; confirmPassword: String): ActionResult;
begin
  ViewData['PasswordLength'] := MembershipService.MinPasswordLength;
  
  if ValidateRegistration(userName, email, password, confirmPassword) then 
  begin
    var createStatus: MembershipCreateStatus := MembershipService.CreateUser(userName, password, email);
    if (createStatus = MembershipCreateStatus.Success) then 
    begin
      FormsAuth.SignIn(userName, false);
      result := RedirectToAction('_Index', 'Home'); exit
    end
    else
      ModelState.AddModelError('_FORM', AccountController.ErrorCodeToString(createStatus))
  end;

  result := View;
end;

method AccountController.ValidateChangePassword(currentPassword: String; newPassword: String; confirmPassword: String): Boolean;
begin
  if String.IsNullOrEmpty(currentPassword) then 
  ModelState.AddModelError('currentPassword', 'You must specify a current password.');

  if ((newPassword = nil) or (newPassword.Length < MembershipService.MinPasswordLength)) then 
  ModelState.AddModelError('newPassword', String.Format(CultureInfo.CurrentCulture, 
  'You must specify a new password of {0} or more characters.', MembershipService.MinPasswordLength));

  if not String.Equals(newPassword, confirmPassword, StringComparison.Ordinal) then 
  ModelState.AddModelError('_FORM', 'The new password and confirmation password do not match.');

  result := ModelState.IsValid;
end;

method AccountController.ValidateLogOn(userName: String; password: String): Boolean;
begin
  if String.IsNullOrEmpty(userName) then 
  ModelState.AddModelError('username', 'You must specify a username.');

  if String.IsNullOrEmpty(password) then 
  ModelState.AddModelError('password', 'You must specify a password.');

  if not self.MembershipService.ValidateUser(userName, password) then 
  ModelState.AddModelError('_FORM', 'The username or password provided is incorrect.');

  result := ModelState.IsValid;
end;

method AccountController.ValidateRegistration(userName: String; email: String; password: String; confirmPassword: String): Boolean;
begin
  if String.IsNullOrEmpty(userName) then 
  ModelState.AddModelError('username', 'You must specify a username.');

  if String.IsNullOrEmpty(email) then 
  ModelState.AddModelError('email', 'You must specify an email address.');

  if ((password = nil) or (password.Length < MembershipService.MinPasswordLength)) then 
  ModelState.AddModelError('password', String.Format(CultureInfo.CurrentCulture, 
  'You must specify a password of {0} or more characters.', MembershipService.MinPasswordLength));

  if not String.Equals(password, confirmPassword, StringComparison.Ordinal) then 
  ModelState.AddModelError('_FORM', 'The new password and confirmation password do not match.');

  result := ModelState.IsValid;
end;

constructor AccountMembershipService;
begin
  constructor (nil);
end;

constructor AccountMembershipService(provider: MembershipProvider);
begin
  inherited constructor;
  _provider := coalesce(provider, Membership.Provider)
end;

method AccountMembershipService.ChangePassword(userName: String; oldPassword: String; newPassword: String): Boolean;
begin
  result := _provider.GetUser(userName, true).ChangePassword(oldPassword, newPassword)
end;

method AccountMembershipService.CreateUser(userName: String; password: String; email: String): MembershipCreateStatus;
begin
  var status: MembershipCreateStatus;
  _provider.CreateUser(userName, password, email, nil, nil, true, nil, out status);

  result := status
end;

method AccountMembershipService.ValidateUser(userName: String; password: String): Boolean;
begin
  result := _provider.ValidateUser(userName, password)
end;

method FormsAuthenticationService.SignIn(userName: String; createPersistentCookie: Boolean);
begin
  FormsAuthentication.SetAuthCookie(userName, createPersistentCookie)
end;

method FormsAuthenticationService.SignOut;
begin
  FormsAuthentication.SignOut
end;

end.