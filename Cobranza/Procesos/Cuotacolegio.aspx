<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Cuotacolegio.aspx.cs" Inherits="CobranzaALC.Cobranza.Procesos.Cuotacolegio" %>


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

            AsignarAutocompletar('txtRutRepresentante1', 'txtNombreRepresentante1', '', '');
            AsignarAutocompletar('txtRutRepresentante2', 'txtNombreRepresentante2', '', '');

            BuscarConceptos('txtTipoDocumento', 'hdfIdTipoDocumento', 'TIPOS_DOCUMENTOS');
            BuscarConceptos('txtBanco', 'hdfIdBanco', 'BANCOS');
            BuscarConceptos('txtMeses', 'hdfIdMes', 'MESES');

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
                            <asp:Label ID="lblTitulo" runat="server"></asp:Label></td>
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
                        <td style="width: 20%" class="letra">Rut Demandado</td>
                        <td style="width: 30%" class="letra">
                            <asp:TextBox ID="txtRutDeudor" runat="server" ClientIDMode="Static" ReadOnly="True"></asp:TextBox>
                        </td>
                        <td style="width: 20%" class="letra">Nombre Demandado</td>
                        <td style="width: 30%" class="letra">
                            <asp:TextBox ID="txtNombreDeudor" runat="server" ClientIDMode="Static" Width="95%" CssClass="solo-lectura" ReadOnly="True"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td class="barra-sub-titulo" colspan="4">Representantes o Avales</td>
                    </tr>
                    <tr>
                        <td style="width: 20%" class="letra">Rut</td>
                        <td style="width: 30%" class="letra">

                            <asp:TextBox ID="txtRutRepresentante1" runat="server"></asp:TextBox>
                        </td>
                        <td style="width: 20%" class="letra">Nombre</td>
                        <td style="width: 30%" class="letra">

                            <asp:TextBox ID="txtNombreRepresentante1" runat="server" ReadOnly="true" Width="95%"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td style="width: 20%" class="letra">Rut</td>
                        <td style="width: 30%" class="letra">

                            <asp:TextBox ID="txtRutRepresentante2" runat="server"></asp:TextBox>
                        </td>
                        <td style="width: 20%" class="letra">Nombre</td>
                        <td style="width: 30%" class="letra">
                            <asp:TextBox ID="txtNombreRepresentante2" runat="server" ReadOnly="true" Width="95%"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td class="barra-sub-titulo" colspan="4">&nbsp;</td>
                    </tr>
                    <tr>
                        <td style="width: 20%" class="letra">N° Documento</td>
                        <td style="width: 30%" class="letra">
                            <asp:TextBox ID="txtnrodocumento" runat="server" Width="60%"></asp:TextBox>
                        </td>
                        <td style="width: 20%" class="letra">&nbsp;</td>
                        <td style="width: 30%" class="letra">&nbsp;</td>
                    </tr>
                    <tr>
                        <td style="width: 20%" class="letra">Tipo Documento</td>
                        <td style="width: 30%" class="letra">

                            <asp:TextBox ID="txtTipoDocumento" runat="server" ClientIDMode="Static" Width="95%" CssClass="solo-lectura"></asp:TextBox>

                            <asp:HiddenField ID="hdfIdTipoDocumento" runat="server" Value="0" />

                        </td>
                        <td style="width: 20%" class="letra">Código</td>
                        <td style="width: 30%" class="letra">
                            <asp:TextBox ID="txtcodigo" runat="server" Width="60%"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td style="width: 20%" class="letra">Banco</td>
                        <td style="width: 30%" class="letra">

                            <asp:TextBox ID="txtBanco" runat="server" ClientIDMode="Static" Width="95%" CssClass="solo-lectura"></asp:TextBox>

                            <asp:HiddenField ID="hdfIdBanco" runat="server" Value="0" />

                        </td>
                        <td style="width: 20%" class="letra">Serie</td>
                        <td style="width: 30%" class="letra">
                            <asp:TextBox ID="txtserie" runat="server" Width="60%"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td style="width: 20%" class="letra">N° Cuota</td>
                        <td style="width: 30%" class="letra">
                            <asp:TextBox ID="txtnrocuota" runat="server"></asp:TextBox>
                        </td>
                        <td style="width: 20%" class="letra">&nbsp;</td>
                        <td style="width: 30%" class="letra">&nbsp;</td>
                    </tr>
                    <tr>
                        <td style="width: 20%" class="letra">Fecha Mora</td>
                        <td style="width: 30%" class="letra">
                            <asp:TextBox ID="txtfechamora" runat="server" MaxLength="10" CssClass="control-calendario"></asp:TextBox>
                        </td>
                        <td style="width: 20%" class="letra">Fecha Ingreso</td>
                        <td style="width: 30%" class="letra">
                            <asp:TextBox ID="txtfechaingresocobranza" runat="server" MaxLength="10" CssClass="control-calendario"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td style="width: 20%" class="letra">Fecha Vencimiento</td>
                        <td style="width: 30%" class="letra">
                            <asp:TextBox ID="txtfechavcto" runat="server" MaxLength="10" CssClass="control-calendario"></asp:TextBox>
                        </td>
                        <td style="width: 20%" class="letra">Fecha Prescripción</td>
                        <td style="width: 30%" class="letra">
                            <asp:TextBox ID="txtfechaprescripcion" runat="server" CssClass="control-calendario"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td>Mes de la Mora</td>
                        <td>

                            <asp:TextBox ID="txtMeses" runat="server" ClientIDMode="Static" Width="95%" CssClass="solo-lectura"></asp:TextBox>

                            <asp:HiddenField ID="hdfIdMes" runat="server" Value="0" />

                        </td>
                        <td>Año Mora</td>
                        <td>
                            <asp:TextBox ID="txtaniomora" runat="server"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td style="width: 20%" class="letra">Monto Capital</td>
                        <td style="width: 30%" class="letra">

                            <asp:TextBox ID="txtmontocapital" runat="server"></asp:TextBox>
                        </td>
                        <td style="width: 20%" class="letra">Abonos a Cliente</td>
                        <td style="width: 30%" class="letra">
                            <asp:TextBox ID="txtabonos" runat="server"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td style="width: 20%" class="letra">Monto Intereses</td>
                        <td style="width: 30%" class="letra">
                            <asp:TextBox ID="txtmontointeres" runat="server"></asp:TextBox>
                        </td>
                        <td style="width: 20%" class="letra">Saldo Deuda</td>
                        <td style="width: 30%" class="letra">
                            <asp:TextBox ID="txtsaldodeuda" runat="server"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td style="width: 20%" class="letra">Observaciones</td>
                        <td class="letra" colspan="3">

                            <asp:TextBox ID="txtobservacion" runat="server"
                                Height="60px" TextMode="MultiLine" Width="97%"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td class="barra-sub-titulo" colspan="4">dOCUMENTO</td>
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
                            <asp:HiddenField ID="hdfIdCuotaColegio" runat="server" Value="0" />
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
