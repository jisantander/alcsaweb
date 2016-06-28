<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ExtractoVoluntaria.aspx.cs" Inherits="CobranzaALC.Cobranza.Documentos.Formatos.DocumentosCinco.ExtractoVoluntaria" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <p style="text-align: center; font-family: Verdana;">
                <strong>NOTIFICACIÓN
            </strong>
            <br />
                <p style="text-align: justify; font-family: Verdana;">
                <strong><asp:Label ID="lblTribunal" runat="server" EnableViewState="False"></asp:Label></strong>
                    , Rol <strong>V  -<asp:Label ID="lblRol" runat="server" EnableViewState="False"></asp:Label></strong>, Banco Estado solicita se declare extraviada única copia endosable de la escritura de Mutuo Hipotecario Endosable, fecha __________________, protocolizado bajo el número __________________ por Notario Público de  __________________ don __________________. En la referida escritura Banco Estado otorgó a <strong>
                    <asp:Label ID="lblDeudor" runat="server" EnableViewState="False"></asp:Label></strong>, RUT Nº <strong>
                    <asp:Label ID="lblRutDeudor" runat="server" EnableViewState="False"></asp:Label></strong>, mutuo hipotecario endosable por __________________, más interés __________________  % anual, a pagarse en __________________ desde el día primero del mes subsiguiente a la fecha del contrato, todo ello de conformidad a las estipulaciones pactadas en la referida escritura. Secretario.
                </p>
        </div>
    </form>
</body>
</html>
