<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Mantenedor.aspx.cs" Inherits="CobranzaALC.Cobranza.mantenedores.RelacionBienes.Mantenedor" %>

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
            width: 16%;
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
                    <td class="auto-style6" colspan="6">Modificar Bien Raiz</td>
                </tr>
                <tr>
                    <td class="barra-sub-titulo" colspan="6">&nbsp;</td>
                </tr>
                <tr>
                    <td class="auto-style2">Id Remesa</td>
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
                    <td class="auto-style2">Domicilio</td>
                    <td colspan="2">
                        <asp:DropDownList ID="lisDomicilio" runat="server"  AutoPostBack="true"
                                style="WIDTH: 100%; margin-left: 0px; " OnSelectedIndexChanged="lisDomicilio_SelectedIndexChanged"> 
                        </asp:DropDownList>
                    </td>
                    <td class="auto-style7">
                        &nbsp;</td>
                    <td style="width: 75%">
                        &nbsp;</td>
                    <td style="width: 75%">
                        &nbsp;</td>
                </tr>
                <tr>
                    <td class="auto-style2">Región</td>
                    <td colspan="2">
                        <asp:DropDownList ID="lisRegion" runat="server"  AutoPostBack="true"
                                style="WIDTH: 100%; margin-left: 0px; " OnSelectedIndexChanged="lisRegion_SelectedIndexChanged"> 
                        </asp:DropDownList>
                    </td>
                    <td class="auto-style7">
                        &nbsp;</td>
                    <td style="width: 75%">
                        &nbsp;</td>
                    <td style="width: 75%">
                        &nbsp;</td>
                </tr>
                <tr>
                    <td class="auto-style2">Comuna</td>
                    <td colspan="2">
                        <asp:DropDownList ID="lisComuna" runat="server"  AutoPostBack="true"
                                style="WIDTH: 100%; margin-left: 0px; " OnSelectedIndexChanged="lisComuna_SelectedIndexChanged"> 
                        </asp:DropDownList>
                    </td>
                    <td class="auto-style7">
                        &nbsp;</td>
                    <td style="width: 75%">
                        &nbsp;</td>
                    <td style="width: 75%">
                        &nbsp;</td>
                </tr>
                <tr>
                    <td class="auto-style2">&nbsp;</td>
                    <td class="auto-style1">
                        Insc.</td>
                    <td class="auto-style4">
                        Hip1.</td>
                    <td class="auto-style7">
                        Hip2.</td>
                    <td style="width: 75%">
                        Proh1.</td>
                    <td style="width: 75%">
                        Proh2.</td>
                </tr>
                <tr>
                    <td class="auto-style2">Fojas</td>
                    <td class="auto-style1">
                        <asp:TextBox ID="txtFojas1" runat="server" style="WIDTH: 120px; margin-left: 0px; "></asp:TextBox>
                    </td>
                    <td class="auto-style4">
                        <asp:TextBox ID="txtFojas2" runat="server" style="margin-left: 0px; " Width="120px"></asp:TextBox>
                    </td>
                    <td class="auto-style7">
                        <asp:TextBox ID="txtFojas3" runat="server" style="WIDTH: 120px; margin-left: 0px; "></asp:TextBox>
                    </td>
                    <td style="width: 75%">
                        <asp:TextBox ID="txtFojas4" runat="server" style="WIDTH: 120px; margin-left: 0px; "></asp:TextBox>
                    </td>
                    <td style="width: 75%">
                        <asp:TextBox ID="txtFojas5" runat="server" style="WIDTH: 120px; margin-left: 0px; "></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style2">Nº</td>
                    <td class="auto-style1">
                        <asp:TextBox ID="txtNumero1" runat="server" style="WIDTH: 120px; margin-left: 0px; "></asp:TextBox>
                    </td>
                    <td class="auto-style4">
                        <asp:TextBox ID="txtNumero2" runat="server" style="WIDTH: 120px; margin-left: 0px; "></asp:TextBox>
                    </td>
                    <td class="auto-style7">
                        <asp:TextBox ID="txtNumero3" runat="server" style="WIDTH: 120px; margin-left: 0px; "></asp:TextBox>
                    </td>
                    <td style="width: 75%">
                        <asp:TextBox ID="txtNumero4" runat="server" style="WIDTH: 120px; margin-left: 0px; "></asp:TextBox>
                    </td>
                    <td style="width: 75%">
                        <asp:TextBox ID="txtNumero5" runat="server" style="WIDTH: 120px; margin-left: 0px; "></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style2">Año</td>
                    <td class="auto-style1">
                        <asp:TextBox ID="txtAno1" runat="server" style="WIDTH: 120px; margin-left: 0px; "></asp:TextBox>
                    </td>
                    <td class="auto-style4">
                        <asp:TextBox ID="txtAno2" runat="server" style="WIDTH: 120px; margin-left: 0px; "></asp:TextBox>
                    </td>
                    <td class="auto-style7">
                        <asp:TextBox ID="txtAno3" runat="server" style="WIDTH: 120px; margin-left: 0px; "></asp:TextBox>
                    </td>
                    <td style="width: 75%">
                        <asp:TextBox ID="txtAno4" runat="server" style="WIDTH: 120px; margin-left: 0px; "></asp:TextBox>
                    </td>
                    <td style="width: 75%">
                        <asp:TextBox ID="txtAno5" runat="server" style="WIDTH: 120px; margin-left: 0px; "></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style2">Convervador</td>
                    <td colspan="2">
                        <asp:DropDownList ID="lisConservador" runat="server"  AutoPostBack="true"
                                style="WIDTH: 100%; margin-left: 0px; " OnSelectedIndexChanged="lisConservador_SelectedIndexChanged"> 
                        </asp:DropDownList>
                    </td>
                    <td class="auto-style7">
                        &nbsp;</td>
                    <td style="width: 75%">
                        &nbsp;</td>
                    <td style="width: 75%">
                        &nbsp;</td>
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
