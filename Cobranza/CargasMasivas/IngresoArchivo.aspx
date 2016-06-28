<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="IngresoArchivo.aspx.cs" Inherits="CobranzaALC.Cobranza.CargasMasivas.IngresoArchivo" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>ALC Asesorìa Legal y Crediticía Ltda</title>
    <link href="../../css/alc2.css" rel="stylesheet" />
    <link href="../../css/start/jquery-ui-1.10.3.custom.min.css" rel="stylesheet" />
    <link href="../../css/alc_estilo.css" rel="stylesheet" />
    <script type="text/javascript" src="../../js/jquery-1.10.2.min.js"></script>
    <script type="text/javascript" src="../../js/jquery-ui-1.10.3.custom.min.js"></script>
    <script type="text/javascript" src="../../js/datepicker-es.js"></script>
    <script type="text/javascript">
        $(document).ready(function () {
            $('#txtFechaVencimiento').datepicker();

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
            <table cellpadding="0" cellspacing="0" style="width: 700px">
                <tr>
                    <td class="barra-titulo" colspan="4">CARGAS MASIVAS</td>
                </tr>
                <tr>
                    <td class="barra-sub-titulo" colspan="4">información de cobranza</td>
                </tr>
                <tr>
                    <td style="width: 15%">Código Proceso</td>
                    <td style="width: 35%">
                        <asp:Label ID="lblCodigoProceso" runat="server"></asp:Label>
                    </td>
                    <td style="width: 15%">Usuario</td>
                    <td style="width: 35%">
                        <asp:Label ID="lblUsuario" runat="server"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td style="width: 15%">Cliente</td>
                    <td style="width: 35%">
                        <asp:DropDownList ID="ddlClientes" runat="server" DataTextField="rsocial" DataValueField="rut_cli" Width="95%" AutoPostBack="True" OnSelectedIndexChanged="ddlClientes_SelectedIndexChanged">
                        </asp:DropDownList>
                    </td>
                    <td style="width: 15%">&nbsp;</td>
                    <td style="width: 35%">&nbsp;</td>
                </tr>
                <tr>
                    <td style="width: 15%">Tipo Cobranza</td>
                    <td style="width: 35%">
                        <asp:DropDownList ID="ddlTiposCobranzas" runat="server" AutoPostBack="True"
                            OnSelectedIndexChanged="ddlTiposCobranzas_SelectedIndexChanged" Width="95%">
                            <asp:ListItem Value="J">JUDICIAL</asp:ListItem>
                            <asp:ListItem Value="P">PRE-JUDICIAL</asp:ListItem>
                            <asp:ListItem Value="A">PRENDA</asp:ListItem>

                        </asp:DropDownList>
                    </td>
                    <td style="width: 15%">Procedimiento</td>
                    <td style="width: 35%">
                        <asp:DropDownList ID="ddlTiposProcedimientos" runat="server"
                            AutoPostBack="True"
                            OnSelectedIndexChanged="ddlTiposProcedimientos_SelectedIndexChanged" Width="95%" DataTextField="descripcion" DataValueField="id_procedimiento">
                        </asp:DropDownList>
                    </td>
                </tr>
                <tr>
                    <td style="width: 15%">Materia</td>
                    <td style="width: 35%">
                        <asp:DropDownList ID="ddlMaterias" runat="server" Width="95%"
                            AutoPostBack="True" OnSelectedIndexChanged="ddlMaterias_SelectedIndexChanged" DataTextField="descripcion" DataValueField="id_materia">
                        </asp:DropDownList>
                    </td>
                    <td style="width: 15%">Producto</td>
                    <td style="width: 35%">
                        <asp:DropDownList ID="ddlProductos" runat="server" Width="95%" DataTextField="descripcion" DataValueField="id_producto">
                        </asp:DropDownList>
                    </td>
                </tr>
                <tr>
                    <td style="width: 15%">Fecha Vencimiento</td>
                    <td style="width: 35%">
                        <asp:TextBox ID="txtFechaVencimiento" runat="server" ClientIDMode="Static"></asp:TextBox>
                    </td>
                    <td style="width: 15%">&nbsp;</td>
                    <td style="width: 35%">
                        &nbsp;</td>
                </tr>
                <tr>
                    <td class="barra-sub-titulo" colspan="4">Archivo</td>
                </tr>
                <tr>
                    <td style="width: 15%">Archivo Excel</td>
                    <td colspan="3">
                        <asp:FileUpload ID="fupArchivoExcel" runat="server" Width="95%" />
                    </td>
                </tr>
                <tr>
                    <td style="width: 15%"></td>
                    <td style="width: 35%">
                        <a href="Temporal/Prueba Carga Masiva.xlsx">Descargar Archivo de Prueba</a>
                    </td>
                    <td style="width: 15%"></td>
                    <td style="width: 35%"></td>
                </tr>
                <tr>
                    <td style="width: 15%">REMESA</td>
                    <td style="width: 35%">
                            <asp:DropDownList ID="ddlRemesas" runat="server" Width="100%" DataValueField="ID" DataTextField="Nombre">
                            </asp:DropDownList>
                    </td>
                    <td style="width: 15%">&nbsp;</td>
                    <td style="width: 35%">&nbsp;</td>
                </tr>
                <tr>
                    <td align="right" class="barra-sub-titulo" colspan="4">
                        <asp:Button ID="btnProcesarCarga" runat="server" Text="Cargar" CssClass="boton" OnClick="btnProcesarCarga_Click" />
                    </td>
                </tr>
                <tr>
                    <td class="barra-sub-titulo" colspan="4">Registros del archivo</td>
                </tr>
                <tr>
                    <td colspan="4">

                        <asp:Panel ID="pnlGrilla" runat="server" Height="350px" ScrollBars="Both" Width="690px">
                            <asp:GridView ID="gvDetalleArchivo" runat="server"
                                AllowPaging="True"
                                Width="100%"
                                CellPadding="4" ForeColor="#333333"
                                GridLines="None" PageSize="500" OnPageIndexChanging="gvDetalleArchivo_PageIndexChanging" EmptyDataText="NO SE HAN CARGADO DATOS DEL ARCHIVO">
                                <HeaderStyle CssClass="cabezabrilla" />
                                <RowStyle BackColor="#EFF3FB" />
                                <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                                <PagerStyle BackColor="#2461BF" ForeColor="White" />
                                <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                                <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                                <EditRowStyle BackColor="#2461BF" />
                                <AlternatingRowStyle BackColor="White" />
                            </asp:GridView>
                        </asp:Panel>

                    </td>
                </tr>
                <tr>
                    <td class="barra-sub-titulo" colspan="4" align="right">
                        
                        <asp:Button ID="btnProcesarFinal" runat="server" Text="Guardar" CssClass="boton" OnClick="btnProcesarFinal_Click" Visible="False" />
                    </td>
                </tr>
            </table>
        </div>
        <div id="divMensaje" title="Mensaje">
            <table style="width: 100%;">
                <tr>
                    <td style="width: 20%; text-align: center; vertical-align: central;">
                        <img src="../../images/alert-icon-red-md.png" alt="*" style="width: 70px; height: 70px;" />
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
