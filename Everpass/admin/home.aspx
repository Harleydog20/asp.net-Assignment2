<%@ Page Title="Home" Language="C#" MasterPageFile="~/Everpass.Master" AutoEventWireup="true" CodeBehind="home.aspx.cs" Inherits="Everpass.home" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <h1>Home</h1>

    <div class="well">
        <p>This is your password hub, you can edit or delete passwords using the tools on the right-most columns, or create a new one with the link below or in the nav bar.
        </p>
    </div>

    <a href="addPassword.aspx">Add Password</a>    
    <asp:GridView ID="grdPasswords" runat="server" CssClass="table table-striped"
        AutoGenerateColumns="false" OnRowDeleting="grdPasswords_RowDeleting" DataKeyNames="PasswordID">
        <Columns>
            <asp:BoundField DataField="WebsiteName" HeaderText="Website Name" />
            <asp:BoundField DataField="UserPassword" HeaderText="Password" />
            <asp:BoundField DataField="SecurityLevel" HeaderText="Security Level" />
            <asp:BoundField DataField="CreationDate" HeaderText="Date Added" DataFormatString="{0:MM-dd-yyyy}" />
            <asp:HyperLinkField HeaderText="Edit" NavigateUrl="add.aspx" 
                 Text="Edit" DataNavigateUrlFields="PasswordID"
                 DataNavigateUrlFormatString="addPassword.aspx?PasswordID={0}" />
            <asp:CommandField DeleteText="Delete" ShowDeleteButton="true" HeaderText="Delete" />
        </Columns>
    </asp:GridView>
</asp:Content>
