<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="DaCuentaDePagoYRetiro.aspx.cs" Inherits="CobranzaALC.Cobranza.Documentos.Formatos.DocumentosTres.DaCuentaDePagoYRetiro" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <p style="text-align: justify; font-family: Verdana;"><strong>DA CUENTA DE REGULARIZACIÓN DE DEUDA Y SOLICITA DEVOLUCION DE DOCUMENTO.</strong></p>
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
            Que, el demandado ha regularizado su deuda pagando las cuotas morosas, razón por la cual a quedado al día procediendo la desaceleración de la totalidad de la deuda exigida. En virtud de lo anterior, corresponde poner término al presente juicio y a SS solicito ordenar hacer devolución del pagaré materia de autos a esta parte.
        </p>
        <br />
        <p style="text-align: center; font-family: Verdana;">
            <strong>POR TANTO,
            </strong>
        </p>
        <br />
        <p style="text-align: left; font-family: Verdana;">
            <strong>RUEGO A US:</strong> se sirva tener presente la regularización del crédito y ordenar la devolución del título en los términos indicados.
        </p>
    </form>
</body>
</html>
