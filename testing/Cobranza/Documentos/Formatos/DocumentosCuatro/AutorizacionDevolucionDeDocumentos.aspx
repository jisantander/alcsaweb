<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AutorizacionDevolucionDeDocumentos.aspx.cs" Inherits="CobranzaALC.Cobranza.Documentos.Formatos.DocumentosCuatro.AutorizacionDevolucionDeDocumentos" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>

            <p style="text-align: left; font-family: Verdana;">
                AUTORIZACION QUE SEÑALA.-
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
                Que vengo en autorizar a mi procurador don _________________________________, cédula de identidad _________________________, para que retire los documentos fundantes ordenados devolver en autos, previa constancia en los libros y registros respectivos, bajo mi responsabilidad legal.-
            </p>
            <br />
            <p style="text-align: center; font-family: Verdana;">
                <strong>POR TANTO,
                </strong>
            </p>
            <br />
            <p style="text-align: justify; font-family: Verdana;">
                <strong>RUEGO A US.</strong> Acceder a la autorización para el retiro.-
            </p>
        </div>
    </form>
</body>
</html>
