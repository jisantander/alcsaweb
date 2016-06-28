<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="EntradaVicidialArchivo.aspx.cs" Inherits="CobranzaALC.Cobranza.Procesos.CallCenter.EntradaVicidialArchivo" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
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

            <table cellpadding="0" cellspacing="0" style="width: 100%;">
                <tr>
                    <td class="barra-titulo" colspan="2">Entradas Vicidial Desde Archivo</td>
                </tr>
                <tr>
                    <td class="barra-sub-titulo" colspan="2">&nbsp;</td>
                </tr>
                <tr>
                    <td style="width: 15%">Archivo Excel</td>
                    <td style="width: 85%">
                        <asp:FileUpload ID="fupArchivo" runat="server" Width="100%" />
                        <br />
                        <span style="font: bold 10px Arial; color: red;">El archivo debe tener dos columnas: Rut del Deudor y Número Operación</span></td>
                </tr>
                <tr>
                    <td style="width: 15%">&nbsp;</td>
                    <td style="width: 85%">
                        <asp:CheckBox ID="chkConservaCobranzas" runat="server" Checked="True" Font-Bold="True" Text="Conservar Cobranzas Seleccionadas Previamente" />
                    </td>
                </tr>
                <tr>
                    <td class="barra-sub-titulo" colspan="2" align="right">
                        <asp:Button ID="btnGuardar" runat="server" CssClass="boton" Text="Guardar" OnClick="btnGuardar_Click" />
                        &nbsp;<asp:Button ID="btnCancelar" runat="server" CssClass="boton" Text="Cancelar" OnClick="btnCancelar_Click" />
                    </td>
                </tr>
            </table>

        </div>
        <div id="divMensaje" title="Mensaje">
            <asp:Label ID="lblMensaje" runat="server" Text="" ClientIDMode="Static" EnableViewState="false"></asp:Label>
        </div>
        <asp:HiddenField ID="hdfIdCampana" runat="server" />
        <asp:HiddenField ID="hdfUsuario" runat="server" />
    </form>
</body>
</html>
