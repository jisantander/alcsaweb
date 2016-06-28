<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Listar.aspx.cs" Inherits="CobranzaALC.Cobranza.Gastos.Listar" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>ALC Asesorìa Legal y Crediticía Ltda</title>
    <link href="../../css/alc2.css" rel="stylesheet" type="text/css" />

    <script src="../../js/funciones.js" type="text/javascript"></script>
    <link href="../../css/start/jquery-ui-1.10.3.custom.min.css" rel="stylesheet" />
    <link href="../../css/alc_estilo.css" rel="stylesheet" />

    <script type="text/javascript" src="../../js/jquery-1.10.2.min.js"></script>
    <script type="text/javascript" src="../../js/jquery-ui-1.10.3.custom.min.js"></script>
    <script type="text/javascript" src="../../js/datepicker-es.js"></script>

    <script type="text/javascript">
        $(document).ready(function () {
            $('.control-calendario').datepicker({
                changeMonth: true,
                changeYear: true,
                maxDate: 0
            });

            $('.ver-detalle-gasto').click(function () {
                window.location = 'Gastos.aspx?id_gasto=' + $(this).attr('alt');
            });

            $('.ver-documento-fisico').click(function () {
                var ruta = '../Documentos/Descargar.aspx?id=' + $(this).attr('alt') + '&nom_id_doc=id&tipo_id_doc=TIGAS&ruta=Formatos/Gastos/ComprobanteIngreso.aspx';
                var ventana = window.open(ruta, 'descarga_archivo', '');
                ventana.focus();
            });
        });
    </script>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <table border="0" style="width: 800px">
                <tr>
                    <td class="barra-titulo" colspan="4">SISTEMA DE COBRANZA</td>
                </tr>

                <tr>
                    <td class="barra-sub-titulo" colspan="4">LISTAR GASTOS</td>
                </tr>

                <tr>
                    <td align="left" style="width: 20%">Rol</td>
                    <td align="left" style="width: 30%">
                        <asp:TextBox ID="txtRol" runat="server" Width="95%"></asp:TextBox>
                    </td>
                    <td align="left" style="width: 20%">N° Operación</td>
                    <td align="left" style="width: 30%">
                        <asp:TextBox ID="txtNumeroOperacion" runat="server" Width="95%"></asp:TextBox>
                    </td>
                </tr>

                <tr>
                    <td align="left" style="width: 20%">Rut Deudor</td>
                    <td align="left" style="width: 30%">
                        <asp:TextBox ID="txtRutDeudor" runat="server" Width="95%"></asp:TextBox>
                    </td>
                    <td align="left" style="width: 20%">Número Sucursal</td>
                    <td align="left" style="width: 30%">
                        <asp:TextBox ID="txtNumeroSucursal" runat="server" Width="95%"></asp:TextBox>
                    </td>
                </tr>

                <tr>
                    <td align="left" style="width: 20%">Cliente</td>
                    <td align="left" style="width: 30%">
                        <asp:DropDownList ID="ddlCliente" runat="server"
                            Width="97%" DataTextField="rsocial" DataValueField="rut_cli">
                        </asp:DropDownList>
                    </td>
                    <td align="left" style="width: 20%">Procurador</td>
                    <td align="left" style="width: 30%">
                        <asp:DropDownList ID="ddlProcurador" runat="server"
                            Width="97%" DataTextField="nombres" DataValueField="rut">
                        </asp:DropDownList>
                    </td>
                </tr>
                <tr>
                    <td align="left" style="width: 20%">Gasto</td>
                    <td align="left" style="width: 30%">
                        <asp:DropDownList ID="ddlGastos" runat="server"
                            Width="97%" AutoPostBack="True" OnSelectedIndexChanged="ddlGastos_SelectedIndexChanged">
                            <asp:ListItem Selected="True" Value="T">Todos</asp:ListItem>
                            <asp:ListItem Value="P">Pre-Judicial</asp:ListItem>
                            <asp:ListItem Value="J">Judicial</asp:ListItem>
                            <asp:ListItem Value="A">Administrativo</asp:ListItem>
                        </asp:DropDownList>
                    </td>
                    <td align="left" style="width: 20%">
                        <asp:Label ID="lblTexto" runat="server" Text="Tipo Gasto" Visible="False"></asp:Label>
                    </td>
                    <td align="left" style="width: 30%">
                        <asp:DropDownList ID="ddlTiposGastos" runat="server"
                            Width="97%" Visible="False">
                        </asp:DropDownList>
                    </td>
                </tr>

                <tr>
                    <td align="left" style="width: 20%">Fecha Ingreso</td>
                    <td align="left" style="width: 30%">
                        <asp:TextBox ID="txtFechaIngreso" runat="server" Width="95%" CssClass="control-calendario"></asp:TextBox>
                    </td>
                    <td align="left" style="width: 20%">&nbsp;</td>
                    <td align="left" style="width: 30%">&nbsp;</td>
                </tr>

                <tr>
                    <td align="right" class="barra-sub-titulo" colspan="4">
                        <asp:Button ID="btnBuscar" runat="server" CssClass="boton" Text="Buscar" OnClick="btnBuscar_Click" />
                        &nbsp;<asp:Button ID="btnLimpiar" runat="server" CssClass="boton" OnClick="btnLimpiar_Click" Text="Limpiar" />
                        &nbsp;<asp:Button ID="btnExportarExcel" runat="server" CssClass="boton" OnClick="btnExportarExcel_Click" Text="Exportar Excel" />
                    </td>
                </tr>
            </table>
        </div>
        <table cellpadding="0" cellspacing="0">
            <tr>
                <td>
                    <asp:GridView ID="gvGastos" runat="server"
                        AllowPaging="True"
                        PageSize="25"
                        AutoGenerateColumns="False"
                        Width="100%"
                        CellPadding="4" ForeColor="#333333"
                        GridLines="None" OnPageIndexChanging="gvGastos_PageIndexChanging" EmptyDataText="NO SE ENCONTRARON REGISTROS">
                        <%-- <PagerSettings Mode="Numeric" FirstPageText="<<" LastPageText=">>" PageButtonCount="20"/> --%>
                        <HeaderStyle CssClass="cabezabrilla" />
                        <AlternatingRowStyle BackColor="White" />
                        <Columns>
                            <asp:TemplateField HeaderText="Ver">
                                <ItemTemplate>
                                    <asp:Image ID="imgVer" runat="server" AlternateText='<%# Bind("IdGasto") %>' ImageUrl="~/images/iconos/Buscar.png" Style="cursor: pointer;" CssClass="ver-detalle-gasto" />
                                </ItemTemplate>
                                <ItemStyle HorizontalAlign="Center" />
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Imprimir">
                                <ItemTemplate>
                                    <asp:Image ID="imgVer2" runat="server" AlternateText='<%# Bind("IdGasto") %>' ImageUrl="~/images/iconos/Buscar.png" Style="cursor: pointer;" CssClass="ver-documento-fisico" />
                                </ItemTemplate>
                                <ItemStyle HorizontalAlign="Center" />
                            </asp:TemplateField>
                            <asp:BoundField DataField="NumeroOperacion" HeaderText="N° Operación" />
                            <asp:BoundField DataField="RutCliente" HeaderText="Rut Cliente" />
                            <asp:BoundField DataField="NombreCliente" HeaderText="Nombre Cliente" />
                            <asp:BoundField DataField="Rol" HeaderText="Rol" />
                            <asp:BoundField DataField="NombreProcurador" HeaderText="Procurador" />
                            <asp:BoundField DataField="NumeroDocumento" HeaderText="N° Documento" />
                            <asp:BoundField DataField="EstadoGasto" HeaderText="Estado Gasto" />
                            <asp:BoundField DataField="FechaGasto" HeaderText="Fecha Gasto" DataFormatString="{0:dd-MM-yyyy}" HtmlEncode="False" />
                            <asp:BoundField DataField="TipoGasto" HeaderText="Tipo Gasto" />
                            <asp:BoundField DataField="MontoGasto" DataFormatString="$ {0:N0}" HeaderText="Monto Gasto" HtmlEncode="False" />
                            <asp:TemplateField HeaderText="Eliminar">
                                <ItemTemplate>
                                    <asp:ImageButton ID="btnEliminar" runat="server" CommandArgument='<%# Bind("IdGasto") %>' ImageUrl="~/images/iconos/icono_eliminar.png" OnClick="btnEliminar_Click" />
                                </ItemTemplate>
                            </asp:TemplateField>
                        </Columns>
                        <EditRowStyle BackColor="#2461BF" />
                        <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" Font-Size="13px" />
                        <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" Font-Size="13px" />
                        <PagerStyle BackColor="#2461BF" ForeColor="White" Font-Size="13px" />
                        <RowStyle BackColor="#EFF3FB" Font-Size="13px" Wrap="false" />
                        <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" Font-Size="13px" />
                    </asp:GridView>
                </td>
            </tr>
            <tr>
                <td class="barra-sub-titulo">&nbsp;</td>
            </tr>
        </table>
    </form>
</body>
</html>
