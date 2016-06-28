<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Mutuo.aspx.cs" Inherits="CobranzaALC.Cobranza.Procesos.Mutuo" %>

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

            if ($('#hdfIdEsCobranzaNueva').val() == '1')
                $('#btnCancelar').hide();

            $('.ver-documento-fisico').click(function () {
                var ruta = '../Documentos/DescargarArchivo.aspx?id=' + $(this).attr('alt');
                var ventana = window.open(ruta, 'descarga_archivo', '');
                ventana.focus();
            });

            // BuscarDirecciones('txtRutDeudor', 'txtDomicilioDeudor', 'hdfIdDomicilioDeudor')
            // AsignarAutocompletar('txtRutEndosante', 'txtNombreEndosante', 'txtDomicilioEndosante', 'hdfIdDomicilioEndosante');
            // BuscarConceptos('txtBanco', 'hdfIdBanco', 'BANCOS');

            BuscarConceptos('txtSubProducto', 'hdfIdSubProducto', 'SUBPRODUCTOS');

            $('.solo-lectura').prop('readonly', true);

            $('#txtDomicilioInmueble').autocomplete({
                source: function (request, response) {
                    $.ajax({
                        url: '/Servicios/ListadosAutocompletar.svc/ListarBienesRaicesDisponiblesMutuo',
                        data: {
                            rutDeudor: $('#txtRutDeudor').val(),
                            idBienRaizActual: $('#hdfIdDomicilioInmuebleActual').val(),
                            count: 15
                        },
                        dataType: 'json',
                        contentType: 'application/json; charset=utf-8',
                        success: function (data) {
                            response($.map(data.d, function (item) {
                                return {
                                    Direccion: item.Direccion,
                                    IdBienRaiz: item.IdBienRaiz,
                                    FechaEscritura: item.FechaEscritura,
                                    NombreNotario: item.NombreNotario,
                                    FojasInscripcion: item.FojasInscripcion,
                                    NumeroInscripcion: item.NumeroInscripcion,
                                    AnoInscripcion: item.AnoInscripcion,
                                    Comuna: item.Comuna,
                                    FojasHipotecario: item.FojasHipotecario,
                                    NumeroHipotecario: item.NumeroHipotecario,
                                    AnoHipotecario: item.AnoHipotecario
                                }
                            }))
                        },
                        error: function (XMLHttpRequest, textStatus, errorThrown) { }
                    });
                },
                minLength: 0,
                focus: function (event, ui) {
                    return AsignarValoresBienRaiz(ui);
                },
                select: function (event, ui) {
                    return AsignarValoresBienRaiz(ui);
                }
            }).focus(function () {
                $(this).autocomplete("search");
            }).data('ui-autocomplete')._renderItem = function (ul, item) {
                return $('<li>')
                .append('<a>' + item.Direccion + '</a>')
                .appendTo(ul);
            };
        });

        function AsignarValoresBienRaiz(ui) {
            $('#txtDomicilioInmueble').val(ui.item.Direccion);
            $('#hdfIdDomicilioInmueble').val(ui.item.IdBienRaiz);

            $('#txtNotario').val(ui.item.NombreNotario);
            $('#txtFojaInsc').val(ui.item.FojasInscripcion);
            $('#txtNroInsc').val(ui.item.NumeroInscripcion);
            $('#txtAnioInsc').val(ui.item.AnoInscripcion);
            $('#txtComunaConservador').val(ui.item.Comuna);
            $('#txtFojahip').val(ui.item.FojasHipotecario);
            $('#txtNrohip').val(ui.item.NumeroHipotecario);
            $('#txtaniohip').val(ui.item.AnoHipotecario);
            $('#txtFechaEscritura').val($.datepicker.formatDate('dd/mm/yy', new Date(parseInt(ui.item.FechaEscritura.substr(6)))));
            return false;
        }
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
                        <td class="barra-sub-titulo" colspan="4">MUTUO</td>
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
                        <td class="barra-sub-titulo" colspan="4">Bien Raiz</td>
                    </tr>
                    <tr>
                        <td style="width: 20%" class="letra">Dirección Inmueble Hip.</td>
                        <td style="width: 30%" class="letra">
                            <asp:TextBox ID="txtDomicilioInmueble" runat="server" ClientIDMode="Static" Width="95%" CssClass="solo-lectura" ReadOnly="True"></asp:TextBox>
                            <asp:HiddenField ID="hdfIdDomicilioInmueble" runat="server" Value="0" />
                        </td>
                        <td style="width: 20%" class="letra">&nbsp;</td>
                        <td style="width: 30%" class="letra">

                            <asp:HiddenField ID="hdfIdDomicilioInmuebleActual" runat="server" Value="0" />
                        </td>
                    </tr>
                    <tr>
                        <td style="width: 20%" class="letra">Fecha Escritura</td>
                        <td style="width: 30%" class="letra">
                            <asp:TextBox ID="txtFechaEscritura" runat="server"
                                ReadOnly="True" CssClass="solo-lectura"></asp:TextBox>
                        </td>
                        <td style="width: 20%" class="letra">Notaria</td>
                        <td style="width: 30%" class="letra">

                            <asp:TextBox ID="txtNotario" runat="server" ClientIDMode="Static" Width="95%" CssClass="solo-lectura"></asp:TextBox>

                        </td>
                    </tr>
                    <tr>
                        <td style="width: 20%" class="letra">Fojas Insc. Dom.</td>
                        <td style="width: 30%" class="letra">
                            <asp:TextBox ID="txtFojaInsc" runat="server"
                                ReadOnly="True" CssClass="solo-lectura"></asp:TextBox>
                        </td>
                        <td style="width: 20%" class="letra">N° Insc.</td>
                        <td style="width: 30%" class="letra">

                            <asp:TextBox ID="txtNroInsc" runat="server"
                                ReadOnly="True" CssClass="solo-lectura"></asp:TextBox>

                        </td>
                    </tr>
                    <tr>
                        <td style="width: 20%" class="letra">Año Insc. Dom.</td>
                        <td style="width: 30%" class="letra">
                            <asp:TextBox ID="txtAnioInsc" runat="server"
                                ReadOnly="True" CssClass="solo-lectura"></asp:TextBox>
                        </td>
                        <td style="width: 20%" class="letra">Comuna Conservador</td>
                        <td style="width: 30%" class="letra">

                            <asp:TextBox ID="txtComunaConservador" runat="server"
                                ReadOnly="True" Width="95%" CssClass="solo-lectura"></asp:TextBox>

                        </td>
                    </tr>
                    <tr>
                        <td style="width: 20%" class="letra">Fojas Hip.</td>
                        <td style="width: 30%" class="letra">
                            <asp:TextBox ID="txtFojahip" runat="server"
                                ReadOnly="True" CssClass="solo-lectura"></asp:TextBox>
                        </td>
                        <td style="width: 20%" class="letra">N° Hip.</td>
                        <td style="width: 30%" class="letra">

                            <asp:TextBox ID="txtNrohip" runat="server" ReadOnly="True" CssClass="solo-lectura"></asp:TextBox>

                        </td>
                    </tr>
                    <tr>
                        <td style="width: 20%" class="letra">Año Hip.</td>
                        <td style="width: 30%" class="letra">
                            <asp:TextBox ID="txtaniohip" runat="server"
                                ReadOnly="True" CssClass="solo-lectura"></asp:TextBox>
                        </td>
                        <td style="width: 20%" class="letra">&nbsp;</td>
                        <td style="width: 30%" class="letra">

                            &nbsp;</td>
                    </tr>
                    <tr>
                        <td class="barra-sub-titulo" colspan="4">&nbsp;</td>
                    </tr>
                    <tr>
                        <td style="width: 20%" class="letra">N° Documento</td>
                        <td style="width: 30%" class="letra">
                            <asp:TextBox ID="txtNroDocum" runat="server"></asp:TextBox>
                        </td>
                        <td style="width: 20%" class="letra">Sub Producto</td>
                        <td style="width: 30%" class="letra">

                            <asp:TextBox ID="txtSubProducto" runat="server" ClientIDMode="Static" Width="95%" CssClass="solo-lectura"></asp:TextBox>

                            <asp:HiddenField ID="hdfIdSubProducto" runat="server" Value="0" />

                        </td>
                    </tr>
                    <tr>
                        <td style="width: 20%" class="letra">Monto Cred. 1ª Esc. </td>
                        <td style="width: 30%" class="letra">
                            <asp:TextBox ID="txtMontoCred1esc" onKeyPress="return acceptNum(event)" runat="server"></asp:TextBox>
                        </td>
                        <td style="width: 20%" class="letra">Monto Cred. 2ª Esc.</td>
                        <td style="width: 30%" class="letra">
                            <asp:TextBox ID="txtMontoCred2esc" onKeyPress="return acceptNum(event)" runat="server"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td style="width: 20%" class="letra">Serie Letra Crédito</td>
                        <td style="width: 30%" class="letra">
                            <asp:TextBox ID="txtSerieLetraCred" runat="server"></asp:TextBox>
                        </td>
                        <td style="width: 20%" class="letra">Plazo Mutuo Meses</td>
                        <td style="width: 30%" class="letra">
                            <asp:TextBox ID="txtPlazoMutuoMeses" onKeyPress="return acceptNum(event)" runat="server"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td style="width: 20%" class="letra">Fecha 1º Vcto.</td>
                        <td style="width: 30%" class="letra">
                            <asp:TextBox ID="txtFecha1Vcto" runat="server"
                                CssClass="control-calendario"></asp:TextBox>
                        </td>
                        <td style="width: 20%" class="letra">Fecha Prescripción</td>
                        <td style="width: 30%" class="letra">

                            <asp:TextBox ID="txtFechaPrescripcion" runat="server"
                                CssClass="control-calendario"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td style="width: 20%" class="letra">Tasa Int.1ª Esc.</td>
                        <td style="width: 30%" class="letra">
                            <asp:TextBox ID="txtTasaInt1Esc" runat="server"></asp:TextBox>%</td>
                        <td style="width: 20%" class="letra">Tasa Int 2ª Esc.</td>
                        <td style="width: 30%" class="letra">
                            <asp:TextBox ID="txtTasaInt2Esc" runat="server"></asp:TextBox>%</td>
                    </tr>
                    <tr>
                        <td style="width: 20%" class="letra">Moneda</td>
                        <td style="width: 30%" class="letra">
                            <asp:DropDownList ID="moneda" runat="server">
                                <asp:ListItem Value="1">UF</asp:ListItem>
                                <asp:ListItem Value="2">PESOS</asp:ListItem>
                                <asp:ListItem Value="2">I.V.P</asp:ListItem>
                            </asp:DropDownList>
                        </td>
                        <td style="width: 20%" class="letra">&nbsp;</td>
                        <td style="width: 30%" class="letra">&nbsp;</td>
                    </tr>
                    <tr>
                        <td style="width: 20%" class="letra">Número 1º Div. Impago</td>
                        <td style="width: 30%" class="letra">
                            <asp:TextBox ID="txtNumero1Divimpago" onKeyPress="return acceptNum(event)" runat="server"></asp:TextBox>
                        </td>
                        <td style="width: 20%" class="letra">Número Ult. Div. Impago </td>
                        <td style="width: 30%" class="letra">
                            <asp:TextBox ID="txtNumeroUltDivImpago" onKeyPress="return acceptNum(event)" runat="server"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td style="width: 20%" class="letra">Fecha Liquidación</td>
                        <td style="width: 30%" class="letra">
                            <asp:TextBox ID="txtFechaLiquidacion" runat="server"
                                CssClass="control-calendario"></asp:TextBox>
                        </td>
                        <td style="width: 20%" class="letra">&nbsp;</td>
                        <td style="width: 30%" class="letra">&nbsp;</td>
                    </tr>
                    <tr>
                        <td style="width: 20%" class="letra">Monto Div. Adeudado (UF o IVP)</td>
                        <td style="width: 30%" class="letra">
                            <asp:TextBox ID="txtMontoDivAdeudadoUF" runat="server"></asp:TextBox>
                        </td>
                        <td style="width: 20%" class="letra">Monto Div. Adeudado ($)</td>
                        <td style="width: 30%" class="letra">
                            <asp:TextBox ID="txtMontoDivAdeudadoPESO" onKeyPress="return acceptNum(event)" runat="server"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td style="width: 20%" class="letra">Fecha Mora</td>
                        <td style="width: 30%" class="letra">
                            <asp:TextBox ID="txtFechaMora" runat="server"
                                CssClass="control-calendario"></asp:TextBox>
                        </td>
                        <td style="width: 20%" class="letra">&nbsp;</td>
                        <td style="width: 30%" class="letra">&nbsp;</td>
                    </tr>
                    <tr>
                        <td style="width: 20%" class="letra">Saldo Total Deuda (UF o IVP)</td>
                        <td style="width: 30%" class="letra">
                            <asp:TextBox ID="txtSaldoTotalDeudaUF" runat="server"></asp:TextBox>
                        </td>
                        <td style="width: 20%" class="letra">Total Adeudado ($)</td>
                        <td style="width: 30%" class="letra">
                            <asp:TextBox ID="txtTotalAdeudado" onKeyPress="return acceptNum(event)" runat="server"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td class="barra-sub-titulo" colspan="4">&nbsp;</td>
                    </tr>
                    <tr>
                        <td style="width: 20%" class="letra">Digitalizar Documento</td>
                        <td class="letra" colspan="3">
                            <asp:FileUpload ID="filesubir" runat="server" />
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
                            <asp:HiddenField ID="hdfIdMutuo" runat="server" Value="0" />
                            <asp:HiddenField ID="hdfIdEsCobranzaNueva" runat="server" Value="0" />
                        </td>
                    </tr>
                </tbody>
            </table>
        </div>
        <div id="divPiePagina" class="barra-sub-titulo">
            <input id="btnCancelar" class="boton" type="button" value="Cancelar" />
            <asp:Button ID="btnGuardar" runat="server" CssClass="boton" Text="Guardar y Generar"
                OnClick="btnGuardar_Click" />
        </div>
    </form>
</body>
</html>
