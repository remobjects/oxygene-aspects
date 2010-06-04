<%@ Page Title="" Language="Oxygene" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<IEnumerable<ValidationDomain.Employee>>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <table>
        <tr>
            <th></th>
            <th>Id</th>
            <th>First Name</th>
            <th>Last Name</th>
        </tr>
        
        <% for empl in Model do begin %>
        <tr>
            <td>
                <%= Html.ActionLink("Edit", "Edit", new class (Id := empl.Id )) %> 
            </td>
  
        
            <td><%= Html.Encode(empl.Id) %></td>
            
            <td><%= Html.Encode(empl.Firstname) %></td>
            
            <td><%= Html.Encode(empl.Lastname) %></td>    
            
        </tr>
        
        <% end; %>

    
    </table>

</asp:Content>
