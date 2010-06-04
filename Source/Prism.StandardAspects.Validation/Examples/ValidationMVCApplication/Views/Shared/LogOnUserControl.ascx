<%@ Control Language="Oxygene" Inherits="System.Web.Mvc.ViewUserControl" %>
<%
    if (Request.IsAuthenticated) then begin
%>
        Welcome <b><%= Html.Encode(Page.User.Identity.Name) %></b>!
        [ <%= Html.ActionLink("Log Off", "LogOff", "Account") %> ]
<%
    end
    else begin
%> 
        [ <%= Html.ActionLink("Log On", "LogOn", "Account") %> ]
<%
    end
%>