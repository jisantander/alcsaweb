<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ComprobanteIngreso.aspx.cs" Inherits="CobranzaALC.Cobranza.Documentos.Formatos.Gastos.ComprobanteIngreso" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <h1 style="text-align: center; font-family: Verdana;">
                <strong>Ingreso de Gastos.</strong>
            </h1>
            <br />

            <table cellpadding="0" cellspacing="0" width="100%">
                <tr>
                    <td width="20%">Cliente</td>
                    <td width="80%">:
                        <asp:Label ID="lblCliente" runat="server" EnableViewState="False"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td width="20%">Rol</td>
                    <td width="80%">:
                        <asp:Label ID="lblRol" runat="server" EnableViewState="False"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td width="20%">Tribunal</td>
                    <td width="80%">:
                        <asp:Label ID="lblTribunal" runat="server" EnableViewState="False"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td width="20%">Rut Deudor</td>
                    <td width="80%">:
                        <asp:Label ID="lblRutDeudor" runat="server" EnableViewState="False"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td width="20%">Nombre Deudor</td>
                    <td width="80%">:
                        <asp:Label ID="lblNombreDeudor" runat="server" EnableViewState="False"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td width="20%">N° Operación</td>
                    <td width="80%">:
                        <asp:Label ID="lblNumeroOperacion" runat="server" EnableViewState="False"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td width="20%">N° Boleta / Comprobante</td>
                    <td width="80%">:
                        <asp:Label ID="lblNumeroBoleta" runat="server" EnableViewState="False"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td width="20%">N° Nómina</td>
                    <td width="80%">:
                        <asp:Label ID="lblNumeroNomina" runat="server" EnableViewState="False"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td width="20%">Fecha Nómina</td>
                    <td width="80%">:
                        <asp:Label ID="lblFechaNomina" runat="server" EnableViewState="False"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td width="20%">Proveedor</td>
                    <td width="80%">:
                        <asp:Label ID="lblProveedor" runat="server" EnableViewState="False"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td width="20%">Tipo de Gasto</td>
                    <td width="80%">:
                        <asp:Label ID="lblTipoGasto" runat="server" EnableViewState="False"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td width="20%">Monto</td>
                    <td width="80%">: $
                        <asp:Label ID="lblMonto" runat="server" EnableViewState="False"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td width="20%">Observación</td>
                    <td width="80%">:
                        <asp:Label ID="lblObservacion" runat="server" EnableViewState="False"></asp:Label>
                    </td>
                </tr>
                </table>
        </div>
    </form>
</body>
</html>
