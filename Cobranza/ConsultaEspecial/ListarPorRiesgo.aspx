<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ListarPorRiesgo.aspx.cs" Inherits="CobranzaALC.Cobranza.ConsultaEspecial.ListarPorRiesgo" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>ALC Asesorìa Legal y Crediticía Ltda</title>
    <link href="../../css/alc_estilo.css" rel="stylesheet" />
    <link href="../../css/alc2.css" rel="stylesheet" />
    <script type="text/javascript" src="../../js/jquery-1.10.2.min.js"></script>

    <script language="javascript" type="text/javascript">
        function Popup() {
            var url = 'ReporteListarPorRiesgo.aspx';
            var pWin = window.open(url, 'newWin', 'width=900,height=650,scrollbars=1,resizable=yes,satus=0,menubar=yes,top=10,left=100')
            pWin.focus();
            return false;
        }
    </script>

</head>
<body>
    <form id="form1" runat="server">
        <div>
            <table cellpadding="0" cellspacing="0" style="width: 800px">
                <tr>
                    <td class="barra-titulo" colspan="3">JUICIOS - RIESGO</td>
                </tr>
                <tr>
                    <td class="barra-sub-titulo" colspan="3">FILTRO DE BUSQUEDA</td>
                </tr>
                <tr>
                    <td style="width: 25%">Riesgo</td>
                    <td style="width: 50%">
                        <asp:DropDownList ID="ddlRiesgo" runat="server" DataTextField="Nombre" DataValueField="ID" Width="99%" Height="20px">
                        </asp:DropDownList>
                    </td>
                    <td align="center" style="width: 25%">
                        <asp:ImageButton ID="ImageButton1" runat="server" OnClientClick="return Popup();"
                            ImageUrl="~/images/ico_excel.gif" Width="20px" Height="20px" />
                    </td>
                </tr>
                <tr>
                    <td style="width: 25%">Cliente</td>
                    <td style="width: 50%">
                        <asp:DropDownList ID="ddlCliente" runat="server"
                            Style="margin-left: 0px;" AutoPostBack="True" Width="99%" Height="19px">
                        </asp:DropDownList>
                    </td>
                    <td style="width: 25%"></td>
                </tr>
                <tr>
                    <td style="width: 25%">Procurador</td>
                    <td style="width: 50%">
                        <asp:DropDownList ID="ddlProcurador" runat="server"
                            Style="margin-left: 0px;" Width="99%" Height="21px" AutoPostBack="True">
                        </asp:DropDownList>
                    </td>
                    <td style="width: 25%"></td>
                </tr>
                <tr>
                    <td style="width: 25%">Tribunal</td>
                    <td style="width: 50%">
                        <asp:DropDownList ID="ddlTribunal" runat="server"
                            Style="margin-left: 0px;" Width="99%" Height="22px" AutoPostBack="True">
                        </asp:DropDownList>
                    </td>
                    <td style="width: 25%"></td>
                </tr>
                <tr>
                    <td style="width: 25%">&nbsp;</td>
                    <td style="width: 50%">
                        <asp:DropDownList ID="ddlUltimaActividadExhorto" runat="server"
                            Style="WIDTH: 400px; margin-left: 0px;" Visible="False">
                        </asp:DropDownList>
                    </td>
                    <td style="width: 25%">&nbsp;</td>
                </tr>
                <tr class="barra-sub-titulo">
                    <td style="width: 25%">Total Registros:</td>
                    <td style="width: 50%">

                        <asp:Label ID="lab_Total_Registros" runat="server" Font-Size="Small" Font-Bold="True" ForeColor="Blue"></asp:Label>
                    </td>
                    <td style="width: 25%">
                        <asp:Button ID="btnBuscar" runat="server" Text="Buscar" OnClick="btnBuscar_Click" Width="150px" />
                    </td>
                </tr>
                <tr>
                    <td colspan="3">

                        <asp:Panel ID="pnlGrilla" runat="server" Height="450px" ScrollBars="Both" Width="100%" BorderWidth="1px" BorderColor="#c8e3f9">
                            <asp:GridView ID="gvJuicios" runat="server"
                                AllowPaging="True"
                                Width="100%"
                                CellPadding="4" ForeColor="#333333"
                                GridLines="None" PageSize="100" OnPageIndexChanging="gvJuicios_PageIndexChanging" EmptyDataText="NO SE ENCONTRARON REGISTROS" AutoGenerateColumns="False" ShowHeader="False">
                                <AlternatingRowStyle BackColor="White" />
                                <Columns>
                                    <asp:TemplateField>
                                        <ItemTemplate>
                                            <table cellpadding="0" cellspacing="0" style="width: 100%;">
                                                <tr>
                                                    <td class="barra-sub-titulo" colspan="2">fecha riesgo:
                                                        <asp:Label ID="lblFechaRiesgo" runat="server" Text='<%# Eval("FechaRiesgo", "{0:dd-MM-yyyy}") %>'></asp:Label>
                                                        &nbsp;- TRIBUNAL:
                                                        <asp:Label ID="lblTribunal" runat="server" Text='<%# Bind("NombreTribunal") %>'></asp:Label>
                                                        &nbsp;- ROL:
                                                        <asp:Label ID="lblRol" runat="server" Text='<%# Bind("Rol") %>'></asp:Label>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td style="width: 20%">Deudor</td>
                                                    <td style="width: 80%">
                                                        <asp:Label ID="lblNombreDeudor" runat="server" Text='<%# Bind("NombreDeudor") %>'></asp:Label>
                                                        &nbsp;[<asp:Label ID="lblRutDeudor" runat="server" Text='<%# Bind("RutDeudor") %>'></asp:Label>
                                                        ]</td>
                                                </tr>
                                                <tr>
                                                    <td style="width: 20%">Cliente</td>
                                                    <td style="width: 80%">
                                                        <asp:Label ID="lblNombreCliente" runat="server" Text='<%# Bind("NombreCliente") %>'></asp:Label>
                                                        &nbsp;[<asp:Label ID="lblRutCliente" runat="server" Text='<%# Bind("RutCliente") %>'></asp:Label>
                                                        ]</td>
                                                </tr>
                                                <tr>
                                                    <td style="width: 20%">Procurador</td>
                                                    <td style="width: 80%">
                                                        <asp:Label ID="lblNombreProcurador" runat="server" Text='<%# Bind("NombreProcurador") %>'></asp:Label>
                                                        &nbsp;[<asp:Label ID="lblRutProcurador" runat="server" Text='<%# Bind("RutProcurador") %>'></asp:Label>
                                                        ]</td>
                                                </tr>
                                                <tr>
                                                    <td style="width: 20%">Abogado</td>
                                                    <td style="width: 80%">
                                                        <asp:Label ID="lblNombreAbogado" runat="server" Text='<%# Bind("NombreAbogado") %>'></asp:Label>
                                                        &nbsp;[<asp:Label ID="lblRutAbogado" runat="server" Text='<%# Bind("RutAbogado") %>'></asp:Label>
                                                        ]</td>
                                                </tr>
                                                <tr>
                                                    <td style="width: 20%">Tipo Riesgo</td>
                                                    <td style="width: 80%">
                                                        <asp:Label ID="lblNombreRiesgo" runat="server" Text='<%# Bind("NombreRiesgo") %>'></asp:Label>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td style="width: 20%">Fecha Tramite</td>
                                                    <td style="width: 80%">
                                                        <asp:Label ID="Label4" runat="server" Text='<%# Bind("FECHA_TRAMITE") %>'></asp:Label>

                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td style="width: 20%">Tramite</td>
                                                    <td style="width: 80%">
                                                        <asp:Label ID="Label3" runat="server" Text='<%# Bind("NOMBRE_TRAMITE") %>'></asp:Label>

                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td style="width: 20%">Fecha SubTramite</td>
                                                    <td style="width: 80%">
                                                        <asp:Label ID="Label2" runat="server" Text='<%# Bind("FECHASUBTRAMITE") %>'></asp:Label>

                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td style="width: 20%">SubTramite</td>
                                                    <td style="width: 80%">
                                                        <asp:Label ID="Label1" runat="server" Text='<%# Bind("SUBTRAMITE") %>'></asp:Label>

                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td style="width: 20%">Observación SubTramite</td>
                                                    <td style="width: 80%">
                                                        <asp:Label ID="Label5" runat="server" Text='<%# Bind("ObservacionSubTramite") %>'></asp:Label>
                                                    </td>
                                                </tr>
                                            </table>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                </Columns>
                                <EditRowStyle BackColor="#2461BF" />
                                <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                                <HeaderStyle CssClass="cabezabrilla" />
                                <PagerStyle BackColor="#2461BF" ForeColor="White" />
                                <RowStyle BackColor="#EFF3FB" />
                                <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                            </asp:GridView>
                        </asp:Panel>
                    </td>
                </tr>
                <tr>
                    <td class="barra-sub-titulo" colspan="3" align="right">&nbsp;</td>
                </tr>
            </table>
        </div>
    </form>
</body>
</html>
