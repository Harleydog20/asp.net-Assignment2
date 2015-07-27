<%@ Page Title="Register" Language="C#" MasterPageFile="~/Everpass.Master" AutoEventWireup="true" CodeBehind="register.aspx.cs" Inherits="Everpass.register" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <h1>Register</h1>
    <h6>All feilds are required</h6>
    <br />
    <div class="form-group-lg">
        <asp:label ID="lblStatus" runat="server" CssClass="label label-info"></asp:label>
    </div>
    <div class="form-group">
        <label for="txtUsername" class="col-sm-2">Username: </label>
        <asp:TextBox ID="txtUsername" runat="server" />
    </div>
    <div class="form-group">
        <label for="txtPassword" class="col-sm-2">Password: </label>
        <asp:TextBox ID="txtPassword" runat="server" TextMode="Password" />
    </div>
    <div class="form-group">
        <label for="txtConfirm" class="col-sm-2">Confirm: </label>
        <asp:TextBox ID="txtConfirm" runat="server" TextMode="Password" />
        <asp:CompareValidator ID="CompareValidator1" runat="server" ControlToValidate="txtPassword" ControlToCompare="txtConfirm" Operator="Equal" CssClass="label label-danger" ErrorMessage="Passwords must match"></asp:CompareValidator>
    </div>
    <div class="col-sm-offset-2">
        <asp:Button ID="btnRegister" runat="server" Text="Register" CssClass="btn btn-primary" OnClick="btnRegister_Click" />
    </div>
</asp:Content>
