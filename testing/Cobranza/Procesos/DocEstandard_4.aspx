<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="DocEstandard_4.aspx.cs" Inherits="CobranzaALC.Cobranza.Procesos.DocEstandard_4" %>


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

            BuscarDirecciones('txtRutDeudor', 'txtDomicilioDeudor', 'hdfIdDomicilioDeudor')
            AsignarAutocompletar('txtRutDeudor2', 'txtNombreDeudor2', 'txtDomicilioDeudor2', 'hdfIdDomicilioDeudor2');
            AsignarAutocompletar('txtRutRepresentante', 'txtNombreRepresentante', 'txtDireccionRepresentante', '');

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
                        <td class="barra-sub-titulo" colspan="4">DOCUMENTO ESTÁNDARD 4</td>
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
                        <td style="width: 20%" class="letra">Domicilio Demandado</td>
                        <td style="width: 30%" class="letra">

                            <asp:TextBox ID="txtDomicilioDeudor" runat="server" ClientIDMode="Static" Width="95%" CssClass="solo-lectura"></asp:TextBox>

                            <asp:HiddenField ID="hdfIdDomicilioDeudor" runat="server" Value="0" />

                        </td>
                        <td style="width: 20%" class="letra">&nbsp;</td>
                        <td style="width: 30%" class="letra">&nbsp;</td>
                    </tr>
                    <tr>
                        <td class="barra-sub-titulo" colspan="4">Demandado 2</td>
                    </tr>
                    <tr>
                        <td style="width: 20%" class="letra">Rut</td>
                        <td style="width: 30%" class="letra">
                            <asp:TextBox ID="txtRutDeudor2" runat="server"></asp:TextBox>
                        </td>
                        <td style="width: 20%" class="letra">Nombre</td>
                        <td style="width: 30%" class="letra">
                            <asp:TextBox ID="txtNombreDeudor2" runat="server" ClientIDMode="Static" Width="95%" CssClass="solo-lectura"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td style="width: 20%" class="letra">Direccion</td>
                        <td style="width: 30%" class="letra">

                            <asp:TextBox ID="txtDomicilioDeudor2" runat="server" ClientIDMode="Static" Width="95%" CssClass="solo-lectura"></asp:TextBox>

                            <asp:HiddenField ID="hdfIdDomicilioDeudor2" runat="server" Value="0" />

                        </td>
                        <td style="width: 20%" class="letra">&nbsp;</td>
                        <td style="width: 30%" class="letra">&nbsp;</td>
                    </tr>
                    <tr>
                        <td class="barra-sub-titulo" colspan="4">Representante Legal</td>
                    </tr>
                    <tr>
                        <td style="width: 20%" class="letra">Rut</td>
                        <td style="width: 30%" class="letra">

                            <asp:TextBox ID="txtRutRepresentante" runat="server"></asp:TextBox>
                        </td>
                        <td style="width: 20%" class="letra">Nombre</td>
                        <td style="width: 30%" class="letra">

                            <asp:TextBox ID="txtNombreRepresentante" runat="server" Width="95%"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td style="width: 20%" class="letra">Domicilio</td>
                        <td style="width: 30%" class="letra">
                            <asp:TextBox ID="txtDireccionRepresentante" runat="server" Width="95%"></asp:TextBox>
                        </td>
                        <td style="width: 20%" class="letra">Profesión u Oficio</td>
                        <td style="width: 30%" class="letra">
                            <asp:TextBox ID="txtProfesionOficioRepresentante" runat="server" Width="95%"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td class="barra-sub-titulo" colspan="4">&nbsp;</td>
                    </tr>
                    <tr>
                        <td style="width: 20%" class="letra">Cuantía</td>
                        <td style="width: 30%" class="letra">
                            <asp:TextBox ID="txtcuantia" runat="server" onKeyPress="return acceptNum(event)" Width="95%"></asp:TextBox>
                        </td>
                        <td style="width: 20%" class="letra"></td>
                        <td style="width: 30%" class="letra"></td>
                    </tr>
                    <tr>
                        <td style="width: 20%" class="letra">Delito</td>
                        <td style="width: 30%" class="letra">
                            <asp:TextBox ID="txtDelito" runat="server" Width="95%"></asp:TextBox>
                        </td>
                        <td style="width: 20%" class="letra">Fecha Comisión Delito</td>
                        <td style="width: 30%" class="letra">
                            <asp:TextBox ID="txtFechaComisionDelito" runat="server" CssClass="control-calendario"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td style="width: 20%" class="letra">Situación Autor</td>
                        <td style="width: 30%" class="letra">
                            <asp:TextBox ID="txtsituacionautor" runat="server" Width="95%"></asp:TextBox>
                        </td>
                        <td style="width: 20%" class="letra"></td>
                        <td style="width: 30%" class="letra"></td>
                    </tr>
                    <tr>
                        <td style="width: 20%" class="letra">Relación de los Hechos</td>
                        <td class="letra" colspan="3">
                            <asp:TextBox ID="txtRelaciondeloshechos" runat="server"
                                TextMode="MultiLine" Width="97%"
                                Rows="5"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td style="width: 20%" class="letra">Petitorio</td>
                        <td class="letra" colspan="3">
                            <asp:TextBox ID="txtPetitorio" runat="server"
                                TextMode="MultiLine" Width="97%"
                                Rows="5"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td style="width: 20%" class="letra">Documentos Fundamentales</td>
                        <td class="letra" colspan="3">
                            <asp:TextBox ID="txtdocumentosfundantes" runat="server"
                                TextMode="MultiLine" Width="97%"
                                Rows="5"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td style="width: 20%" class="letra">Observación</td>
                        <td class="letra" colspan="3">
                            <asp:TextBox ID="txtObservacion" runat="server"
                                TextMode="MultiLine" Width="97%"
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
                        <td colspan="4">&nbsp;<asp:HiddenField ID="hdfIdDocumento4" runat="server" Value="0" />
                            <asp:HiddenField ID="hdfIdCobranza" runat="server" Value="0" />
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
