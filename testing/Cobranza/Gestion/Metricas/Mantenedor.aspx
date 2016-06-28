<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Mantenedor.aspx.cs" Inherits="CobranzaALC.Cobranza.Gestion.Metricas.Mantenedor" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link href="../../../css/alc.css" rel="stylesheet" />
    <link href="../../../css/alc_estilo.css" rel="stylesheet" />
    <link href="../../../css/start/jquery-ui-1.10.3.custom.min.css" rel="stylesheet" />

    <script type="text/javascript" src="../../../js/jquery-1.10.2.min.js"></script>
    <script type="text/javascript" src="../../../js/jquery-ui-1.10.3.custom.min.js"></script>

    <script type="text/javascript">
        $(document).ready(function () {
            $('#btnVolver').click(function () {
                window.location = 'Listado.aspx';
            });
        });
    </script>

    <style type="text/css">
        .cabezabrilla {
            background-color: #6CB3D8;
            font-family: Verdana, Arial, Helvetica, sans-serif;
            font-size: 12px;
            font-weight: bold;
            color: #ffffff;
            text-align: left;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <table cellpadding="0" cellspacing="0" border="0" style="width: 100%;">
                <tr>
                    <td class="barra-titulo" colspan="4">mantenedor de métricas</td>
                </tr>
                <tr>
                    <td align="left" class="barra-sub-titulo" colspan="4">Cliente</td>
                </tr>
                <tr>
                    <td align="left" style="width: 15%">Cliente</td>
                    <td align="left" style="width: 35%">
                        <asp:DropDownList ID="ddlClientes" runat="server" ClientIDMode="Static" Width="98%" DataTextField="rsocial" DataValueField="rut_cli" AutoPostBack="True" OnSelectedIndexChanged="ddlClientes_SelectedIndexChanged">
                        </asp:DropDownList>
                    </td>
                    <td align="left" style="width: 15%">Tipo Cobranzas</td>
                    <td align="left" style="width: 35%">
                        <asp:DropDownList ID="ddlTiposCobranzas" runat="server" AutoPostBack="True" Width="98%" OnSelectedIndexChanged="ddlTiposCobranzas_SelectedIndexChanged">
                            <asp:ListItem Value="J">JUDICIAL</asp:ListItem>
                            <asp:ListItem Value="P">PRE-JUDICIAL</asp:ListItem>
                            <asp:ListItem Value="A">PRENDA</asp:ListItem>
                        </asp:DropDownList>
                    </td>
                </tr>
                <tr>
                    <td align="left" style="width: 15%">Procedimiento</td>
                    <td align="left" style="width: 35%">
                        <asp:DropDownList ID="ddlProcedimientos" runat="server" AutoPostBack="True" ClientIDMode="Static" OnSelectedIndexChanged="ddlProcedimientos_SelectedIndexChanged" Width="98%" DataTextField="descripcion" DataValueField="id_procedimiento">
                        </asp:DropDownList>
                    </td>
                    <td align="left" style="width: 15%">Materia</td>
                    <td align="left" style="width: 35%">
                        <asp:DropDownList ID="ddlMaterias" runat="server" AutoPostBack="True" ClientIDMode="Static" OnSelectedIndexChanged="ddlMaterias_SelectedIndexChanged" Width="98%" DataTextField="descripcion" DataValueField="id_materia">
                        </asp:DropDownList>
                    </td>
                </tr>
                <tr>
                    <td align="left" style="width: 15%">Producto</td>
                    <td align="left" style="width: 35%">
                        <asp:DropDownList ID="ddlProductos" runat="server" AutoPostBack="True" ClientIDMode="Static" OnSelectedIndexChanged="ddlProductos_SelectedIndexChanged" Width="98%" DataTextField="descripcion" DataValueField="id_producto">
                        </asp:DropDownList>
                    </td>
                    <td align="left" style="width: 15%">&nbsp;</td>
                    <td align="left" style="width: 35%">&nbsp;</td>
                </tr>
                <tr>
                    <td align="left" class="barra-sub-titulo" colspan="4">Trámites</td>
                </tr>
                <tr>
                    <td align="left" colspan="4">
                        <asp:GridView ID="gvTramites" runat="server"
                            Width="100%"
                            CellPadding="4" ForeColor="#333333"
                            PageSize="100" AutoGenerateColumns="False">
                            <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                            <AlternatingRowStyle BackColor="White" />
                            <Columns>
                                <asp:BoundField HeaderText="Índice Trámite" DataField="IndiceTramite">
                                    <ItemStyle HorizontalAlign="Center" Width="15%" />
                                </asp:BoundField>
                                <asp:BoundField HeaderText="Etapa" DataField="NombreEtapa">
                                    <ItemStyle HorizontalAlign="Left" Width="30%" />
                                </asp:BoundField>
                                <asp:BoundField HeaderText="Trámite" DataField="NombreTramite">
                                    <ItemStyle HorizontalAlign="Left" Width="40%" />
                                </asp:BoundField>
                                <asp:TemplateField HeaderText="Días">
                                    <ItemTemplate>
                                        <asp:TextBox ID="txtDias" runat="server" Width="98%" Text='<%# Bind("PlazoDias") %>'></asp:TextBox>
                                        <asp:HiddenField ID="hdfIdTramite" runat="server" Value='<%# Bind("IdTramite") %>' />
                                    </ItemTemplate>
                                    <ItemStyle HorizontalAlign="Left" Width="15%" />
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
                    <td class="barra-sub-titulo" colspan="4" align="right">
                        <input id="btnVolver" class="boton" type="button" value="Volver" />
                        <asp:Button ID="btnGuardar" runat="server" CssClass="boton" OnClick="btnGuardar_Click" Text="Guardar" />
                    </td>
                </tr>
            </table>

        </div>
    </form>
</body>
</html>
