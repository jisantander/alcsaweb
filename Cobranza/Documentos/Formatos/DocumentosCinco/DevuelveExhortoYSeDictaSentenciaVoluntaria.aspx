<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="DevuelveExhortoYSeDictaSentenciaVoluntaria.aspx.cs" Inherits="CobranzaALC.Cobranza.Documentos.Formatos.DocumentosCinco.DevuelveExhortoYSeDictaSentenciaVoluntaria" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <p style="text-align: justify; font-family: Verdana;">
                <strong>EN LO PRINCIPAL: DEVUELVE EXHORTO DILIGENCIADO Y SOLICITA SE AGREGUE A LOS AUTOS; OTROSI: SE DICTE SENTENCIA DE EXTRAVIO.</strong>
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
                Que vengo en devolver exhorto debidamente diligenciado ante el Juzgado de Letras en lo Civil de Puente Alto, en el cual consta que el demandado fue notificado conforme __________________, el día __________________  de __________________ del año __________________. 
            </p>
            <br />
            <p style="text-align: center; font-family: Verdana;">
                <strong>POR TANTO,
                </strong>
            </p>
            <br />
            <p style="text-align: justify; font-family: Verdana;">
                <strong>RUEGO A US.</strong> tener por devuelto exhorto debidamente diligenciado y ordenar sea agregado a los autos.-
            </p>
            <br />
            <p style="text-align: justify; font-family: Verdana;">
                <strong>OTROSI:</strong> Habiendo transcurrido el plazo de 5 días para que el obligado al pago efectuare oposición y 30 días desde la publicación para que los terceros manifestaren lo correspondiente y de conformidad a lo establecido en los artículos 89 y 90 de la Ley 18.092.- solicito a SS. se sirva dictar sentencia declarando el extravío de la escritura de mutuo hipotecario endosable, declarando que el único titular y dueño es el Banco del Estado de Chile, quién podrá ejercer  todos los derechos que le corresponden como Acreedor y Portador Legítimo del documento. Al efecto la sentencia que se dicte con más copia autorizada de estos autos, reemplazará la única copia autorizada endosable del Mutuo referido para todos los efectos legales.-
            </p>
        </div>
    </form>
</body>
</html>
