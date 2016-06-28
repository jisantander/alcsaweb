<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Listar.aspx.cs" Inherits="CobranzaALC.Cobranza.mantenedores.Riesgo.Listar" %>

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
            $("#divMensaje").dialog({
                resizable: false,
                autoOpen: false,
                height: 250,
                width: 500,
                modal: true,
                buttons: {
                    Cerrar: function () {
                        $(this).dialog("close");
                    }
                }
            });

            if ($('.etiqueta-mensaje').html() != '')
                $("#divMensaje").dialog('open');
        });
    </script>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <table cellpadding="0" cellspacing="0" style="width: 700px;">
                <tr>
                    <td class="barra-titulo" colspan="2">RIESGOS</td>
                </tr>
                <tr>
                    <td align="right" class="barra-sub-titulo" colspan="2">
                        <asp:Button ID="btnAgregar" runat="server" CssClass="boton" OnClick="btnAgregar_Click" Text="Agregar Nuevo" />
                    </td>
                </tr>
                <tr>
                    <td colspan="2">
                        <asp:GridView ID="gvRiesgos" runat="server"
                            AllowPaging="True"
                            Width="100%"
                            CellPadding="4" ForeColor="#333333"
                            GridLines="None" PageSize="25" OnPageIndexChanging="gvRiesgos_PageIndexChanging" EmptyDataText="NO SE ENCONTRARON REMESAS" AutoGenerateColumns="False">
                            <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                            <AlternatingRowStyle BackColor="White" />
                            <Columns>
                                <asp:BoundField DataField="ID" HeaderText="ID">
                                    <ItemStyle HorizontalAlign="Left" Width="30%" />
                                </asp:BoundField>
                                <asp:BoundField DataField="Nombre" HeaderText="Nombre">
                                    <ItemStyle HorizontalAlign="Left" Width="50%" />
                                </asp:BoundField>
                                <asp:TemplateField ConvertEmptyStringToNull="False">
                                    <EditItemTemplate>
                                        <asp:DynamicControl ID="DynamicControl1" runat="server" DataField="" Mode="Edit" />
                                    </EditItemTemplate>
                                    <ItemTemplate>
                                        <asp:ImageButton ID="btnModificar" runat="server" CommandArgument='<%# Bind("ID") %>' Height="20px" ImageUrl="~/images/iconos/Buscar.png" OnClick="btnModificar_Click" Width="20px" />
                                    </ItemTemplate>
                                    <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" Width="10%" />
                                </asp:TemplateField>
                                <asp:TemplateField ConvertEmptyStringToNull="False">
                                    <EditItemTemplate>
                                        <asp:DynamicControl ID="DynamicControl2" runat="server" DataField="" Mode="Edit" />
                                    </EditItemTemplate>
                                    <ItemTemplate>
                                        <asp:ImageButton ID="btnEliminar" runat="server" CommandArgument='<%# Bind("ID") %>' Height="20px" ImageUrl="~/images/iconos/icono_eliminar.png" OnClick="btnEliminar_Click" Width="20px" />
                                    </ItemTemplate>
                                    <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" Width="10%" />
                                </asp:TemplateField>
                            </Columns>
                            <EditRowStyle BackColor="#2461BF" />
                            <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                            <HeaderStyle CssClass="cabezabrilla" />
                            <PagerStyle BackColor="#2461BF" ForeColor="White" />
                            <RowStyle BackColor="#EFF3FB" />
                            <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                        </asp:GridView>
                    </td>
                </tr>
                <tr>
                    <td class="barra-sub-titulo" colspan="2">&nbsp;</td>
                </tr>
            </table>

        </div>
        <div id="divMensaje" title="Mensaje">
            <table style="width: 100%;">
                <tr>
                    <td style="width: 20%; text-align: center; vertical-align: central;">
                        <img src="../../../images/alert-icon-red-md.png" alt="*" style="width: 70px; height: 70px;" />
                    </td>
                    <td style="width: 80%; text-align: left; vertical-align: central; font: bold 18px arial; padding-left: 4px;">
                        <asp:Label ID="lblMensaje" runat="server" Text="" EnableViewState="false" CssClass="etiqueta-mensaje"></asp:Label>
                    </td>
                </tr>
            </table>
        </div>
    </form>
</body>
</html>
