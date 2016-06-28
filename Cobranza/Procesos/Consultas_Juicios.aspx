<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Consultas_Juicios.aspx.cs" Inherits="CobranzaALC.Cobranza.Procesos.Consultas_Juicios" %>


<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>ALC Asesorìa Legal y Crediticía Ltda</title>
    <link href="../../css/alc2.css" rel="stylesheet" type="text/css" />
    <link href="../../css/alc_estilo.css" rel="stylesheet" />
    <link href="../../css/start/jquery-ui-1.10.3.custom.min.css" rel="stylesheet" />

    <script src="../../js/funciones.js" type="text/javascript"></script>

    <script type="text/javascript" src="../../js/jquery-1.10.2.min.js"></script>
    <script type="text/javascript" src="../../js/jquery-ui-1.10.3.custom.min.js"></script>

    <script language="javascript" type="text/javascript">
        $(document).ready(function () {
            $('#btnGuardarComentario').hide();
            $('#divTabs').tabs();
            $('#btnPoderJudicial').click(function () {
                window.open('http://www.pjud.cl/', '', '');
            });

            $('#divAgregarComentario').dialog({
                resizable: false,
                autoOpen: false,
                modal: true,
                height: 300,
                width: 600,
                modal: true,
                appendTo: 'form',
                buttons: {
                    Guardar: function () {
                        $('#btnGuardarComentario').click();
                        $(this).dialog('close');
                    },
                    Cancelar: function () {
                        $(this).dialog('close');
                    }
                }
            });

            $('#divMensaje').dialog({
                resizable: false,
                autoOpen: false,
                height: 200,
                width: 400,
                modal: true,
                buttons: {
                    Cerrar: function () {
                        $(this).dialog('close');
                    }
                }
            });

            if ($('#lblMensaje').html() != '')
                $('#divMensaje').dialog('open');
        });

        function AgregarComentario() {
            $('#divAgregarComentario').dialog('open');
        }

        // 'MostrarDocuPagareConsulta.aspx?Codigo=' + idcobranza;
        // 'MostrarDocuJuicioConsulta.aspx?Codigo=' + idcobranza;
        // 'MostrarDocuMutuoConsula.aspx?Codigo=' + idcobranza;
        // 'MostrarDocuEstandard1Consula.aspx?Codigo=' + idcobranza;
        // 'MostrarDocuEstandard2Consula.aspx?Codigo=' + idcobranza;
        // 'MostrarDocuEstandard3Consula.aspx?Codigo=' + idcobranza;
        // 'MostrarDocuEstandard4Consula.aspx?Codigo=' + idcobranza;

        // 'MostrarActividades.aspx?Codigo=' + valor + '&tipo=' + tipo;
        // 'MostrarfonosDeudor.aspx';
        // '/cobranza/gastos/MostrarDetalleGastos.aspx?Codigo=' + valor;
        // 'MostrarDomicilios.aspx?cerrar=1&deudor=' + deudor;
        // 'MostrarBienRaiz.aspx?cerrar=1&deudor=' + deudor;
        //  '../ConsultaEspecial/BienMueble.aspx?cerrar=1&rutdeudor=' + deudor;

    </script>

