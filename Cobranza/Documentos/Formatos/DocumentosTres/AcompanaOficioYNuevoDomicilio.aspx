<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AcompanaOficioYNuevoDomicilio.aspx.cs" Inherits="CobranzaALC.Cobranza.Documentos.Formatos.DocumentosTres.AcompanaOficioYNuevoDomicilio" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <p style="text-align: justify; font-family: Verdana;"><strong>EN LO PRINCIPAL: ACOMPAÑA  RESPUESTA A OFICIO QUE SEÑALA; OTROSI: NUEVO DOMICILIO.-</strong></p>
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
        <p style="text-align: center; font-family: Verdana;">
            <strong>POR TANTO,</strong>
        </p>
        <br />
        <p style="text-align: left; font-family: Verdana;">
            <strong>RUEGO A US.</strong> Tener por acompañado el documento y por contestado el oficio señalado.-
        </p>
        <br />
        <p style="text-align: justify; font-family: Verdana;">
            <strong>OTROSI:</strong> Con el mérito de la respuesta al oficio indicado en lo principal, solicito a SS. tener presente que el nuevo domicilio del demandado corresponde a:____________________________________________, comuna de ______________________________________. Por lo que solicito tener por señalado el nuevo domicilio para todos los efectos legales.
        </p>
    </form>
</body>
</html>
