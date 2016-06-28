<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="EntradaVicidial.aspx.cs" Inherits="CobranzaALC.Cobranza.Procesos.CallCenter.EntradaVicidial" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>ALC Asesorìa Legal y Crediticía Ltda</title>
    <link href="../../../css/alc2.css" rel="stylesheet" type="text/css" />
    <link href="../../../css/alc_estilo.css" rel="stylesheet" />
    <link href="../../../css/start/jquery-ui-1.10.3.custom.min.css" rel="stylesheet" />

    <script type="text/javascript" src="../../../js/jquery-1.10.2.min.js"></script>
    <script type="text/javascript" src="../../../js/jquery-ui-1.10.3.custom.min.js"></script>

    <script type="text/javascript">
        $(document).ready(function () {
            $('.boton-ver-comentarios').click(function () {
                var idCobranza = $(this).attr('alt');
                var idCampana = $('#lblNumeroCampana').html();
                window.open('ListadoComentarios.aspx?id_cob=' + idCobranza + '&id_cam=' + idCampana, 'ventana', 'width=800,height=600,scrollbars=1,satus=0,menubar=no,top=10,left=100');
            });
        });
    </script>
</head>
<body>
    <form id="form1" runat="server">
        <div>

            <table cellpadding="0" cellspacing="0" style="width: 100%;">
                <tr>
                    <td class="barra-titulo" colspan="4">Entradas Vicidial</td>
                </tr>
                <tr>
                    <td class="barra-sub-titulo" colspan="4">Campaña</td>
                </tr>
                <tr>
                    <td style="width: 15%">ID</td>
                    <td style="width: 35%">
                        <asp:Label ID="lblNumeroCampana" runat="server">...</asp:Label>
                    </td>
                    <td style="width: 15%">Fecha Ingreso</td>
                    <td style="width: 35%">
                        <asp:Label ID="lblFechaIngreso" runat="server">...</asp:Label>
                    </td>
                </tr>
                <tr>
                    <td style="width: 15%">&nbsp;</td>
                    <td style="width: 35%">&nbsp;</td>
                    <td style="width: 15%">Fecha Primer Registro Vicidial</td>
                    <td style="width: 35%">
                        <asp:Label ID="lblFechaVicidial" runat="server">...</asp:Label>
                    </td>
                </tr>
                <!--<asp:Panel ID="pnlDatosCreacion" runat="server">-->
                <tr>
                    <td class="barra-sub-titulo" colspan="4">Filtro de Busqueda</td>
                </tr>
                <tr>
                    <td style="width: 15%">Cliente</td>
                    <td style="width: 35%">
                        <asp:DropDownList ID="ddlClientes" runat="server" Width="95%" DataTextField="rsocial" DataValueField="rut_cli">
                        </asp:DropDownList>
                    </td>
                    <td style="width: 15%">Rut Deudor</td>
                    <td style="width: 35%">
                        <asp:TextBox ID="txtRutDeudor" runat="server" Width="95%"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td style="width: 15%">N° Operación</td>
                    <td style="width: 35%">
                        <asp:TextBox ID="txtNumeroOperacion" runat="server" Width="95%"></asp:TextBox>
                    </td>
                    <td style="width: 15%">&nbsp;</td>
                    <td style="width: 35%">&nbsp;</td>
                </tr>
                <tr>
                    <td class="barra-sub-titulo" colspan="4" align="right">
                        <asp:Button ID="btnBuscar" runat="server" CssClass="boton" Text="Buscar" Width="200px" OnClick="btnBuscar_Click" />
                    </td>
                </tr>
                <tr>
                    <td class="barra-sub-titulo" colspan="4">Cobranzas No Seleccionadas</td>
                </tr>
                <tr>
                    <td colspan="4">
                        <asp:Panel ID="pnlCobranzasNoSeleccionadas" runat="server" Width="99%" Height="250px" ScrollBars="Vertical">
                            <asp:GridView ID="gvCobranzasNoSeleccionadas" runat="server"
                                PageSize="5"
                                AutoGenerateColumns="False"
                                Width="100%"
                                CellPadding="4" ForeColor="#333333"
                                GridLines="None" EmptyDataText="NO SE ENCONTRARON REGISTROS" AllowPaging="True" OnPageIndexChanging="gvCobranzasNoSeleccionadas_PageIndexChanging">
                                <Columns>
                                    <asp:BoundField DataField="RutDeudor" HeaderText="Rut Deudor">
                                        <HeaderStyle HorizontalAlign="Left" />
                                        <ItemStyle HorizontalAlign="Left" Width="15%" />
                                    </asp:BoundField>
                                    <asp:BoundField DataField="NombreDeudor" HeaderText="Nombre Deudor">
                                        <HeaderStyle HorizontalAlign="Left" />
                                        <ItemStyle HorizontalAlign="Left" Width="25%" />
                                    </asp:BoundField>
                                    <asp:BoundField DataField="RutCliente" HeaderText="Rut Cliente">
                                        <HeaderStyle HorizontalAlign="Left" />
                                        <ItemStyle HorizontalAlign="Left" Width="15%" />
                                    </asp:BoundField>
                                    <asp:BoundField DataField="NombreCliente" HeaderText="Nombre Cliente">
                                        <HeaderStyle HorizontalAlign="Left" />
                                        <ItemStyle HorizontalAlign="Left" Width="25%" />
                                    </asp:BoundField>
                                    <asp:BoundField DataField="NumeroOperacion" HeaderText="N° Operacion">
                                        <HeaderStyle HorizontalAlign="Left" />
                                        <ItemStyle HorizontalAlign="Left" Width="15%" />
                                    </asp:BoundField>
                                    <asp:TemplateField>
                                        <ItemTemplate>
                                            <asp:CheckBox ID="chkSeleccionado" runat="server" CssClass="marca-seleccionado-cob-no-sel" />
                                            <asp:HiddenField ID="hdfIdCobranza" runat="server" Value='<%# Bind("IdCobranza") %>' />
                                        </ItemTemplate>
                                        <HeaderStyle HorizontalAlign="Left" />
                                        <ItemStyle HorizontalAlign="Center" Width="5%" />
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
                        </asp:Panel>

                    </td>
                </tr>
                <tr>
                    <td class="barra-sub-titulo" colspan="4" align="right">
                        <asp:Button ID="btnAgregarArchivo" runat="server" CssClass="boton" Text="Agregar Desde Archivo" Width="200px" OnClick="btnAgregarArchivo_Click" />
                        &nbsp;<asp:Button ID="btnAgregar" runat="server" CssClass="boton" Text="Agregar Seleccionadas" Width="200px" OnClick="btnAgregar_Click" />
                    </td>
                </tr>
                <tr>
                    <td colspan="4" align="right">&nbsp;</td>
                </tr>
                <!--</asp:Panel>-->
                <tr>
                    <td class="barra-sub-titulo" colspan="4">Cobranzas Seleccionadas</td>
                </tr>
                <tr>
                    <td colspan="4">
                        <asp:Panel ID="pnlCobranzasSeleccionadas" runat="server" Width="99%" Height="250px" ScrollBars="Vertical">
                            <asp:GridView ID="gvCobranzasSeleccionadas" runat="server"
                                PageSize="5"
                                AutoGenerateColumns="False"
                                Width="100%"
                                CellPadding="4" ForeColor="#333333"
                                GridLines="None" EmptyDataText="NO SE ENCONTRARON REGISTROS" AllowPaging="True" OnPageIndexChanging="gvCobranzasSeleccionadas_PageIndexChanging">
                                <Columns>
                                    <asp:BoundField DataField="RutDeudor" HeaderText="Rut Deudor">
                                        <HeaderStyle HorizontalAlign="Left" />
                                        <ItemStyle HorizontalAlign="Left" Width="10%" />
                                    </asp:BoundField>
                                    <asp:BoundField DataField="NombreDeudor" HeaderText="Nombre Deudor">
                                        <HeaderStyle HorizontalAlign="Left" />
                                        <ItemStyle HorizontalAlign="Left" Width="20%" />
                                    </asp:BoundField>
                                    <asp:BoundField DataField="RutCliente" HeaderText="Rut Cliente">
                                        <HeaderStyle HorizontalAlign="Left" />
                                        <ItemStyle HorizontalAlign="Left" Width="10%" />
                                    </asp:BoundField>
                                    <asp:BoundField DataField="NombreCliente" HeaderText="Nombre Cliente">
                                        <HeaderStyle HorizontalAlign="Left" />
                                        <ItemStyle HorizontalAlign="Left" Width="20%" />
                                    </asp:BoundField>
                                    <asp:BoundField DataField="NumeroOperacion" HeaderText="N° Operacion">
                                        <HeaderStyle HorizontalAlign="Left" />
                                        <ItemStyle HorizontalAlign="Left" Width="10%" />
                                    </asp:BoundField>
                                    <asp:BoundField DataField="NumeroComentarios" HeaderText="N° Comentarios">
                                        <HeaderStyle HorizontalAlign="Left" />
                                        <ItemStyle HorizontalAlign="Left" Width="10%" />
                                    </asp:BoundField>
                                    <asp:BoundField DataField="DisposicionDeudor" HeaderText="Disposicion Deudor">
                                        <HeaderStyle HorizontalAlign="Left" />
                                        <ItemStyle HorizontalAlign="Left" Width="15%" />
                                    </asp:BoundField>
                                    <asp:TemplateField>
                                        <ItemTemplate>
                                            <asp:CheckBox ID="chkSeleccionado" runat="server" CssClass="marca-seleccionado-cob-sel" />
                                            <asp:HiddenField ID="hdfIdCobranza" runat="server" Value='<%# Bind("IdCobranza") %>' />
                                            <asp:HiddenField ID="hdfIdCampanaCobranza" runat="server" Value='<%# Bind("ID") %>' />
                                        </ItemTemplate>
                                        <HeaderStyle HorizontalAlign="Left" />
                                        <ItemStyle HorizontalAlign="Center" Width="5%" />
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Comentarios">
                                        <ItemTemplate>
                                            <asp:Image ID="imgVerComentarios" runat="server" AlternateText='<%# Bind("IdCobranza") %>' CssClass="boton-ver-comentarios" ImageUrl="~/images/iconos/Buscar.png" style="cursor: pointer;" />
                                        </ItemTemplate>
                                        <HeaderStyle HorizontalAlign="Left" />
                                        <ItemStyle HorizontalAlign="Center" Width="5%" />
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
                        </asp:Panel>

                    </td>
                </tr>
                <tr>
                    <td class="barra-sub-titulo" colspan="4" align="right">
                        <asp:Button ID="btnDescargarArchivoExcel" runat="server" CssClass="boton" Text="Descargar Excel" Width="200px" OnClick="btnDescargarArchivoExcel_Click" />
                        &nbsp;<asp:Button ID="btnDescargarArchivo" runat="server" CssClass="boton" Text="Descargar Archivo Vicidial" Width="200px" OnClick="btnDescargarArchivo_Click" />
                        &nbsp;<asp:Button ID="btnFinalizar" runat="server" CssClass="boton" Text="Finalizar" Width="200px" OnClick="btnFinalizar_Click" />
                        &nbsp;<asp:Button ID="btnQuitar" runat="server" CssClass="boton" Text="Quitar Seleccionadas" Width="200px" OnClick="btnQuitar_Click" />
                    </td>
                </tr>
            </table>

        </div>
        <asp:HiddenField ID="hdfUsuario" runat="server" />
        <asp:HiddenField ID="hdfEsTemporal" runat="server" Value="1" />
    </form>
</body>
</html>
