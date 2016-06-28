<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ListadoProcuradores.aspx.cs" Inherits="CobranzaALC.Cobranza.Gestion.Metricas.EstadosActuales.Procuradores.ListadoProcuradores" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title></title>
    <link href="../../../../../css/alc_estilo1.0.0.css" rel="stylesheet" />
    <link href="../../../../../css/start/jquery-ui-1.10.3.custom.min.css" rel="stylesheet" />
    <style type="text/css">
        .enlace_resumen_procurador {
            cursor: pointer;
        }
    </style>

    <script type="text/javascript" src="../../../../../js/jquery-1.10.2.min.js"></script>
    <script type="text/javascript" src="../../../../../js/jquery-ui-1.10.3.custom.min.js"></script>

    <script type="text/javascript">
        $(document).ready(function () {
            $('.enlace_resumen_procurador').click(function () {
                var rut = $(this).attr('class').replace('enlace_resumen_procurador ', '');
                var nombre = $(this).text();
                var ventana = window.open('Resumen.aspx?rut_pro=' + rut + '&nombre=' + nombre, 'resumen_procurador', 'width=850,height=650,scrollbar=yes');
                ventana.focus();
            });
        });
    </script>

</head>
<body>
    <form id="form1" runat="server">
        <div>
            <table cellpadding="0" cellspacing="0" border="0" style="width: 100%; min-width: 700px;">
                <tr>
                    <td class="barra-titulo" colspan="4">Estado de cobranzas por Procurador</td>
                </tr>
                <tr>
                    <td align="left" style="width: 15%">Procurador</td>
                    <td align="left" style="width: 35%">
                        <asp:DropDownList ID="ddlProcurador" runat="server" ClientIDMode="Static" Width="98%" DataTextField="nombres" DataValueField="rut" AutoPostBack="True" OnSelectedIndexChanged="ddlClientes_SelectedIndexChanged">
                        </asp:DropDownList>
                    </td>
                    <td align="left" style="width: 15%">&nbsp;</td>
                    <td align="left" style="width: 35%"></td>
                </tr>
                <tr>
                    <td align="right" class="barra-sub-titulo" colspan="4">
                        <asp:Button ID="btnExportar" runat="server" CssClass="boton" Text="Exportar Excel" OnClick="btnExportar_Click" />
                    </td>
                </tr>
                <tr>
                    <td align="left" colspan="4">
                        <asp:GridView ID="gvDetalle" runat="server"
                            Width="100%"
                            CellPadding="4" ForeColor="#333333"
                            PageSize="1000" AutoGenerateColumns="False" EmptyDataText="NO SE ENCONTRÓ INFORMACION" ShowHeader="False">
                            <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                            <AlternatingRowStyle BackColor="White" />
                            <Columns>
                                <asp:TemplateField>
                                    <ItemTemplate>
                                        <table cellpadding="0" cellspacing="0" border="0" style="width: 100%;">
                                            <tr>
                                                <td>
                                                    <asp:Label ID="lblNombreProcurador" runat="server" Font-Bold="True" Font-Size="Larger" Text='<%# Bind("NombreProcurador") %>' Font-Underline="True" CssClass='<%# Eval("RutProcurador", "enlace_resumen_procurador {0}") %>'></asp:Label>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td align="right">
                                                    <table cellpadding="0" cellspacing="0" border="0" style="width: 90%;">
                                                        <tr>
                                                            <td align="center" style="width: 20%" class="cuadradoBordeRedondeado cuadradoBlanco">Total:
                                                                <asp:HyperLink ID="hlkNumeroTotal" runat="server" Text='<%# Eval("NumeroTotalCobranzas", "{0:0000}") %>' NavigateUrl='<%# Eval("RutProcurador", "ListadoCobranzasProcuradores.aspx?rut_pro={0}&est=todos") %>'></asp:HyperLink>
                                                            </td>
                                                            <td align="center" style="width: 20%" class="cuadradoBordeRedondeado cuadradoRojo">Vencidas:
                                                                <asp:HyperLink ID="hlkNumeroVencidas" runat="server" Text='<%# Eval("NumeroCobranzasVencidas", "{0:0000}") %>' NavigateUrl='<%# Eval("RutProcurador", "ListadoCobranzasProcuradores.aspx?rut_pro={0}&est=vencida") %>'></asp:HyperLink>
                                                            </td>
                                                            <td align="center" style="width: 20%" class="cuadradoBordeRedondeado cuadradoAmarillo">Por Vencer:
                                                                <asp:HyperLink ID="hlkNumeroPorVencer" runat="server" Text='<%# Eval("NumeroCobranzasPorVencer", "{0:0000}") %>' NavigateUrl='<%# Eval("RutProcurador", "ListadoCobranzasProcuradores.aspx?rut_pro={0}&est=por_vencer") %>'></asp:HyperLink>
                                                            </td>
                                                            <td align="center" style="width: 20%" class="cuadradoBordeRedondeado cuadradoVerde">En Plazo:
                                                                <asp:HyperLink ID="hlkNumeroEnFecha" runat="server" Text='<%# Eval("NumeroCobranzasEnPlazo", "{0:0000}") %>' NavigateUrl='<%# Eval("RutProcurador", "ListadoCobranzasProcuradores.aspx?rut_pro={0}&est=en_plazo") %>'></asp:HyperLink>
                                                            </td>
                                                            <td align="center" style="width: 20%" class="cuadradoBordeRedondeado cuadradoCeleste ">Terminadas:
                                                                <asp:HyperLink ID="hlkNumeroTerminadas" runat="server" Text='<%# Eval("NumeroCobranzasTerminadas", "{0:0000}") %>' NavigateUrl='<%# Eval("RutProcurador", "ListadoCobranzasProcuradores.aspx?rut_pro={0}&est=terminada") %>'></asp:HyperLink>
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td align="center" class="cuadradoBordeRedondeado cuadradoBlanco" colspan="5">
                                                                <table cellpadding="0" cellspacing="0" border="0" style="width: 100%;">
                                                                    <tr>
                                                                        <td align="center" style="width: 20%" >Asignado:
                                                                            <asp:Label ID="HyperLink1" runat="server" Text='<%# Eval("PorcentajeAsignado", "{0:N2}%") %>' ></asp:Label>
                                                                        </td>
                                                                        <td align="center" style="width: 20%" >Vencidas:
                                                                            <asp:Label ID="HyperLink2" runat="server" Text='<%# Eval("PorcentajeVencidas", "{0:N2}%") %>' ></asp:Label>
                                                                        </td>
                                                                        <td align="center" style="width: 20%" >Por Vencer:
                                                                            <asp:Label ID="HyperLink3" runat="server" Text='<%# Eval("PorcentajePorVencer", "{0:N2}%") %>' ></asp:Label>
                                                                        </td>
                                                                        <td align="center" style="width: 20%" >En Plazo:
                                                                            <asp:Label ID="HyperLink4" runat="server" Text='<%# Eval("PorcentajeEnPlazo", "{0:N2}%") %>' ></asp:Label>
                                                                        </td>
                                                                        <td align="center" style="width: 20%" >Terminadas:
                                                                            <asp:Label ID="HyperLink5" runat="server" Text='<%# Eval("PorcentajeTerminado", "{0:N2}%") %>' ></asp:Label>
                                                                        </td>
                                                                    </tr>
                                                                </table>
                                                            </td>
                                                        </tr>
                                                    </table>
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
