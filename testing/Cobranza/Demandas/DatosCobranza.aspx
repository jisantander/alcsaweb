<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="DatosCobranza.aspx.cs" Inherits="CobranzaALC.Cobranza.Demandas.DatosCobranza" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <script type="text/javascript" src="../../js/jquery-1.10.2.min.js"></script>
    <link href="../../css/Demandas-1.0.1.css" rel="stylesheet" />
    <link href="../../css/alc_estilo.css" rel="stylesheet" />
    <link href="../../css/alc.css" rel="stylesheet" />

    <script type="text/javascript">
        $(document).ready(function () {
            $('#lstTiposDocumentos').height($('#tdCuerpo').height());

            $('.DOCUJUICIO').hide();
            $('.DOCUPAGARE').hide();
            $('.DOCUMUTUO').hide();
            $('.ESTANDARD1').hide();
            $('.ESTANDARD2').hide();
            $('.ESTANDARD3').hide();
            $('.ESTANDARD4').hide();
            $('.CUOTA_COLEGIO').hide();

            $('#btnGenerar').click(function () {
                window.location = 'Descargar.aspx?ruta=' + $('.listado-documentos').val() + '&id=' + $('#hdfIdCobranza').val() + '&tipo_id_doc=ID_COBRANZA';
            });
            $('#btnCancelar').click(function () {
                window.close();
            });
        });
    </script>
</head>
<body>
    <form id="form1" runat="server">
        <div id="divCabecera" class="barra-titulo">
            SELECCION DE DOCUMENTO DE DEMANDA
        </div>
        <div id="divCuerpo">
            <br />
            <asp:ListBox ID="lstTiposDocumentos" runat="server" CssClass="listado-documentos" Height="300px" Width="98%">
                <asp:ListItem class="DOCUPAGARE" Selected="True" Value="Formatos/DdaBbvaCorrigida2014PagareConExhorto.aspx">Pagaré con Exhorto</asp:ListItem>
                <asp:ListItem class="DOCUPAGARE" Value="Formatos/DdaBbvaCorrigida2014PagareSinExhorto.aspx">Pagaré sin Exhorto</asp:ListItem>
                <asp:ListItem class="DOCUPAGARE" Value="Formatos/DdaPagareBbvaConAvalConExhUf.aspx">Con Aval con Exhorto UF</asp:ListItem>
                <asp:ListItem class="DOCUPAGARE" Value="Formatos/DdaUfConExhorto.aspx">UF Con Exhorto</asp:ListItem>
                <asp:ListItem class="DOCUPAGARE" Value="Formatos/DdaUfSinExhorto.aspx">UF sin Exhorto</asp:ListItem>
                <asp:ListItem class="DOCUPAGARE" Value="Formatos/DdaVisaBbvaSinExhFlores.aspx">Visa sin Exhorto</asp:ListItem>

                <asp:ListItem Value="Formatos/01_CitacionConfesarDeudaCheque.aspx">Citación Confesar Deuda Cheque</asp:ListItem>
                <asp:ListItem Value="Formatos/02_CitacionConfesarDeudaFactura.aspx">Citación Confesar Deuda Factura</asp:ListItem>
                <asp:ListItem Value="Formatos/03_DemandaEjecutivaCheque.aspx">Demanda Ejecutiva Cheque</asp:ListItem>
                <asp:ListItem Value="Formatos/04_DemandaEjecutivaLetraDeCambio.aspx">Demanda Ejecutiva Letra de Cambio</asp:ListItem>
                <asp:ListItem Value="Formatos/05_DemandaEjecutivaPagareBbvaAvalYExhorto.aspx">Demanda Ejecutiva Pagaré Bbva Aval y Exhorto</asp:ListItem>
                <asp:ListItem Value="Formatos/06_DemandaEjecutivaPagareCreditoUniversitario.aspx">Demanda Ejecutiva Pagaré Crédito Universitario</asp:ListItem>
                <asp:ListItem Value="Formatos/07_GestionVoluntariaExtravioDeTitulos.aspx">Gestión Voluntaria Extravio de Títulos</asp:ListItem>
                <asp:ListItem Value="Formatos/08_OrdinariaMenorCuantiaCobroPesos.aspx">Ordinaria Menor Cuantía Cobro Pesos</asp:ListItem>
                <asp:ListItem Value="Formatos/09_PreparacionNotificacionProtestoDeCheque.aspx">Preparación Notificación Protesto de Cheque</asp:ListItem>
            </asp:ListBox>

            <asp:HiddenField ID="hdfIdCobranza" runat="server" ClientIDMode="Static" EnableViewState="False" Value="0" />
            <asp:HiddenField ID="hdfTipo" runat="server" ClientIDMode="Static" EnableViewState="False" />
        </div>
        <div id="divPiePagina" class="barra-sub-titulo">
            <input id="btnCancelar" class="boton" type="button" value="Cancelar" />
            <input id="btnGenerar" class="boton" type="button" value="Generar" />
        </div>
    </form>
</body>
</html>
