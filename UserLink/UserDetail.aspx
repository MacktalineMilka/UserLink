<%@ Page Title="User Details" Language="C#" AutoEventWireup="true" CodeBehind="UserDetail.aspx.cs" Inherits="UserLink.UserDetail" MasterPageFile="~/Site.Master" %>

<asp:Content runat="server" ContentPlaceHolderID="MainContent" ClientIDMode="Static">  
     <h1 class="userheading">User Details</h1>
        <div class="userform user-container"> 
             
            <table class="tbl-userdetail center user">
                <%--<thead>
                    <tr class="row" style="display:none;">
                        <th class="col-md-1"></th>
                        <th class="col-md-3"></th> 
                    </tr>
                </thead>--%>
                <tbody>                     
                    <tr>
                        <td><asp:Label runat="server">Id:</asp:Label></td>
                        <td><asp:Label runat="server" ID="userId"></asp:Label></td>
                    </tr>
                    <tr>
                        <td><asp:label runat="server">Name:</asp:label></td>
                        <td>
                            <asp:TextBox runat="server" ID="name"></asp:TextBox>
                            <br />
                            <asp:RequiredFieldValidator runat="server"  CssClass="error" ControlToValidate="name" ErrorMessage="Name is required"></asp:RequiredFieldValidator>
                        </td>  
                    </tr>
                    <tr>
                        <td><asp:label runat="server">Date of Birth:</asp:label></td>
                        <td><input type="date"  runat="server" id="dob"  />
                            <br />
                            <asp:RequiredFieldValidator runat="server" CssClass="error" ControlToValidate="dob" ErrorMessage="Date of Birth is required"></asp:RequiredFieldValidator>
                        </td> 
                    </tr>
                    <tr>
                        <td><asp:label runat="server">Telephone Number:</asp:label></td>
                        <td><asp:TextBox runat="server" ID="telephonenumber"></asp:TextBox>
                            <br />
                            <asp:RequiredFieldValidator runat="server" CssClass="error" ControlToValidate="telephonenumber" ErrorMessage="Telephone Number is required"></asp:RequiredFieldValidator>
                        </td> 
                    </tr>
                    <tr>
                        <td><asp:label runat="server">Email:</asp:label></td>
                        <td><asp:TextBox runat="server" ID="email"></asp:TextBox>
                            <br />
                            <asp:RequiredFieldValidator runat="server" CssClass="error" ControlToValidate="email" ErrorMessage="Email is required"></asp:RequiredFieldValidator>
                            <br />
                            <asp:RegularExpressionValidator ID="RegularExpressionValidator1" CssClass="error"   runat="server" ErrorMessage="Invalid email." ControlToValidate="email" ValidationExpression="^([\w\.\-]+)@([\w\-]+)((\.(\w){2,3})+)$" />
                        </td> 
                    </tr>
                    <tr>
                        <td colspan="2" style="text-align:center;">
                            <asp:Button runat="server" ID="btnSubmit"  CssClass="btn btnSubmit" Text="Submit" OnClick="btnSubmit_Click"/>
                            <asp:Button runat="server" ID="btnCancel" CssClass="btn btnCancel" Text="Cancel"  OnClick="btnCancel_Click" OnClientClick="resetForm();" CausesValidation="false" />
                        </td>
                    </tr>
                </tbody>
            </table>
        </div>
    <script type="text/javascript">

        function validateUser() {
            return true;
        }

        function resetForm() {
            document.getElementById("form1").reset();
            return false; 
        }

    </script>
</asp:Content>

 