</head>
<body>

    <form id="form1" runat="server">
        <table border="0" style="width: 100%">
            <tr>
                <td class="barra-titulo" colspan="4">SISTEMA DE COBRANZA<br />
                    Consulta Individual de Cobranza</td>
            </tr>
            <tr>
                <td class="barra-sub-titulo" colspan="4">Antecedentes del Deudor</td>
            </tr>
            <tr>
                <td align="left" style="width: 15%">Deudor</td>
                <td align="left" style="width: 35%">
                    <asp:TextBox ID="txtDeudor" runat="server" ReadOnly="true" Width="95%"></asp:TextBox>
                </td>
                <td align="left" style="width: 15%">Rut</td>
                <td align="left" style="width: 35%">
                    <asp:TextBox ID="txtRutdeudor" runat="server" ReadOnly="true" Width="95%"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td align="left" class="barra-sub-titulo" colspan="4">Antecedentes de la cobranza</td>
            </tr>
            <tr>
                <td align="left" style="width: 15%">N° Operación</td>
                <td align="left" style="width: 35%">
                    <asp:TextBox ID="txtNroOperacion" runat="server" ReadOnly="true" Width="95%"></asp:TextBox>
                </td>
                <td align="left" style="width: 15%">&nbsp;</td>
                <td align="left" style="width: 35%">
                    &nbsp;</td>
            </tr>
            <tr>
                <td align="left" style="width: 15%">Cliente</td>
                <td align="left" style="width: 35%">
                    <asp:TextBox ID="txtNombreCliente" runat="server" ReadOnly="true" Width="95%"></asp:TextBox>
                </td>
                <td align="left" style="width: 15%">Estado</td>
                <td align="left" style="width: 35%">
                    <asp:TextBox ID="txtEstado" runat="server" ReadOnly="true"
                        Width="95%"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td align="left" style="width: 15%">Procedimiento</td>
                <td align="left" style="width: 35%">
                    <asp:TextBox ID="txtProcedimiento" runat="server" ReadOnly="true" Width="95%"></asp:TextBox>
                </td>
                <td align="left" style="width: 15%">Materia</td>
                <td align="left" style="width: 35%">
                    <asp:TextBox ID="txtMateria" runat="server" ReadOnly="true" Width="95%"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td align="left" style="width: 15%">Producto</td>
                <td align="left" style="width: 35%">
                    <asp:TextBox ID="txtProducto" runat="server" ReadOnly="true" Width="95%"></asp:TextBox>
                </td>
                <td align="left" style="width: 15%">Etapa</td>
                <td align="left" style="width: 35%">
                    <asp:TextBox ID="txtEtapa" runat="server" ReadOnly="true" Width="95%"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td align="left" style="width: 15%">Trámite</td>
                <td align="left" style="width: 35%">
                    <asp:TextBox ID="txttramite" runat="server" ReadOnly="true" Width="95%"></asp:TextBox>
                </td>
                <td align="left" style="width: 15%">Fecha Trámite</td>
                <td align="left" style="width: 35%">
                    <asp:TextBox ID="txtFechaTramite" runat="server" ReadOnly="true" Width="95%"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td align="left" style="width: 15%">Jugado</td>
                <td align="left" style="width: 35%">
                    <asp:TextBox ID="txtJuzgado" runat="server" ReadOnly="true" Width="95%"></asp:TextBox>
                </td>
                <td align="left" style="width: 15%">Rol-Rit</td>
                <td align="left" style="width: 35%">
                    <asp:TextBox ID="txtRol" runat="server" ReadOnly="true" Width="95%"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td align="left" style="width: 15%">Abogado</td>
                <td align="left" style="width: 35%">
                    <asp:TextBox ID="txtAbogado" runat="server" ReadOnly="true" Width="95%"></asp:TextBox>
                </td>
                <td align="left" style="width: 15%">Procurador</td>
                <td align="left" style="width: 35%">
                    <asp:TextBox ID="txtProcurador" runat="server" ReadOnly="true" Width="95%"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td align="left" colspan="4">
                    <div id="divTabs">
                        <ul>
                            <li><a href="#divDetalleDeuda">Deuda</a></li>
                            <li><a href="#divComentariosCallCenter">Gestión Extra-Judicial</a></li>
                            <li><a href="#divDomicilios">Domicilios</a></li>
                            <li><a href="#divTelefonos">Teléfonos</a></li>
                            <li><a href="#divBienesRaices">Bienes Raices</a></li>
                            <li><a href="#divBienesMuebles">Bienes Muebles</a></li>
                            <li><a href="#divObservacionesEstado">Obs. Cobranza</a></li>
                            <li><a href="#divDetalleGastos">Detalle Gastos</a></li>
                            <li><a href="#divActividadesJudiciales">Actividades Judiciales</a></li>
                            <li><a href="#divDocumentosCobranza">Documento Cobranza</a></li>
                        </ul>
                        <div id="divDetalleDeuda">
                            <table border="0" style="width: 100%">
                                <tr>
                                    <td class="barra-sub-titulo">Deuda</td>
                                </tr>
                                <tr>
                                    <td>
                                        <table border="0" style="width: 100%">
                                            <tr>
                                                <td style="width: 15%">Monto Deuda</td>
                                                <td style="width: 85%">
                                                    <asp:Label ID="lblMontoDeuda" runat="server" Font-Bold="True" Font-Size="Small"></asp:Label>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td style="width: 15%">Monto Intereses</td>
                                                <td style="width: 85%">

                                                    <asp:Label ID="lblMontoIntereses" runat="server" Font-Bold="True" Font-Size="Small"></asp:Label>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td style="width: 15%">Monto Honorarios</td>
                                                <td style="width: 85%">

                                                    <asp:Label ID="lblMontoHonorarios" runat="server" Font-Bold="True" Font-Size="Small"></asp:Label>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td style="width: 15%">Descuentos</td>
                                                <td style="width: 85%">

                                                    <asp:Label ID="lblMontoDescuentos" runat="server" Font-Bold="True" Font-Size="Small"></asp:Label>
                                                &nbsp;<asp:Label ID="lblPorcentajeDescuentos" runat="server" Font-Bold="True" Font-Size="Small"></asp:Label>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td style="width: 15%">Gastos</td>
                                                <td style="width: 85%">

                                                    <asp:Label ID="lblMontoGastos" runat="server" Font-Bold="True" Font-Size="Small"></asp:Label>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td style="width: 15%">Monto Final</td>
                                                <td style="width: 85%">

                                                    <asp:Label ID="lblMontoFinal" runat="server" Font-Bold="True" Font-Size="Small" ForeColor="#CC0000"></asp:Label>
                                                </td>
                                            </tr>
                                        </table>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <asp:GridView ID="gvLetras" runat="server"
                                            PageSize="100"
                                            AutoGenerateColumns="False"
                                            CellPadding="4" ForeColor="#333333"
                                            GridLines="None" Width="100%">
                                            <Columns>
                                                <asp:TemplateField HeaderText="Tipo Doc.">
                                                    <HeaderStyle Wrap="true"></HeaderStyle>
                                                    <ItemStyle Wrap="false"></ItemStyle>
                                                    <ItemTemplate>
                                                        (<asp:Label ID="lblcuota" Visible="true" runat="server" Text='<%# Bind("idcuotacolegio") %>'></asp:Label>)    
                                                            <asp:Label ID="lblCodigo" runat="server" Text='<%# Bind("DescProducto") %>'></asp:Label>
                                                        <asp:HiddenField ID="hdfPorcentajeDescuentoDeuda" runat="server" Value='<%# Eval("PorcentajeDescuentoDeuda", "{0:N2}") %>' />
                                                    </ItemTemplate>
                                                </asp:TemplateField>

                                                <asp:BoundField DataField="NroDocumento" HeaderText="N° Doc" />
                                                <asp:BoundField DataField="Monto" HeaderText="Monto" DataFormatString="{0:N0}" HtmlEncode="False" />
                                                <asp:BoundField DataField="Fvcto" HeaderText="Fecha Vcto." DataFormatString="{0:dd-MM-yyyy}" HtmlEncode="False" />
                                                <asp:BoundField DataField="DiasMora" HeaderText="Dias Mora Acu." />
                                                <asp:BoundField DataField="Interes" HeaderText="Intereses" DataFormatString="{0:N0}" HtmlEncode="False" />
                                                <asp:BoundField DataField="IntAdicional" HeaderText="Intereses Adic." DataFormatString="{0:N0}" HtmlEncode="False" />
                                                <asp:BoundField DataField="Honorarios" HeaderText="Honorarios" DataFormatString="{0:N0}" HtmlEncode="False" />
                                                <asp:BoundField DataField="DescHonorario" HeaderText="Desc. Honorarios" DataFormatString="{0:N0}" HtmlEncode="False" />
                                                <asp:BoundField DataField="DescInteres" HeaderText="Desc. Intereses" DataFormatString="{0:N0}" HtmlEncode="False" />
                                                <asp:BoundField DataField="OtrosDesc" HeaderText="Otros Desc." DataFormatString="{0:N0}" HtmlEncode="False" />
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
                                    <td class="barra-sub-titulo">
                                        Abonos realizados en ALC</td>
                                </tr>
                                <tr>
                                    <td>
                                        <asp:GridView ID="gvAbonosRealizados" runat="server"
                                            EmptyDataText="NO SE ENCONTRARON REGISTROS"
                                            PageSize="500"
                                            AutoGenerateColumns="False"
                                            Width="100%"
                                            CellPadding="4" ForeColor="#333333"
                                            GridLines="None" Style="margin-right: 0px">
                                            <Columns>
                                                <asp:BoundField DataField="concepto" HeaderText="Concepto Abono" />
                                                <asp:BoundField DataField="montoabono" HeaderText="Monto Pagado" DataFormatString="$ {0:N0}" HtmlEncode="False" />
                                                <asp:BoundField DataField="fecha" HeaderText="Fecha Comprobante" DataFormatString="{0:dd-MM-yyyy}" HtmlEncode="False" />
                                                <asp:BoundField DataField="moneda" HeaderText="Tipo Moneda" />
                                                <asp:BoundField DataField="fechapago" HeaderText="Última Fecha Pago" DataFormatString="{0:dd-MM-yyyy}" HtmlEncode="False" />
                                                <asp:BoundField DataField="boleta" HeaderText="Boleta Honorarios" />
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
                                    <td class="barra-sub-titulo">
                                        Cheques Ingresados</td>
                                </tr>
                                <tr>
                                    <td>
                                        <asp:GridView ID="gvChequesIngresados" runat="server"
                                            PageSize="100"
                                            AutoGenerateColumns="False"
                                            Width="100%"
                                            CellPadding="4" ForeColor="#333333"
                                            GridLines="None" EmptyDataText="NO SE ENCONTRARON REGISTROS">
                                            <Columns>
                                                <asp:BoundField DataField="id_abono_comprobante" HeaderText="N° Comprobante" />
                                                <asp:BoundField DataField="fpago" HeaderText="Fecha Pago" DataFormatString="{0:dd-MM-yyyy}" HtmlEncode="False" />
                                                <asp:BoundField DataField="nrocheque" HeaderText="N° Cheque" />
                                                <asp:BoundField DataField="serie" HeaderText="Serie" />
                                                <asp:BoundField DataField="montoabono" HeaderText="Monto Abono" DataFormatString="$ {0:N0}" HtmlEncode="False" />
                                                <asp:BoundField DataField="estado" HeaderText="Liberado" />
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
                            </table>
                        </div>
                        <div id="divComentariosCallCenter">
                            <table border="0" style="width: 100%">
                                <tr>
                                    <td class="barra-sub-titulo">Gestión Extra-Judicial</td>
                                </tr>
                                <tr>
                                    <td align="right">
                                        <asp:Button ID="btnAgregarComentarioManual" runat="server" CssClass="boton" OnClick="btnAgregarComentarioManual_Click" Text="Agregar Comentario" />
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <asp:GridView ID="gvComentariosCallCenter" runat="server"
                                            AutoGenerateColumns="False"
                                            Width="100%"
                                            CellPadding="4" ForeColor="#333333"
                                            EmptyDataText="NO SE ENCONTRARON REGISTROS"
                                            GridLines="None" PageSize="1000">
                                            <Columns>

                                                <asp:BoundField HeaderText="ID Campaña" DataField="IdCampana" DataFormatString="{0:00000}" HtmlEncode="False">
                                                    <HeaderStyle HorizontalAlign="Left" />
                                                    <ItemStyle HorizontalAlign="Left" Width="5%" />
                                                </asp:BoundField>

                                                <asp:BoundField HeaderText="Usuario Ingreso" DataField="UsuarioIngreso">
                                                    <HeaderStyle HorizontalAlign="Left" />
                                                    <ItemStyle HorizontalAlign="Left" Width="10%" />
                                                </asp:BoundField>

                                                <asp:BoundField HeaderText="Fecha Ingreso" DataField="FechaIngreso" HtmlEncode="false" DataFormatString="{0:dd-MM-yyyy HH:mm}" >
                                                    <HeaderStyle HorizontalAlign="Left" />
                                                    <ItemStyle HorizontalAlign="Left" Width="10%" />
                                                </asp:BoundField>

                                                <asp:BoundField DataField="NombreTipoDisposicion" HeaderText="Tipo Disposicion" NullDisplayText="...">
                                                    <HeaderStyle HorizontalAlign="Left" />
                                                    <ItemStyle HorizontalAlign="Left" Width="15%" />
                                                </asp:BoundField>

                                                <asp:BoundField HeaderText="Disposición" DataField="NombreDisposicion" NullDisplayText="...">
                                                    <HeaderStyle HorizontalAlign="Left" />
                                                    <ItemStyle HorizontalAlign="Left" Width="15%" />
                                                </asp:BoundField>

                                                <asp:BoundField HeaderText="Comentario" DataField="Descripcion">
                                                    <HeaderStyle HorizontalAlign="Left" />
                                                    <ItemStyle HorizontalAlign="Left" Width="35%" />
                                                </asp:BoundField>

                                                <asp:BoundField HeaderText="Tipo Vivienda" DataField="AdicionalTipoVivienda">
                                                    <HeaderStyle HorizontalAlign="Left" />
                                                    <ItemStyle HorizontalAlign="Left" Width="5%" />
                                                </asp:BoundField>

                                                <asp:BoundField HeaderText="Antiguedad Vivienda" DataField="AdicionalAntiguedadVivienda">
                                                    <HeaderStyle HorizontalAlign="Left"  />
                                                    <ItemStyle HorizontalAlign="Left" Width="5%" />
                                                </asp:BoundField>

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
                            </table>
                        </div>
                        <div id="divDomicilios">
                            <table border="0" style="width: 100%">
                                <tr>
                                    <td class="barra-sub-titulo">Domicilios</td>
                                </tr>
                                <tr>
                                    <td>
                                        <asp:GridView ID="gvDomicilios" runat="server"
                                            AutoGenerateColumns="False"
                                            Width="100%"
                                            CellPadding="4" ForeColor="#333333"
                                            EmptyDataText="NO SE ENCONTRARON REGISTROS"
                                            GridLines="None" PageSize="1000">
                                            <Columns>
                                                <asp:BoundField HeaderText="Calle" DataField="calle" />
                                                <asp:BoundField HeaderText="Número" DataField="numero" />
                                                <asp:BoundField HeaderText="Villa o Población" DataField="villapob" />
                                                <asp:BoundField HeaderText="Block" DataField="block" />
                                                <asp:BoundField HeaderText="N° Dpto." DataField="nrodpto" />
                                                <asp:BoundField HeaderText="Región" DataField="regnom" />
                                                <asp:BoundField HeaderText="Comuna" DataField="comnom" />
                                                <asp:BoundField HeaderText="Vigencia" DataField="vigencia" />
                                                <asp:BoundField HeaderText="Nuevos Domicilios Encontrados" DataField="SinNuevosDomicilios" />
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
                            </table>
                        </div>
                        <div id="divTelefonos">
                            <table border="0" style="width: 100%">
                                <tr>
                                    <td class="barra-sub-titulo">Teléfonos</td>
                                </tr>
                                <tr>
                                    <td>
                                        <asp:GridView ID="gvTelefonos" runat="server"
                                            PageSize="1000"
                                            AutoGenerateColumns="False"
                                            Width="100%"
                                            CellPadding="4" ForeColor="#333333"
                                            EmptyDataText="NO SE ENCONTRARON REGISTROS"
                                            GridLines="None">
                                            <Columns>

                                                <asp:BoundField HeaderText="Teléfono 1" DataField="telefono1" />
                                                <asp:BoundField HeaderText="Celular 1" DataField="celular1" />
                                                <asp:BoundField HeaderText="Teléfono 2" DataField="telefono2" />
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
                            </table>
                        </div>
                        <div id="divBienesRaices">
                            <table border="0" style="width: 100%">
                                <tr>
                                    <td class="barra-sub-titulo">Bienes Raices</td>
                                </tr>
                                <tr>
                                    <td>
                                        <asp:GridView ID="gvBienesRaices" runat="server"
                                            AutoGenerateColumns="False"
                                            Width="100%"
                                            CellPadding="4" ForeColor="#333333"
                                            EmptyDataText="NO SE ENCONTRARON REGISTROS"
                                            GridLines="None" PageSize="1000">
                                            <Columns>

                                                <asp:BoundField HeaderText="Domicilio" DataField="domici" />
                                                <asp:BoundField HeaderText="Región" DataField="regnom" />
                                                <asp:BoundField HeaderText="Comuna" DataField="comnom" />
                                                <asp:BoundField HeaderText="Fojas" DataField="fojas_insc" />
                                                <asp:BoundField HeaderText="N°" DataField="n_insc" />
                                                <asp:BoundField HeaderText="Año" DataField="anio_insc" />
                                                <asp:BoundField HeaderText="Conservador" DataField="conservador" />
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
                            </table>
                        </div>
                        <div id="divBienesMuebles">
                            <table border="0" style="width: 100%">
                                <tr>
                                    <td class="barra-sub-titulo">Bienes Muebles</td>
                                </tr>
                                <tr>
                                    <td>
                                        <asp:GridView ID="gvBienesMuebles" runat="server"
                                            AutoGenerateColumns="False"
                                            Width="100%"
                                            CellPadding="4" ForeColor="#333333"
                                            EmptyDataText="NO SE ENCONTRARON REGISTROS"
                                            GridLines="None" PageSize="1000">
                                            <Columns>
                                                <asp:BoundField HeaderText="Marca" DataField="marca" />
                                                <asp:BoundField HeaderText="Modelo" DataField="modelo" />
                                                <asp:BoundField HeaderText="N° Chassis" DataField="n_chassis" />
                                                <asp:BoundField HeaderText="Motor" DataField="n_motor" />
                                                <asp:BoundField HeaderText="Patente" DataField="patente" />
                                                <asp:BoundField HeaderText="Año Fabricación" DataField="anio_fabricacion" />
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
                            </table>
                        </div>
                        <div id="divObservacionesEstado">
                                <table border="0" style="width: 100%">
                                <tr>
                                    <td class="barra-sub-titulo">Observaciones Cobranza - Cambio de Estado</td>
                                </tr>
                                <tr>
                                    <td>
                                        <asp:GridView ID="gvObservaciones" runat="server"
                                            AutoGenerateColumns="False" Width="100%" CellPadding="4" ForeColor="#333333" GridLines="None" EmptyDataText="NO SE ENCONTRARON OBSERVACIONES">
                                            <Columns>
                                                <asp:BoundField DataField="usuario" HeaderText="Usuario">
                                                    <ItemStyle HorizontalAlign="Left" Width="20%" />
                                                </asp:BoundField>
                                                <asp:BoundField DataField="descripcion" HeaderText="Observacion">
                                                    <ItemStyle HorizontalAlign="Justify" Width="80%" />
                                                </asp:BoundField>
                                            </Columns>
                                            <RowStyle BackColor="#EFF3FB" />
                                            <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                                            <AlternatingRowStyle BackColor="White" />
                                        </asp:GridView>
                                    </td>
                                </tr>
                            </table>
                        </div>
                        <div id="divDetalleGastos">
                            <table border="0" style="width: 100%">
                                <tr>
                                    <td class="barra-sub-titulo">Detalle de Gastos</td>
                                </tr>
                                <tr>
                                    <td>
                                        <asp:GridView ID="gvDetalleGastos" runat="server"
                                            PageSize="1000"
                                            AutoGenerateColumns="False"
                                            Width="100%"
                                            CellPadding="4" ForeColor="#333333"
                                            EmptyDataText="NO SE ENCONTRARON REGISTROS"
                                            GridLines="None">
                                            <Columns>
                                                <asp:BoundField HeaderText="Gasto" DataField="gasto" />
                                                <asp:BoundField HeaderText="Tipo Gasto" DataField="desgasto" />
                                                <asp:BoundField HeaderText="Fecha Gasto" DataField="fechagasto" />
                                                <asp:BoundField HeaderText="Monto" DataField="montogasto" />
                                                <asp:BoundField HeaderText="Proveedor" DataField="nom_responsable" />
                                                <asp:BoundField HeaderText="N° Comprobante" DataField="nroboleta" />
                                                <asp:BoundField HeaderText="Estado Comprobante" DataField="estagasto" />
                                                <asp:BoundField HeaderText="F. Estado Comprobante" DataField="fechaestagasto" />
                                                <asp:BoundField HeaderText="Nómina" DataField="nomina" />
                                                <asp:BoundField HeaderText="Fecha Nómina" DataField="fnomina" />
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
                            </table>
                        </div>
                        <div id="divActividadesJudiciales">
                            <table border="0" style="width: 100%">
                                <tr>
                                    <td class="barra-sub-titulo">Actividades Judiciales</td>
                                </tr>
                                <tr>
                                    <td>
                                        <asp:GridView ID="gvActividadesJudiciales" runat="server"
                                            PageSize="1000"
                                            AutoGenerateColumns="False"
                                            Width="100%"
                                            CellPadding="4" ForeColor="#333333"
                                            EmptyDataText="NO SE ENCONTRARON REGISTROS"
                                            GridLines="None">
                                            <Columns>

                                                <asp:BoundField HeaderText="ID Tramite" DataField="corr" />
                                                <asp:BoundField HeaderText="Trámite" DataField="descripcion" />
                                                <asp:BoundField HeaderText="Fecha Trámite" DataField="ftramite" />
                                                <asp:BoundField HeaderText="Próxima Gestión" DataField="proxgestion" />
                                                <asp:BoundField HeaderText="Fecha Prox. Gestión" DataField="fproxgestion" />
                                                <asp:BoundField HeaderText="Sub Trámite" DataField="SubTramite" />
                                                <asp:BoundField HeaderText="Fecha Sub Trámite" DataField="fsubtramite" />
                                                <asp:BoundField HeaderText="Observación" DataField="observacion" />
                                                <asp:BoundField HeaderText="" DataField="" />
                                                <asp:BoundField HeaderText="" DataField="" />
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
                            </table>
                        </div>
                        <div id="divDocumentosCobranza">
                            <table border="0" style="width: 100%">
                                <tr>
                                    <td class="barra-sub-titulo">Documentos Cobranza</td>
                                </tr>
                                <tr>
                                    <td>
                                        <asp:GridView ID="gvDocumentoPagare" runat="server" Visible="false"
                                            PageSize="1000"
                                            AutoGenerateColumns="False"
                                            Width="100%"
                                            CellPadding="4" ForeColor="#333333"
                                            GridLines="None">
                                            <Columns>
                                                <asp:BoundField HeaderText="N° Pagaré" DataField="nropagare" />
                                                <asp:BoundField HeaderText="Monto Total Deuda" DataField="montotaldeuda" />
                                                <asp:BoundField HeaderText="Fecha Suscripción" DataField="fsuscripcion" />
                                                <asp:BoundField HeaderText="Suma Inicial Suscripción" DataField="sumainisuscripcion" />
                                                <asp:BoundField HeaderText="N° Cuotas" DataField="nrocuotas" />
                                                <asp:BoundField HeaderText="Tasa de Interes" DataField="tasainteres" />
                                                <asp:BoundField HeaderText="Fecha Mora." DataField="fechamora" />
                                                <asp:BoundField HeaderText="IdContratista" DataField="urldocumento" />
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

                                        <asp:GridView ID="gvDocumentoJuicio" runat="server" Visible="false"
                                            PageSize="1000"
                                            AutoGenerateColumns="False"
                                            Width="100%"
                                            CellPadding="4" ForeColor="#333333"
                                            GridLines="None">
                                            <Columns>
                                                <asp:BoundField HeaderText="Fecha Aceptación" DataField="faceptacion" />
                                                <asp:BoundField HeaderText="Notario" DataField="notario" />
                                                <asp:BoundField HeaderText="N° Documento" DataField="nrodocumento" />
                                                <asp:BoundField HeaderText="Titulo Consta Deuda" DataField="tituloconstadeuda" />
                                                <asp:BoundField HeaderText="Banco" DataField="banco" />
                                                <asp:BoundField HeaderText="Cta. Cte." DataField="ctacte" />
                                                <asp:BoundField HeaderText="N° Seríe" DataField="numserie" />
                                                <asp:BoundField HeaderText="N° cheque" DataField="numcheque" />
                                                <asp:BoundField HeaderText="Monto" DataField="monto" />
                                                <asp:BoundField HeaderText="Fecha Giro Emisión" DataField="fgiroemision" />
                                                <asp:BoundField HeaderText="Acta Protesto" DataField="actaprotesto" />
                                                <asp:BoundField HeaderText="Dirección Acta" DataField="direccionacta" />
                                                <asp:BoundField HeaderText="IdContratista" DataField="urldocumento" />
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

                                        <asp:GridView ID="gvMutuo" runat="server" Visible="false"
                                            PageSize="1000"
                                            AutoGenerateColumns="false"
                                            Width="100%"
                                            CellPadding="4" ForeColor="#333333"
                                            GridLines="None">
                                            <Columns>
                                                <asp:BoundField HeaderText="N° Documento" DataField="nrodocumento" />
                                                <asp:BoundField HeaderText="Monto Cred. 1° Esc." DataField="monto_cred_1_esc" />
                                                <asp:BoundField HeaderText="Monto Cred. 2° Esc." DataField="monto_cred_2_esc" />
                                                <asp:BoundField HeaderText="Serie Letra Crédito" DataField="serie_let_cred" />
                                                <asp:BoundField HeaderText="Plazo Mutuo Meses" DataField="plazo_mutuo_mes" />
                                                <asp:BoundField HeaderText="Fecha 1° Vcto." DataField="fecha_1_venc" />
                                                <asp:BoundField HeaderText="Tasa Interes 1° Esc." DataField="taza_int_1_esc" />
                                                <asp:BoundField HeaderText="Tasa Interes 2° Esc." DataField="taza_int_2_esc" />
                                                <asp:BoundField HeaderText="Nro. 1° Div. Impago" DataField="n_1_div_impago" />
                                                <asp:BoundField HeaderText="Nro. Ult. Div. Impago" DataField="n_ult_div_impago" />
                                                <asp:BoundField HeaderText="Fecha Liquidación" DataField="fecha_liquidacion" />
                                                <asp:BoundField HeaderText="Monto Div. Adeudado (UF o IVP)" DataField="monto_div_adeudado_uf" />
                                                <asp:BoundField HeaderText="Monto Div. Adeudado ($)" DataField="monto_div_adeudado_ps" />
                                                <asp:BoundField HeaderText="Fecha Mora" DataField="fecha_mora" />
                                                <asp:BoundField HeaderText="Monto Total Deuda (UF o IVP)" DataField="saldo_total_deuda_uf" />
                                                <asp:BoundField HeaderText="Monto Adeudado ($)" DataField="total_adeudado" />
                                                <asp:BoundField HeaderText="IdContratista" DataField="urldocumento" />
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

                                        <asp:GridView ID="gvDocuEstandar1" runat="server" Visible="false"
                                            PageSize="1000"
                                            AutoGenerateColumns="False"
                                            Width="100%"
                                            CellPadding="4" ForeColor="#333333"
                                            GridLines="None">
                                            <Columns>
                                                <asp:BoundField HeaderText="Cuantía" DataField="cuantia" />
                                                <asp:BoundField HeaderText="Relación de Hechos" DataField="relacion_hechos" />
                                                <asp:BoundField HeaderText="Petitorio" DataField="petitorio" />
                                                <asp:BoundField HeaderText="Documentos Fundantes" DataField="doc_fundantes" />
                                                <asp:BoundField HeaderText="Observación" DataField="observacion" />
                                                <asp:BoundField HeaderText="IdContratista" DataField="urldocumento" />
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

                                        <asp:GridView ID="gvDocuEstandar2" runat="server" Visible="false"
                                            PageSize="1000"
                                            AutoGenerateColumns="False"
                                            Width="100%"
                                            CellPadding="4" ForeColor="#333333"
                                            GridLines="None">
                                            <Columns>
                                                <asp:BoundField HeaderText="Juzgado" DataField="txtJuzgado" />
                                                <asp:BoundField HeaderText="Rol" DataField="txtRol" />
                                                <asp:BoundField HeaderText="Materia" DataField="txtMateria" />
                                                <asp:BoundField HeaderText="Monto Demandado" DataField="txtMontoDemandado" />
                                                <asp:BoundField HeaderText="Observación" DataField="txtobservacion" />
                                                <asp:BoundField HeaderText="IdContratista" DataField="urldocumento" />
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

                                        <asp:GridView ID="gvDocuEstandar3" runat="server" Visible="false"
                                            PageSize="1000"
                                            AutoGenerateColumns="False"
                                            Width="100%"
                                            CellPadding="4" ForeColor="#333333"
                                            GridLines="None">
                                            <Columns>
                                                <asp:BoundField HeaderText="Cuantia" DataField="cuantia" />
                                                <asp:BoundField HeaderText="Monto Remuneración" DataField="txtMontoRemuneracion" />
                                                <asp:BoundField HeaderText="Cargo" DataField="txtCargo" />
                                                <asp:BoundField HeaderText="Relación Hechos" DataField="Relacion_Hechos" />
                                                <asp:BoundField HeaderText="Petitorio" DataField="petitorio" />
                                                <asp:BoundField HeaderText="Documentos Fundantes" DataField="doc_fundantes" />
                                                <asp:BoundField HeaderText="Observación" DataField="observacion" />
                                                <asp:BoundField HeaderText="IdContratista" DataField="urldocumento" />
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

                                        <asp:GridView ID="gvDocuEstandar4" runat="server" Visible="false"
                                            PageSize="1000"
                                            AutoGenerateColumns="False"
                                            Width="100%"
                                            CellPadding="4" ForeColor="#333333"
                                            GridLines="None">
                                            <Columns>
                                                <asp:BoundField HeaderText="Cuantia" DataField="cuantia" />
                                                <asp:BoundField HeaderText="Delito" DataField="delito" />
                                                <asp:BoundField HeaderText="Situación Autor" DataField="situacion_autor" />
                                                <asp:BoundField HeaderText="Relación Hechos" DataField="Relacion_Hechos" />
                                                <asp:BoundField HeaderText="Petitorio" DataField="petitorio" />
                                                <asp:BoundField HeaderText="Documentos Fundantes" DataField="doc_fundantes" />
                                                <asp:BoundField HeaderText="Observación" DataField="observacion" />
                                                <asp:BoundField HeaderText="IdContratista" DataField="urldocumento" />
                                                <asp:BoundField HeaderText="" DataField="" />
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
                            </table>
                        </div>
                    </div>
                </td>
            </tr>
            <tr>
                <td align="right" colspan="4" class="barra-sub-titulo">
                    <input id="btnPoderJudicial" type="button" value="Poder Judicial" class="boton" />
                    <asp:Button ID="btnAgregarComentario" runat="server" CssClass="boton" Visible="false" Text="Agregar Comentario" OnClientClick="AgregarComentario(); return false;" />
                </td>
            </tr>
        </table>
        <div id="divAgregarComentario" title="Agregar Comentario">
            <table cellpadding="0" cellspacing="0" style="width: 100%;">
                <tr>
                    <td align="left" style="width: 20%;">
                        Comentario
                    </td>
                    <td align="left" style="width: 80%;">
                        <asp:TextBox ID="txtComentario" runat="server" ClientIDMode="Static" Height="150px" TextMode="MultiLine" Width="98%" ></asp:TextBox>
                    </td>
                </tr>
            </table>
        </div>
        <div id="divMensaje" title="Mensaje">
            <asp:Label ID="lblMensaje" runat="server" Text="" ClientIDMode="Static" EnableViewState="false"></asp:Label>
        </div>
        <asp:HiddenField ID="hdfIdCobranza" runat="server" />
        <asp:HiddenField ID="hdfTipoCobranza" runat="server" />
        <asp:HiddenField ID="hdfTipoDocumentoCobranza" runat="server" />
        <asp:HiddenField ID="hdfIdJuicio" runat="server" />

        <asp:HiddenField ID="hdfUsuarioCallCenter" runat="server" />
        <asp:HiddenField ID="hdfRutDeudorCallCenter" runat="server" />

        <asp:HiddenField ID="hdfIdCampanaCallCenter" runat="server" />

        <asp:Button ID="btnGuardarComentario" runat="server" Text="" ClientIDMode="Static" OnClick="btnGuardarComentario_Click" />
    </form>
</body>
</html>
