<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Mantenedor.aspx.cs" Inherits="CobranzaALC.Cobranza.Metas.Mantenedor" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link href="../../css/alc_estilo.css" rel="stylesheet" />
    <link href="../../css/alc2.css" rel="stylesheet" />
    <link href="../../css/start/jquery-ui-1.10.3.custom.min.css" rel="stylesheet" />

    <script type="text/javascript" src="../../js/jquery-1.10.2.min.js"></script>
    <script type="text/javascript" src="../../js/jquery-ui-1.10.3.custom.min.js"></script>
    <script type="text/javascript" src="../../js/datepicker-es.js"></script>

    <script type="text/javascript">
        $(document).ready(function () {
            $('.control-calendario').datepicker({
                dateFormat: 'dd/mm/yy',
                changeMonth: true,
                changeYear: true
            });
        });
    </script>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <table cellpadding="0" cellspacing="0" style="width: 700px;">
            <tr>
                <td class="barra-titulo" colspan="4">METAS PROCURADORES</td>
            </tr>
            <tr>
                <td style="width: 15%">ID Meta</td>
                <td style="width: 35%">
                    <asp:Label ID="lblIdMeta" runat="server" Font-Bold="True" Text="0000"></asp:Label>
                </td>
                <td style="width: 15%">&nbsp;</td>
                <td style="width: 35%">&nbsp;</td>
            </tr>
            <tr>
                <td style="width: 15%">Etapa</td>
                <td style="width: 35%">
                    <asp:DropDownList ID="ddlEtapas" runat="server" DataTextField="Nombre" DataValueField="Nombre" Width="95%" AutoPostBack="True" OnSelectedIndexChanged="ddlEtapas_SelectedIndexChanged">
                    </asp:DropDownList>
                </td>
                <td style="width: 15%">Numero</td>
                <td style="width: 35%">
                    <asp:TextBox ID="txtNumero" runat="server"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td style="width: 15%">Fecha Desde</td>
                <td style="width: 35%">
                    <asp:TextBox ID="txtFechaDesde" runat="server" CssClass="control-calendario"></asp:TextBox>
                </td>
                <td style="width: 15%">Fecha Hasta</td>
                <td style="width: 35%">
                    <asp:TextBox ID="txtFechaHasta" runat="server" CssClass="control-calendario"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td style="width: 15%">Trámites</td>
                <td colspan="3">
                    <asp:CheckBoxList ID="chklTramites" runat="server" Width="100%" DataTextField="Nombre" DataValueField="Nombre">
                    </asp:CheckBoxList>
                </td>
            </tr>
            <tr>
                <td align="right" class="barra-sub-titulo" colspan="4"><asp:Button ID="btnVolver" runat="server" CssClass="boton" Text="Volver" OnClick="btnVolver_Click" Width="150px" />
                &nbsp;<asp:Button ID="btnGuardar" runat="server" CssClass="boton" Text="Guardar" OnClick="btnGuardar_Click" Width="150px" />
                </td>
            </tr>
            
            </table>
    </div>
    </form>
</body>
</html>
