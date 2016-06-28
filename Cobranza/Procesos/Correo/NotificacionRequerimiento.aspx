<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="NotificacionRequerimiento.aspx.cs" Inherits="CobranzaALC.Cobranza.Procesos.Correo.NotificacionRequerimiento" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <table cellpadding="0" cellspacing="0" style="width: 800px;">
        <tr>
            <td colspan="4" style="color: #eaeaea; background-color: #304ea3; padding: 4px;"><strong>Requerimientos</strong></td>
        </tr>
        <tr>
            <td style="width: 20%">Fecha Solicitud</td>
            <td style="width: 30%">
                <asp:Label ID="lblFecha" runat="server" ClientIDMode="Static"></asp:Label>
            </td>
            <td style="width: 20%">Estado</td>
            <td style="width: 30%">
                <asp:Label ID="lblEstado" runat="server" ClientIDMode="Static"></asp:Label>
            </td>
        </tr>
        <tr>
            <td style="width: 20%">Solicitante</td>
            <td style="width: 30%">
                <asp:Label ID="lblSolicitante" runat="server" ClientIDMode="Static"></asp:Label>
            </td>
            <td style="width: 20%">&nbsp;</td>
            <td style="width: 30%">&nbsp;</td>
        </tr>
        <tr>
            <td style="width: 20%">Descripción</td>
            <td colspan="3">
                <asp:Label ID="lblDescripcion" runat="server" ClientIDMode="Static"></asp:Label>
            </td>
        </tr>
        <tr>
            <td style="width: 20%">&nbsp;</td>
            <td style="width: 30%">&nbsp;</td>
            <td style="width: 20%">&nbsp;</td>
            <td style="width: 30%">&nbsp;</td>
        </tr>
        <tr>
            <td colspan="4" style="color: #eaeaea; background-color: #304ea3; padding: 4px;">&nbsp;</td>
        </tr>
    </table>
    </form>

</body>
</html>
