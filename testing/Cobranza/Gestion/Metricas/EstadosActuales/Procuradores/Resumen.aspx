<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Resumen.aspx.cs" Inherits="CobranzaALC.Cobranza.Gestion.Metricas.EstadosActuales.Procuradores.Resumen" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title></title>
    <link href="../../../../../css/alc_estilo1.0.0.css" rel="stylesheet" />
    <link href="../../../../../css/start/jquery-ui-1.10.3.custom.min.css" rel="stylesheet" />
    <style type="text/css">
        .ui-tabs .ui-tabs-panel {
            padding: 0;
        }
    </style>
    <script type="text/javascript" src="../../../../../js/jquery-1.10.2.min.js"></script>
    <script type="text/javascript" src="../../../../../js/jquery-ui-1.10.3.custom.min.js"></script>

    <script type="text/javascript">
        $(document).ready(function () {
            $('#divTabs').tabs();

            $('#btnVolver').click(function () {
                window.location = 'ListadoProcuradores.aspx';
            });

            $('.detalle-cobranzas-termino').click(function () {
                var ids = $(this).attr('class').replace('detalle-cobranzas-termino ', '');
                window.showModalDialog('ResumenCobranzasTermino.aspx?ids=' + ids, '', 'dialogWidth:800px; dialogHeight:450px; center: 1;');
            });

            $('.detalle-cobranzas-termino').css('cursor', 'pointer');
        });
    </script>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <table cellpadding="0" cellspacing="0" border="0" style="width: 100%;">
                <tr>
                    <td class="barra-titulo">
                        <asp:Label ID="lblNombreProcurador" runat="server"></asp:Label>
                        <br />
                        <asp:Label ID="lblFecha" runat="server"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td class="barra-sub-titulo">&nbsp;&nbsp;</td>
                </tr>
                <tr>
                    <td>
                        <table cellpadding="0" cellspacing="0" border="0" style="width: 100%;">
                            <tr>
                                <td align="center" style="width: 33%" class="cuadradoBordeRedondeado cuadradoCeleste">N° Promedio de Tramitaciones:
                                    <asp:Label ID="lblVelocidadTramitacion" runat="server" Text="0,00"></asp:Label>
                                </td>
                                <td align="center" style="width: 34%" class="cuadradoBordeRedondeado cuadradoVerde">N° Promedio de Términos: <asp:Label ID="lblVelocidadTermino" runat="server">0,00</asp:Label>
                                </td>
                                <td align="center" style="width: 33%" class="cuadradoBordeRedondeado cuadradoAmarillo">Efectividad:
                                    <asp:Label ID="lblEfectividad" runat="server">0,00</asp:Label>
                                    %</td>
                            </tr>
                        </table>
                    </td>
                </tr>
                <tr>
                    <td>
                        <div id="divTabs">
                            <ul>
                                <li><a href="#divResumenCliente">Resumen</a></li>
                                <li><a href="#divResumenTramite">Trámites</a></li>
                            </ul>
                            <div id="divResumenCliente">
                                <asp:Panel ID="pnlDatosUno" runat="server" Width="830px" Height="450px" ScrollBars="Vertical">
                                    <table cellpadding="0" cellspacing="0" style="width: 100%;">
                                        <tr>
                                            <td align="center" style="width: 11.1%; border: solid 1px #000">N° de Cobranzas Asignadas (Total)</td>
                                            <td align="center" style="width: 11.1%; border: solid 1px #000">N° de Cobranzas Tramitadas en el Mes</td>
                                            <td align="center" style="width: 11.1%; border: solid 1px #000">N° de Cobranzas Terminadas en el Mes</td>
                                            <td align="center" style="width: 11.1%; border: solid 1px #000">N° de Cobranzas Vencidas (Total) </td>
                                            <td align="center" style="width: 11.1%; border: solid 1px #000">N° de Cobranzas en Plazo (Total) </td>
                                            <td align="center" style="width: 11.1%; border: solid 1px #000">N° de Cobranzas por Vencer (Total) </td>
                                            <td align="center" style="width: 11.1%; border: solid 1px #000">N° de Cobranzas Vencidas en el Mes</td>
                                            <td align="center" style="width: 11.1%; border: solid 1px #000">N° de Cobranzas en Plazo en el Mes</td>
                                            <td align="center" style="width: 11.1%; border: solid 1px #000">N° de Cobranzas por Vencer en Mes</td>
                                        </tr>
                                    </table>
                                    <asp:GridView ID="gvResumenesPorClientes" runat="server"
                                        Width="100%"
                                        CellPadding="4" ForeColor="#333333"
                                        PageSize="40" AutoGenerateColumns="False" EmptyDataText="NO SE ENCONTRO INFORMACION" ShowHeader="False">
                                        <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                                        <AlternatingRowStyle BackColor="White" />
                                        <Columns>
                                            <asp:TemplateField>
                                                <ItemTemplate>
                                                    <table cellpadding="0" cellspacing="0" border="1" style="width: 100%;">
                                                        <tr>
                                                            <td align="center" colspan="9" class="cuadradoBordeRedondeado cuadradoBlanco">
                                                                <asp:Label ID="lblNombreCliente" runat="server" Text='<%# Bind("NombreCliente") %>'></asp:Label>
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td align="center" style="width: 11.1%">
                                                                <asp:Label ID="lblNumero" runat="server" Text='<%# Eval("NumeroTotalCobranzas","{0:N0}") %>'></asp:Label>
                                                            </td>
                                                            <td align="center" style="width: 11.1%">
                                                                <asp:Label ID="lblNumero0" runat="server" Text='<%# Eval("NumeroTotalCobranzasMes","{0:N0}") %>'></asp:Label>
                                                            </td>
                                                            <td align="center" style="width: 11.1%">
                                                                <asp:Label ID="lblNumero1" runat="server" Text='<%# Eval("NumeroCobranzasTerminadasMes","{0:N0}") %>'></asp:Label>
                                                            </td>
                                                            <td align="center" style="width: 11.1%">
                                                                <asp:Label ID="lblNumero2" runat="server" Text='<%# Eval("NumeroCobranzasVencidas","{0:N0}") %>'></asp:Label>
                                                            </td>
                                                            <td align="center" style="width: 11.1%">
                                                                <asp:Label ID="lblNumero3" runat="server" Text='<%# Eval("NumeroCobranzasEnPlazo","{0:N0}") %>'></asp:Label>
                                                            </td>
                                                            <td align="center" style="width: 11.1%">
                                                                <asp:Label ID="lblNumero4" runat="server" Text='<%# Eval("NumeroCobranzasPorVencer","{0:N0}") %>'></asp:Label>
                                                            </td>
                                                            <td align="center" style="width: 11.1%">
                                                                <asp:Label ID="lblNumero5" runat="server" Text='<%# Eval("NumeroCobranzasVencidasMes","{0:N0}") %>'></asp:Label>
                                                            </td>
                                                            <td align="center" style="width: 11.1%">
                                                                <asp:Label ID="lblNumero6" runat="server" Text='<%# Eval("NumeroCobranzasEnPlazoMes","{0:N0}") %>'></asp:Label>
                                                            </td>
                                                            <td align="center" style="width: 11.1%">
                                                                <asp:Label ID="lblNumero7" runat="server" Text='<%# Eval("NumeroCobranzasPorVencerMes","{0:N0}") %>'></asp:Label>
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td align="center" style="width: 11.1%">
                                                                <asp:Label ID="lblPorcentaje" runat="server" Text='<%# Eval("PorcentajeTotalCobranzas","{0:N2}%") %>'></asp:Label>
                                                            </td>
                                                            <td align="center" style="width: 11.1%">
                                                                <asp:Label ID="lblPorcentaje0" runat="server" Text='<%# Eval("PorcentajeTotalCobranzasMes","{0:N2}%") %>'></asp:Label>
                                                            </td>
                                                            <td align="center" style="width: 11.1%">
                                                                <asp:Label ID="lblPorcentaje1" runat="server" Text='<%# Eval("PorcentajeCobranzasTerminadasMes","{0:N2}%") %>'></asp:Label>
                                                            </td>
                                                            <td align="center" style="width: 11.1%">
                                                                <asp:Label ID="lblPorcentaje2" runat="server" Text='<%# Eval("PorcentajeCobranzasVencidas","{0:N2}%") %>'></asp:Label>
                                                            </td>
                                                            <td align="center" style="width: 11.1%">
                                                                <asp:Label ID="lblPorcentaje3" runat="server" Text='<%# Eval("PorcentajeCobranzasEnPlazo","{0:N2}%") %>'></asp:Label>
                                                            </td>
                                                            <td align="center" style="width: 11.1%">
                                                                <asp:Label ID="lblPorcentaje4" runat="server" Text='<%# Eval("PorcentajeCobranzasPorVencer","{0:N2}%") %>'></asp:Label>
                                                            </td>
                                                            <td align="center" style="width: 11.1%">
                                                                <asp:Label ID="lblPorcentaje5" runat="server" Text='<%# Eval("PorcentajeCobranzasVencidasMes","{0:N2}%") %>'></asp:Label>
                                                            </td>
                                                            <td align="center" style="width: 11.1%">
                                                                <asp:Label ID="lblPorcentaje6" runat="server" Text='<%# Eval("PorcentajeCobranzasEnPlazoMes","{0:N2}%") %>'></asp:Label>
                                                            </td>
                                                            <td align="center" style="width: 11.1%">
                                                                <asp:Label ID="lblPorcentaje7" runat="server" Text='<%# Eval("PorcentajeCobranzasPorVencerMes","{0:N2}%") %>'></asp:Label>
                                                            </td>
                                                        </tr>
                                                    </table>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                        </Columns>
                                        <EditRowStyle BackColor="#2461BF" />
                                        <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                                        <HeaderStyle CssClass="cabecera_grilla" />
                                        <PagerStyle BackColor="#2461BF" ForeColor="White" />
                                        <RowStyle BackColor="#EFF3FB" />
                                        <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                                    </asp:GridView>
                                </asp:Panel>
                            </div>
                            <div id="divResumenTramite">
                                <asp:Panel ID="pnlDatosDos" runat="server" Width="830px" Height="450px" ScrollBars="Vertical">
                                    <asp:GridView ID="gvResumenesTramites" runat="server"
                                        Width="100%"
                                        CellPadding="4" ForeColor="#333333"
                                        PageSize="100" EmptyDataText="NO SE ENCONTRO INFORMACION">
                                        <AlternatingRowStyle BackColor="White" />
                                        <EditRowStyle BackColor="#2461BF" />
                                        <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                                        <PagerStyle BackColor="#2461BF" ForeColor="White" />
                                        <RowStyle BackColor="#EFF3FB" />
                                        <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                                    </asp:GridView>
                                </asp:Panel>
                            </div>
                        </div>
                    </td>
                </tr>
                <tr>
                    <td class="barra-sub-titulo">&nbsp;&nbsp;</td>
                </tr>
            </table>
        </div>
        <asp:HiddenField ID="hdfRutProcurador" runat="server" />
    </form>
</body>
</html>
