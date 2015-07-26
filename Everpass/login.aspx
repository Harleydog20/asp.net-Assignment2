<%@ Page Title="Log In" Language="C#" MasterPageFile="~/Everpass.Master" AutoEventWireup="true" CodeBehind="login.aspx.cs" Inherits="Everpass.login" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <h1>Log In</h1>

    <div>
        <asp:label ID="lblStatus" runat="server" CssClass="label label-danger"></asp:label>
    </div>
    <div class="form-group">
        <label for="txtUsername" class="col-sm-2">Username: </label>
        <asp:TextBox ID="txtUsername" runat="server" />
    </div>
    <div class="form-group">
        <label for="txtPassword" class="col-sm-2">Password: </label>
        <asp:TextBox ID="txtPassword" runat="server" TextMode="Password" />
    </div>
    <div class="col-sm-offset-2">
        <asp:Button ID="btnLogin" runat="server" CssClass="btn btn-primary" Text="Login" OnClick="btnLogin_Click" />
    </div>
</asp:Content>
