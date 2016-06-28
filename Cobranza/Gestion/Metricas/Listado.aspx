<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Listado.aspx.cs" Inherits="CobranzaALC.Cobranza.Gestion.Metricas.Listado" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title></title>

    <link href="../../../css/alc_estilo.css" rel="stylesheet" />
    <link href="../../../css/start/jquery-ui-1.10.3.custom.min.css" rel="stylesheet" />

    <script type="text/javascript" src="../../../js/jquery-1.10.2.min.js"></script>
    <script type="text/javascript" src="../../../js/jquery-ui-1.10.3.custom.min.js"></script>
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
                    <td class="barra-titulo" colspan="4">métricas</td>
                </tr>
                <tr>
                    <td align="left" class="barra-sub-titulo" colspan="4">
                        parametros generales</td>
                </tr>
                <tr>
                    <td align="left" style="width: 20%">
                        Plazo Máximo Ingreso Juicio</td>
                    <td align="left" style="width: 30%">
                        <asp:TextBox ID="txtPlazoMaximo" runat="server"></asp:TextBox>
                    </td>
                    <td align="left" style="width: 20%">
                        &nbsp;</td>
                    <td align="left" style="width: 30%">
                        &nbsp;</td>
                </tr>
                <tr>
                    <td align="left" style="width: 20%">
                        Días por Vencer Actividad</td>
                    <td align="left" style="width: 30%">
                        <asp:TextBox ID="txtDiasPorVencer" runat="server"></asp:TextBox>
                    </td>
                    <td align="left" style="width: 20%">
                        &nbsp;</td>
                    <td align="left" style="width: 30%">
                        &nbsp;</td>
                </tr>
                <tr>
                    <td align="right" class="barra-sub-titulo" colspan="4">
                        <asp:Button ID="btnGuardarParametros" runat="server" CssClass="boton" OnClick="btnGuardarParametros_Click" Text="Guardar" />
                    </td>
                </tr>
                <tr>
                    <td align="left" class="barra-titulo" colspan="4">
                        plazos por cliente</td>
                </tr>
                <tr>
                    <td align="left" colspan="4">
                        <a href="Mantenedor.aspx"><strong>+ Agregar Nuevos Plazos</strong></a></td>
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
                                <asp:BoundField HeaderText="Rut Cliente" DataField="RutCliente">
                                    <ItemStyle HorizontalAlign="Center" Width="15%" />
                                </asp:BoundField>
                                <asp:BoundField HeaderText="Nombre Cliente" DataField="NombreCliente">
                                    <ItemStyle HorizontalAlign="Left" Width="20%" />
                                </asp:BoundField>
                                <asp:BoundField HeaderText="Procedimiento" DataField="NombreProcedimiento">
                                    <ItemStyle HorizontalAlign="Left" Width="20%" />
                                </asp:BoundField>
                               <asp:BoundField HeaderText="Materia" DataField="NombreMateria">
                                    <ItemStyle HorizontalAlign="Left" Width="20%" />
                                </asp:BoundField>
                                <asp:BoundField HeaderText="Producto" DataField="NombreProducto">
                                    <ItemStyle HorizontalAlign="Left" Width="20%" />
                                </asp:BoundField>
                                <asp:TemplateField>
                                    <ItemTemplate>
                                        <asp:ImageButton ID="btnVer" runat="server" CommandArgument='<%# Bind("IdPlazoCobranza") %>' ImageUrl="~/images/iconos/Buscar.png" OnClick="btnVer_Click" />
                                    </ItemTemplate>
                                    <ItemStyle HorizontalAlign="Center" Width="5%" />
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
                    <td class="barra-sub-titulo" align="right" colspan="4">
                        &nbsp;&nbsp;</td>
                </tr>
            </table>

        </div>
    </form>
</body>
</html>