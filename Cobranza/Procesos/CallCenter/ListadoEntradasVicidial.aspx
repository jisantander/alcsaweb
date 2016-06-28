<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ListadoEntradasVicidial.aspx.cs" Inherits="CobranzaALC.Cobranza.Procesos.CallCenter.ListadoEntradasVicidial" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>ALC Asesorìa Legal y Crediticía Ltda</title>
    <link href="../../../css/alc2.css" rel="stylesheet" type="text/css" />
    <link href="../../../css/alc_estilo.css" rel="stylesheet" />
    <link href="../../../css/start/jquery-ui-1.10.3.custom.min.css" rel="stylesheet" />

    <script type="text/javascript" src="../../../js/jquery-1.10.2.min.js"></script>
    <script type="text/javascript" src="../../../js/jquery-ui-1.10.3.custom.min.js"></script>

    <script type="text/javascript">
        $(document).ready(function () {
            $('#btnEliminar').hide();

            $('#divConfirmacion').dialog({
                resizable: false,
                autoOpen: false,
                height: 200,
                width: 500,
                modal: true,
                buttons: {
                    Aceptar: function () {
                        $('#btnEliminar').click();
                    },
                    Cerrar: function () {
                        $(this).dialog('close');
                    }
                }
            });

            $('#divMensaje').dialog({
                resizable: false,
                autoOpen: false,
                height: 200,
                width: 500,
                modal: true,
                buttons: {
                    Cerrar: function () {
                        $(this).dialog('close');
                    }
                }
            });

            if ($('#hdfIdCampanaEliminacion').val() == '-1') {
                $('#hdfIdCampanaEliminacion').val('0');
                $('#divMensaje').dialog('open');
            }

            $('.eliminar-campana').click(function () {
                $('#hdfIdCampanaEliminacion').val($(this).attr('alt'));
                $('#divConfirmacion').dialog('open');
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
                    <td class="barra-sub-titulo" colspan="4">
                        <asp:Button ID="btnNuevaCampana" runat="server" CssClass="boton" OnClick="btnNuevaCampana_Click" Text="Nueva Campaña" />
                    </td>
                </tr>
                <tr>
                    <td>&nbsp;</td>
                    <td>&nbsp;</td>
                    <td>&nbsp;</td>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td colspan="4">
                        <asp:GridView ID="gvCampanas" runat="server"
                            PageSize="5"
                            AutoGenerateColumns="False"
                            Width="100%"
                            CellPadding="4" ForeColor="#333333"
                            GridLines="None" EmptyDataText="NO SE ENCONTRARON REGISTROS">
                            <Columns>
                                <asp:BoundField DataField="ID" HeaderText="ID Campaña" DataFormatString="{0:00000}" HtmlEncode="False">
                                    <HeaderStyle HorizontalAlign="Left" />
                                    <ItemStyle HorizontalAlign="Left" Width="20%" />
                                </asp:BoundField>
                                <asp:BoundField DataField="Nombre" HeaderText="Estado">
                                    <HeaderStyle HorizontalAlign="Left" />
                                    <ItemStyle HorizontalAlign="Left" Width="10%" />
                                </asp:BoundField>
                                <asp:BoundField DataField="FechaIngreso" HeaderText="Fecha Ingreso" DataFormatString="{0:dd-MM-yyyy}" HtmlEncode="False">
                                    <HeaderStyle HorizontalAlign="Left" />
                                    <ItemStyle HorizontalAlign="Left" Width="20%" />
                                </asp:BoundField>
                                <asp:BoundField DataField="NumeroCobranzasAsignadas" HeaderText="N° Cobranzas Asignadas">
                                    <HeaderStyle HorizontalAlign="Left" />
                                    <ItemStyle HorizontalAlign="Left" Width="20%" />
                                </asp:BoundField>
                                <asp:BoundField DataField="NumeroCobranzasConComentario" HeaderText="N° Cobranzas Con Comentarios Vicidial">
                                    <HeaderStyle HorizontalAlign="Left" Wrap="False" Width="20%" />
                                    <ItemStyle HorizontalAlign="Left" Width="20%" />
                                </asp:BoundField>

                                <asp:TemplateField>
                                    <ItemTemplate>
                                        <asp:ImageButton ID="btnVer" runat="server" CommandArgument='<%# Bind("ID") %>' ImageUrl="~/images/iconos/Buscar.png" OnClick="btnVer_Click" />
                                    </ItemTemplate>
                                    <HeaderStyle HorizontalAlign="Left" />
                                    <ItemStyle HorizontalAlign="Center" Width="5%" />
                                </asp:TemplateField>
                                <asp:TemplateField>
                                    <ItemTemplate>
                                        <asp:Image ID="imgEliminar" ImageUrl="~/images/b_borrar.gif" CssClass="eliminar-campana" AlternateText='<%# Bind("ID") %>' runat="server" style="cursor: pointer;" />
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
                    </td>
                </tr>
                <tr>
                    <td class="barra-sub-titulo" colspan="4">&nbsp;</td>
                </tr>
            </table>

        </div>
        <asp:HiddenField ID="hdfIdCampanaEliminacion" runat="server" ClientIDMode="Static" Value="0" />
        <asp:Button ID="btnEliminar" runat="server" ClientIDMode="Static" Text="Eliminar" OnClick="btnEliminar_Click" />
    </form>

    <div id="divConfirmacion">
        <p>¿Está seguro que desea eliminar la Campaña?</p>
    </div>
    <div id="divMensaje">
        <p>Campaña eliminada correctamente</p>
    </div>
</body>
</html>
