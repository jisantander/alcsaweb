<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="blanco.aspx.cs" Inherits="CobranzaALC.blanco" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>Untitled Page</title>
    <link href="css/alc_estilo.css" rel="stylesheet" />
    <link href="css/alc2.css" rel="stylesheet" />
    <link href="css/start/jquery-ui-1.10.3.custom.min.css" rel="stylesheet" />
    <style type="text/css">
        .cabezabrilla {
            background-color: #6CB3D8;
            font-family: Verdana, Arial, Helvetica, sans-serif;
            font-size: 12px;
            font-weight: bold;
            color: #ffffff;
            text-align: left;
        }

        td {
            font: normal 12px verdana,arial;
            padding: 0 0 0 2px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <br />
            <br />
            <br />
            <img src="images/logo.jpg" alt="" style="width: 437px" />
            <br />
        </div>
        <br />

        <asp:Panel ID="pnlMetas" runat="server" Visible="false">
            <table cellpadding="0" cellspacing="0" style="width: 95%;">
                <tr>
                    <td class="barra-titulo">METAS</td>
                </tr>
                <tr>
                    <td>
                        <asp:GridView ID="gvHistoricos" runat="server" AutoGenerateColumns="False" CellPadding="4" ForeColor="#333333" GridLines="None" PageSize="25" Width="100%">
                            <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                            <AlternatingRowStyle BackColor="White" />
                            <Columns>
                                <asp:BoundField DataField="Etapa" HeaderText="Etapa" />
                                <asp:BoundField DataField="FechaInicio" DataFormatString="{0:dd-MM-yyyy}" HeaderText="Fecha Desde" HtmlEncode="False" />
                                <asp:BoundField DataField="FechaFinal" DataFormatString="{0:dd-MM-yyyy}" HeaderText="Fecha Hasta" HtmlEncode="False" />
                                <asp:BoundField DataField="NumeroMeta" DataFormatString="{0:N0}" HeaderText="Meta" HtmlEncode="False" />
                                <asp:BoundField DataField="NumeroFinal" DataFormatString="{0:N0}" HeaderText="N° Casos" HtmlEncode="False" />
                            </Columns>
                            <EditRowStyle BackColor="#2461BF" />
                            <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                            <HeaderStyle CssClass="cabezabrilla" />
                            <PagerStyle BackColor="#2461BF" ForeColor="White" />
                            <RowStyle BackColor="#EFF3FB" />
                            <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                        </asp:GridView>
                    </td>
                </tr>
                <tr>
                    <td class="barra-sub-titulo">&nbsp;</td>
                </tr>
            </table>
        </asp:Panel>
    </form>
</body>
</html>
