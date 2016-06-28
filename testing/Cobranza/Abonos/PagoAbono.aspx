<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="PagoAbono.aspx.cs" Inherits="CobranzaALC.Cobranza.Abonos.PagoAbono" %>

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
    <script type="text/javascript" src="../../js/datepicker-es.js"></script>

    <script type="text/javascript">

        $(document).ready(function () {
            $('.control-calendario').datepicker({
                dateFormat: 'dd/mm/yy',
                changeMonth: true,
                changeYear: true,
                onSelect: function (dateText, inst) {
                    if ($('#ddlFormaPago').val() == '5')
                        alert('Al ingresar la fecha de pago, no olvide volver a Calcular');
                }
            });

            $('#btnDesgloseGral').click(function () {
                VerDetalleDesglose(0);
            });

            $('.mostrar-desglose-abono').click(function () {
                VerDetalleDesglose($(this).attr('alt'));
            });

            $('.mostrar-documento-abono').click(function () {
                MostrarDocumento($(this).attr('alt'));
            });
        });

        function MostrarDocumento(id_abono) {
            var pWin = window.open('ComprobanteAbono.aspx?id_abono=' + id_abono, 'documento', 'width=680,height=650,scrollbars=1,status=0,menubar=no,top=10,left=100')
            pWin.focus()
        }

        function VerDetalleDesglose(idAbono) {
            var ventana = window.open('MuestraDesglose.aspx?Codigo=' + $('#hiddidcobranza').val() + '&id_abono=' + idAbono, 'desglose', 'width=800,height=650,scrollbars=1,status=0,menubar=no,top=10,left=100');
            ventana.focus();
        }

        function ValidarGuardar() {
            if (confirm('Esta seguro de guardar el abono ?'))
                return true;
            return false;
        }

    </script>

