<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AvancePorEtapa.aspx.cs" Inherits="CobranzaALC.Cobranza.Gestion.Metricas.Avances.AvancePorEtapa" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link href="../../../../css/alc_estilo.css" rel="stylesheet" />
    <link href="../../../../css/start/jquery-ui-1.10.3.custom.min.css" rel="stylesheet" />
    <link href="../../../../css/jquery.jqplot.min.css" rel="stylesheet" />

    <script type="text/javascript" src="../../../../js/jquery-1.10.2.min.js"></script>
    <script type="text/javascript" src="../../../../js/jquery-ui-1.10.3.custom.min.js"></script>

    <script type="text/javascript" src="../../../../js/jqplot/jquery.jqplot.min.js"></script>
    <script type="text/javascript" src="../../../../js/jqplot/excanvas.min.js"></script>
    <script type="text/javascript" src="../../../../js/jqplot/plugins/jqplot.barRenderer.min.js"></script>
    <script type="text/javascript" src="../../../../js/jqplot/plugins/jqplot.categoryAxisRenderer.min.js"></script>
    <script type="text/javascript" src="../../../../js/jqplot/plugins/jqplot.pointLabels.min.js"></script>
    <script type="text/javascript" src="../../../../js/jqplot/plugins/jqplot.canvasTextRenderer.min.js"></script>
    <script type="text/javascript" src="../../../../js/jqplot/plugins/jqplot.canvasAxisTickRenderer.min.js"></script>

    <script type="text/javascript">
        $(document).ready(function () {
            $('.control-calendario').datepicker({
                dateFormat: 'dd/mm/yy',
                changeMonth: true,
                changeYear: true
            });

            $('#divGrafico').jqplot([datosGrafico], {
                animate: true,
                seriesDefault: {
                    renderer: $.jqplot.BarRenderer,
                    pointLabel: { show: true },
                    rendererOptions: {
                        varyBarColor: true,
                        animation: {
                            speed: 900
                        }
                    }
                },
                axes: {
                    xaxis: {
                        renderer: $.jqplot.CategoryAxisRenderer,
                        tickRenderer: $.jqplot.CanvasAxisTickRenderer,
                        tickOptions: {
                            angle: -40,
                            fontSize: '8pt'
                        }
                    },
                    yaxis: {
                        tickRenderer: $.jqplot.CanvasAxisTickRenderer,
                        tickOptions: {
                            fontSize: '7pt',
                            formatString: '%#.1f'
                        }
                    }
                }
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
        
        <table cellpadding="0" cellspacing="0" border="0" style="width: 100%; min-width: 700px;">
            <tr>
                <td class="barra-titulo" colspan="4">Avances por etapa</td>
            </tr>
            <tr>
                <td align="left" style="width: 15%">Cliente</td>
                <td align="left" style="width: 35%">
                        <asp:DropDownList ID="ddlClientes" runat="server" ClientIDMode="Static" Width="98%" DataTextField="rsocial" DataValueField="rut_cli">
                        </asp:DropDownList>
                    </td>
                <td align="left" style="width: 15%">Procurador</td>
                <td align="left" style="width: 35%">
                        <asp:DropDownList ID="ddlProcuradores" runat="server" ClientIDMode="Static" Width="98%" DataValueField="rut" DataTextField="nombres">
                        </asp:DropDownList>
                    </td>
            </tr>
            <tr>
                <td align="left" style="width: 15%">Fecha Desde</td>
                <td align="left" style="width: 35%">
                    <asp:TextBox ID="txtFechaDesde" runat="server" MaxLength="10" Width="120px" CssClass="control-calendario"></asp:TextBox>
                    </td>
                <td align="left" style="width: 15%">Fecha Hasta</td>
                <td align="left" style="width: 35%">
                    <asp:TextBox ID="txtFechaHasta" runat="server" MaxLength="10" Width="120px" CssClass="control-calendario"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td align="right" colspan="4" class="barra-sub-titulo">
                    <asp:Button ID="btnBuscar" runat="server" CssClass="boton" OnClick="btnBuscar_Click" Text="Buscar" />
                </td>
            </tr>
            <tr>
                <td align="left" colspan="4">
                    <asp:Literal ID="ltrInformacionGrafico" runat="server"></asp:Literal>
                    <div id="divGrafico" style="width:100% ;height:250px; display:inline-block"></div>
                </td>
            </tr>
            <tr>
                <td align="left" class="barra-sub-titulo" colspan="4">Detalle</td>
            </tr>
            <tr>
                <td align="left" colspan="4">
                        <asp:GridView ID="gvDetalle" runat="server"
                            Width="100%"
                            CellPadding="4" ForeColor="#333333"
                            PageSize="100" AutoGenerateColumns="False" EmptyDataText="NO SE ENCONTRO INFORMACION">
                            <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                            <AlternatingRowStyle BackColor="White" />
                            <Columns>
                                <asp:BoundField HeaderText="Etapa" DataField="Etapa">
                                    <ItemStyle HorizontalAlign="Left" Width="60%" />
                                </asp:BoundField>
                                <asp:BoundField HeaderText="Número Cobranzas" DataField="NumeroCobranzas" DataFormatString="{0:N0}" HtmlEncode="False">
                                    <ItemStyle HorizontalAlign="Right" Width="20%" />
                                </asp:BoundField>
                                <asp:BoundField HeaderText="Porcentaje Avance" DataField="PorcentajeAvance" DataFormatString="{0:N2}%" HtmlEncode="False">
                                    <ItemStyle HorizontalAlign="Right" Width="20%" />
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
                <td align="left" class="barra-sub-titulo" colspan="4">&nbsp;&nbsp;</td>
            </tr>
        </table>
        
    </div>
    </form>
</body>
</html>
