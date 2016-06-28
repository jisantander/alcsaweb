<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="LectorCodigo.aspx.cs" Inherits="CobranzaALC.LectorCodigo" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link href="css/alc_estilo.css" rel="stylesheet" />
    <link href="css/start/jquery-ui-1.10.3.custom.min.css" rel="stylesheet" />
    <script type="text/javascript" src="js/jquery-1.10.2.min.js"></script>
    <script type="text/javascript" src="js/jquery.scannerdetection.js"></script>
    <script type="text/javascript" src="js/jquery.scannerdetection.compatibility.js"></script>
    <script type="text/javascript">
        $(document).ready(function () {
            if ($('#hdfRuta').val() != '') {
                window.opener.CargarRutaDesdeCodigoBarra($('#hdfRuta').val());
                window.close();
            }

            $('#btnCerrar').click(function () {
                window.close();
            });

            $('#txtValor').focus();

            $(document).focus(function () {
                this.focus();
            });

            $('#txtValor').bind('scannerDetectionComplete', function (e, data) {
                __doPostBack('', '');
            });
        });
    </script>
</head>
<body>
    <form id="form1" runat="server">
        <div>

            <table cellpadding="0" cellspacing="0" border="0" style="width: 100%;">
                <tr>
                    <td class="barra-titulo" colspan="2">Lector de código de barra</td>
                </tr>
                <tr>
                    <td style="width: 20%">Código</td>
                    <td style="width: 80%">
                        <asp:TextBox ID="txtValor" runat="server" Width="85%"></asp:TextBox>
                        <asp:ImageButton ID="btnBuscar" runat="server" ImageUrl="~/images/iconos/Buscar.png" OnClick="btnBuscar_Click" />
                    </td>
                </tr>
                <tr>
                    <td style="width: 20%">&nbsp;</td>
                    <td style="width: 80%">Escanee el código de barra</td>
                </tr>
                <tr>
                    <td align="right" class="barra-sub-titulo" colspan="2">
                        <input id="btnCerrar" class="boton" type="button" value="Cerrar" /></td>
                </tr>
            </table>

        </div>
        <asp:HiddenField ID="hdfRuta" runat="server" EnableViewState="False" />
    </form>
</body>
</html>
