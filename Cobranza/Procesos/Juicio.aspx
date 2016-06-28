<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Juicio.aspx.cs" Inherits="CobranzaALC.Cobranza.Procesos.Juicio" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>ALC Asesorìa Legal y Crediticía Ltda</title>
    <link href="../../css/alc2.css" rel="stylesheet" type="text/css" />
    <link href="../../css/alc_estilo.css" rel="stylesheet" />
    <script src="../../js/funciones.js" type="text/javascript"></script>
    <link href="../../css/start/jquery-ui-1.10.3.custom.min.css" rel="stylesheet" />

    <script type="text/javascript" src="../../js/jquery-1.10.2.min.js"></script>
    <script type="text/javascript" src="../../js/jquery-ui-1.10.3.custom.min.js"></script>
    <script type="text/javascript" src="../../js/datepicker-es.js"></script>

    <script type="text/javascript">
        $(document).ready(function () {
            $('.control-calendario').datepicker();
        });
    </script>

    <script language="javascript" type="text/javascript">

        function ValidarEliminar() {
            if (confirm('Esta seguro de eliminar el deudor ?'))
                return true;
            else return false;
        }

        function ValidarActualizar() {

            if (confirm('Esta seguro de actualizar el deudor ?')) {

                if (document.all("txtNombre").value == "") {
                    alert('Debe ingresar la Razón Social');
                    document.all("txtNombre").focus();
                    return false;
                }
                if (document.all("txtProfesion").value == "") {
                    alert('Debe ingresar la la profesión');
                    document.all("txtProfesion").focus();
                    return false;
                }
                return true;
            }
            return false;
        }

        function ValidarGuardar() {
            if (trim(document.all("txtRol").value) == "") {
                alert('Debe ingresar el rol');
                document.all("txtRol").focus();
                return false;
            }

            if (trim(document.all("txtFechaIngCorte").value) == "") {
                alert('Debe ingresar fecha ingreso a la corte');
                document.all("txtFechaIngCorte").focus();
                return false;
            }

            if (confirm('Esta seguro de guardar el juicio ?'))
                return true;

            return false;
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

    <style type="text/css">
        .style1 {
            width: 153px;
        }

        .style2 {
            FONT-WEIGHT: normal;
            FONT-SIZE: 12px;
            COLOR: #493f46;
            FONT-FAMILY: "Gill Sans MT", Arial;
        }

        .style3 {
            FONT-WEIGHT: normal;
            FONT-SIZE: 12px;
            COLOR: #493f46;
            FONT-FAMILY: "Gill Sans MT", Arial;
            width: 81px;
        }
    </style>
</head>
<body>
    <form runat="server" id="Formulario">
        <table border="0" style="width: 800px">
            <tr>
                <td class="barra-titulo" colspan="4">SISTEMA DE COBRANZA</td>
            </tr>

            <tr>
                <td class="barra-sub-titulo" colspan="4">INGRESO JUICIO</td>
            </tr>

            <tr>
                <td align="left" style="width: 20%">N° Operación</td>
                <td align="left" style="width: 30%">
                    <asp:TextBox ID="txtNroOperacion" runat="server"
                        ReadOnly="True"></asp:TextBox>
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
                        ReadOnly="True"></asp:TextBox>
                </td>
                <td align="left" style="width: 20%">Deudor</td>
                <td align="left" style="width: 30%">
                    <asp:TextBox ID="txtNomDeudor" runat="server"
                        ReadOnly="True" Width="95%"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td align="left" style="width: 20%">Tipo Procedimiento</td>
                <td align="left" style="width: 30%">
                    <asp:TextBox ID="txtProcedimiento" runat="server"
                        ReadOnly="True" Width="95%"></asp:TextBox>
                </td>
                <td align="left" style="width: 20%">Materia</td>
                <td align="left" style="width: 30%">
                    <asp:TextBox ID="txtMateria" runat="server"
                        ReadOnly="True" Width="95%"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td align="left" style="width: 20%">Producto</td>
                <td align="left" style="width: 30%">
                    <asp:TextBox ID="txtProducto" runat="server"
                        ReadOnly="True" Width="95%"></asp:TextBox>
                </td>
                <td align="left" style="width: 20%"></td>
                <td align="left" style="width: 30%"></td>
            </tr>
            <tr>
                <td align="left" style="width: 20%">Rol-Rit</td>
                <td align="left" style="width: 30%">
                    <asp:TextBox ID="txtRol" runat="server"></asp:TextBox>
                </td>
                <td align="left" style="width: 20%"></td>
                <td align="left" style="width: 30%"></td>
            </tr>
            <tr>
                <td align="left" style="width: 20%">Jurisdicción</td>
                <td align="left" style="width: 30%">

                    <asp:DropDownList ID="juris" runat="server" AutoPostBack="True"
                        OnSelectedIndexChanged="juris_SelectedIndexChanged" Width="97%">
                    </asp:DropDownList>

                </td>
                <td align="left" style="width: 20%">Tribunal</td>
                <td align="left" style="width: 30%">
                    <asp:DropDownList ID="Tribunal" runat="server" Width="97%">
                    </asp:DropDownList>
                </td>
            </tr>
            <tr>
                <td align="left" style="width: 20%">Fecha Ing. Corte</td>
                <td align="left" style="width: 30%">
                    <asp:TextBox ID="txtFechaIngCorte" runat="server"
                        CssClass="control-calendario"></asp:TextBox>
                </td>
                <td align="left" style="width: 20%">Procurador</td>
                <td align="left" style="width: 30%">
                    <asp:DropDownList ID="Procurador" runat="server" Width="97%">
                    </asp:DropDownList>
                </td>
            </tr>
            <tr>
                <td align="left" style="width: 20%">Abogado</td>
                <td align="left" style="width: 30%">
                    <asp:DropDownList ID="Abogado" runat="server" Width="97%">
                    </asp:DropDownList>
                </td>
                <td align="left" style="width: 20%"></td>
                <td align="left" style="width: 30%"></td>
            </tr>
            <tr>
                <td align="left" style="width: 20%">Riesgo</td>
                <td align="left" style="width: 30%">
                    <asp:DropDownList ID="ddlRiesgo" runat="server" DataTextField="Nombre" DataValueField="ID" Width="97%">
                    </asp:DropDownList>
                </td>
                <td align="left" style="width: 20%">Fecha Riesgo</td>
                <td align="left" style="width: 30%">
                    <asp:TextBox ID="txtFechaRiesgo" runat="server"
                        CssClass="control-calendario"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td align="left" class="barra-sub-titulo" colspan="4">Documento</td>
            </tr>
            <tr>
                <td align="left" style="width: 20%">Archivo</td>
                <td align="left" colspan="3">
                    <asp:FileUpload ID="filesubir" runat="server" Width="95%" />
                </td>
            </tr>
            <tr>
                <td align="left" style="width: 20%">&nbsp;</td>
                <td align="left" colspan="3">
                    <asp:HiddenField ID="hiddidcobranza" runat="server" />
                </td>
            </tr>
            <tr>
                <td align="right" class="barra-sub-titulo" colspan="4">
                    <asp:Button ID="btnBuscar" runat="server" CssClass="boton" Text="Buscar"
                        OnClientClick="return ValidarBuscar();" OnClick="btnBuscar_Click"
                        Visible="False" />

                    <asp:Button ID="btnGuardar" runat="server" CssClass="boton" Text="Guardar"
                        OnClientClick="return ValidarGuardar();" OnClick="btnGuardar_Click" />

                    <asp:Button ID="btnActualizar" runat="server" CssClass="boton" Text="Actualizar"
                        OnClientClick="return ValidarActualizar();" Visible="False" OnClick="btnActualizar_Click" />

                    <asp:Button ID="btnEliminar" runat="server" CssClass="boton" Text="Eliminar" Visible="False"
                        OnClientClick="return ValidarEliminar();" OnClick="btnEliminar_Click" />

                    <asp:Button ID="btnCancelar" runat="server" CssClass="boton" Text="Cancelar"
                        OnClick="btnCancelar_Click" />

                </td>
            </tr>
        </table>
    </form>
</body>
</html>
