<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Mantenedor.aspx.cs" Inherits="CobranzaALC.Cobranza.mantenedores.Remesas.Mantenedor" %>

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
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <table cellpadding="0" cellspacing="0" style="width: 700px;">
                <tr>
                    <td class="barra-titulo" colspan="2">REMESAS</td>
                </tr>
                <tr>
                    <td class="barra-sub-titulo" colspan="2">&nbsp;</td>
                </tr>
                <tr>
                    <td style="width: 25%">Id Remesa</td>
                    <td style="width: 75%">
                        <asp:Label ID="lblIdRemesa" runat="server" Text="0"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td style="width: 25%">Cliente</td>
                    <td style="width: 75%">
                        <asp:DropDownList ID="ddlClientes" runat="server" Width="80%" DataValueField="rut_cli" DataTextField="rsocial">
                        </asp:DropDownList>
                    </td>
                </tr>
                <tr>
                    <td style="width: 25%">Nombre Remesa</td>
                    <td style="width: 75%">
                        <asp:TextBox ID="txtNombreRemesa" runat="server" Width="80%"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td align="right" class="barra-sub-titulo" colspan="2">
                        <asp:Button ID="btnGuardar" runat="server" CssClass="boton" OnClick="btnGuardar_Click" Text="Guardar" />
                        &nbsp;<asp:Button ID="btnVolver" runat="server" CssClass="boton" OnClick="btnVolver_Click" Text="VOLVER" />
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
