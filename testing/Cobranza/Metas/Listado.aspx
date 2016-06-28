<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Listado.aspx.cs" Inherits="CobranzaALC.Cobranza.Metas.Listado" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link href="../../css/alc_estilo.css" rel="stylesheet" />
    <link href="../../css/alc2.css" rel="stylesheet" />
    <link href="../../css/start/jquery-ui-1.10.3.custom.min.css" rel="stylesheet" />
    <link href="../../css/morris.css" rel="stylesheet" />
    <style type="text/css">
        .barra-metas-izquierda {
            width: 100%;
            height: 600px;
            overflow-x: hidden;
            overflow-y: scroll;
            margin: 0 2px 0 0;
        }

        .barra-detalle-cobranzas {
            width: 100%;
            height: 288px;
            overflow-x: hidden;
            overflow-y: scroll;
        }

        .barra-contenedor-grafico {
            width: 100%;
            height: 288px;
            overflow: hidden;
        }
    </style>

    <script type="text/javascript" src="../../js/jquery-1.10.2.min.js"></script>
    <script type="text/javascript" src="../../js/jquery-ui-1.10.3.custom.min.js"></script>

    <script type="text/javascript" src="../../js/modernizr-2.5.3-respond-1.1.0.min.js"></script>
    <script type="text/javascript" src="../../js/raphael-2.0.2.min.js"></script>
    <script type="text/javascript" src="../../js/morris.js"></script>

</head>
<body>
    <form id="form1" runat="server">
        <table cellpadding="0" cellspacing="0" style="width: 97%;">
            <tr>
                <td class="barra-titulo" colspan="2">METAS PROCURADORES</td>
            </tr>
            <tr>
                <td style="width: 25%">Procurador</td>
                <td style="width: 75%">
                    <asp:DropDownList ID="ddlProcuradores" runat="server" Width="95%" AutoPostBack="True" OnSelectedIndexChanged="ddlProcuradores_SelectedIndexChanged" DataTextField="NombreCompleto" DataValueField="Rut">
                    </asp:DropDownList>
                </td>
            </tr>
            <tr>
                <td align="right" colspan="2">
                    <table cellpadding="0" cellspacing="0" style="width: 100%">
                        <tr>
                            <td align="left" valign="top" class="barra-sub-titulo" colspan="2">
                                <asp:Button ID="btnVolverUnMes" runat="server" Height="20px" OnClick="btnVolverUnMes_Click" Text="&lt;--" Width="50px" />
