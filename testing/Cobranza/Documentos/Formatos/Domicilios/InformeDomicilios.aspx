<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="InformeDomicilios.aspx.cs" Inherits="CobranzaALC.Cobranza.Documentos.Formatos.Domicilios.InformeDomicilios" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title></title>
    <link href="../../../css/alc2.css" rel="stylesheet" type="text/css" />
    <link href="../../../css/alc_estilo.css" rel="stylesheet" />
    <link href="../../../css/start/jquery-ui-1.10.3.custom.min.css" rel="stylesheet" />

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
    <style type="text/css">
        .boton {
            width: 90px;
            font-size: 14px;
            font-style: normal;
            height: 26px;
        }

        .auto-style1 {
            width: 966px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <p style="text-align: left; font-family: Verdana; font-size: small">
            <strong>SPS</strong>
        </p>
        <br />
        <p style="text-align: right; font-family: Verdana; font-size: small">
            <strong>
                <asp:Label ID="lb_fecha" runat="server" EnableViewState="False"></asp:Label></strong>

        </p>
        <br />
        <h2 style="text-align: center;"><strong>INFORME UBICACION DE DOMICILIO</strong></h2>
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
        <p style="text-align: justify; font-family: Verdana;" class="auto-style1">
            En relación al deudor señalado, se obtuvo de las búsquedas de domicilio, la siguiente dirección del demandado, en donde fue notificado.
        </p>
        <p style="text-align: justify; font-family: Verdana;">
            Dirección ubicada: calle:<asp:Label ID="lb_Calle" runat="server" EnableViewState="False"></asp:Label>
            &nbsp;número:&nbsp;<asp:Label ID="lb_Numero" runat="server" EnableViewState="False"></asp:Label>
            &nbsp;block:&nbsp;<asp:Label ID="lb_Block" runat="server" EnableViewState="False"></asp:Label>
            &nbsp;nº dpto:<asp:Label ID="lb_NDpto" runat="server" EnableViewState="False"></asp:Label>
            &nbsp;villa:&nbsp;<asp:Label ID="lb_Villa" runat="server" EnableViewState="False"></asp:Label>
            &nbsp;comuna:&nbsp;<asp:Label ID="lb_Comuna" runat="server" EnableViewState="False"></asp:Label>
        </p>
        <p style="text-align: justify; font-family: Verdana;">
            Se emite el presente informe, para los fines que el cliente estime conveniente.
        </p>
        <br />
        <br />
        <p style="text-align: center; font-family: Verdana;">
            <strong>ALC Asesoría Legal y Crediticia Ltda.</strong>
        </p>
        <p style="text-align: center; font-family: Verdana">
            &nbsp;
        <br />
            <br />
            <p style="text-align: center; font-family: Verdana">
                <asp:Button ID="btnImprimir" runat="server" CssClass="boton" Text="Imprimir" OnClientClick="javascript:imprimir()" />
            </p>
    </form>
</body>
</html>
