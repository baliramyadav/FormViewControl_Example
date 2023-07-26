<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="WebForm2.aspx.cs" Inherits="FormViewControl_Example.WebForm2" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div style="text-align: center">
            <h3>FormView Control in ASP.NET C# [ Part-63 ]</h3>
            <h4>Performing Editing Operations using FormView Control (New, Edit ,Delete)</h4>
        </div>
        <div>
            <asp:FormView ID="FormView1" runat="server" AllowPaging="true" HorizontalAlign="Center" PagerStyle-HorizontalAlign="Center"
                OnPageIndexChanging="FormView1_PageIndexChanging" DataKeyNames="Custid" OnModeChanging="FormView1_ModeChanging"
                 OnItemInserting="FormView1_ItemInserting" OnItemUpdating="FormView1_ItemUpdating" OnItemDeleting="FormView1_ItemDeleting" >

                <HeaderTemplate>Customer Details</HeaderTemplate>
                <HeaderStyle HorizontalAlign="Center" BackColor="LightGoldenrodYellow" ForeColor="MediumVioletRed" Font-Size="XX-Large" />

                <FooterTemplate>Subscribe @CODERBABA</FooterTemplate>
                <FooterStyle BackColor="SlateBlue" ForeColor="Tan" Font-Size="Large" />

                <ItemTemplate>
                    <table border="1" style="background-color: coral">
                        <tr>
                            <th>Custid</th>
                            <th>Name</th>
                            <th>Balance</th>
                            <th>City</th>
                            <th>Is-Active</th>
                        </tr>
                        <tr>
                            <td align="center">
                                <asp:Label ID="lblCustid" runat="server" Text='<%# Eval("Custid") %>' /></td>
                            <td><%# Eval("Name") %></td>
                            <td><%# Eval("Balance") %></td>
                            <td><%# Eval("City") %></td>
                            <td align="center">
                                <asp:CheckBox ID="cbStatus" runat="server" Enabled="false"
                                    Checked='<%# Eval("Status") %>' /></td>
                        </tr>
                        <tr>
                            <td colspan="5" align="center" style="background-color: white">
                                <asp:LinkButton ID="btnNew" runat="server" Text="New" CommandName="New" />
                                <asp:LinkButton ID="btnEdit" runat="server" Text="Edit" CommandName="Edit" />
                                <asp:LinkButton ID="btnDelete" runat="server" Text="Delete" CommandName="Delete"
                                    OnClientClick="return confirm('Are you sure of deleting the current record?')" />
                            </td>
                        </tr>
                    </table>

                </ItemTemplate>
                <InsertItemTemplate>
                    <table border="1" style="background-color: coral">
                        <tr>
                            <th>Name</th>
                            <th>Balance</th>
                            <th>City</th>
                            <th>Is-Active</th>
                        </tr>
                        <tr>
                            <td>
                                <asp:TextBox ID="txtName" runat="server" /></td>
                            <td>
                                <asp:TextBox ID="txtBalance" runat="server" /></td>
                            <td>
                                <asp:TextBox ID="txtCity" runat="server" /></td>
                            <td align="center">
                                <asp:CheckBox ID="cbStatus" runat="server" /></td>
                        </tr>
                        <tr>
                            <td colspan="4" align="center" style="background-color: white">
                                <asp:LinkButton ID="btnInsert" runat="server" Text="Insert" CommandName="Insert" />
                                <asp:LinkButton ID="btnCancel" runat="server" Text="Cancel" CommandName="Cancel" />
                            </td>
                        </tr>
                    </table>

                </InsertItemTemplate>
                <EditItemTemplate>
                    <table border="1" style="background-color: coral">
                        <tr>
                            <th>Custid</th>
                            <th>Name</th>
                            <th>Balance</th>
                            <th>City</th>
                            <th>Is-Active</th>
                        </tr>
                        <tr>
                            <td><%# Eval("Custid") %></td>
                            <td>
                                <asp:TextBox ID="txtName" runat="server" Text='<%# Eval("Name") %>' /></td>
                            <td>
                                <asp:TextBox ID="txtBalance" runat="server" Text='<%# Eval("Balance") %>' /></td>
                            <td>
                                <asp:TextBox ID="txtCity" runat="server" Text='<%# Eval("City") %>' /></td>
                            <td align="center">
                                <asp:CheckBox ID="cbStatus" runat="server" Enabled="false"
                                    Checked='<%# Eval("Status") %>' /></td>
                        </tr>
                        <tr>
                            <td colspan="5" align="center" style="background-color: white">
                                <asp:LinkButton ID="btnUpdate" runat="server" Text="Update" CommandName="Update" />
                                <asp:LinkButton ID="btnCancel" runat="server" Text="Cancel" CommandName="Cancel" />
                            </td>
                        </tr>
                    </table>

                </EditItemTemplate>

            </asp:FormView>
        </div>
    </form>
</body>
</html>
