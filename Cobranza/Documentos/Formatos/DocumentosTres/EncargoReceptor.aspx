<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="EncargoReceptor.aspx.cs" Inherits="CobranzaALC.Cobranza.Documentos.Formatos.DocumentosTres.EncargoReceptor" %>

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
            Por intermedio de la presente, mucho agradeceré a Ud. proceder a retirar el expediente que a continuación se indica, con la finalidad de realizar la diligencia de _____________. 
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
            DOMICILIO QUE REGISTRA EN LA DEMANDA:_________________________________
        </p>
        <br />
        <p style="text-align: left; font-family: Verdana;">
            Una vez efectuado, le agradeceré confirmarme por esta misma vía, el retiro del expediente y la realización de la diligencia.
        </p>
        <br />
        <br />
        <p style="text-align: left; font-family: Verdana;">
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
