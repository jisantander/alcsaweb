<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="InformeBienMuebles.aspx.cs" Inherits="CobranzaALC.Cobranza.Documentos.Formatos.Bienes.InformeBienMuebles" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title></title>
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
    <style type="text/css">
        .boton {
            width: 90px;
            font-size: 14px;
            font-style: normal;
            height: 26px;
        }
    </style>
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
        <p style="text-align: center;">&nbsp;</p>
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


        <p style="text-align: center; font-family: Verdana;">
            <br />
        </p>
        <p style="text-align: justify; font-family: Verdana;">
            En relación al deudor señalado, se obtuvo de las búsquedas de bienes, la siguiente vehículo.
        </p>
        <br />
        <p style="text-align: justify; font-family: Verdana;">
            <strong>TIPO DE VEHICULO:</strong>
            <asp:Label ID="lb_TipoVehiculo" runat="server" EnableViewState="False"></asp:Label>
        </p>
        <p style="text-align: justify; font-family: Verdana;">
            <strong>PATENTE:</strong>
            <asp:Label ID="lb_Patente" runat="server" EnableViewState="False"></asp:Label>
        </p>
        <p style="text-align: justify; font-family: Verdana;">
            <strong>MARCA:</strong>
            <asp:Label ID="lb_Marca" runat="server" EnableViewState="False"></asp:Label>
        </p>
        <p style="text-align: justify; font-family: Verdana;">
            <strong>MODELO:</strong>
            <asp:Label ID="lb_Modelo" runat="server" EnableViewState="False"></asp:Label>
        </p>
        <p style="text-align: justify; font-family: Verdana;">
            <strong>AÑO:</strong>
            <asp:Label ID="lb_Ano" runat="server" EnableViewState="False"></asp:Label>
        </p>
        <p style="text-align: justify; font-family: Verdana;">
            Se emite el presente informe, para los fines que el cliente estime conveniente.
        </p>
        <p style="text-align: justify; font-family: Verdana;">
            Adjunto Certificado de Anotaciones y Vehículos Motorizados.
        </p>
        <br />
        <br />
        <p style="text-align: center; font-family: Verdana;">
            <strong>ALC Asesoría Legal y Crediticia Ltda.</strong>
        </p>
        <br />
        <br />
        <br />
        <p style="text-align: center; font-family: Verdana">

            <asp:Button ID="btnImprimir" runat="server" CssClass="boton" Text="Imprimir" OnClientClick="javascript:imprimir()" />

        </p>
    </form>
</body>
</html>
