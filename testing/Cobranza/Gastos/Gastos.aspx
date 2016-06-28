<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Gastos.aspx.cs" Inherits="CobranzaALC.Cobranza.Gastos.Gastos" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>ALC Asesorìa Legal y Crediticía Ltda</title>
    <link href="../../css/alc2.css" rel="stylesheet" type="text/css" />

    <script src="../../js/funciones.js" type="text/javascript"></script>
    <link href="../../css/start/jquery-ui-1.10.3.custom.min.css" rel="stylesheet" />
    <link href="../../css/alc_estilo.css" rel="stylesheet" />

    <script type="text/javascript" src="../../js/jquery-1.10.2.min.js"></script>
    <script type="text/javascript" src="../../js/jquery-ui-1.10.3.custom.min.js"></script>
    <script type="text/javascript" src="../../js/datepicker-es.js"></script>

    <script language="javascript" type="text/javascript">
        $(document).ready(function () {
            $('.control-calendario').datepicker({
                changeMonth: true,
                changeYear: true,
                maxDate: 0
            });

            if ($('#hdfGenerarDocumento').val() == '1') {               
                ventana.focus();
            }
        });

        function Montoadmin() {
            if (document.all("tipogastoadmin").value == 'Seleccione') document.all("tipogastoadmin").focus();
        }

        function Montojudi() {
            if (document.all("tipogastojudi").value == 'Seleccione') document.all("tipogastojudi").focus();
        }

        function gastopre() {
            if (document.all("tipogastopre").value == 'Seleccione') document.all("tipogastopre").focus();
        }

        function ValidaAdmin() {

            if (!(document.all("tipogastojudi").value == 'Seleccione')) {
                alert('Solo debe ingresar un tipo de gasto');
                document.all("tipogastoadmin").selectedIndex = 0;
                document.all("txtMontoadmin").value = '';
            }

            if (!(document.all("tipogastopre").value == 'Seleccione')) {
                alert('Solo debe ingresar un tipo de gasto');
                document.all("tipogastopre").selectedIndex = 0;
                document.all("txtMontoadmin").value = '';
            }
        }

        function ValidaJudi() {
            if (!(document.all("tipogastoadmin").value == 'Seleccione')) {
                alert('Solo debe ingresar un tipo de gasto');
                document.all("tipogastojudi").selectedIndex = 0;
                document.all("txtMontojudi").value = '';
            }

            if (!(document.all("tipogastopre").value == 'Seleccione')) {
                alert('Solo debe ingresar un tipo de gasto');
                document.all("tipogastojudi").selectedIndex = 0;
                document.all("txtMontojudi").value = '';
            }

        }

        function ValidaPre() {
            if (!(document.all("tipogastoadmin").value == 'Seleccione')) {
                alert('Solo debe ingresar un tipo de gasto');
                document.all("tipogastopre").selectedIndex = 0;
                document.all("txtMontopre").value = '';
            }

            if (!(document.all("tipogastojudi").value == 'Seleccione')) {
                alert('Solo debe ingresar un tipo de gasto');
                document.all("tipogastopre").selectedIndex = 0;
                document.all("txtMontopre").value = '';
            }

        }


        function DetalleGastos() {
            var valor = document.all("hdfIdCobranza").value;
            var url = 'MostrarDetalleGastos.aspx?Codigo=' + valor;
            Ir(url, '750', '600');
            return false;
        }

        function Ir(url, ancho, alto) {
            var pWin = window.open(url, 'newWin', 'width=' + ancho + ',height=' + alto + ',scrollbars=1,satus=0,menubar=no,top=10,left=210')
            if (window.pWin)
                pWin.focus()
            return false;
        }

        function ValidarGuardar() {
            if (trim(document.all("txtFecha").value) == "") {
                alert('Debe ingresar fecha del gasto ');
                document.all("txtFecha").focus();
                return false;
            }

            if (document.all("Proveedor").value == 'Seleccione') {
                alert('Ingrese proveedor del gasto');
                document.all("Proveedor").focus();
                return false;
            }

            if (!(document.all("estadogasto").value == "0")) {
                if (trim(document.all("txtfechaestadogasto").value) == "") {
                    alert('Ingrese fecha estado gasto');
                    document.all("txtfechaestadogasto").focus();
                    return false;
                }
            }

            if (document.all("tipogastoadmin").value == 'Seleccione' && document.all("tipogastojudi").value == 'Seleccione' && document.all("tipogastopre").value == 'Seleccione') {

                alert('Seleccione un tipo de gasto');
                document.all("tipogastoadmin").focus();
                return false;
            }

            if (!(document.all("tipogastoadmin").value == 'Seleccione')) {
                if (trim(document.all("txtMontoadmin").value) == "") {
                    alert('Debe ingresar monto gasto administrativo ');
                    document.all("txtMontoadmin").focus();
                    return false;
                }
            }

            if (!(document.all("tipogastojudi").value == 'Seleccione')) {
                if (trim(document.all("txtMontojudi").value) == "") {
                    alert('Debe ingresar monto gasto judicial ');
                    document.all("txtMontojudi").focus();
                    return false;
                }
            }

            if (!(document.all("tipogastopre").value == 'Seleccione')) {
                if (trim(document.all("txtMontopre").value) == "") {
                    alert('Debe ingresar monto gasto prejudicial ');
                    document.all("txtMontopre").focus();
                    return false;
                }
            }

            if (confirm('Esta seguro de guardar el gasto ?'))
                return true;
            else return false;
        }

    </script>