</head>
<body>
    <form runat="server" id="Form1">
        <table border="0" style="width: 800px">
            <tr>
                <td class="barra-titulo" colspan="4">SISTEMA DE COBRANZA</td>
            </tr>

            <tr>
                <td class="barra-sub-titulo" colspan="4">INGRESO PAGOS</td>
            </tr>

            <tr>
                <td align="left" style="width: 20%">N° Operación</td>
                <td align="left" style="width: 30%">
                    <asp:TextBox ID="txtNroOperacion" runat="server"
                        ReadOnly="True" Width="95%"></asp:TextBox>
                </td>
                <td align="left" style="width: 20%">Cliente</td>
                <td align="left" style="width: 30%">
                    <asp:TextBox ID="txtCliente" runat="server"
                        ReadOnly="True" Width="95%"></asp:TextBox>
                </td>
            </tr>

            <tr>
                <td align="left" style="width: 20%">Rut Deudor</td>
                <td align="left" style="width: 30%">
                    <asp:TextBox ID="txtRutDeudor" runat="server"
                        ReadOnly="True" Width="95%"></asp:TextBox>
                </td>
                <td align="left" style="width: 20%">Deudor</td>
                <td align="left" style="width: 30%">
                    <asp:TextBox ID="txtNomDeudor" runat="server"
                        ReadOnly="True" Width="95%"></asp:TextBox>
                </td>
            </tr>

            <tr>
                <td align="left" style="width: 20%">Fecha</td>
                <td align="left" style="width: 30%">
                    <asp:TextBox ID="txtFecha" runat="server" ReadOnly="true"
                        Width="95%"></asp:TextBox>
                </td>
                <td align="left" style="width: 20%">&nbsp;</td>
                <td align="left" style="width: 30%">&nbsp;</td>
            </tr>

            <tr>
                <td align="left" style="width: 20%">Total Parcial</td>
                <td align="left" style="width: 30%">
                    <asp:TextBox ID="txtTotalParcial" runat="server" ReadOnly="true" Width="95%"></asp:TextBox>
                </td>
                <td align="left" style="width: 20%">Tasa de Interés</td>
                <td align="left" style="width: 30%">
                    <asp:DropDownList ID="tipotasa" runat="server" Width="95%">
                        <asp:ListItem Value="TIC">Corriente</asp:ListItem>
                    </asp:DropDownList>
                </td>
            </tr>

            <tr>
                <td align="left" colspan="4">
                    <asp:GridView ID="grillapagletras" runat="server"
                        OnRowCommand="Habilitar"
                        PageSize="100"
                        AutoGenerateColumns="False"
                        CellPadding="4" ForeColor="#333333"
                        GridLines="None" Width="98%">
                        <Columns>
                            <asp:TemplateField HeaderText="Tipo Doc.">
                                <HeaderStyle Wrap="true" Width="70"></HeaderStyle>
                                <ItemStyle Wrap="false"></ItemStyle>
                                <ItemTemplate>
                                    (<asp:Label ID="lblcuota" Visible="true" runat="server" Text='<%# Bind("idcuotacolegio") %>'></asp:Label>)    
                                
                                    <asp:Label ID="lblCodigo" runat="server" Text='<%# Bind("DescProducto") %>'></asp:Label>
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

                            <asp:TemplateField HeaderText="" HeaderStyle-Width="5%">
                                <HeaderTemplate>
                                    <asp:CheckBox ID="chkSeleccionaTodos" AutoPostBack="true" runat="server"
                                        ToolTip="Selecciona/Deselecciona Todos los registros"
                                        OnCheckedChanged="chkSeleccionaTodos_CheckedChanged" />
                                </HeaderTemplate>
                                <ItemTemplate>
                                    <asp:CheckBox ID="chkSeleccionaFila" AutoPostBack="true" runat="server" OnCheckedChanged="chkSeleccionaFila_CheckedChanged" />
                                </ItemTemplate>
                                <HeaderStyle Width="5%" />
                            </asp:TemplateField>

                        </Columns>

                        <PagerSettings Mode="NextPreviousFirstLast"
                            FirstPageText="<<"
                            LastPageText=">>"
                            PageButtonCount="3" />

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
                <td align="left" colspan="4">
                    <table class="style1">
                        <tr class="cssLabelsData">
                            <td>Monto 
                            </td>
                            <td>Intereses     
                            </td>
                            <td>Gastos</td>
                            <td>Interes Adicional
                            </td>
                            <td>Honorarios</td>
                            <td>Desc. Honorarios</td>
                            <td>Otros Descuentos
                            </td>
                            <td>Desc. Interes
                            </td>
                            <td>TOTAL
                            </td>
                        </tr>

                        <tr>
                            <td>
                                <asp:TextBox ID="txtMonto" runat="server" CssClass="cssLabelsData" Text="0"
                                    Style="WIDTH: 80px; margin-left: 0px; text-align: right" ReadOnly="true"></asp:TextBox></td>
                            <td>
                                <asp:TextBox ID="txtIntereses" runat="server" ReadOnly="true" Text="0" CssClass="cssLabelsData"
                                    Style="WIDTH: 80px; margin-left: 0px; text-align: right"></asp:TextBox></td>
                            <td>

                                <asp:TextBox ID="txtGastos" runat="server" ReadOnly="true" Text="0" CssClass="cssLabelsData"
                                    Style="WIDTH: 80px; margin-left: 0px; text-align: right"></asp:TextBox>
                            </td>
                            <td>
                                <asp:TextBox ID="txtIntAdicional" runat="server" ReadOnly="true" Text="0" CssClass="cssLabelsData"
                                    Style="WIDTH: 80px; margin-left: 0px; text-align: right"></asp:TextBox>
                            </td>
                            <td>
                                <asp:TextBox ID="txthonorarios" runat="server" ReadOnly="true" Text="0" CssClass="cssLabelsData"
                                    Style="WIDTH: 80px; margin-left: 0px; text-align: right"></asp:TextBox>
                            </td>
                            <td>
                                <asp:TextBox ID="txtdeschonorarios" runat="server" ReadOnly="true" Text="0" CssClass="cssLabelsData"
                                    Style="WIDTH: 80px; margin-left: 0px; text-align: right"></asp:TextBox></td>
                            <td>
                                <asp:TextBox ID="txtotrosdescuentos" runat="server" ReadOnly="true" Text="0" CssClass="cssLabelsData"
                                    Style="WIDTH: 80px; margin-left: 0px; text-align: right"></asp:TextBox></td>
                            <td>
                                <asp:TextBox ID="txtdescintereses" runat="server" ReadOnly="true" Text="0" CssClass="cssLabelsData"
                                    Style="WIDTH: 80px; margin-left: 0px; text-align: right"></asp:TextBox></td>
                            <td>
                                <asp:TextBox ID="txttotal" runat="server" ReadOnly="true" Text="0" CssClass="cssLabelsData"
                                    Style="WIDTH: 120px; margin-left: 0px; text-align: right"></asp:TextBox>
                            </td>
                        </tr>
                    </table>
                </td>
            </tr>

            <tr>
                <td align="right" colspan="4" class="barra-sub-titulo">
                    <asp:Button ID="btnCalcular" runat="server" Visible="true" CssClass="boton"
                        Text="CALCULAR" OnClick="btnCalcular_Click" />
                </td>
            </tr>

            <tr>
                <td align="left" style="width: 20%">Monto Pago</td>
                <td align="left" style="width: 30%">
                    <asp:TextBox ID="txtMontoAbono" runat="server" ReadOnly="true" Width="95%"></asp:TextBox>
                </td>
                <td align="left" style="width: 20%">Tipo Comprobante</td>
                <td align="left" style="width: 30%">

                    <asp:DropDownList ID="TipoComprobante" runat="server" Width="95%">
                        <asp:ListItem Value="1">Ingreso</asp:ListItem>
                        <%-- <asp:ListItem Value="2">Egreso</asp:ListItem>--%>
                    </asp:DropDownList>
                </td>
            </tr>

            <tr>
                <td align="left" style="width: 20%">Concepto Pago</td>
                <td align="left" style="width: 30%">
                    <asp:DropDownList ID="ConceptoAbono" runat="server" Width="95%">
                    </asp:DropDownList>
                </td>
                <td align="left" style="width: 20%">Boleta Honorarios</td>
                <td align="left" style="width: 30%">

                    <asp:TextBox ID="txtBoletaHonorarios" runat="server" MaxLength="40"
                        Width="95%"></asp:TextBox>
                </td>
            </tr>

            <tr>
                <td align="left" style="width: 20%">Forma de Pago</td>
                <td align="left" style="width: 30%">
                    <asp:DropDownList ID="ddlFormaPago" runat="server" AutoPostBack="true"
                        OnSelectedIndexChanged="ddlFormaPago_SelectedIndexChanged" Width="95%">
                    </asp:DropDownList>
                </td>
                <td align="left" style="width: 20%">&nbsp;</td>
                <td align="left" style="width: 30%">&nbsp;</td>
            </tr>

            <!--<asp:Panel ID="pnlDatosCheques" runat="server" ClientIDMode="Static" Visible="false">-->

            <tr>
                <td align="left" class="barra-sub-titulo" colspan="4">Cheques</td>
            </tr>

            <tr>
                <td align="left" style="width: 20%">Nro. Cheques</td>
                <td align="left" style="width: 30%">

                    <asp:DropDownList ID="ddlNumeroCheques" runat="server" Width="95%" AutoPostBack="True" OnSelectedIndexChanged="ddlNumeroCheques_SelectedIndexChanged">
                        <asp:ListItem>1</asp:ListItem>
                        <asp:ListItem>2</asp:ListItem>
                        <asp:ListItem>3</asp:ListItem>
                        <asp:ListItem>4</asp:ListItem>
                        <asp:ListItem>5</asp:ListItem>
                        <asp:ListItem>6</asp:ListItem>
                        <asp:ListItem>7</asp:ListItem>
                        <asp:ListItem>8</asp:ListItem>
                        <asp:ListItem>9</asp:ListItem>
                        <asp:ListItem>10</asp:ListItem>
                        <asp:ListItem>11</asp:ListItem>
                        <asp:ListItem>12</asp:ListItem>
                    </asp:DropDownList>
                </td>
                <td align="left" style="width: 20%">Banco</td>
                <td align="left" style="width: 30%">
                    <asp:DropDownList ID="banco" runat="server" Width="95%">
                    </asp:DropDownList>
                </td>
            </tr>

            <tr>
                <td align="left" style="width: 20%">Rut Girador</td>
                <td align="left" style="width: 30%">
                    <asp:TextBox ID="txtGirador" runat="server" Width="65%"></asp:TextBox>

                    <asp:ImageButton ID="imgBuscarGirador" runat="server" ImageUrl="~/images/lupa.jpg" OnClick="imgBuscarGirador_Click" Height="20px" Width="20px" />
                </td>
                <td align="left" style="width: 20%">Nombre Girador</td>
                <td align="left" style="width: 30%">
                    <asp:TextBox ID="txtnomgirador" runat="server" Width="95%"></asp:TextBox>
                </td>
            </tr>

            <tr>
                <td align="left" colspan="4">
                    <asp:GridView ID="gvDetalleCheques" runat="server"
                        OnRowCommand="Habilitar"
                        PageSize="100"
                        AutoGenerateColumns="False"
                        CellPadding="4" ForeColor="#333333"
                        GridLines="None" Width="98%">
                        <Columns>
                            <asp:BoundField HeaderText="N°" DataField="NumeroCorrelativo">
                                <ItemStyle Width="8%" />
                            </asp:BoundField>

                            <asp:TemplateField HeaderText="N° Cheque">
                                <ItemTemplate>
                                    <asp:TextBox ID="txtNumeroCheque" runat="server" Width="95%" Text='<%# Bind("Nrocheque") %>'></asp:TextBox>
                                </ItemTemplate>
                                <ItemStyle Width="23%" />
                            </asp:TemplateField>

                            <asp:TemplateField HeaderText="Fecha Pago">
                                <ItemTemplate>
                                    <asp:TextBox ID="txtFechaPago" runat="server" CssClass="control-calendario" Width="95%" Text='<%# Eval("Fpago","{0:dd/MM/yyyy}") %>'></asp:TextBox>
                                </ItemTemplate>
                                <ItemStyle Width="23%" />
                            </asp:TemplateField>

                            <asp:TemplateField HeaderText="Monto">
                                <ItemTemplate>
                                    <asp:TextBox ID="txtMontoCheque" runat="server" Width="95%" Text='<%# Bind("Montoabono") %>'></asp:TextBox>
                                </ItemTemplate>
                                <ItemStyle Width="23%" />
                            </asp:TemplateField>

                            <asp:TemplateField HeaderText="Serie">
                                <ItemTemplate>
                                    <asp:TextBox ID="txtSerieCheque" runat="server" Width="95%" Text='<%# Bind("Serie") %>'></asp:TextBox>
                                </ItemTemplate>
                                <ItemStyle Width="23%" />
                            </asp:TemplateField>

                        </Columns>

                        <PagerSettings Mode="NextPreviousFirstLast"
                            FirstPageText="<<"
                            LastPageText=">>"
                            PageButtonCount="3" />

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
            <!--</asp:Panel>-->
            <tr>
                <td align="left" class="barra-sub-titulo" colspan="4">Observación</td>
            </tr>

            <tr>
                <td align="center" colspan="4">
                    <asp:TextBox ID="txtObservacion" runat="server"
                        TextMode="MultiLine" Width="98%"
                        Rows="5" Height="50px"></asp:TextBox>
                </td>
            </tr>

            <tr>
                <td align="right" class="barra-sub-titulo" colspan="4">
                    <asp:Button ID="btnGuardar" runat="server" CssClass="boton" Text="Guardar Abono"
                        OnClientClick="return ValidarGuardar();" OnClick="btnGuardar_Click" />
                    <asp:Button ID="btnAbonoParcial" runat="server" CssClass="boton"
                        Text="Abono Parcial" OnClick="btnAbonoParcial_Click" />
                    <input id="btnDesgloseGral" class="boton" type="button" value="Desglose" /><asp:Button ID="btnCancelar" runat="server" CssClass="boton" Text="Cancelar"
                        OnClick="btnCancelar_Click" />
                </td>
            </tr>

            <tr>
                <td align="left" colspan="4" class="barra-sub-titulo">
                    Abonos ingresados</td>
            </tr>

            <tr>
                <td align="left" colspan="4">
                    <asp:GridView ID="gvAbonosRealizados" runat="server"
                        EmptyDataText="NO SE ENCONTRARON REGISTROS"
                        PageSize="500"
                        AutoGenerateColumns="False"
                        Width="98%"
                        CellPadding="4" ForeColor="#333333"
                        GridLines="None" Style="margin-right: 0px">
                        <Columns>
                            <asp:BoundField DataField="concepto" HeaderText="Concepto Abono" />
                            <asp:BoundField DataField="montoabono" HeaderText="Monto Pagado" DataFormatString="$ {0:N0}" HtmlEncode="False" />
                            <asp:BoundField DataField="fecha" HeaderText="Fecha Comprobante" DataFormatString="{0:dd-MM-yyyy}" HtmlEncode="False" />
                            <asp:BoundField DataField="moneda" HeaderText="Tipo Moneda" />
                            <asp:BoundField DataField="fechapago" HeaderText="Última Fecha Pago" DataFormatString="{0:dd-MM-yyyy}" HtmlEncode="False" />
                            <asp:BoundField DataField="boleta" HeaderText="Boleta Honorarios" />
                            <asp:TemplateField HeaderText="Imprimir Comprobante">
                                <ItemTemplate>
                                    <asp:Image ID="imgVerDocumentoAbono" runat="server" ImageUrl="~/images/lupa.jpg" ToolTip="Ver comprobante abono"
                                        CssClass="mostrar-documento-abono" AlternateText='<%# Eval("id_abono")%>' style="cursor: pointer;" />
                                </ItemTemplate>
                                <ItemStyle Width="10%" />
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Ver Desglose">
                                <ItemTemplate>
                                    <asp:Image ID="imgVerDesgloseAbono" runat="server" ImageUrl="~/images/lupa.jpg" ToolTip="Ver desglose abono"
                                        CssClass="mostrar-desglose-abono" AlternateText='<%# Eval("id_abono")%>' style="cursor: pointer;" />
                                </ItemTemplate>
                                <ItemStyle Width="10%" />
                            </asp:TemplateField>
                        </Columns>
                        <PagerSettings Mode="NextPreviousFirstLast"
                            FirstPageText="<<"
                            LastPageText=">>"
                            PageButtonCount="3" />

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
                <td align="left" colspan="4" class="barra-sub-titulo">
                    Cheques ingresados</td>
            </tr>

            <tr>
                <td align="left" colspan="4">
                    <asp:GridView ID="gvChequesIngresados" runat="server"
                        PageSize="100"
                        AutoGenerateColumns="False"
                        Width="98%"
                        CellPadding="4" ForeColor="#333333"
                        GridLines="None" EmptyDataText="NO SE ENCONTRARON REGISTROS">
                        <Columns>
                            <asp:BoundField DataField="id_abono_comprobante" HeaderText="N° Comprobante" />
                            <asp:BoundField DataField="fpago" HeaderText="Fecha Pago" DataFormatString="{0:dd-MM-yyyy}" HtmlEncode="False" />
                            <asp:BoundField DataField="nrocheque" HeaderText="N° Cheque" />
                            <asp:BoundField DataField="serie" HeaderText="Serie" />
                            <asp:BoundField DataField="montoabono" HeaderText="Monto Abono" DataFormatString="$ {0:N0}" HtmlEncode="False" />
                            <asp:BoundField DataField="estado" HeaderText="Liberado" />

                            <asp:TemplateField HeaderText="Eliminar">
                                <HeaderStyle HorizontalAlign="Center"></HeaderStyle>
                                <ItemStyle HorizontalAlign="Center"></ItemStyle>
                                <ItemTemplate>
                                    <asp:ImageButton ID="btnEliminarCheque" runat="server" ImageUrl="~/images/b_borrar.gif" CommandArgument='<%# Bind("id_abonoMCH") %>' OnClientClick="return confirm('¿Está seguro que desea eliminar el cheque ?')" OnClick="btnEliminarCheque_Click" />
                                </ItemTemplate>
                            </asp:TemplateField>

                        </Columns>

                        <PagerSettings Mode="NextPreviousFirstLast"
                            FirstPageText="<<"
                            LastPageText=">>"
                            PageButtonCount="3" />

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
                <td align="left" colspan="4" class="barra-sub-titulo">
                    &nbsp;&nbsp;</td>
            </tr>
        </table>
        <asp:HiddenField ID="hiddidcobranza" runat="server" ClientIDMode="Static" Value="0" />
        <asp:HiddenField ID="hddCorrAntiguo" runat="server" ClientIDMode="Static" />
        <asp:TextBox ID="txtcuota" Width="1" Height="1" size="0" runat="server" style="visibility: hidden;"></asp:TextBox>
    </form>
</body>
</html>

