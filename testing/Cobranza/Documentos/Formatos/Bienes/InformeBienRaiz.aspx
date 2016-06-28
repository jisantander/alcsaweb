<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="InformeBienRaiz.aspx.cs" Inherits="CobranzaALC.Cobranza.Documentos.Formatos.Bienes.InformeBienRaiz" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title></title>
    <style type="text/css">
        .boton {
            width: 90px;
            font-size: 14px;
            font-style: normal;
            height: 26px;
        }

        .auto-style1 {
            margin-bottom: 19px;
        }
    </style>
    <link href="../../css/alc_estilo.css" rel="stylesheet" />
    <link href="../../css/alc2.css" rel="stylesheet" />
    <link href="../../css/start/jquery-ui-1.10.3.custom.min.css" rel="stylesheet" />

    <script type="text/javascript" src="../../js/jquery-1.10.2.min.js"></script>
    <script type="text/javascript" src="../../js/jquery-ui-1.10.3.custom.min.js"></script>
    <script type="text/javascript">    
            <!--Jbaez: Imprimir bitacora 10-04-2014-->

    function imprimir() {
        if (window.print)
            window.print()
        else
            alert("Para imprimir presione Crtl+P.");
    }
    </script>
</head>
<body>
    <form id="form1" runat="server">
        <p style="text-align: left; font-family: Verdana; font-size: small">
            <strong>SPS</strong>
            <br />
        </p>
        <p style="text-align: right; font-family: Verdana; font-size: small">
            <strong>
                <asp:Label ID="lb_fecha" runat="server" EnableViewState="False"></asp:Label></strong>
            <br />
        </p>
        <h2 style="text-align: center;"><strong>INFORME BÚSQUEDAS DE  BIENES</strong></h2>
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
            <strong>Sucursal:</strong>
            <asp:Label ID="lblSucursal" runat="server" EnableViewState="False"></asp:Label>
        </p>
        <p style="text-align: justify; font-family: Verdana;">
            <strong>N° Operación:</strong>
            <asp:Label ID="lblNumeroOperacion" runat="server" EnableViewState="False"></asp:Label>
        </p>
        <br />
        <p style="text-align: justify; font-family: Verdana;">
            En relación al deudor señalado, se obtuvo de las búsquedas de bienes, la siguiente inscripción de propiedad en el Conservador de Bienes Raíces de 
               <asp:Label ID="lb_ConservadorBR" runat="server" EnableViewState="False"></asp:Label>
            , ubicada en
               <asp:Label ID="lb_Direccion" runat="server" EnableViewState="False"></asp:Label>
            &nbsp;<asp:Label ID="lb_ComunaDeudor" runat="server" EnableViewState="False"></asp:Label>
        </p>
        <p style="text-align: justify; font-family: Verdana;">
            La propiedad se encuentra debidamente inscrita a:
        </p>
        <p style="text-align: justify; font-family: Verdana;">
            <strong>FOJAS:</strong>
            <asp:Label ID="lb_Fojas" runat="server" EnableViewState="False"></asp:Label>
        </p>
        <p style="text-align: justify; font-family: Verdana;">
            <strong>Nº:</strong>
            <asp:Label ID="lb_Numero" runat="server" EnableViewState="False"></asp:Label>
        </p>
        <p style="text-align: justify; font-family: Verdana;">
            <strong>AÑO:</strong>
            <asp:Label ID="lb_Ano" runat="server" EnableViewState="False"></asp:Label>
        </p>
        <p style="text-align: justify; font-family: Verdana;" class="auto-style1">
            <strong>VIGENTE:</strong>
            <asp:Label ID="lb_Vigente" runat="server" EnableViewState="False"></asp:Label>
        </p>
        <p style="text-align: justify; font-family: Verdana;" class="auto-style1">
            Registro de propiedad          
        </p>

        <p style="text-align: justify; font-family: Verdana;">
            Se emite el presente informe, para los fines que el cliente estime conveniente.
        </p>
        <p style="text-align: justify; font-family: Verdana;">
            Se adjunta Copia de Inscripción de dominio Vigente y Certificado de Hipotecas y Gravámenes.
        </p>
        <br />
        <br />
        <p style="text-align: center; font-family: Verdana;">
            <strong>ALC Asesoría Legal y Crediticia Ltda.</strong>
        </p>
        <br />
        <br />
        <p style="text-align: center; font-family: Verdana">
            <asp:Button ID="btnImprimir" runat="server" CssClass="boton" Text="Imprimir" OnClientClick="javascript:imprimir()" />
        </p>
    </form>
</body>
</html>
