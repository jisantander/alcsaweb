<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="DocuJuicio.aspx.cs" Inherits="CobranzaALC.Cobranza.Procesos.DocuJuicio" %>


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

            BuscarDirecciones('txtRutDeudor', 'txtDomicilioDeudor', 'hdfIdDomicilioDeudor')

            AsignarAutocompletar('txtRutRepresentanteUno', 'txtNombreRepresentanteUno', '', '');
            AsignarAutocompletar('txtRutRepresentanteDos', 'txtNombreRepresentanteDos', '', '');
            AsignarAutocompletar('txtRutEndosante', 'txtNombreEndosante', 'txtDomicilioEndosante', 'hdfIdDomicilioEndosante');

            // BuscarConceptos('txtTipoDocumento', 'hdfIdTipoDocumento', 'TIPOS_DOCUMENTOS');
            // BuscarConceptos('txtNotario', 'hdfIdNotario', 'NOTARIOS');
            // BuscarConceptos('txtLocalidadNotario', 'hdfIdLocalidadNotario', 'COMUNAS_NOTARIO');
            // BuscarConceptos('txtBanco', 'hdfIdBanco', 'BANCOS');

            $('.solo-lectura').prop('readonly', true);

            $('.ver-documento-fisico').click(function () {
                var ruta = '../Documentos/DescargarArchivo.aspx?id=' + $(this).attr('alt');
                var ventana = window.open(ruta, 'descarga_archivo', '');
                ventana.focus();
            });
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
                            <asp:Label ID="lblTitulo"
                                runat="server"></asp:Label>
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
                        <td style="width: 20%" class="letra">Domicilio Demandado</td>
                        <td style="width: 30%" class="letra">
                            <asp:TextBox ID="txtDomicilioDeudor" runat="server" ClientIDMode="Static" Width="95%" CssClass="solo-lectura"></asp:TextBox>
                            <asp:HiddenField ID="hdfIdDomicilioDeudor" runat="server" Value="0" />
                        </td>
                        <td style="width: 20%" class="letra">&nbsp;</td>
                        <td style="width: 30%" class="letra">&nbsp;</td>
                    </tr>
                    <tr>
                        <td class="barra-sub-titulo" colspan="4">Representantes o Avales</td>
                    </tr>
                    <tr>
                        <td style="width: 20%" class="letra">Rut</td>
                        <td style="width: 30%" class="letra">

                            <asp:TextBox ID="txtRutRepresentanteUno" runat="server" ClientIDMode="Static"></asp:TextBox>

                        </td>
                        <td style="width: 20%" class="letra">Nombre</td>
                        <td style="width: 30%" class="letra">

                            <asp:TextBox ID="txtNombreRepresentanteUno" runat="server" ClientIDMode="Static" Width="95%" CssClass="solo-lectura"></asp:TextBox>

                        </td>
                    </tr>
                    <tr>
                        <td style="width: 20%" class="letra">Rut</td>
                        <td style="width: 30%" class="letra">

                            <asp:TextBox ID="txtRutRepresentanteDos" runat="server" ClientIDMode="Static"></asp:TextBox>

                        </td>
                        <td style="width: 20%" class="letra">Nombre</td>
                        <td style="width: 30%" class="letra">

                            <asp:TextBox ID="txtNombreRepresentanteDos" runat="server" ClientIDMode="Static" Width="95%" CssClass="solo-lectura"></asp:TextBox>

                        </td>
                    </tr>
                    <tr>
                        <td class="barra-sub-titulo" colspan="4">Endosante</td>
                    </tr>
                    <tr>
                        <td style="width: 20%" class="letra">Rut</td>
                        <td style="width: 30%" class="letra">

                            <asp:TextBox ID="txtRutEndosante" runat="server" ClientIDMode="Static"></asp:TextBox>

                        </td>
                        <td style="width: 20%" class="letra">Nombre</td>
                        <td style="width: 30%" class="letra">

                            <asp:TextBox ID="txtNombreEndosante" runat="server" ClientIDMode="Static" Width="95%" CssClass="solo-lectura"></asp:TextBox>

                        </td>
                    </tr>
                    <tr>
                        <td style="width: 20%" class="letra">Dirección Endosante </td>
                        <td style="width: 30%" class="letra">

                            <asp:TextBox ID="txtDomicilioEndosante" runat="server" ClientIDMode="Static" Width="95%" CssClass="solo-lectura"></asp:TextBox>

                            <asp:HiddenField ID="hdfIdDomicilioEndosante" runat="server" Value="0" />

                        </td>
                        <td style="width: 20%" class="letra">&nbsp;</td>
                        <td style="width: 30%" class="letra">&nbsp;</td>
                    </tr>


                    <tr>
                        <td class="barra-sub-titulo" colspan="4">&nbsp;&nbsp;</td>
                    </tr>


                    <tr>
                        <td style="width: 20%" class="letra">Notario</td>
                        <td style="width: 30%" class="letra">

                            <asp:DropDownList ID="ddlNotarios" runat="server" Width="96%" DataTextField="Nombre" DataValueField="ID" >
                            </asp:DropDownList>

                        </td>
                        <td style="width: 20%" class="letra">Localidad Notario</td>
                        <td style="width: 30%" class="letra">

                            <asp:DropDownList ID="ddlLocalidadesNotarios" runat="server" Width="96%" DataTextField="Nombre" DataValueField="ID" >
                            </asp:DropDownList>
                        </td>
                    </tr>
                    <tr>
                        <td style="width: 20%" class="letra">Fecha Autorización Notario</td>
                        <td style="width: 30%" class="letra">
                            <asp:TextBox ID="txtFechaAutorizacionNotarial" runat="server" MaxLength="10"
                                CssClass="control-calendario"></asp:TextBox>
                        </td>
                        <td style="width: 20%" class="letra">Fecha Aceptación </td>
                        <td style="width: 30%" class="letra">

                            <asp:TextBox ID="txtFechaAceptacion" runat="server" MaxLength="10"
                                CssClass="control-calendario"></asp:TextBox>

                        </td>
                    </tr>


                    <tr>
                        <td style="width: 20%" class="letra">Título en que Consta la Deuda </td>
                        <td style="width: 30%" class="letra">

                            <asp:TextBox ID="txtTituloConstaDeuda" runat="server" Width="95%"></asp:TextBox>

                        </td>
                        <td style="width: 20%" class="letra">Fecha de La Deuda</td>
                        <td style="width: 30%" class="letra">

                            <asp:TextBox ID="txtFechaDeuda" runat="server" MaxLength="10" CssClass="control-calendario"></asp:TextBox>

                        </td>
                    </tr>


                    <tr>
                        <td style="width: 20%" class="letra">Banco</td>
                        <td style="width: 30%" class="letra">

                            <asp:DropDownList ID="ddlBancos" runat="server" Width="96%" DataTextField="Nombre" DataValueField="ID" >
                            </asp:DropDownList>

                        </td>
                        <td style="width: 20%" class="letra">N° Cta Cte</td>
                        <td style="width: 30%" class="letra">

                            <asp:TextBox ID="txtCtacte" runat="server"
                                Width="95%"></asp:TextBox>

                        </td>
                    </tr>


                    <tr>
                        <td style="width: 20%" class="letra">Serie</td>
                        <td style="width: 30%" class="letra">

                            <asp:TextBox ID="txtserie" runat="server"></asp:TextBox>

                        </td>
                        <td style="width: 20%" class="letra">Fecha de Giro o Emisión</td>
                        <td style="width: 30%" class="letra">

                            <asp:TextBox ID="txtFechaGiroEmision" runat="server" MaxLength="10"
                                CssClass="control-calendario"></asp:TextBox>

                        </td>
                    </tr>


                    <tr>
                        <td style="width: 20%" class="letra">Fecha Prescripción</td>
                        <td style="width: 30%" class="letra">

                            <asp:TextBox ID="txtfechaprescripcion" runat="server"
                                CssClass="control-calendario"></asp:TextBox>

                        </td>
                        <td style="width: 20%" class="letra">&nbsp;</td>
                        <td style="width: 30%" class="letra">

                            &nbsp;</td>
                    </tr>


                    <tr>
                        <td style="width: 20%" class="letra">Acta Protesto</td>
                        <td class="letra" colspan="3">

                            <asp:TextBox ID="txtActaProtesto" runat="server"
                                TextMode="MultiLine" Width="97%"
                                Rows="4"></asp:TextBox>

                        </td>
                    </tr>


                    <tr>
                        <td style="width: 20%" class="letra">Dirección Acta</td>
                        <td class="letra" colspan="3">

                            <asp:TextBox ID="txtDireccionActa" runat="server" MaxLength="80" Width="97%"></asp:TextBox>

                        </td>
                    </tr>


                    <tr>
                        <td style="width: 20%" class="letra">Observación</td>
                        <td class="letra" colspan="3">

                            <asp:TextBox ID="txtObservacion" runat="server"
                                TextMode="MultiLine" Width="97%"
                                Rows="4"></asp:TextBox>

                        </td>
                    </tr>


                    <tr>
                        <td class="barra-sub-titulo" colspan="4">Documentos</td>
                    </tr>


                    <tr>
                        <td style="width: 20%" class="letra">&nbsp;</td>
                        <td class="letra" colspan="3">
                            <asp:GridView ID="gvDocumentos" runat="server"
                                AutoGenerateColumns="False"
                                Width="100%"
                                CellPadding="4" ForeColor="#333333"
                                GridLines="None">
                                <Columns>
                                    <asp:TemplateField HeaderText="Tipo">
                                        <ItemTemplate>
                                            <asp:DropDownList ID="ddlTiposDocumentos" runat="server" DataTextField="Nombre" DataValueField="ID" DataSource="<%# ListarTiposDocumentos() %>" SelectedValue='<%# Bind("IdTipoDocumento") %>' Width="96%">
                                            </asp:DropDownList>
                                            <asp:HiddenField ID="hdfIdDocumentoJuicio" runat="server" Value='<%# Bind("ID") %>' />
                                        </ItemTemplate>
                                        <ItemStyle Width="25%" />
                                    </asp:TemplateField>

                                    <asp:TemplateField HeaderText="N° Documento">
                                        <ItemTemplate>
                                            <asp:TextBox ID="txtNroDocumento" runat="server" Text='<%# Bind("Nrodocumento") %>' Width="95%"></asp:TextBox>
                                        </ItemTemplate>
                                        <ItemStyle Width="25%" HorizontalAlign="Left" />
                                    </asp:TemplateField>

                                    <asp:TemplateField HeaderText="Monto">
                                        <ItemTemplate>
                                            <asp:TextBox ID="txtMonto" runat="server" Text='<%# Bind("Monto") %>' onKeyPress="return acceptNum(event)" Width="95%"></asp:TextBox>
                                        </ItemTemplate>
                                        <ItemStyle Width="25%" HorizontalAlign="Right" />
                                    </asp:TemplateField>

                                    <asp:TemplateField HeaderText="Fecha Vencimiento">
                                        <EditItemTemplate>
                                            <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
                                        </EditItemTemplate>
                                        <ItemTemplate>
                                            <asp:TextBox ID="txtFechaVencimiento" runat="server" CssClass="control-calendario" MaxLength="10" Text='<%# Eval("Fvencimiento", "{0:dd/MM/yyyy}") %>' Width="95%"></asp:TextBox>
                                        </ItemTemplate>
                                        <ItemStyle HorizontalAlign="Right" Width="25%" />
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
                        <td class="barra-sub-titulo" colspan="4">Documento DIGITALIZADO</td>
                    </tr>
                    <tr>
                        <td style="width: 20%" class="letra">Digitalizar</td>
                        <td class="letra" colspan="3">

                            <asp:FileUpload ID="filesubir" runat="server" Style="margin-left: 0px;" Width="96%" />
                            
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
                        <td colspan="4">
                            &nbsp;<asp:HiddenField ID="hdfIdCobranza" runat="server" Value="0" />
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
