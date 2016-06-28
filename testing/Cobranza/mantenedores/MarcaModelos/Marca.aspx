<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Marca.aspx.cs" Inherits="CobranzaALC.Cobranza.mantenedores.MarcaModelos.Marca" %>

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
</script>

    <style type="text/css">
        .auto-style1 {
            width: 25%;
            height: 14px;
        }
        .auto-style2 {
            width: 75%;
            height: 14px;
        }
        </style>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <table cellpadding="0" cellspacing="0" style="width: 700px;">
                <tr>
                    <td class="barra-titulo" colspan="2">Agregar Marca </td>
                </tr>
                <tr>
                    <td class="barra-sub-titulo" colspan="2">&nbsp;</td>
                </tr>
                <tr>
                    <td class="auto-style1"><strong>Marca</strong></td>
                    <td class="auto-style2">
                        <asp:TextBox ID="TextBox1" runat="server" Width="512px"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td align="right" class="barra-sub-titulo" colspan="2">
                        <asp:Button ID="btn_Agregar" runat="server" CssClass="boton"  Text="Agregar Nuevo" OnClick="btn_Agregar_Click" />
                        <asp:Button ID="btn_volver" runat="server" CssClass="boton"  OnClientClick="cerrarVentana()" Text="Volver" />
                    </td>
                </tr>
                <tr>
                    <td colspan="2">
                        &nbsp;</td>
                </tr>
                <tr>
                    <td class="barra-sub-titulo" colspan="2">&nbsp;</td>
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
