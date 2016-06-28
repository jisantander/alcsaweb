<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="EncargoTrabajoProcurador.aspx.cs" Inherits="CobranzaALC.Cobranza.Documentos.Formatos.DocumentosTres.EncargoTrabajoProcurador" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <p style="text-align: left; font-family: Verdana;">
            Santiago, <asp:Label ID="lblFecha" runat="server" EnableViewState="False"></asp:Label>
        </p>
        <br />
        <br />
        <p style="text-align: left; font-family: Verdana;">
            Señora
            <br />
            Evelyn Torres
            <br />
            Presente
        </p>
        <br />
        <br />
        <p style="text-align: justify; font-family: Verdana;">
            Por intermedio de la presente, mucho agradeceré a Ud. proceder a realizar el siguiente Trabajo en el  expediente que a continuación se indica:
        </p>
        <br />
        <p style="text-align: justify; font-family: Verdana;">
            <table cellpadding="0" cellspacing="0" border="1" style="width: 100%;">
                <tr>
                    <td style="width: 30%; font-weight: bold; text-align: center;">Juzgado</td>
                    <td style="width: 20%; font-weight: bold; text-align: center;">Rol</td>
                    <td style="width: 50%; font-weight: bold; text-align: center;">Partes</td>
                </tr>
                <tr>
                    <td style="width: 30%; text-align: center;">
                        <asp:Label ID="lblTribunal" runat="server" EnableViewState="False"></asp:Label>
                    </td>
                    <td style="width: 20%; text-align: center;">
                        <asp:Label ID="lblRol" runat="server" EnableViewState="False"></asp:Label>
                    </td>
                    <td style="width: 50%; text-align: center;">
                        <asp:Label ID="lblCliente" runat="server" EnableViewState="False"></asp:Label>
                        <br />
                        <asp:Label ID="lblDeudor" runat="server" EnableViewState="False"></asp:Label>
                    </td>
                </tr>
            </table>
        </p>
        <br />
        <p style="text-align: left; font-family: Verdana;">
            Rut: <asp:Label ID="lblDeudorUno" runat="server" EnableViewState="False"></asp:Label>
        </p>
        <br />
        <p style="text-align: left; font-family: Verdana;">
            Gestión a Realizar:_______________________________________________________
        </p>
        <br />
        <p style="text-align: left; font-family: Verdana;">
            <strong>Una vez efectuado, le solicito actualizar el sistema ALCSA y los sistemas del cliente.
            </strong>
        </p>
        <br />
        <br />
        <p style="text-align: justify; font-family: Verdana;">
            Atte.-
        </p>
        <br />
        <p style="text-align: center; font-family: Verdana;">
            <strong>José Santander Robles</strong>
            <br />
            Abogado
        </p>
    </form>
</body>
</html>