&nbsp;<asp:Label ID="lblMes" runat="server"></asp:Label>
                            &nbsp;<asp:Button ID="btnAdelantarUnMes" runat="server" Height="20px" OnClick="btnAdelantarUnMes_Click" Text="--&gt;" Width="50px" />
                                <asp:HiddenField ID="hdfFechaSeleccion" runat="server" />
                            </td>
                        </tr>
                        <tr>
                            <td align="left" style="width: 20%" valign="top" rowspan="4">
                                <div class="barra-metas-izquierda">
                                    <asp:GridView ID="gvMetasMesActual" runat="server" AutoGenerateColumns="False" CellPadding="4" EmptyDataText="NO SE ENCONTRARON REGISTROS" ForeColor="#333333" GridLines="None" PageSize="25" Width="100%">
                                        <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                                        <AlternatingRowStyle BackColor="White" />
                                        <Columns>
                                            <asp:BoundField DataField="Etapa" HeaderText="Etapa">
                                                <HeaderStyle HorizontalAlign="Left" />
                                                <ItemStyle HorizontalAlign="Left" />
                                            </asp:BoundField>
                                            <asp:BoundField DataField="Numero" DataFormatString="{0:N0}" HeaderText="Numero Meta">
                                                <HeaderStyle HorizontalAlign="Center" />
                                                <ItemStyle HorizontalAlign="Center" />
                                            </asp:BoundField>
                                            <asp:BoundField DataField="NumeroActual" HeaderText="Numero Mes">
                                                <HeaderStyle HorizontalAlign="Center" />
                                                <ItemStyle HorizontalAlign="Center" />
                                            </asp:BoundField>
                                        </Columns>
                                        <EditRowStyle BackColor="#2461BF" />
                                        <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                                        <PagerStyle BackColor="#2461BF" ForeColor="White" />
                                        <RowStyle BackColor="#EFF3FB" />
                                        <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                                    </asp:GridView>
                                </div>
                            </td>
                            <td align="center" style="width: 80%" valign="top">
                                <div class="barra-contenedor-grafico">
                                    <div id="divGraficoBarras">
                                    </div>
                                    <asp:Literal ID="ltrGrafico" runat="server"></asp:Literal>
                                </div>
                            </td>
                        </tr>
                        <tr>
                            <td align="left" style="width: 80%" valign="top">
                            <table cellpadding="0" cellspacing="0" style="width: 100%">
                                <tr>
                                    <td class="barra-sub-titulo" >Detalle de Cobranzas</td>
                                    <td class="barra-sub-titulo" align="right" style="width: 150px" >
                                        <asp:Button ID="btnExportarExcel" runat="server" CssClass="boton" Text="Exportar Excel" Width="150px" OnClick="btnExportarExcel_Click" />
                                    </td>
                                </tr>
                                </table>
                            </td>
                        </tr>
                        <tr>
                            <td align="center" style="width: 80%" valign="top">
                                <div class="barra-detalle-cobranzas">
                                    <asp:GridView ID="gvDetalleCobranzas" runat="server" AutoGenerateColumns="False" CellPadding="4" EmptyDataText="NO SE ENCONTRARON REGISTROS" ForeColor="#333333" GridLines="None" PageSize="25" Width="100%" style="margin-right: 0px">
                                        <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                                        <AlternatingRowStyle BackColor="White" />
                                        <Columns>
                                            <asp:BoundField DataField="Etapa" HeaderText="Etapa">
                                                <HeaderStyle HorizontalAlign="Left" />
                                                <ItemStyle HorizontalAlign="Left" />
                                            </asp:BoundField>
                                            <asp:BoundField DataField="RutCliente" HeaderText="Rut Cliente">
                                                <HeaderStyle HorizontalAlign="Left" />
                                                <ItemStyle HorizontalAlign="Left" />
                                            </asp:BoundField>
                                            <asp:BoundField DataField="RutDeudor" HeaderText="Rut Deudor">
                                                <HeaderStyle HorizontalAlign="Left" />
                                                <ItemStyle HorizontalAlign="Left" />
                                            </asp:BoundField>

                                            <asp:BoundField DataField="Nombre" HeaderText="Nombre Deudor">
                                                <HeaderStyle HorizontalAlign="Left" />
                                                <ItemStyle HorizontalAlign="Left" />
                                            </asp:BoundField>

                                            <asp:BoundField HeaderText="Estado Cobranza" DataField="EstadoCobranza" >
                                                <HeaderStyle HorizontalAlign="Left" />
                                                <ItemStyle HorizontalAlign="Left" />
                                            </asp:BoundField>

                                            <asp:BoundField DataField="Rol" HeaderText="Rol" >
                                                <HeaderStyle HorizontalAlign="Left" />
                                                <ItemStyle HorizontalAlign="Left" />
                                            </asp:BoundField>

                                            <asp:BoundField DataField="Tribunal" HeaderText="Tribunal" >
                                                <HeaderStyle HorizontalAlign="Left" />
                                                <ItemStyle HorizontalAlign="Left" />
                                            </asp:BoundField>


                                            <asp:BoundField DataField="Tramite" HeaderText="Tramite" >
                                                <HeaderStyle HorizontalAlign="Left" />
                                                <ItemStyle HorizontalAlign="Left" />
                                            </asp:BoundField>

                                            <asp:BoundField DataField="FechaTramite" DataFormatString="{0:dd-MM-yyyy}" HeaderText="Fecha Tramite" HtmlEncode="False" >
                                                <ItemStyle HorizontalAlign="Center" />
                                            </asp:BoundField>
                                        </Columns>
                                        <EditRowStyle BackColor="#2461BF" />
                                        <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                                        <PagerStyle BackColor="#2461BF" ForeColor="White" />
                                        <RowStyle BackColor="#EFF3FB" />
                                        <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                                    </asp:GridView>
                                </div>
                            </td>
                        </tr>
                    </table>
                </td>
            </tr>
            <!--<asp:Panel ID="pnlDefiniciones" runat="server" Visible="false">-->
            <tr>
                <td class="barra-titulo" align="right" colspan="2">Definiciones</td>
            </tr>
            <tr>
                <td class="barra-sub-titulo" align="right" colspan="2">
                    <asp:Button ID="btnNuevaMeta" runat="server" CssClass="boton" Text="Nueva Meta" Width="150px" OnClick="btnNuevaMeta_Click" />
                </td>
            </tr>
            <tr>
                <td colspan="2">
                    <asp:GridView ID="gvMetas" runat="server" AutoGenerateColumns="False" CellPadding="4" EmptyDataText="NO SE ENCONTRARON METAS" ForeColor="#333333" GridLines="None" PageSize="25" Width="100%">
                        <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                        <AlternatingRowStyle BackColor="White" />
                        <Columns>
                            <asp:BoundField DataField="ID" DataFormatString="{0:0000}" HeaderText="ID" HtmlEncode="False">
                                <HeaderStyle HorizontalAlign="Center" />
                                <ItemStyle HorizontalAlign="Center" Width="15%" />
                            </asp:BoundField>
                            <asp:BoundField DataField="Etapa" HeaderText="Etapa">
                                <HeaderStyle HorizontalAlign="Left" />
                                <ItemStyle HorizontalAlign="Left" Width="35%" />
                            </asp:BoundField>
                            <asp:BoundField DataField="Numero" DataFormatString="{0:N0}" HeaderText="Numero">
                                <HeaderStyle HorizontalAlign="Center" />
                                <ItemStyle HorizontalAlign="Center" Width="15%" />
                            </asp:BoundField>
                            <asp:BoundField DataField="FechaDesde" DataFormatString="{0:dd-MM-yyyy}" HeaderText="Fecha Desde" HtmlEncode="False">
                                <HeaderStyle HorizontalAlign="Center" />
                                <ItemStyle HorizontalAlign="Center" Width="15%" />
                            </asp:BoundField>
                            <asp:BoundField DataField="FechaHasta" DataFormatString="{0:dd-MM-yyyy}" HeaderText="Fecha Hasta" HtmlEncode="False">
                                <HeaderStyle HorizontalAlign="Center" />
                                <ItemStyle HorizontalAlign="Center" Width="15%" />
                            </asp:BoundField>
                            <asp:TemplateField HeaderText="Ver">
                                <ItemTemplate>
                                    <asp:ImageButton ID="btnVer" runat="server" CommandArgument='<%# Bind("ID") %>' ImageUrl="~/images/iconos/Buscar.png" OnClick="btnVer_Click" />
                                </ItemTemplate>
                                <HeaderStyle HorizontalAlign="Center" />
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
            <!--</asp:Panel>-->
            <tr>
                <td class="barra-sub-titulo" colspan="2">&nbsp;</td>
            </tr>
        </table>
    </form>
</body>
</html>
