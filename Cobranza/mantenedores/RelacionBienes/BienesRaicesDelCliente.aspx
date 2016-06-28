<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="BienesRaicesDelCliente.aspx.cs" Inherits="CobranzaALC.Cobranza.mantenedores.RelacionBienes.BienesRaicesDelCliente" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>ALC Asesorìa Legal y Crediticía Ltda</title>
    <link href="../../../css/alc2.css" rel="stylesheet" type="text/css" />
    <link href="../../../css/alc_estilo.css" rel="stylesheet" />
    <link href="../../../css/start/jquery-ui-1.10.3.custom.min.css" rel="stylesheet" />
    <script type="text/javascript" src="../../../js/jquery-1.10.2.min.js"></script>
    <script type="text/javascript" src="../../../js/jquery-ui-1.10.3.custom.min.js"></script>
    <script language="javascript" type="text/javascript">
        function cerrarVentana() {
            //la referencia de la ventana es el objeto window del popup. Lo utilizo para acceder al método close
            window.close();
        }
        function MostrarDocumento(documento) {
            if (documento != '') {
                var url = 'http://www.alcsa.cl/DIGITALIZADOS/' + documento;
                var pWin = window.open(url, 'newWin', 'width=800,height=650,scrollbars=1,satus=0,menubar=no,top=10,left=100')
                pWin.focus();

            }
            else alert('No Hay Documentos');
            return false;
        }

        function Popup() {
            var url;
            url = 'ReporteBienesRaicesDelCliente.aspx';
            pWin = window.open(url, 'newWin', 'width=750,height=400,scrollbars=1,resizable=yes,satus=0,menubar=yes,top=10,left=100')
            if (window.pWin)
                pWin.focus()
            return false;
        }

        function PopupInforme() {
            var url = '../../Documentos/Formatos/Bienes/InformeBienRaiz.aspx';
            var pWin = window.open(url, 'newWin', 'width=2000,height=400,scrollbars=1,resizable=yes,satus=0,menubar=yes,top=10,left=100')
            pWin.focus()
            return false;
        }

    </script>

    <style type="text/css">
        .auto-style1 {
            height: 14px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <table cellpadding="0" cellspacing="0" style="width: 700px;">
                <tr>
                    <td class="barra-titulo" colspan="2">Bienes Raices del deudor</td>
                </tr>
                <tr>
                    <td class="barra-sub-titulo">
                        <asp:ImageButton ID="ImageButton1" runat="server" OnClientClick="return Popup();"
                            ImageUrl="~/images/ico_excel.gif" Width="20px" Height="20px" />

                    </td>
                    <td class="barra-sub-titulo">
                        <asp:Label ID="Lb_MarcaSinMasBienesRaices" runat="server" Visible="False"></asp:Label>&nbsp;
                        <asp:Label ID="Lb_FechaMarca" runat="server" Visible="False"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style1" colspan="2">
                        <asp:GridView ID="gvBienes" runat="server"
                            AllowPaging="True"
                            Width="100%"
                            CellPadding="4" ForeColor="#333333"
                            GridLines="None" PageSize="25" EmptyDataText="No se encontraron Bienes Raices" AutoGenerateColumns="False" OnSelectedIndexChanged="gvBienes_SelectedIndexChanged" OnPageIndexChanging="gvBienes_PageIndexChanging">
                            <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                            <AlternatingRowStyle BackColor="White" />
                            <Columns>

                                <asp:TemplateField>
                                    <ItemTemplate>
                                        <asp:ImageButton ID="btnInforme" runat="server" OnClick="btnInforme_Click" CommandArgument='<%# Eval("ID_BIEN_RAIZ")  +","+ Eval("DIRECCION")+","+ Eval("CONSERVADOR") +","+ Eval("FOJAS_INSC")+","+ Eval("N_INSC")+","+ Eval("ANIO_INSC")+","+ Eval("RUT_DEUDOR")+","+ Eval("COMUNA") %>' Height="20px" ImageUrl="~/images/b_editar.gif" Width="20px" />


                                    </ItemTemplate>

                                </asp:TemplateField>
                                <asp:BoundField DataField="ID_BIEN_RAIZ" HeaderText="Id">
                                    <ItemStyle HorizontalAlign="Left" Width="5%" />
                                </asp:BoundField>

                                <asp:BoundField DataField="RUT_DEUDOR" HeaderText="Rut Deudor">
                                    <ItemStyle HorizontalAlign="Left" Width="30%" />
                                </asp:BoundField>
                                <asp:BoundField DataField="DIRECCION" HeaderText="Domicilio">
                                    <ItemStyle HorizontalAlign="Left" Width="40%" />
                                </asp:BoundField>
                                <asp:BoundField DataField="Region" HeaderText="Región">
                                    <ItemStyle HorizontalAlign="Left" Width="25%" />
                                </asp:BoundField>
                                <asp:BoundField DataField="Comuna" HeaderText="Comuna">
                                    <ItemStyle HorizontalAlign="Left" Width="25%" />
                                </asp:BoundField>
                                <asp:BoundField DataField="FOJAS_INSC" HeaderText="Fojas">
                                    <ItemStyle HorizontalAlign="Left" Width="25%" />
                                </asp:BoundField>
                                <asp:BoundField DataField="N_INSC" HeaderText="Nº">
                                    <ItemStyle HorizontalAlign="Left" Width="25%" />
                                </asp:BoundField>
                                <asp:BoundField DataField="ANIO_INSC" HeaderText="Año">
                                    <ItemStyle HorizontalAlign="Left" Width="25%" />
                                </asp:BoundField>
                                <asp:BoundField DataField="Conservador" HeaderText="Conservador">
                                    <ItemStyle HorizontalAlign="Left" Width="100%" />
                                </asp:BoundField>
                                <asp:TemplateField ConvertEmptyStringToNull="False">
                                    <EditItemTemplate>
                                        <asp:DynamicControl ID="DynamicControl1" runat="server" DataField="" Mode="Edit" />
                                    </EditItemTemplate>
                                    <ItemTemplate>
                                        <asp:ImageButton ID="btnModificar" runat="server" CommandArgument='<%# Eval("ID_BIEN_RAIZ")  +","+ Eval("ID_REGION")+"," + Eval("ID_COMUNA")+"," + Eval("ID_COMUNA_CBR") %>' Height="20px" OnClick="btnModificar_Click" ImageUrl="~/images/iconos/icono_actualizar.png" Width="20px" />
                                    </ItemTemplate>
                                    <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" Width="5%" />
                                </asp:TemplateField>
                                <asp:TemplateField ConvertEmptyStringToNull="False">
                                    <EditItemTemplate>
                                        <asp:DynamicControl ID="DynamicControl2" runat="server" DataField="" Mode="Edit" />
                                    </EditItemTemplate>
                                    <ItemTemplate>
                                        <asp:ImageButton ID="btnEliminar" runat="server" CommandArgument='<%# Bind("ID_BIEN_RAIZ") %>' OnClick="btnEliminar_Click" Height="20px" ImageUrl="~/images/iconos/icono_eliminar.png" Width="20px" />
                                    </ItemTemplate>
                                    <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" Width="5%" />
                                </asp:TemplateField>

                                <asp:BoundField DataField="urldocumento" HeaderText="Doc.">
                                    <ItemStyle HorizontalAlign="Left" Width="20%" Font-Size="X-Small" />
                                </asp:BoundField>

                                <asp:TemplateField HeaderText="Ver">
                                    <ItemTemplate>
                                        <a href="#" onclick="javascript:MostrarDocumento('<%# Eval("urldocumento")%>');">
                                            <asp:Image ID="Img_VerDoc" runat="server" ImageUrl="~/images/Iconos/Buscar.png" ToolTip="Ver Documento" />

                                        </a>
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
                    </td>
                </tr>
                <tr>
                    <td align="right" class="barra-sub-titulo" colspan="2">
                        <asp:Button ID="btn_volver" runat="server" CssClass="boton" OnClientClick="cerrarVentana()" Text="Volver" />
                    </td>
                </tr>
                <tr>
                    <td colspan="2">&nbsp;</td>
                </tr>
                <tr>
                    <td class="barra-sub-titulo" colspan="2">
                        <asp:Label ID="Lb_RutDeudor" runat="server" Visible="False"></asp:Label>
                        <asp:Label ID="Lb_ID_BIEN_RAIZ" runat="server" Visible="true"></asp:Label>
                    </td>
                </tr>
            </table>

        </div>
        <div id="divMensaje" title="Mensaje">
            <table style="width: 100%;">
                <tr>
                    <td style="width: 20%; text-align: center; vertical-align: central;">&nbsp;</td>
                    <td style="width: 80%; text-align: left; vertical-align: central; font: bold 18px arial; padding-left: 4px;">&nbsp;</td>
                </tr>
            </table>
        </div>
    </form>
</body>
</html>
