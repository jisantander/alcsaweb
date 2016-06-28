<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="InformeBienRaiz_Negativa.aspx.cs" Inherits="CobranzaALC.Cobranza.Documentos.Formatos.Bienes.InformeBienRaiz_Negativa" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <p style="text-align: left; font-family: Verdana; font-size: small">
            <strong>SPS</strong>
        </p>
        <br />
        <p style="text-align: right; font-family: Verdana; font-size: small">
            <strong><asp:Label ID="lb_fecha" runat="server" EnableViewState="False"></asp:Label></strong>
        </p>
        <br />
        <h2 style="text-align: center;"><strong>INFORME BÚSQUEDAS DE  BIENES NEGATIVA</strong></h2>
        <br />
        <p style="text-align: justify; font-family: Verdana;">
            <strong>Cliente:</strong>
            <asp:Label ID="lb_Cliente" runat="server" EnableViewState="False"></asp:Label>
        </p>
        <p style="text-align: justify; font-family: Verdana;">
            <strong>Nombre Deudor:</strong>
            <asp:Label ID="lb_NombreDeudor" runat="server" EnableViewState="False"></asp:Label>
        </p>
        <p style="text-align: justify; font-family: Verdana;">
            <strong>Rut:</strong>
            <asp:Label ID="lb_RutDeudor" runat="server" EnableViewState="False"></asp:Label>
        </p>
        <p style="text-align: justify; font-family: Verdana;">
            <strong>Operación:</strong>
            <asp:Label ID="lb_NOperacion" runat="server" EnableViewState="False"></asp:Label>
        </p>
        <br />
        <p style="text-align: justify; font-family: Verdana;">
            En relación al deudor señalado, debo informar que efectuada las búsquedas de bienes en distintas bases de datos y en distintos Conversadores de Bienes Raíces, ellas resultaron infructuosas, por lo que le señalo que la persona antes individualizada, carece de bienes susceptibles de embargo.
        </p>
        <p style="text-align: right; font-family: Verdana;">
            __________________________________________
        </p>
        <p style="text-align: justify; font-family: Verdana;">
            Se emite el presente informe, para los fines que el cliente estime conveniente.
        </p>
        <br />
        <br />
        <br />
        <p style="text-align: center; font-family: Verdana;">
            <strong>ALC Asesoría Legal y Crediticia Ltda.</strong>
        </p>
    </form>
</body>
</html>
