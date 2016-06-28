<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AmpliacionEmbargoInmueble.aspx.cs" Inherits="CobranzaALC.Cobranza.Documentos.Formatos.DocumentosSeis.AmpliacionEmbargoInmueble" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <p style="text-align: left; font-family: Verdana;">
                <strong>EN LO PRINCIPAL:</strong> AMPLIACION DE EMBARGO; <strong>EN OTROSI: </strong>ACOMPAÑA DOCUMENTOS; 
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
                        <asp:Label ID="lblRol" runat="server" EnableViewState="False"></asp:Label></strong>, a US. respetuosamente digo:
            </p>
            <br />
            <p style="text-align: justify; font-family: Verdana;">
                Consta de autos que en la causa se ha embargado al ejecutado, don ___________________________, los bienes muebles que guarnecen su domicilio, cuyo avalúo y tasación ascendente a $______________.- efectuado por el Receptor, es insuficiente considerando el capital, intereses y costas demandados.
            </p>
            <br />
            <p style="text-align: justify; font-family: Verdana;">
                En virtud de lo anterior y de acuerdo a lo establecido en el art. 456 del Código de Procedimiento Civil, solicito a SS., decretar la ampliación de embargo respecto de la propiedad del demandado consistente en el inmueble ubicado  en ________________________________________ de la comuna de __________________, el cual rola inscrito a fojas _____ Nº ______en el Registro de Propiedad del Conservador de Bienes Raíces de _________, correspondiente al año ________.-
            </p>
            <br />
            <p style="text-align: center; font-family: Verdana;">
                <strong>POR TANTO,</strong>
            </p>
            <br />
            <p style="text-align: justify; font-family: Verdana;">
                <strong>SOLICITO A US.:</strong> Decretar la ampliación del embargo al inmueble antes singularizado.
            </p>
            <p style="text-align: justify; font-family: Verdana;">
                <strong>EN OTROSI:</strong> Que con el objeto de acreditar lo pretendido en lo principal de esta presentación, vengo en acompañar, con citación:
            </p>
            <p style="text-align: justify; font-family: Verdana;">
                1.- Copia de inscripción de dominio vigente de la propiedad individualizada en lo principal de este cuerpo.
            </p>
            <p style="text-align: justify; font-family: Verdana;">
                2.- Certificado de avalúo fiscal del inmueble singularizado.
            </p>
        </div>
    </form>
</body>
</html>
