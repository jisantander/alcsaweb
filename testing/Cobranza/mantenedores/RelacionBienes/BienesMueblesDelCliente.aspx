<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="BienesMueblesDelCliente.aspx.cs" Inherits="CobranzaALC.Cobranza.mantenedores.RelacionBienes.BienesMueblesDelCliente" %>

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
             var pWin = window.open(documento, 'newWin', 'width=800,height=650,scrollbars=1,satus=0,menubar=no,top=10,left=100')
             pWin.focus()
             
         }
         else alert('No Hay Documentos');
         
         return false;
     }

     function Popup() {
         var url = 'ReporteBienesMueblesDelCliente.aspx';
         var pWin = window.open(url, 'newWin', 'width=750,height=400,scrollbars=1,resizable=yes,satus=0,menubar=yes,top=10,left=100')
         pWin.focus()
         return false;
     }

     function PopupInforme() {
         var url = '../../Documentos/Formatos/Bienes/InformeBienMuebles.aspx';
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
                    <td class="barra-titulo" colspan="2">Bienes Muebles del deudor</td>
                </tr>
                <tr>
                    <td class="barra-sub-titulo">
                        <asp:ImageButton ID="ImageButton1"  runat="server" OnClientClick="return Popup();"
                            ImageUrl="~/images/ico_excel.gif" Width="20px" Height="20px" />
                    </td>
                    <td class="barra-sub-titulo">
                        <asp:Label ID="Lb_MarcaSinMasBienesMuebles" runat="server" Visible="False"></asp:Label>&nbsp;
                        <asp:Label ID="Lb_FechaMarca" runat="server" Visible="False"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style1" colspan="2">
                        <asp:GridView ID="gvBienes" runat="server"
                            AllowPaging="True"
                            Width="100%"
                           
                            CellPadding="4" ForeColor="#333333"
                            GridLines="None"  PageSize="25"  EmptyDataText="No se encontraron Bienes Muebles" AutoGenerateColumns="False" OnSelectedIndexChanged="gvBienes_SelectedIndexChanged" OnPageIndexChanging="gvBienes_PageIndexChanging">
                            <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                            <AlternatingRowStyle BackColor="White" />
                            <Columns>
                                 
                                <asp:TemplateField>
                                <ItemTemplate>
                                   <asp:ImageButton ID="btnInforme" runat="server" OnClick="btnInforme_Click" CommandArgument='<%# Eval("id_bien_mueble")  +","+ Eval("TipoVehiculo")+","+ Eval("Marca") +","+ Eval("Modelo")+","+ Eval("patente")+","+Eval("anio_fabricacion")+","+ Eval("NombreCliente")+","+ Eval("NombreDeudor")+","+ Eval("RUT_DEUDOR") %>' Height="20px"  ImageUrl="~/images/b_editar.gif"  Width="20px" />
                                   
                                        
                                </ItemTemplate>
                                 
                                </asp:TemplateField>
                                <asp:BoundField DataField="id_bien_mueble"  HeaderText="Id">
                                    <ItemStyle HorizontalAlign="Left" Width="5%" />
                                </asp:BoundField>
                                 
                                <asp:BoundField DataField="RUT_DEUDOR" HeaderText="Rut Deudor" FooterStyle-Font-Size="XX-Small">
                                    <ItemStyle HorizontalAlign="Left" Width="50%" />
                                </asp:BoundField>
                                <asp:BoundField DataField="TipoVehiculo" HeaderText="TipoVehiculo">
                                    <ItemStyle HorizontalAlign="Left" Width="40%" />
                                </asp:BoundField>
                                <asp:BoundField DataField="Marca" HeaderText="Marca">
                                    <ItemStyle HorizontalAlign="Left" Width="25%" />
                                </asp:BoundField>
                                <asp:BoundField DataField="Modelo" HeaderText="Modelo">
                                    <ItemStyle HorizontalAlign="Left" Width="25%" />
                                </asp:BoundField>
                                 <asp:BoundField DataField="n_chassis" HeaderText="n_chassis">
                                    <ItemStyle HorizontalAlign="Left" Width="25%" />
                                </asp:BoundField>
                                 <asp:BoundField DataField="Color" HeaderText="Color">
                                    <ItemStyle HorizontalAlign="Left" Width="25%" />
                                </asp:BoundField>
                                 <asp:BoundField DataField="n_motor" HeaderText="n_motor">
                                    <ItemStyle HorizontalAlign="Left" Width="25%" />
                                </asp:BoundField>
                                <asp:BoundField DataField="patente" HeaderText="patente">
                                    <ItemStyle HorizontalAlign="Left" Width="100%" />
                                </asp:BoundField>
                                <asp:BoundField DataField="anio_fabricacion" HeaderText="Año Fabric.">
                                    <ItemStyle HorizontalAlign="Left" Width="100%" />
                                </asp:BoundField>
                                <asp:BoundField DataField="id_limitaciones" HeaderText="id_limitaciones">
                                    <ItemStyle HorizontalAlign="Left" Width="100%" />
                                </asp:BoundField>
                                <asp:BoundField DataField="estado" HeaderText="estado">
                                    <ItemStyle HorizontalAlign="Left" Width="100%" />
                                </asp:BoundField>
                                <asp:TemplateField ConvertEmptyStringToNull="False">
                                    <EditItemTemplate>
                                        <asp:DynamicControl ID="DynamicControl1" runat="server" DataField="" Mode="Edit" />
                                    </EditItemTemplate>
                                    <ItemTemplate>
                                        <asp:ImageButton ID="btnModificar" runat="server" CommandArgument='<%# Bind("patente") %>' Height="20px" OnClick="btnModificar_Click" ImageUrl="~/images/iconos/icono_actualizar.png"  Width="20px" />
                                    </ItemTemplate>
                                    <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" Width="5%" />
                                </asp:TemplateField>
                                <asp:TemplateField ConvertEmptyStringToNull="False">
                                    <EditItemTemplate>
                                        <asp:DynamicControl ID="DynamicControl2" runat="server" DataField="" Mode="Edit" />
                                    </EditItemTemplate>
                                    <ItemTemplate>
                                        <asp:ImageButton ID="btnEliminar" runat="server" CommandArgument='<%# Bind("id_bien_mueble") %>' OnClick="btnEliminar_Click" Height="20px" ImageUrl="~/images/iconos/icono_eliminar.png" Width="20px" />
                                    </ItemTemplate>
                                    <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" Width="5%" />
                                </asp:TemplateField>                              
                                   <asp:TemplateField HeaderText="Ver"  >
                              <ItemTemplate>
                               <a href="#" onclick="javascript:MostrarDocumento('<%# Eval("urldocumento")%>');" >
                               <asp:Image ID="Img_VerDoc" runat="server" ImageUrl="~/images/Iconos/Buscar.png" ToolTip="Ver Documento"  />

                               </a> 
                              </ItemTemplate>
                             </asp:TemplateField>
                              
                            </Columns>
                            <EditRowStyle BackColor="#2461BF"  />
                            <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                            <HeaderStyle CssClass="cabezabrilla"  />
                            <PagerStyle BackColor="#2461BF"  ForeColor="White" />
                            <RowStyle BackColor="#EFF3FB"   />
                            <SelectedRowStyle BackColor="#D1DDF1"  Font-Bold="True" ForeColor="#333333" />
                        </asp:GridView>
                    </td>
                </tr>
                <tr>
                    <td align="right" class="barra-sub-titulo" colspan="2">
                        <asp:Button ID="btn_volver" runat="server" CssClass="boton"  OnClientClick="cerrarVentana()" Text="Volver" />
                    </td>
                </tr>
                <tr>
                    <td colspan="2">
                        &nbsp;</td>
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
                    <td style="width: 20%; text-align: center; vertical-align: central;">
                        &nbsp;</td>
                    <td style="width: 80%; text-align: left; vertical-align: central; font: bold 18px arial; padding-left: 4px;">
                        &nbsp;</td>
                </tr>
            </table>
        </div>
    </form>
</body>
</html>
