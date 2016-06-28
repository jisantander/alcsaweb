<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="MantenedorBienMuebles.aspx.cs" Inherits="CobranzaALC.Cobranza.mantenedores.RelacionBienes.MantenedorBienMuebles" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>ALC Asesorìa Legal y Crediticía Ltda</title>
    <link href="../../../css/alc2.css" rel="stylesheet" type="text/css" />
    <link href="../../../css/alc_estilo.css" rel="stylesheet" />
    <link href="../../../css/start/jquery-ui-1.10.3.custom.min.css" rel="stylesheet" />
    <script type="text/javascript" src="../../../js/jquery-1.10.2.min.js"></script>
    <script type="text/javascript" src="../../../js/jquery-ui-1.10.3.custom.min.js"></script>
    <script type="text/javascript">
        $(document).ready(function () {
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
    <style type="text/css">
        .auto-style1 {
            width: 38%;
        }
        .auto-style2 {
            width: 21%;
        }
        .auto-style4 {
            width: 81%;
        }
        .auto-style6 {
            height: 50px;
            vertical-align: top;
            background-color: #336699;
            text-align: right;
            padding: 2px 10px 2px 2px;
            font: bold 19px "Gill Sans MT", Arial;
            color: #fff;
            text-transform: uppercase;
        }
        .auto-style7 {
            width: 73%;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <table cellpadding="0" cellspacing="0" style="width: 700px;">
                <tr>
                    <td class="auto-style6" colspan="6">Modificar Bien Mueble</td>
                </tr>
                <tr>
                    <td class="barra-sub-titulo" colspan="6">&nbsp;</td>
                </tr>
                <tr>
                    <td class="auto-style2">Id Bien Mueble</td>
                    <td class="auto-style1">
                        <asp:Label ID="lblIdBienDeudor" runat="server" Text="0"></asp:Label>
                    </td>
                    <td class="auto-style4">
                        &nbsp;</td>
                    <td class="auto-style7">
                        &nbsp;</td>
                    <td style="width: 75%">
                        &nbsp;</td>
                    <td style="width: 75%">
                        &nbsp;</td>
                </tr>
                <tr>
                    <td class="auto-style2">Rut Deudor</td>
                    <td class="auto-style1">
                        <asp:TextBox ID="txtRutDeudor" runat="server" style="WIDTH: 120px; margin-left: 0px; "></asp:TextBox>
                    </td>
                    <td class="auto-style4">
                        &nbsp;</td>
                    <td class="auto-style7">
                        &nbsp;</td>
                    <td style="width: 75%">
                        &nbsp;</td>
                    <td style="width: 75%">
                        &nbsp;</td>
                </tr>
                <tr>
                        <td align="right" class="style2" >Tipo Vehículo :</td>
                        <td  align="left" class="auto-style2" >
                            <asp:DropDownList ID="tipovehiculo" runat="server" Enabled="true" AutoPostBack="True" style="WIDTH: 180px; margin-left: 0px; ">
                            
                               
                            </asp:DropDownList>
                        </td>
                        <td  align="left" class="auto-style3" >
                            &nbsp;</td>
                        <td align="right" class="style3" >Año Fabricación :</td>
                        <td  align=left class="auto-style1">
                            

                            <asp:TextBox ID="txtAnioFabricacion" runat="server" style="WIDTH: 100px; margin-left: 0px;" 
                                ></asp:TextBox>

                            
                            
                            
                        </td>
                        <td  align=left>
                            

                            &nbsp;</td>
                    </tr>
                <tr>
                        <td align="right" class="style2" >Patente :</td>
                        <td  align="left" class="auto-style2" >
                         <asp:TextBox ID="txtPatente" runat="server" style="WIDTH: 100px; margin-left: 0px;" 
                                ReadOnly="True" AutoPostBack="True" ontextchanged="txtPatente_TextChanged"></asp:TextBox>

                        </td>
                        
                        <td  align="left" class="auto-style3" >
                            &nbsp;</td>
                        
                         <td align="right" class="style3" >N° Motor :</td>
                        <td  align=left class="auto-style1">
                            <asp:TextBox ID="txtMotor" runat="server" style="WIDTH: 100px; margin-left: 0px;" 
                                ReadOnly="True"></asp:TextBox>
                        </td>
                        
                        
                        <td  align=left>
                            &nbsp;</td>
                        
                        
                    </tr>
                <tr>
                    
                     <td align="right" class="style2" >Marca :</td>
                        <td  align=left class="auto-style2">
                         <asp:DropDownList ID="marca" runat="server" Enabled="true" 
                                style="WIDTH: 180px; margin-left: 0px; " 
                                onselectedindexchanged="marca_SelectedIndexChanged" AutoPostBack="True">
                               
                            </asp:DropDownList>
                        </td>
                        
                        <td  align=left class="auto-style3">
                            <asp:ImageButton ID="IBtn_Agregar_Marca"   runat="server" OnClientClick="return Popup_Marca();" ImageUrl="~/images/iconos/icono_agregar.png" />
                        </td>
                        
                        <td align="right" class="style3" >Modelo :</td>
                        <td  align="left" class="auto-style1" >
                           <asp:DropDownList ID="modelo" runat="server" Enabled="true"  style="WIDTH: 180px; margin-left: 0px; "
                               >
                              
                               
                            </asp:DropDownList>
                        </td>
                        <td  align="right" class="style1" >
                            <asp:ImageButton ID="IBtn_Agregar_Modelo"  runat="server" OnClientClick="return Popup_Modelo();" ImageUrl="~/images/iconos/icono_agregar.png" />
                            
                        </td>
                    </tr>
                <tr>
                        <td align="right" class="style2" >N° Chassis :</td>
                        <td  align="left" class="auto-style2" >
                           <asp:TextBox ID="txtChassis" runat="server" 
                                style="WIDTH: 100px; margin-left: 0px;" ></asp:TextBox>
                        </td>
                        <td  align="left" class="auto-style3" >
                            &nbsp;</td>
                        <td align="right" class="style3" >Color :</td>
                        <td  align=left class="auto-style1">
                            <asp:DropDownList ID="color" runat="server" Enabled="true" style="WIDTH: 180px; margin-left: 0px; "
                               >
                               
                            </asp:DropDownList>
                        </td>
                        <td  align=left>
                            &nbsp;</td>
                    </tr>
                <tr>
                        <td align="right" class="style2" >Limitaciones :</td>
                        <td  align="left" class="auto-style2" >
                            <asp:DropDownList ID="limitaciones" runat="server" Enabled="true" style="WIDTH: 180px; margin-left: 0px; "
                               >
                              <asp:ListItem Value="0">Seleccione</asp:ListItem>
                                <asp:ListItem Value="1">Prenda</asp:ListItem>
                                <asp:ListItem Value="2">Embargo</asp:ListItem>
                                <asp:ListItem Value="3">Otros</asp:ListItem>
                            </asp:DropDownList>
                        
                        </td>
                        <td  align="left" class="auto-style3" >
                            &nbsp;</td>
                        <td align="right" class="style3" >Estado :</td>
                        <td  align=left class="auto-style1">
                           <asp:DropDownList ID="estado" runat="server" Enabled="true" style="WIDTH: 180px; margin-left: 0px; "
                               >
                             
                                <asp:ListItem Value="N">Nuevo</asp:ListItem>
                                <asp:ListItem Value="U">Usado</asp:ListItem>
                             
                            </asp:DropDownList>
                        </td>
                        <td  align=left>
                            &nbsp;</td>
                    </tr>
                <tr>
                     <td class="textos22"  colspan="5">&nbsp;</td>
                     <td class="textos22">&nbsp;</td>
                    </tr>
                <tr>
                    <td class="auto-style2">&nbsp;</td>
                    <td class="auto-style1">
                        &nbsp;</td>
                    <td class="auto-style4">
                        &nbsp;</td>
                    <td class="auto-style7">
                        &nbsp;</td>
                    <td style="width: 75%">
                        &nbsp;</td>
                    <td style="width: 75%">
                        &nbsp;</td>
                </tr>
                <tr>
                    <td align="right" class="barra-sub-titulo" colspan="3">
                        <asp:Button ID="btnGuardar" runat="server" CssClass="boton" OnClick="btnGuardar_Click" Text="Guardar" />
                        </td>
                    <td align="left" class="barra-sub-titulo" colspan="3">
                        <asp:Button ID="btnVolver" runat="server" CssClass="boton" OnClick="btnVolver_Click" Text="VOLVER" />
                    </td>
                </tr>
            </table>

        </div>
        <div id="divMensaje" title="Mensaje">
            <table style="width: 100%;">
                <tr>
                    <td style="width: 20%; text-align: center; vertical-align: central;">
                        <img src="../../../images/alert-icon-red-md.png" alt="*" style="width: 70px; height: 70px;" />
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
