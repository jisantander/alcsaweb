<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="DocuPagare.aspx.cs" Inherits="CobranzaALC.Cobranza.Procesos.DocuPagare" %>


<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>ALC Asesorìa Legal y Crediticía Ltda</title>

    <link href="../../css/alc2.css" rel="stylesheet" type="text/css" />
    <link href="../../css/alc_estilo.css" rel="stylesheet" />
    <link href="../../css/start/jquery-ui-1.10.3.custom.min.css" rel="stylesheet" />
    <link href="../../css/Demandas-1.0.1.css" rel="stylesheet" />

    <script src="../../js/funciones.js" type="text/javascript"></script>
    <script type="text/javascript" src="../../js/jquery-1.10.2.min.js"></script>
    <script type="text/javascript" src="../../js/jquery-ui-1.10.3.custom.min.js"></script>
    <script type="text/javascript" src="../../js/datepicker-es.js"></script>
    <script type="text/javascript" src="../../js/Demandas-1.0.1.js"></script>

    <script type="text/javascript">
        $(document).ready(function () {
            $('.control-calendario').datepicker({
                changeMonth: true,
                changeYear: true,
                maxDate: 0
            });

            $('#btnCancelar').click(function () {
                window.close();
            });

            $('.ver-documento-fisico').click(function () {
                var ruta = '../Documentos/DescargarArchivo.aspx?id=' + $(this).attr('alt');
                var ventana = window.open(ruta, 'descarga_archivo', '');
                ventana.focus();
            });

            if ($('#hdfIdEsCobranzaNueva').val() == '1')
                $('#btnCancelar').hide();

            BuscarDirecciones('txtRutDeudor', 'txtDireccionPagare', 'hdfIdDireccionPagare')
            AsignarAutocompletar('txtRutAval1', 'txtNombreAval1', 'txtDireccionAval1', 'hdfIdDireccionAval1');
            AsignarAutocompletar('txtRutAval2', 'txtNombreAval2', 'txtDireccionAval2', 'hdfIdDireccionAval2');

            BuscarConceptos('txtNotario', 'hdfIdNotario', 'NOTARIOS');
            BuscarConceptos('txtLocalidadNotario', 'hdfIdLocalidadNotario', 'COMUNAS_NOTARIO');
            BuscarConceptos('txtTipoMoneda', 'hdfIdTipoMoneda', 'TIPOS_MONEDAS');
            BuscarConceptos('txtComunaExhorto', 'hdfIdComunaExhorto', 'COMUNAS');

            $('.solo-lectura').prop('readonly', true);
        });
    </script>
