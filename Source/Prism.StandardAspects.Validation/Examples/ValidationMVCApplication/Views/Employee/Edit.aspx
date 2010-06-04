<%@ Page Title="" Language="Oxygene" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<ValidationDomain.Employee>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <h2>Edit</h2>

    <%= Html.ValidationSummary('Edit was unsuccessful. Please correct the errors and try again.') %>
    <% using Html.BeginForm do begin%>

        <fieldset>
            <legend>Fields</legend>
            <p>
                <label for="Id">Id:</label>
                <%= Html.TextBox("Id", Model.Id, new class ( readonly := 'readonly')) %>
                <%= Html.ValidationMessage("Id", "*") %>
            </p>
            <p>
                <label for="Firstname">FirstName:</label>
                <%= Html.TextBox("Firstname", Model.Firstname) %>
                <%= Html.ValidationMessage("Firstname", "*") %>
            </p>
            <p>
                <label for="Lastname">Lastname:</label>
                <%= Html.TextBox("Lastname", Model.Lastname) %>
                <%= Html.ValidationMessage("Lastname", "*") %>
            </p>
            <p>
                <input type="submit" value="Save" />
            </p>
        </fieldset>

    <% end; %>

    
</asp:Content>

    
