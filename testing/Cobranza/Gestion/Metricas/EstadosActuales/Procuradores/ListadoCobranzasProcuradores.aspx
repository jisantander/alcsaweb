<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ListadoCobranzasProcuradores.aspx.cs" Inherits="CobranzaALC.Cobranza.Gestion.Metricas.EstadosActuales.Procuradores.ListadoCobranzasProcuradores" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title></title>
    <link href="../../../../../css/alc_estilo1.0.0.css" rel="stylesheet" />
    <script type="text/javascript" src="../../../../../js/jquery-1.10.2.min.js"></script>

    <script type="text/javascript">
        $(document).ready(function () {
            $('#btnVolver').click(function () {
                window.location = 'ListadoProcuradores.aspx';
            });
        });
    </script>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <table cellpadding="0" cellspacing="0" border="0" style="width: 100%; min-width: 700px;">
                <tr>
                    <td class="barra-titulo" colspan="4">Cobranzas procurador:
                        <asp:Label ID="lblNombreProcurador" runat="server"></asp:Label>

                    </td>
                </tr>
                <tr>
                    <td style="width: 15%">Etapa</td>
                    <td style="width: 35%">
                        <asp:DropDownList ID="ddlEtapas" runat="server" DataTextField="Nombre" DataValueField="Nombre" Width="95%">
                        </asp:DropDownList>

                    </td>
                    <td style="width: 15%">&nbsp;</td>
                    <td style="width: 35%">&nbsp;</td>
                </tr>
                <tr>
                    <td style="width: 15%">Trámite</td>
                    <td style="width: 35%">
                        <asp:DropDownList ID="ddlTramites" runat="server" DataTextField="Descripcion" DataValueField="Descripcion" Width="95%">
                        </asp:DropDownList>

                    </td>
                    <td style="width: 15%">&nbsp;</td>
                    <td style="width: 35%">&nbsp;</td>
                </tr>
                <tr>
                    <td align="right" class="barra-sub-titulo" colspan="4">

                        <asp:Button ID="btnFiltrar" runat="server" CssClass="boton"  Text="Filtrar" OnClick="btnFiltrar_Click" />
                    &nbsp;<asp:Button ID="btnExportar" runat="server" CssClass="boton" Text="Exportar Excel" OnClick="btnExportar_Click" />
                        &nbsp;<input id="btnVolver" class="boton" type="button" value="Volver" /></td>
                </tr>
                <tr>
                    <td align="left" colspan="4">
                        <asp:GridView ID="gvDetalle" runat="server"
                            Width="100%"
                            CellPadding="4" ForeColor="#333333"
                            PageSize="40" AutoGenerateColumns="False" EmptyDataText="NO SE ENCONTRO INFORMACION" AllowPaging="True" OnPageIndexChanging="gvDetalle_PageIndexChanging">
                            <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                            <AlternatingRowStyle BackColor="White" />
                            <Columns>
                                <asp:BoundField HeaderText="N° Operación" DataField="NumeroOperacion"></asp:BoundField>
                                <asp:BoundField HeaderText="Rut Deudor" DataField="RutDeudor"></asp:BoundField>
                                <asp:BoundField HeaderText="Nombre Deudor" DataField="NombreDeudor"></asp:BoundField>
                                <asp:BoundField HeaderText="Nombre Cliente" DataField="NombreCliente"></asp:BoundField>
                                <asp:BoundField DataField="FechaIngresoComoTexto" HeaderText="Fecha Ingreso Cobranza" />
                                <asp:BoundField DataField="PlazoDias" DataFormatString="{0:N0}" HeaderText="Plazo Días" HtmlEncode="False" />
                                <asp:BoundField DataField="DiasDesdeIngresoCobranza" DataFormatString="{0:N0}" HeaderText="Días Desde Ingreso Cobranza" HtmlEncode="False" />
                                <asp:BoundField DataField="DiasRestantes" DataFormatString="{0:N0}" HeaderText="Días Restantes" HtmlEncode="False" />
                                <asp:BoundField DataField="DiasAtraso" DataFormatString="{0:N0}" HeaderText="Días Atraso" />
                                <asp:BoundField DataField="FechaLimiteComoTexto" HeaderText="Fecha Límite" />
                                <asp:BoundField DataField="FechaTerminoComoTexto" HeaderText="Fecha Termino" />
                                <asp:BoundField DataField="Rol" HeaderText="Rol" />
                                <asp:BoundField DataField="Estado" HeaderText="Estado" />
                                <asp:BoundField DataField="EstadoAvance" HeaderText="Estado Avance" />
                                <asp:BoundField DataField="Etapa" HeaderText="Etapa" />
                                <asp:BoundField DataField="Tramite" HeaderText="Trámite" />
                                <asp:BoundField DataField="SubTramite" HeaderText="Sub-Trámite" />
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
        <asp:HiddenField ID="hdfRutProcurador" runat="server" />
        <asp:HiddenField ID="hdfEstadoAvance" runat="server" />
    </form>
</body>
</html>
