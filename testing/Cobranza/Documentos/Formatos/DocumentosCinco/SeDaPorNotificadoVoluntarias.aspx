<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="SeDaPorNotificadoVoluntarias.aspx.cs" Inherits="CobranzaALC.Cobranza.Documentos.Formatos.DocumentosCinco.SeDaPorNotificadoVoluntarias" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <p style="text-align: left; font-family: Verdana;">
                <strong>EN LO PRINCIPAL:</strong> SE DA POR NOTIFICADO EXPRESAMENTE DE LA SENTENCIA; <strong>PRIMER OTROSÍ: </strong>SE CERTIFIQUE EJECUTORIA.-
            </p>
            <br />
            <br />
            <p style="text-align: center; font-family: Verdana;">
                <strong>S. J. L. (<asp:Label ID="lblTribunal" runat="server" EnableViewState="False"></asp:Label>).-</strong>
            </p>
            <br />
            <p style="text-align: justify; font-family: Verdana;">
                <strong>JOSÉ SANTANDER ROBLES,</strong> por la parte demandante en los autos caratulados <strong>&quot;<asp:Label ID="lblCliente" runat="server" EnableViewState="False"></asp:Label>&nbsp;</strong>con <strong>
                    <asp:Label ID="lblDeudor" runat="server" EnableViewState="False"></asp:Label>&quot;</strong>, Rol Nº <strong>C-
                        <asp:Label ID="lblRol" runat="server" EnableViewState="False"></asp:Label></strong>, cuaderno principal a US. respetuosamente digo:
            </p>
            <br />
            <p style="text-align: justify; font-family: Verdana;">
                Que vengo en darme por expresamente notificado de la sentencia de autos y declaro que he tomado conocimiento de la misma para todos los efectos legales.- 
            </p>
            <br />
            <p style="text-align: center; font-family: Verdana;">
                <strong>POR TANTO,
            </strong>
            </p>
            <br />
            <p style="text-align: justify; font-family: Verdana;">
                <strong>RUEGO A US.</strong>, tenerme por notificado de la sentencia de autos. 
            </p>
            <br />
            <p style="text-align: justify; font-family: Verdana;">
                <strong>PRIMER OTROSÍ:</strong> Que vengo en solicitar a US. se sirva ordenar se certifique por el Sr. Secretario del Tribunal, como es efectivo que la sentencia de extravío de título a fojas 59, se encuentra ejecutoriada.
            </p>
        </div>
    </form>
</body>
</html>
