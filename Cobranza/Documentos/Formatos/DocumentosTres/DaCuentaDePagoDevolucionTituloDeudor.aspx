<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="DaCuentaDePagoDevolucionTituloDeudor.aspx.cs" Inherits="CobranzaALC.Cobranza.Documentos.Formatos.DocumentosTres.DaCuentaDePagoDevolucionTituloDeudor" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <p style="text-align: justify; font-family: Verdana;"><strong>DA CUENTA DE PAGO Y SOLICITA DEVOLUCION DE DOCUMENTO.</strong></p>
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
            Que, el demandado ha pagado la totalidad del crédito demandado en autos, razón por la cual vengo en dar cuenta de pago y solicitar a SS ordenar hacer devolución del pagaré materia de autos al demandado o a quien sus derechos represente.
        </p>
        <br />
        <p style="text-align: center; font-family: Verdana;">
            <strong>POR TANTO,
            </strong>
        </p>
        <br />
        <p style="text-align: left; font-family: Verdana;">
            <strong>RUEGO S US:</strong> se sirva  tener presente el pago, y ordenar la devolución del título en los términos indicados.
        </p>
    </form>
</body>
</html>
