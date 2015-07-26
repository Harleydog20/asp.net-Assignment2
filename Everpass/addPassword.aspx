<%@ Page Title="Add Password" Language="C#" MasterPageFile="~/Everpass.Master" AutoEventWireup="true" CodeBehind="addPassword.aspx.cs" Inherits="Everpass.addPassword" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <h1>Department Details</h1>

    <h5>All fields are required</h5>

    <div class="form-group">
        <label for="txtWebsiteName" class="col-sm-3">Website Name:</label>
        <asp:TextBox ID="txtWebsiteName" runat="server" required="true" MaxLength="50" />
    </div>
    <div class="form-group">
        <label for="txtPassword" class="col-sm-3">Password:</label>
        <asp:TextBox ID="txtPassword" runat="server" required="true" MaxLength="50" />
    </div>
    <div class="form-group">
            <label for="ddlSecurityLevel" class="control-label col-sm-3">Security Level:</label>
        <strong class="text-danger"> <!-- have to add the strong so the numbers in to drop down can be seen, because of the theme -->
            <asp:DropDownList ID="ddlSecurityLevel" runat="server">
                <asp:ListItem Value="5">5</asp:ListItem>
                <asp:ListItem Value="4">4</asp:ListItem>
                <asp:ListItem Value="3">3</asp:ListItem>
                <asp:ListItem Value="2">2</asp:ListItem>
                <asp:ListItem Value="1">1</asp:ListItem>
            </asp:DropDownList>
            </strong>
        </div>
    <div class="col-sm-offset-3">
        <asp:Button ID="btnSave" runat="server" Text="Save" CssClass="btn btn-primary" OnClick="btnSave_Click" />
    </div>
</asp:Content>
