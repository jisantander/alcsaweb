<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="SeGireCheque.aspx.cs" Inherits="CobranzaALC.Cobranza.Documentos.Formatos.DocumentosDos.SeGireCheque" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <p style="text-align: justify; font-family: Verdana;"><strong>SE GIRE CHEQUE.-</strong>
        </p>
        <br />
        <p style="text-align: center; font-family: Verdana;">
            <strong>S. J. L. (<asp:Label ID="lblTribunal" runat="server" EnableViewState="False"></asp:Label>).-</strong>
        </p>
        <br />
        <p style="text-align: justify; font-family: Verdana;">
            <strong>JOSÉ SANTANDER ROBLES,</strong> por la parte demandante en los autos caratulados <strong>&quot;<asp:Label ID="lblCliente" runat="server" EnableViewState="False"></asp:Label>&nbsp;</strong>con <strong>
                <asp:Label ID="lblDeudor" runat="server" EnableViewState="False"></asp:Label>&quot;</strong>, Rol Nº <strong>C-
                        <asp:Label ID="lblRol" runat="server" EnableViewState="False"></asp:Label></strong>, cuaderno _____________ a US. respetuosamente digo:
        </p>
        <br />
        <p style="text-align: justify; font-family: Verdana;">
            Que vengo en solicitar a Us. se sirva disponer de la señora Secretaria del tribunal, a fin que gire cheque a nombre de mi representado, Banco del Estado de Chile, por el producto de la subasta de autos.-
        </p>
        <br />
        <p style="text-align: center; font-family: Verdana;">
            <strong>POR TANTO, 
            </strong>
        </p>
        <br />
        <p style="text-align: justify; font-family: Verdana;">
            <strong>Ruego a US,</strong> Disponer el giro del cheque a mi representado.-
        </p>
    </form>
</body>
</html>
