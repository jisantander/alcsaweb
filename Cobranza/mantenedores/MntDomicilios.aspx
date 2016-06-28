<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="MntDomicilios.aspx.cs" Inherits="CobranzaALC.Cobranza.mantenedores.MntDomicilios" %>


<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>ALC Asesorìa Legal y Crediticía Ltda</title>
    <link href="../../css/alc2.css" rel="stylesheet" type="text/css" />
    <link href="../../css/alc_estilo.css" rel="stylesheet" />
    <link href="../../css/start/jquery-ui-1.10.3.custom.min.css" rel="stylesheet" />

    <script src="../../js/funciones.js" type="text/javascript"></script>
    <script type="text/javascript" src="../../../js/jquery-1.10.2.min.js"></script>
    <script type="text/javascript" src="../../../js/jquery-ui-1.10.3.custom.min.js"></script>
    <script type="text/javascript" src="../../js/datepicker-es.js"></script>

    <script language="javascript" type="text/javascript">
        function ParametrosInforme(parametros) {

        }

        function ValidarEliminar() {
            if (confirm('Esta seguro de eliminar el domicilio ?'))
                return true;
            return false;
        }

        function ValidarActualizar() {
            if (document.all("domicilio").value == 'No Registra Nuevos Domicilios') {
                return false;
            }

            if (confirm('Esta seguro de actualizar el domicilio ?')) {

                if (trim(document.all("txtRut").value) == "") {
                    alert('Debe ingresar el rut del deudor');
                    document.all("txtRut").focus();
                    return false;
                }

                if (trim(document.all("txtCalle").value) == "") {
                    alert('Debe ingresar la calle');
                    document.all("txtCalle").focus();
                    return false;
                }

                if (trim(document.all("txtNumero").value) == "") {
                    alert('Debe ingresar el número');
                    document.all("txtNumero").focus();
                    return false;
                }


                if (document.all("region").value == '0' || document.all("region").value == '') {
                    alert("Debe ingresar región ");
                    document.all("region").focus();
                    return false;
                }

                if (document.all("comuna").value == '0' || document.all("comuna").value == '') {
                    alert("Debe ingresar comuna ");
                    document.all("comuna").focus();
                    return false;
                }

                return true;

            }
            else return false;
        }

        function ValidarGuardar() {

            if (document.all("Cbx_SinDomicilio").checked == true || document.all("domicilio").value == 'No Registra Nuevos Domicilios') {
                if (confirm('Esta seguro de modificar marca No Se Encontró Nuevo Domicilio ?')) {
                    return true;
                } else return false;
            }

            if (confirm('Esta seguro de guardar el domicilio ?')) {
                if (trim(document.all("txtRut").value) == "") {
                    alert('Debe ingresar el rut del deudor');
                    document.all("txtRut").focus();
                    return false;
                }

                if (trim(document.all("txtCalle").value) == "") {
                    alert('Debe ingresar la calle');
                    document.all("txtCalle").focus();
                    return false;
                }

                if (trim(document.all("txtNumero").value) == "") {
                    alert('Debe ingresar el número');
                    document.all("txtNumero").focus();
                    return false;
                }

                if (document.all("region").value == '0' || document.all("region").value == '') {
                    alert("Debe ingresar región ");
                    document.all("region").focus();
                    return false;
                }

                if (document.all("comuna").value == '0' || document.all("comuna").value == '') {
                    alert("Debe ingresar comuna ");
                    document.all("comuna").focus();
                    return false;
                }

                return true;
            } else return false;

        }


        function ValidarBuscar() {

            if (!(ChequeaRut(document.all("txtRut")))) {
                alert('Rut no es válido');
                document.all("txtRut").focus();
                document.all("txtRut").select();

                return false;
            }


            if (document.all("txtRut").value == "") {
                alert('Debe ingresar el Rut');
                document.all("txtRut").focus();
                return false;
            }

            return true;
        }

    </script>