</head>
<body>
    <form runat="server" id="Formulario">
        <div id="divCabecera" class="barra-titulo">
            SISTEMA DE COBRANZA
        </div>
        <div id="divCuerpo">
            <table cellspacing="0" cellpadding="0" border="0" style="width: 100%;">
                <tbody>
                    <tr>
                        <td class="barra-sub-titulo" colspan="4">
                            <asp:Label ID="lblTitulo" runat="server"></asp:Label>
                        </td>
                    </tr>

                    <tr>
                        <td style="width: 20%" class="letra">N° Operación</td>
                        <td style="width: 30%" class="letra">

                            <asp:TextBox ID="txtNumeroOperacion" runat="server" ClientIDMode="Static" ReadOnly="True"></asp:TextBox>

                        </td>
                        <td style="width: 20%" class="letra">&nbsp;</td>
                        <td style="width: 30%" class="letra">&nbsp;</td>
                    </tr>
                    <tr>
                        <td style="width: 20%" class="letra">Rut Cliente</td>
                        <td style="width: 30%" class="letra">

                            <asp:TextBox ID="txtRutCliente" runat="server" ClientIDMode="Static" ReadOnly="True"></asp:TextBox>

                        </td>
                        <td style="width: 20%" class="letra">Nombre Cliente</td>
                        <td style="width: 30%" class="letra">

                            <asp:TextBox ID="txtNombreCliente" runat="server" ClientIDMode="Static" Width="95%" CssClass="solo-lectura" ReadOnly="True"></asp:TextBox>

                        </td>
                    </tr>
                    <tr>
                        <td style="width: 20%" class="letra">Rut Deudor</td>
                        <td style="width: 30%" class="letra">
                            <asp:TextBox ID="txtRutDeudor" runat="server" ClientIDMode="Static" ReadOnly="True"></asp:TextBox>
                        </td>
                        <td style="width: 20%" class="letra">Nombre Deudor</td>
                        <td style="width: 30%" class="letra">
                            <asp:TextBox ID="txtNombreDeudor" runat="server" ClientIDMode="Static" Width="95%" CssClass="solo-lectura" ReadOnly="True"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td class="barra-sub-titulo" colspan="4">Pagaré</td>
                    </tr>


                    <tr>
                        <td style="width: 20%" class="letra">Número</td>
                        <td style="width: 30%" class="letra">
                            <asp:TextBox ID="txtNroPagare" runat="server"></asp:TextBox>
                        </td>
                        <td style="width: 20%" class="letra">Dirección</td>
                        <td style="width: 30%" class="letra">

                            <asp:TextBox ID="txtDireccionPagare" runat="server" ClientIDMode="Static" Width="95%" CssClass="solo-lectura"></asp:TextBox>

                            <asp:HiddenField ID="hdfIdDireccionPagare" runat="server" Value="0" />
                        </td>
                    </tr>


                    <tr>
                        <td class="barra-sub-titulo" colspan="4">REPRESENTANTE O AVAL 1</td>
                    </tr>


                    <tr>
                        <td style="width: 20%" class="letra">Rut</td>
                        <td style="width: 30%" class="letra">
                            <asp:TextBox ID="txtRutAval1" runat="server"></asp:TextBox>
                        </td>
                        <td style="width: 20%" class="letra">Nombre</td>
                        <td style="width: 30%" class="letra">
                            <asp:TextBox ID="txtNombreAval1" runat="server" ReadOnly="true" Width="95%" CssClass="solo-lectura"></asp:TextBox>
                        </td>
                    </tr>


                    <tr>
                        <td style="width: 20%" class="letra">Dirección</td>
                        <td style="width: 30%" class="letra">
                            <asp:TextBox ID="txtDireccionAval1" runat="server" ReadOnly="true" Width="95%" CssClass="solo-lectura"></asp:TextBox>
                            <asp:HiddenField ID="hdfIdDireccionAval1" runat="server" Value="0" />
                        </td>
                        <td style="width: 20%" class="letra">&nbsp;</td>
                        <td style="width: 30%" class="letra">&nbsp;</td>
                    </tr>


                    <tr>
                        <td class="barra-sub-titulo" colspan="4">Representante o aval 2</td>
                    </tr>


                    <tr>
                        <td>Rut</td>
                        <td>
                            <asp:TextBox ID="txtRutAval2" runat="server"></asp:TextBox>
                        </td>
                        <td>Nombre</td>
                        <td>
                            <asp:TextBox ID="txtNombreAval2" runat="server" ReadOnly="true" Width="95%" CssClass="solo-lectura"></asp:TextBox>
                        </td>
                    </tr>


                    <tr>
                        <td style="width: 20%" class="letra">Dirección</td>
                        <td style="width: 30%" class="letra">
                            <asp:TextBox ID="txtDireccionAval2" runat="server" ReadOnly="true" Width="95%" CssClass="solo-lectura"></asp:TextBox>
                            <asp:HiddenField ID="hdfIdDireccionAval2" runat="server" Value="0" />
                        </td>
                        <td style="width: 20%" class="letra">&nbsp;</td>
                        <td style="width: 30%" class="letra">&nbsp;</td>
                    </tr>


                    <tr>
                        <td class="barra-sub-titulo" colspan="4">&nbsp;</td>
                    </tr>


                    <tr>
                        <td style="width: 20%" class="letra">Monto Demanda</td>
                        <td style="width: 30%" class="letra">
                            <asp:TextBox ID="txtMontoDemanda" runat="server" MaxLength="10" onKeyPress="return acceptNum(event)"></asp:TextBox>
                        </td>
                        <td style="width: 20%" class="letra">Monto Total Deuda</td>
                        <td style="width: 30%" class="letra">
                            <asp:TextBox ID="txtMontoTotalDeuda" runat="server" MaxLength="10" onKeyPress="return acceptNum(event)"></asp:TextBox>
                        </td>
                    </tr>


                    <tr>
                        <td style="width: 20%" class="letra">Fecha Suscripción</td>
                        <td style="width: 30%" class="letra">
                            <asp:TextBox ID="txtFechaSuscripcion" runat="server" MaxLength="10" CssClass="control-calendario"></asp:TextBox>
                        </td>
                        <td style="width: 20%" class="letra">Suma Inicial Suscripción</td>
                        <td style="width: 30%" class="letra">
                            <asp:TextBox ID="txtSumaInicialSuscripcion" runat="server" MaxLength="10"></asp:TextBox>
                        </td>
                    </tr>


                    <tr>
                        <td style="width: 20%" class="letra">Tipo Moneda</td>
                        <td style="width: 30%" class="letra">

                            <asp:TextBox ID="txtTipoMoneda" runat="server" ClientIDMode="Static" Width="95%" CssClass="solo-lectura"></asp:TextBox>

                            <asp:HiddenField ID="hdfIdTipoMoneda" runat="server" Value="0" />

                        </td>
                        <td style="width: 20%" class="letra">&nbsp;</td>
                        <td style="width: 30%" class="letra">&nbsp;</td>
                    </tr>
                    <tr>
                        <td style="width: 20%" class="letra">N° Cuotas</td>
                        <td style="width: 30%" class="letra">
                            <asp:TextBox ID="txtNroCuotas" runat="server" MaxLength="10" onKeyPress="return acceptNum(event)" Width="95%"></asp:TextBox>
                        </td>
                        <td style="width: 20%" class="letra">Tasa de Interes</td>
                        <td style="width: 30%" class="letra">
                            <asp:TextBox ID="txtTasaInteres" runat="server" MaxLength="10"></asp:TextBox>
                        </td>
                    </tr>


                    <tr>
                        <td style="width: 20%" class="letra">Vcto. 1° Cuota</td>
                        <td style="width: 30%" class="letra">
                            <asp:TextBox ID="txtVcto1cuota" runat="server" MaxLength="10" CssClass="control-calendario"></asp:TextBox>
                        </td>
                        <td style="width: 20%" class="letra">Vsto. Siguientes Cuotas</td>
                        <td style="width: 30%" class="letra">
                            <asp:TextBox ID="txtVstoSgteCuotas" runat="server" MaxLength="10"></asp:TextBox>
                        </td>
                    </tr>


                    <tr>
                        <td style="width: 20%" class="letra">Monto 1° Cuota</td>
                        <td style="width: 30%" class="letra">
                            <asp:TextBox ID="txtMonto1cuota" runat="server" MaxLength="10"></asp:TextBox>
                        </td>
                        <td style="width: 20%" class="letra">Monto Última Cuota</td>
                        <td style="width: 30%" class="letra">
                            <asp:TextBox ID="txtMontoUltCuota" runat="server" MaxLength="10"></asp:TextBox>
                        </td>
                    </tr>


                    <tr>
                        <td style="width: 20%" class="letra">Fecha Mora</td>
                        <td style="width: 30%" class="letra">
                            <asp:TextBox ID="txtfechamora" runat="server" MaxLength="10" CssClass="control-calendario"></asp:TextBox>
                        </td>
                        <td style="width: 20%" class="letra">Fecha Prescripción</td>
                        <td style="width: 30%" class="letra">
                            <asp:TextBox ID="txtfechaprescripcion" runat="server" CssClass="control-calendario"></asp:TextBox>
                        </td>
                    </tr>


                    <tr>
                        <td style="width: 20%" class="letra">Fecha Liquidación</td>
                        <td style="width: 30%" class="letra">
                            <asp:TextBox ID="txtFechaLiquidacion" runat="server" MaxLength="10" CssClass="control-calendario"></asp:TextBox>
                        </td>
                        <td style="width: 20%" class="letra">Comuna Exhorto</td>
                        <td style="width: 30%" class="letra">

                            <asp:TextBox ID="txtComunaExhorto" runat="server" ClientIDMode="Static" Width="95%" CssClass="solo-lectura"></asp:TextBox>

                            <asp:HiddenField ID="hdfIdComunaExhorto" runat="server" Value="0" />

                        </td>
                    </tr>


                    <tr>
                        <td style="width: 20%" class="letra">Fecha Autorización Firma</td>
                        <td style="width: 30%" class="letra">
                            <asp:TextBox ID="txtFechaAutoriFirma" runat="server" MaxLength="10" CssClass="control-calendario"></asp:TextBox>
                        </td>
                        <td style="width: 20%" class="letra">&nbsp;</td>
                        <td style="width: 30%" class="letra">&nbsp;</td>
                    </tr>


                    <tr>
                        <td style="width: 20%" class="letra">Notario</td>
                        <td style="width: 30%" class="letra">

                            <asp:TextBox ID="txtNotario" runat="server" ClientIDMode="Static" Width="95%" CssClass="solo-lectura"></asp:TextBox>

                            <asp:HiddenField ID="hdfIdNotario" runat="server" Value="0" />

                        </td>
                        <td style="width: 20%" class="letra">Localidad Notario</td>
                        <td style="width: 30%" class="letra">

                            <asp:TextBox ID="txtLocalidadNotario" runat="server" ClientIDMode="Static" Width="95%" CssClass="solo-lectura"></asp:TextBox>

                            <asp:HiddenField ID="hdfIdLocalidadNotario" runat="server" Value="0" />
                        </td>
                    </tr>
                    <tr>
                        <td style="width: 20%" class="letra">Observación</td>
                        <td class="letra" colspan="3">
                            <asp:TextBox ID="txtObservacion" runat="server"
                                TextMode="MultiLine" Width="98%"
                                Rows="5"></asp:TextBox>

                        </td>
                    </tr>
                    <tr>
                        <td class="barra-sub-titulo" colspan="4">Documento</td>
                    </tr>
                    <tr>
                        <td style="width: 20%" class="letra">Documento Digitalizado</td>
                        <td class="letra" colspan="3">
                            <asp:FileUpload ID="filesubir" runat="server" Width="95%" />

                        </td>
                    </tr>
                    <tr>
                        <td style="width: 20%" class="letra">&nbsp;</td>
                        <td class="letra" colspan="3">

                            <asp:GridView ID="gvDocumentosFisicos" runat="server"
                                AutoGenerateColumns="False"
                                Width="100%"
                                CellPadding="4" ForeColor="#333333"
                                GridLines="None">
                                <Columns>
                                    <asp:BoundField DataField="Nombre" HeaderText="Nombre Archivo">
                                    <ItemStyle HorizontalAlign="Left" Width="90%" />
                                    </asp:BoundField>
                                    <asp:TemplateField>
                                        <ItemTemplate>
                                            <asp:Image ID="imgVerDocumento" CssClass="ver-documento-fisico" runat="server" AlternateText='<%# Bind("ID") %>' ImageUrl="~/images/iconos/Buscar.png" style="cursor:pointer;" />
                                        </ItemTemplate>
                                        <ItemStyle Width="10%" HorizontalAlign="Center" />
                                    </asp:TemplateField>
                                </Columns>

                                <HeaderStyle CssClass="cabezabrilla" />
                                <RowStyle BackColor="#EFF3FB" />
                                <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                                <PagerStyle BackColor="#2461BF" ForeColor="White" />
                                <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                                <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                                <EditRowStyle BackColor="#2461BF" />
                                <AlternatingRowStyle BackColor="White" />
                            </asp:GridView>
                            
                        </td>
                    </tr>
                    <tr>
                        <td colspan="4">&nbsp;<asp:HiddenField ID="hdfIdCobranza" runat="server" Value="0" />
                            <asp:HiddenField ID="hdfIdDocuPagare" runat="server" Value="0" />
                            <asp:HiddenField ID="hdfIdEsCobranzaNueva" runat="server" Value="0" />
                        </td>
                    </tr>
                </tbody>
            </table>
        </div>
        <div id="divPiePagina" class="barra-sub-titulo">
            <input id="btnCancelar" class="boton" type="button" value="Cancelar" />
            <asp:Button ID="btnGuardar" runat="server" CssClass="boton" Text="Guardar y Generar" OnClick="btnGuardar_Click" />
        </div>
    </form>
</body>
</html>

