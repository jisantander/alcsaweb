<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Cumplimiento.aspx.cs" Inherits="CobranzaALC.Cobranza.Gestion.Metricas.Avances.Cumplimiento" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title></title>
    <link href="../../../../css/alc_estilo.css" rel="stylesheet" />
    <link href="../../../../css/start/jquery-ui-1.10.3.custom.min.css" rel="stylesheet" />

    <script type="text/javascript" src="../../../../js/jquery-1.10.2.min.js"></script>
    <script type="text/javascript" src="../../../../js/jquery-ui-1.10.3.custom.min.js"></script>
    <script type="text/javascript">
        $(document).ready(function () {
            $('.control-calendario').datepicker({
                dateFormat: 'dd/mm/yy',
                changeMonth: true,
                changeYear: true
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
                    <td class="barra-titulo" colspan="4">Cumplimiento</td>
                </tr>
                <tr>
                    <td class="barra-sub-titulo" align="left" colspan="4">
                        Filtro de Busqueda</td>
                </tr>
                <tr>
                    <td align="left" style="width: 15%">
                        Cliente</td>
                    <td align="left" style="width: 35%">
                        <asp:DropDownList ID="ddlClientes" runat="server" ClientIDMode="Static" Width="98%" DataTextField="rsocial" DataValueField="rut_cli">
                        </asp:DropDownList>
                    </td>
                    <td align="left" style="width: 15%">
                        Procurador</td>
                    <td align="left" style="width: 35%">
                        <asp:DropDownList ID="ddlProcuradores" runat="server" ClientIDMode="Static" Width="98%" DataValueField="rut" DataTextField="nombres">
                        </asp:DropDownList>
                    </td>
                </tr>
                <tr>
                    <td align="left" style="width: 15%">
                        Fecha Desde</td>
                    <td align="left" style="width: 35%">
                    <asp:TextBox ID="txtFechaDesde" runat="server" MaxLength="10" Width="120px" CssClass="control-calendario"></asp:TextBox>
                    </td>
                    <td align="left" style="width: 15%">
                        Fecha Hasta</td>
                    <td align="left" style="width: 35%">
                    <asp:TextBox ID="txtFechaHasta" runat="server" MaxLength="10" Width="120px" CssClass="control-calendario"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td class="barra-sub-titulo" align="right" colspan="4">
                    <asp:Button ID="btnBuscar" runat="server" CssClass="boton" OnClick="btnBuscar_Click" Text="Buscar" />
                    </td>
                </tr>
                <tr>
                    <td align="left" colspan="4">
                        <table cellpadding="0" cellspacing="0" border="0" style="width: 20%; width: 250px;">
                            <tr>
                                <td style="width: 50%">En Plazo</td>
                                <td style="width: 50%; background-color: #d8ffd8;" align="right">
                                    <asp:Label ID="lblNumeroEnPlazo" runat="server" Font-Bold="True"></asp:Label>
                                </td>
                            </tr>
                            <tr>
                                <td style="width: 50%">Por Vencer</td>
                                <td style="width: 50%; background-color: #f4f3c0;"" align="right">
                                    <asp:Label ID="lblNumeroPorVencer" runat="server" Font-Bold="True"></asp:Label>
                                </td>
                            </tr>
                            <tr>
                                <td style="width: 50%">Vencidos</td>
                                <td style="width: 50%; background-color: #f4c0c0;"" align="right">
                                    <asp:Label ID="lblNumeroVencidos" runat="server" Font-Bold="True"></asp:Label>
                                </td>
                            </tr>
                        </table>
                    </td>
                </tr>
                <tr>
                    <td align="right" class="barra-sub-titulo" colspan="4">Detalle Por Etapa<asp:Button ID="btnExportar" runat="server" CssClass="boton" OnClick="btnExportar_Click" Text="Exportar Excel" />
                    </td>
                </tr>
                <tr>
                    <td align="left" colspan="4">
                        <asp:GridView ID="gvDetalleEtapa" runat="server"
                            Width="100%"
                            CellPadding="4" ForeColor="#333333"
                            PageSize="100" AutoGenerateColumns="False" EmptyDataText="NO SE ENCONTRO INFORMACION">
                            <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                            <AlternatingRowStyle BackColor="White" />
                            <Columns>
                                <asp:BoundField HeaderText="Etapa" DataField="Etapa">
                                    <ItemStyle HorizontalAlign="Left" Width="50%" />
                                </asp:BoundField>
                                <asp:BoundField HeaderText="N° de Casos" DataField="NumeroCasos" DataFormatString="{0:N0}" HtmlEncode="False">
                                    <ItemStyle HorizontalAlign="Right" Width="10%" />
                                </asp:BoundField>
                                <asp:BoundField HeaderText="% de Casos" DataField="PorcentajeCasos" DataFormatString="{0:N2}%" HtmlEncode="False">
                                    <ItemStyle HorizontalAlign="Right" Width="10%" />
                                </asp:BoundField>
                                <asp:BoundField HeaderText="N° de Casos Dentro del Plazo" DataField="CasosEnPlazo" DataFormatString="{0:N0}" HtmlEncode="False">
                                    <ItemStyle HorizontalAlign="Right" Width="10%" />
                                </asp:BoundField>
                                <asp:BoundField HeaderText="N° de Casos por Vencer" DataField="CasosPorVencer" DataFormatString="{0:N0}" HtmlEncode="False">
                                    <ItemStyle HorizontalAlign="Right" Width="10%" />
                                </asp:BoundField>
                                <asp:BoundField HeaderText="N° de Casos Vencidos" DataField="CasosVencido" DataFormatString="{0:N0}" HtmlEncode="False">
                                    <ItemStyle HorizontalAlign="Right" Width="10%" />
                                </asp:BoundField>
                            </Columns>
                            <EditRowStyle BackColor="#2461BF" />
                            <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                            <HeaderStyle CssClass="cabezabrilla" />
                            <PagerStyle BackColor="#2461BF" ForeColor="White" />
                            <RowStyle BackColor="#EFF3FB" />
                            <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                        </asp:GridView>
                        <br />
                    </td>
                </tr>
                <tr>
                    <td align="left" class="barra-sub-titulo" colspan="4">Detalle Por Trámite</td>
                </tr>
                <tr>
                    <td align="left" colspan="4">
                        <asp:GridView ID="gvDetalleTramite" runat="server"
                            Width="100%"
                            CellPadding="4" ForeColor="#333333"
                            PageSize="100" AutoGenerateColumns="False" EmptyDataText="NO SE ENCONTRO INFORMACION">
                            <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                            <AlternatingRowStyle BackColor="White" />
                            <Columns>
                                <asp:BoundField HeaderText="Etapa" DataField="Etapa">
                                    <ItemStyle HorizontalAlign="Left" Width="25%" />
                                </asp:BoundField>
                                <asp:BoundField HeaderText="Trámite" DataField="Tramite">
                                    <ItemStyle HorizontalAlign="Left" Width="25%" />
                                </asp:BoundField>
                                <asp:BoundField HeaderText="N° de Casos" DataField="NumeroCasos" DataFormatString="{0:N0}" HtmlEncode="False">
                                    <ItemStyle HorizontalAlign="Right" Width="10%" />
                                </asp:BoundField>
                                <asp:BoundField HeaderText="% de Casos" DataField="PorcentajeCasos" DataFormatString="{0:N2}%" HtmlEncode="False">
                                    <ItemStyle HorizontalAlign="Right" Width="10%" />
                                </asp:BoundField>
                                <asp:BoundField HeaderText="N° de Casos Dentro del Plazo" DataField="CasosEnPlazo" DataFormatString="{0:N0}" HtmlEncode="False">
                                    <ItemStyle HorizontalAlign="Right" Width="10%" />
                                </asp:BoundField>
                                <asp:BoundField HeaderText="N° de Casos por Vencer" DataField="CasosPorVencer" DataFormatString="{0:N0}" HtmlEncode="False">
                                    <ItemStyle HorizontalAlign="Right" Width="10%" />
                                </asp:BoundField>
                                <asp:BoundField HeaderText="N° de Casos Vencidos" DataField="CasosVencido" DataFormatString="{0:N0}" HtmlEncode="False">
                                    <ItemStyle HorizontalAlign="Right" Width="10%" />
                                </asp:BoundField>
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
                    <td align="right" class="barra-sub-titulo" colspan="4">&nbsp;</td>
                </tr>
            </table>

        </div>
    </form>
</body>
</html>
