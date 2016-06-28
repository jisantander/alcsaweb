<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="EncargoBusquedaDeDomicilio.aspx.cs" Inherits="CobranzaALC.Cobranza.Documentos.Formatos.DocumentosTres.EncargoBusquedaDeDomicilio" %>

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
            Por intermedio de la presente, mucho agradeceré a Ud. proceder a realizar búsqueda de domicilios, para el juicio que a continuación detallo: 
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
            Rut: <asp:Label ID="lblRutDeudor" runat="server" EnableViewState="False"></asp:Label>
        </p>
        <br />
        <p style="text-align: left; font-family: Verdana;">
            DOMICILIO QUE REGISTRA EN LA DEMANDA:_________________________________
        </p>
        <br />
        <p style="text-align: justify; font-family: Verdana;">
            El resultado de esta búsqueda debe ser informado en el respectivo MANTENEDOR de DOMICILIOS y en el módulo de seguimiento de juicios, sea positivo o sea negativo, comunicando vía informe enviado por correo electrónico al procurador para su incorporación al expediente y contenedor.
        </p>
        <br />
        <p style="text-align: left; font-family: Verdana;">
            En caso de ser positiva la búsqueda Ud. deberá efectuar el cobro al cliente, en su oportunidad. 
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