</head>
<body>
    <form id="form1" runat="server">
        <table border="0" style="width: 800px">
            <tr>
                <td class="barra-titulo" colspan="4">SISTEMA DE COBRANZA</td>
            </tr>

            <tr>
                <td class="barra-sub-titulo" colspan="4">INGRESO GASTOS</td>
            </tr>

            <tr>
                <td align="left" style="width: 20%">N° Operación</td>
                <td align="left" style="width: 30%">
                    <asp:TextBox ID="txtNroOperacion" runat="server"
                        ReadOnly="True" Width="60%"></asp:TextBox>
                </td>
                <td align="left" style="width: 20%">Cliente</td>
                <td align="left" style="width: 30%">
                    <asp:TextBox ID="txtCliente" runat="server"
                        ReadOnly="True" Width="95%"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td align="left" style="width: 20%">Rut Deudor</td>
                <td align="left" style="width: 30%">
                    <asp:TextBox ID="txtRutDeudor" runat="server"
                        ReadOnly="True" Width="60%"></asp:TextBox>
                </td>
                <td align="left" style="width: 20%">Deudor</td>
                <td align="left" style="width: 30%">
                    <asp:TextBox ID="txtNomDeudor" runat="server"
                        ReadOnly="True" Width="95%"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td align="left" style="width: 20%">Rol-Rit</td>
                <td align="left" style="width: 30%">
                    <asp:TextBox ID="txtRol" runat="server"
                        ReadOnly="True" Width="60%"></asp:TextBox>
                </td>
                <td align="left" style="width: 20%">Tribunal</td>
                <td align="left" style="width: 30%">
                    <asp:TextBox ID="txtTribunal" runat="server"
                        ReadOnly="True" Width="95%"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td align="left" style="width: 20%">Fecha Ingreso Gasto</td>
                <td align="left" style="width: 30%">
                    <asp:TextBox ID="txtFecha" runat="server"
                        CssClass="control-calendario" Width="60%"></asp:TextBox>
                </td>
                <td align="left" style="width: 20%"></td>
                <td align="left" style="width: 30%"></td>
            </tr>
            <tr>
                <td align="left" style="width: 20%">N° Boleta/Comprobante</td>
                <td align="left" style="width: 30%">
                    <asp:TextBox ID="txtBoleta" runat="server" Width="95%"></asp:TextBox>
                </td>
                <td align="left" style="width: 20%"></td>
                <td align="left" style="width: 30%"></td>
            </tr>
            <tr>
                <td align="left" style="width: 20%">N° Nómina</td>
                <td align="left" style="width: 30%">

                    <asp:TextBox ID="txtNomina" runat="server" Width="95%"></asp:TextBox>

                </td>
                <td align="left" style="width: 20%">Fecha Nómina</td>
                <td align="left" style="width: 30%">

                    <asp:TextBox ID="txtFechaNomina" runat="server"
                        CssClass="control-calendario" Width="60%"></asp:TextBox>

                </td>
            </tr>
            <tr>
                <td align="left" style="width: 20%">Proveedor</td>
                <td align="left" style="width: 30%">
                    <asp:DropDownList ID="Proveedor" runat="server" Width="95%">
                    </asp:DropDownList>
                </td>
                <td align="left" style="width: 20%">&nbsp;</td>
                <td align="left" style="width: 30%">&nbsp;</td>
            </tr>
            <tr>
                <td align="left" style="width: 20%">Estado Gasto</td>
                <td align="left" style="width: 30%">
                    <asp:DropDownList ID="estadogasto" runat="server" Enabled="False" Width="95%">
                        <asp:ListItem Value="2" Selected="True">Pendiente</asp:ListItem>
                        <asp:ListItem Value="3">Rechazado</asp:ListItem>
                        <asp:ListItem Value="1">Pagado</asp:ListItem>
                        <asp:ListItem Value="4">Rendido</asp:ListItem>
                    </asp:DropDownList>
                </td>
                <td align="left" style="width: 20%">Fecha Estado Gasto</td>
                <td align="left" style="width: 30%">
                    <asp:TextBox ID="txtfechaestadogasto" runat="server"
                        CssClass="control-calendario" Width="60%"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td align="left" class="barra-sub-titulo" colspan="4">Gasto Administrativo</td>
            </tr>
            <tr>
                <td align="left" style="width: 20%">Tipo Gasto</td>
                <td align="left" style="width: 30%">
                    <asp:DropDownList ID="tipogastoadmin" runat="server" Width="95%">
                    </asp:DropDownList>
                </td>
                <td align="left" style="width: 20%">&nbsp;</td>
                <td align="left" style="width: 30%">&nbsp;</td>
            </tr>
            <tr>
                <td align="left" style="width: 20%">Monto $</td>
                <td align="left" style="width: 30%">
                    <asp:TextBox ID="txtMontoadmin" runat="server" onKeyPress="return acceptNum(event)" Width="95%"></asp:TextBox>
                </td>
                <td align="left" style="width: 20%">&nbsp;</td>
                <td align="left" style="width: 30%">&nbsp;</td>
            </tr>
            <tr>
                <td align="left" class="barra-sub-titulo" colspan="4">Gasto Judicial</td>
            </tr>
            <tr>
                <td align="left" style="width: 20%">Tipo Gasto</td>
                <td align="left" style="width: 30%">
                    <asp:DropDownList ID="tipogastojudi" runat="server" Width="95%">
                    </asp:DropDownList>
                </td>
                <td align="left" style="width: 20%">&nbsp;</td>
                <td align="left" style="width: 30%">&nbsp;</td>
            </tr>
            <tr>
                <td align="left" style="width: 20%">Monto $</td>
                <td align="left" style="width: 30%">
                    <asp:TextBox ID="txtMontojudi" runat="server" onKeyPress="return acceptNum(event)" Width="95%"></asp:TextBox>
                </td>
                <td align="left" style="width: 20%">&nbsp;</td>
                <td align="left" style="width: 30%">&nbsp;</td>
            </tr>
            <tr>
                <td align="left" class="barra-sub-titulo" colspan="4">gasto pre-judicial</td>
            </tr>
            <tr>
                <td align="left" style="width: 20%">Tipo Gasto</td>
                <td align="left" style="width: 30%">
                    <asp:DropDownList ID="tipogastopre" runat="server" Width="95%">
                    </asp:DropDownList>
                </td>
                <td align="left" style="width: 20%">&nbsp;</td>
                <td align="left" style="width: 30%">
                    <asp:Button ID="btnDetalleGastos" runat="server" Visible="true" CssClass="boton" Text="Ver detalle"
                        OnClientClick="return DetalleGastos();" />
                </td>
            </tr>
            <tr>
                <td align="left" style="width: 20%">Monto $</td>
                <td align="left" style="width: 30%">
                    <asp:TextBox ID="txtMontopre" runat="server" onKeyPress="return acceptNum(event)" Width="95%"></asp:TextBox>
                </td>
                <td align="left" style="width: 20%"></td>
                <td align="left" style="width: 30%">&nbsp;</td>
            </tr>
            <tr>
                <td align="left" class="barra-sub-titulo" colspan="4">Observacion</td>
            </tr>
            <tr>
                <td align="left" style="width: 20%">&nbsp;</td>
                <td align="left" colspan="3">
                    <asp:TextBox ID="txtObservacion" runat="server" Height="50px" TextMode="MultiLine" Width="98%"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td align="right" class="barra-sub-titulo" colspan="4">
                    <asp:Button ID="btnGuardar" runat="server" CssClass="boton" Text="Guardar"
                        OnClientClick="return ValidarGuardar();" OnClick="btnGuardar_Click" />

                    <asp:Button ID="btnCancelar" runat="server" CssClass="boton" Text="Cancelar"
                        OnClick="btnCancelar_Click" />
                </td>
            </tr>
        </table>
        <asp:HiddenField ID="hdfIdCobranza" runat="server" Value="0" />
        <asp:HiddenField ID="hdfRedireccionActividadJudicial" runat="server" Value="0" />
        <asp:HiddenField ID="hdfIdGasto" runat="server" Value="0" />
        <asp:HiddenField ID="hdfGenerarDocumento" runat="server" Value="0" EnableViewState="False" ViewStateMode="Disabled" />
    </form>
</body>
</html>
