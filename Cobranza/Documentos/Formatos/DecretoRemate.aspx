<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="DecretoRemate.aspx.cs" Inherits="CobranzaALC.Cobranza.Documentos.Formatos.DecretoRemate" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <p style="text-align: justify; font-family: Verdana;"><strong>SE DECRETE EL REMATE DEL INMUEBLE HIPOTECADO.-</strong></p>
        <p style="text-align: center; font-family: Verdana;">
            <strong>S. J. L. (<asp:Label ID="lblTribunal" runat="server" EnableViewState="False"></asp:Label>)</strong>
        </p>
        <br />
        <p style="text-align: justify; font-family: Verdana;">
            <strong>JOSÉ SANTANDER ROBLES</strong>, Abogado, en los autos caratulados &quot;
            <strong>
                <asp:Label ID="lblCliente" runat="server" EnableViewState="False"></asp:Label></strong> con <strong>
                    <asp:Label ID="lblDeudor" runat="server" EnableViewState="False"></asp:Label></strong>, Rol <strong>C-
                        <asp:Label ID="lblRol" runat="server" EnableViewState="False"></asp:Label></strong>, cuaderno principal a US., respetuosamente digo:
        </p>
        <p style="text-align: justify; font-family: Verdana;">
            Que vengo en solicitar a SS. se sirva decretar el remate del inmueble hipotecado, conforme lo disponen los artículo 103 y siguientes de la Ley general de Bancos.
        </p>
        <br />
        <p style="text-align: center; font-family: Verdana;">
            <strong>POR TANTO,</strong>
        </p>
        <br />
        <p style="text-align: left; font-family: Verdana;">
            <strong>RUEGO A US.</strong>, decretar el remate del inmueble hipotecado.
        </p>
    </form>
</body>
</html>
