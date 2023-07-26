<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="WebForm1.aspx.cs" Inherits="FormViewControl_Example.WebForm1" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <div style="text-align:center">
                <h3>FormView Control in ASP.NET C# [ Part-62 ]</h3>
            </div>
            <asp:FormView ID="FormView1" runat="server" AllowPaging="true" HorizontalAlign="Center" PagerStyle-HorizontalAlign="Center"
                OnPageIndexChanging="FormView1_PageIndexChanging">
                <HeaderTemplate>Student Detials</HeaderTemplate>
                <HeaderStyle BackColor="LightGoldenrodYellow" ForeColor="MediumBlue" HorizontalAlign="Center" />
                <ItemTemplate>
                    <table border="1">
                        <tr>
                            <th>Sid</th>
                            <th>Name</th>
                            <th>Class</th>
                            <th>Fees</th>
                            <th>Is-Active</th>
                            <th>Photograph</th>
                        </tr>
                        <tr>
                            <td align="center"><%# Eval("Sid") %></td>
                            <td><%# Eval("Name") %></td>
                            <td align="center"><%# Eval("Class") %></td>
                            <td align="right"><%# Eval("Fees") %></td>
                            <td align="center">
                                <asp:CheckBox ID="cbStatus" runat="server" Enabled="false"
                                    Checked='<%# Eval("Status") %>' /></td>
                            <td>
                                <asp:Image ID="imgPhoto" runat="server" Width="200" Height="200"
                                    ImageUrl='<%# "~/Images/" + Eval("PhotoName") %>' /></td>
                        </tr>
                    </table>

                </ItemTemplate>
                <FooterTemplate>
                    Subscribe my channel @CODERBABA
                </FooterTemplate>
                <FooterStyle BackColor="SlateBlue" ForeColor="Tan" Font-Size="Large" HorizontalAlign="Center" />
               

            </asp:FormView>
        </div>
    </form>
</body>
</html>
