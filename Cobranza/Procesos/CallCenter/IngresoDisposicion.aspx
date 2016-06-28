<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="IngresoDisposicion.aspx.cs" Inherits="CobranzaALC.Cobranza.Procesos.CallCenter.IngresoDisposicion" %>

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
        $(document).ready(function () {
            $('#divMensaje').dialog({
                resizable: false,
                autoOpen: false,
                height: 200,
                width: 400,
                modal: true,
                buttons: {
                    Cerrar: function () {
                        $(this).dialog('close');
                    }
                }
            });

            if ($('#lblMensaje').html() != '')
                $('#divMensaje').dialog('open');
        });
    </script>
</head>
<body>
    <form id="form1" runat="server">
        <div>

            <table cellpadding="0" cellspacing="0" style="width: 99%;">
                <tr>
                    <td class="barra-titulo" colspan="2">Comentario Disposición</td>
                </tr>
                <tr>
                    <td style="width: 20%">ID Campaña</td>
                    <td style="width: 80%">
                        <asp:Label ID="lblIdCampana" runat="server"></asp:Label>
                        <asp:DropDownList ID="ddlCampanas" runat="server" Visible="False" Width="98%">
                        </asp:DropDownList>
                    </td>
                </tr>
                <tr>
                    <td style="width: 20%">Tipo</td>
                    <td style="width: 80%">
                        <asp:DropDownList ID="ddlTiposDisposiciones" runat="server" DataTextField="Nombre" DataValueField="ID" Width="98%" AutoPostBack="True" OnSelectedIndexChanged="ddlTiposDisposiciones_SelectedIndexChanged">
                        </asp:DropDownList>
                    </td>
                </tr>
                <tr>
                    <td style="width: 20%">Disposición</td>
                    <td style="width: 80%">
                        <asp:DropDownList ID="ddlDisposiciones" runat="server" DataTextField="Nombre" DataValueField="Codigo" Width="98%">
                        </asp:DropDownList>
                    </td>
                </tr>
                <tr>
                    <td style="width: 20%">Observación</td>
                    <td style="width: 80%">
                        <asp:TextBox ID="txtComentario" runat="server" Height="100px" TextMode="MultiLine" Width="98%"></asp:TextBox>
                    </td>
                </tr>
                <!--<asp:Panel ID="pnlTipoDisposicionTerreno" runat="server" Visible="false">-->
                <tr>
                    <td style="width: 20%">Tipo Vivienda</td>
                    <td style="width: 80%">
                        <asp:DropDownList ID="ddlTiposViviendas" runat="server" DataTextField="Nombre" DataValueField="ID" Width="98%">
                        </asp:DropDownList>
                    </td>
                </tr>
                <tr>
                    <td style="width: 20%">Antiguedad Vivienda</td>
                    <td style="width: 80%">
                        <asp:DropDownList ID="ddlAntiguedadesViviendas" runat="server" DataTextField="Nombre" DataValueField="ID" Width="98%">
                        </asp:DropDownList>
                    </td>
                </tr>
                <!--</asp:Panel>-->
                <tr>
                    <td align="right" class="barra-sub-titulo" colspan="2">
                        <asp:Button ID="btnGuardar" runat="server" CssClass="boton" OnClick="btnGuardar_Click" Text="Guardar" />
                    </td>
                </tr>
            </table>

        </div>
        <div id="divMensaje" title="Mensaje">
            <asp:Label ID="lblMensaje" runat="server" Text="" ClientIDMode="Static" EnableViewState="false"></asp:Label>
        </div>

        <asp:HiddenField ID="hdfUsuarioCallCenter" runat="server" />
        <asp:HiddenField ID="hdfIdCobranza" runat="server" />
        <asp:HiddenField ID="hdfRutDeudor" runat="server" />
        <asp:HiddenField ID="hdfComentarioManual" runat="server" Value="0" />
    </form>
</body>
</html>
