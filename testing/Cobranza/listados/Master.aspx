<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Master.aspx.cs" Inherits="CobranzaALC.Cobranza.listados.Master" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>ALC Asesorìa Legal y Crediticía Ltda</title>

    <link href="../../css/alc2.css" rel="stylesheet" type="text/css" />


    <style type="text/css">
        .style1 {
            width: 213px;
        }

        .style2 {
            FONT-WEIGHT: normal;
            FONT-SIZE: 12px;
            COLOR: #493f46;
            FONT-FAMILY: "Gill Sans MT", Arial;
            width: 60px;
        }

        .style3 {
            FONT-WEIGHT: normal;
            FONT-SIZE: 12px;
            COLOR: #493f46;
            FONT-FAMILY: "Gill Sans MT", Arial;
            width: 84px;
        }
    </style>

</head>
<body>
    <form runat="server" id="Formulario">
        <h3>Consulta Master<asp:TextBox ID="TextBox1" runat="server" TextMode="Password"></asp:TextBox>
        </h3>

        <asp:TextBox ID="txtSQL" runat="server" Height="100px" TextMode="MultiLine"
            Width="489px"></asp:TextBox>&nbsp;&nbsp;
      <asp:Button ID="Button1" runat="server" Text="Buscar" OnClick="Button1_Click" />
        <br />
        <br />

        <table cellspacing="0" cellpadding="0" width="633" border="0">
            <tbody>
                <tr>
                    <td width="633" height="50" valign="top" bgcolor="#336699" xbackground="../../images/banner2.jpg">
                        <asp:GridView Width="633" ID="Grilla" HorizontalAlign="Left" runat="server" CellPadding="4" ForeColor="#333333"
                            GridLines="None" AutoGenerateColumns="true">

                            <RowStyle BackColor="#EFF3FB" />
                            <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                            <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="left" />
                            <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                            <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                            <HeaderStyle Wrap="true"></HeaderStyle>

                            <EditRowStyle BackColor="#2461BF" />
                            <AlternatingRowStyle BackColor="White" />

                        </asp:GridView>
                    </td>
                </tr>
            </tbody>
        </table>

    </form>

</body>
</html>
