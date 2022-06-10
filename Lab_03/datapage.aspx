<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="datapage.aspx.cs" Inherits="Lab_03.WebForm1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .auto-style2 {
            width: 47px;
        }
        .auto-style3 {
            width: 100%;
            height: 123px;
        }
        .auto-style4 {
            width: 47px;
            height: 30px;
        }
        .auto-style5 {
            height: 30px;
        }#form{
             width: fit-content;
             border: 1px solid black;
             padding: 0.5em;
             background-color: white;
             border-radius: 6px;
         }
        </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div id="form">
    <table class="auto-style3" id="form1">
        <tr>
            <td class="auto-style2">&nbsp;<asp:Label ID="idlbl" runat="server" Text="ID:"></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="idtxt" runat="server"></asp:TextBox>
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <asp:Button ID="loadbtn" runat="server" OnClick="loadbtn_Click" Text="Load" />
            </td>
        </tr>
        <tr>
            <td class="auto-style2">&nbsp;<asp:Label ID="namelbl" runat="server" Text="Name:"></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="nametxt" runat="server"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="auto-style2"><asp:Label ID="pricelbl" runat="server" Text="Price:"></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="pricetxt" runat="server"></asp:TextBox>
                <asp:RangeValidator ID="RangeValidator1" runat="server" ControlToValidate="pricetxt" Display="Dynamic" ErrorMessage="Price must be above 0" MaximumValue="999999.99" MinimumValue="0.00"></asp:RangeValidator>
&nbsp;&nbsp;&nbsp;
                <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="pricetxt" Display="Dynamic" ErrorMessage="Price must be entered in currency format ($$.¢¢)" ValidationExpression="^\$?([0-9]{1,3},([0-9]{3},)*[0-9]{3}|[0-9]+)(.[0-9][0-9])?$"></asp:RegularExpressionValidator>
            </td>
        </tr>
        <tr>
            <td class="auto-style4"><asp:Label ID="quanlbl" runat="server" Text="Quantity:"></asp:Label>
            </td>
            <td class="auto-style5">
                <asp:TextBox ID="quantxt" runat="server"></asp:TextBox>
                <asp:RangeValidator ID="RangeValidator2" runat="server" ControlToValidate="quantxt" Display="Dynamic" ErrorMessage="Quantity must be above 0" MaximumValue="999" MinimumValue="0" Type="Integer"></asp:RangeValidator>
            </td>
        </tr>
        
    </table>
    <div>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:Button ID="insertbtn" runat="server" Text="Insert" OnClick="insertbtn_Click" />
&nbsp;&nbsp;
        <asp:Button ID="updatebtn" runat="server" Text="Update" OnClick="updatebtn_Click" />
&nbsp;&nbsp;
        <asp:Button ID="deletebtn" runat="server" Text="Delete" OnClick="deletebtn_Click" />
        <br />
        <br />
        <asp:Label ID="msglbl" runat="server"></asp:Label>
    </div>
        </div>

</asp:Content>
