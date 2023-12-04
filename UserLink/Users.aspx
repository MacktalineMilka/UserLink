<%@ Page Title="Users" Language="C#" AutoEventWireup="true" CodeBehind="Users.aspx.cs" Inherits="UserLink.Users"  MasterPageFile="~/Site.Master"%>


<asp:Content runat="server" ContentPlaceHolderID="MainContent">  
        <div style="padding:10px;">
            <h1 class="userTtile">Users</h1> <asp:Button ID="btnDownload" ClientIDMode="Static" CssClass="btn btn-right" OnClick="btnDownload_Click" runat="server" Text="Export To CSV"/> 
        </div> 
        <div class="usergridview">
        <asp:GridView CssClass="usersTbl usergridview-container" AllowPaging="true" OnPageIndexChanging="UserGrid_PageIndexChanging" ID="UserGrid" runat="server"
            AutoGenerateColumns="False" PageSize="10" DataKeyNames="ID" EnableViewState="False">
    <Columns>
        <asp:BoundField DataField="ID" HeaderText="ID"
            SortExpression="ID" ReadOnly="True" />
        <asp:BoundField DataField="Name" HeaderText="Name"
            ReadOnly="True" SortExpression="Name" />
        <asp:BoundField DataField="DateOfBirth" HeaderText="Date of Birth"
            ReadOnly="True" SortExpression="Date of Birth" DataFormatString="{0:MM-dd-yyyy}"/>
        <asp:BoundField DataField="TelePhoneNumber" HeaderText="Telephone number"
            SortExpression="Telephone number"  />
        <asp:BoundField DataField="Email" HeaderText="Email"
            SortExpression="Email" />
    </Columns>
</asp:GridView>
</div> 
</asp:Content>
   
<%--<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Users</title>
</head>
<body>

 
</body>
</html>--%>