</head>
<body>
    <form runat="server" id="Formulario">
        <table border="0" style="width: 800px">
            <tr>
                <td class="barra-titulo" colspan="4">SISTEMA DE COBRANZA</td>
            </tr>
            <tr>
                <td class="barra-sub-titulo" colspan="4">MANTENEDOR DE DOMICILIOS</td>
            </tr>
            <tr>
                <td align="left" style="width: 20%">Rut Deudor</td>
                <td align="left" style="width: 30%">
                    <asp:TextBox ID="txtRut" runat="server"
                        ></asp:TextBox>
                    <asp:Button ID="btnBuscar" runat="server" CssClass="boton" Text="Buscar" Width="60px"
                        OnClientClick="return ValidarBuscar();" OnClick="btnBuscar_Click" />
                </td>
                <td align="left" style="width: 20%">
                    <asp:ImageButton ID="btnInforme" runat="server" OnClick="btnInforme_Click" Height="23px" ImageUrl="~/images/b_editar.gif" Width="29px" />

                </td>
                <td align="left" style="width: 30%">
                    <asp:CheckBox ID="Cbx_SinDomicilio" runat="server" Text="No se encontró nuevo domicilio" />
                </td>
            </tr>
            <tr>
                <td align="left" style="width: 20%">Domicilios Actuales</td>
                <td align="left" style="width: 30%">

                    <asp:DropDownList ID="domicilio" runat="server"
                         AutoPostBack="true"
                        OnSelectedIndexChanged="domicilio_SelectedIndexChanged" Width="95%">
                        <asp:ListItem Value="0">Seleccione</asp:ListItem>
                    </asp:DropDownList>
                </td>
                <td align="left" style="width: 20%">&nbsp;</td>
                <td align="left" style="width: 30%">&nbsp;</td>
            </tr>
            <tr>
                <td align="left" style="width: 20%">Calle</td>
                <td align="left" style="width: 30%">
                    <asp:TextBox ID="txtCalle" runat="server"
                         ReadOnly="True" Width="95%"></asp:TextBox>
                </td>
                <td align="left" style="width: 20%">Número</td>
                <td align="left" style="width: 30%">
                    <asp:TextBox ID="txtNumero" runat="server" MaxLength="8"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td align="left" style="width: 20%">Villa / Población</td>
                <td align="left" style="width: 30%">
                    <asp:TextBox ID="txtVilla" runat="server"
                         Width="95%"></asp:TextBox>
                </td>
                <td align="left" style="width: 20%">Block</td>
                <td align="left" style="width: 30%">
                    <asp:TextBox ID="txtBlock" runat="server"
                        ></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td align="left" style="width: 20%">N° Dpto</td>
                <td align="left" style="width: 30%">
                    <asp:TextBox ID="txtNdepartamento" runat="server"
                         Width="120px"></asp:TextBox>
                </td>
                <td align="left" style="width: 20%">&nbsp;</td>
                <td align="left" style="width: 30%">&nbsp;</td>
            </tr>
            <tr>
                <td align="left" style="width: 20%">Región</td>
                <td align="left" style="width: 30%">
                    <asp:DropDownList ID="region" runat="server" AutoPostBack="True" 
                        OnSelectedIndexChanged="region_SelectedIndexChanged" Enabled="False" Width="95%">
                    </asp:DropDownList>

                </td>
                <td align="left" style="width: 20%">Comuna</td>
                <td align="left" style="width: 30%">
                    <asp:DropDownList ID="comuna" runat="server" Enabled="False"  Width="95%">
                        <asp:ListItem Value="0">Seleccione</asp:ListItem>
                    </asp:DropDownList>
                </td>
            </tr>
            <tr>
                <td align="left" style="width: 20%">Vigencia</td>
                <td align="left" style="width: 30%">
                    <asp:DropDownList ID="vigencia" runat="server"
                        Enabled="False" OnSelectedIndexChanged="vigencia_SelectedIndexChanged"  Width="95%">
                        <asp:ListItem Value="1">Vigente</asp:ListItem>
                        <asp:ListItem Value="2">No Vigente</asp:ListItem>
                    </asp:DropDownList>
                </td>
                <td align="left" style="width: 20%">Fuente</td>
                <td align="left" style="width: 30%">
                    <asp:DropDownList ID="fuente" runat="server" Enabled="False"  Width="95%">
                        <asp:ListItem Value="0">Seleccione</asp:ListItem>
                        <asp:ListItem Value="1">Cambio de Domicilio</asp:ListItem>
                        <asp:ListItem Value="2">No existe Domicilio</asp:ListItem>
                    </asp:DropDownList>
                </td>
            </tr>
            <tr>
                <td align="left" style="width: 20%">Fecha Observación</td>
                <td align="left" style="width: 30%">
                    <asp:TextBox ID="txt_FechaObservacion" runat="server"
                         ReadOnly="True"></asp:TextBox>
                </td>
                <td align="left" style="width: 20%">&nbsp;</td>
                <td align="left" style="width: 30%">&nbsp;</td>
            </tr>
            <tr>
                <td align="left" style="width: 20%">Observación</td>
                <td align="left" colspan="3">
                    <asp:TextBox ID="observacion" runat="server"
                        TextMode="MultiLine" MaxLength="10" Width="97%" Height="40px"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td align="right" class="barra-sub-titulo" colspan="4">
                    <asp:Button ID="btnCancelar" runat="server" CssClass="boton" Text="Limpiar"
                        OnClick="btnCancelar_Click" />

                    <asp:Button ID="btnActualizar" runat="server" CssClass="boton" Text="Actualizar"
                        Visible="False" OnClientClick="return ValidarActualizar();" OnClick="btnActualizar_Click" />
                    <asp:Button ID="btnEliminar" runat="server" CssClass="boton" Text="Eliminar"
                        Visible="False" OnClick="btnEliminar_Click" />

                    <asp:Button ID="btnGuardar" runat="server" CssClass="boton" Text="Agregar"
                        OnClientClick="return ValidarGuardar();" OnClick="btnGuardar_Click"
                        Visible="False" />
                </td>
            </tr>
        </table>
        <asp:TextBox ID="txt_NombreDeudor" runat="server" Visible="false"
             ReadOnly="True" Width="60px"></asp:TextBox>
        <asp:TextBox ID="txt_NombreCliente" runat="server" Visible="false"
             ReadOnly="True" Width="72px"></asp:TextBox>
        <asp:HiddenField ID="CodCliente" runat="server" />
        <asp:HiddenField ID="hid_fechasin_nuevo_domicilio" runat="server" />
    </form>
</body>
</html>
