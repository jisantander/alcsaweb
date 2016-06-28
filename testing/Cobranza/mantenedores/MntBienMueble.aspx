<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="MntBienMueble.aspx.cs" Inherits="CobranzaALC.Cobranza.mantenedores.MntBienMueble" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>ALC Asesorìa Legal y Crediticía Ltda</title>

    <link href="../../css/start/jquery-ui-1.10.3.custom.min.css" rel="stylesheet" />
    <link href="../../css/alc2.css" rel="stylesheet" type="text/css" />
    <link href="../../css/alc_estilo.css" rel="stylesheet" />

    <script type="text/javascript" src="../../js/funciones.js"></script>
    <script type="text/javascript" src="../../js/jquery-1.10.2.min.js"></script>
    <script type="text/javascript" src="../../js/jquery-ui-1.10.3.custom.min.js"></script>
    <script type="text/javascript" src="../../js/datepicker-es.js"></script>

    <script language="javascript" type="text/javascript">

        $(document).ready(function () {
            $('#txtRut').keyup(function () {
                MostrarOcultarBotonInformeNegativo();
            });

            $('#Cbx_SinBienes').change(function () {
                MostrarOcultarBotonInformeNegativo();
            });

            $('.control-calendario').datepicker({
                dateFormat: 'dd/mm/yy',
                changeMonth: true,
                changeYear: true,
                onSelect: function (dateText, inst) {
                    if ($('#ddlFormaPago').val() == '5')
                        alert('Al ingresar la fecha de pago, no olvide volver a Calcular');
                }
            });

            MostrarOcultarBotonInformeNegativo();
            var valor_informe = $('#hdfValorInformeNegativo').val();
            if (valor_informe != '') {
                var ruta = '../Documentos/Descargar.aspx?id_propio=1&Parametros_DeudorMueble=' + valor_informe + '&ruta=Formatos/Bienes/InformeBienMuebles_Negativa.aspx';
                window.open(ruta, 'descarga_archivo', '');
                $('#hdfValorInformeNegativo').val('');
            }
        });
        
        function MostrarOcultarBotonInformeNegativo() {
            if ($('#txtRut').val() != '' && $('#Cbx_SinBienes').is(':checked'))
                $('#btnInformeNegativo').show();
            else $('#btnInformeNegativo').hide();
        }

        function popupBMuebles() {
            var url = '../Mantenedores/RelacionBienes/BienesMueblesDelCliente.aspx?rut=' + document.all("txtRut").value;
            var pWin = window.open(url, 'newWin', 'width=900,height=400,scrollbars=1,resizable=yes,satus=0,menubar=yes,top=10,left=100')
            pWin.focus();
            return false;
        }

        function Popup_Modelo() {
            var url = '../Mantenedores/MarcaModelos/agregar.aspx';
            var pWin = window.open(url, 'newWin', 'width=720,height=200,scrollbars=0,resizable=no,satus=0,menubar=no,top=10,left=100')
            pWin.focus();
            return false;
        }

        function Popup_Marca() {
            var url = '../Mantenedores/MarcaModelos/Marca.aspx';
            var pWin = window.open(url, 'newWin', 'width=720,height=200,scrollbars=0,resizable=no,satus=0,menubar=no,top=10,left=100')
            pWin.focus();
            return false;
        }

        function ValidarEliminar() {
            if (confirm('Esta seguro de eliminar el cliente ?'))
                return true;
            return false;
        }

        function ValidarActualizar() {
            if (trim(document.all("txtPatente").value) == "") {
                alert('Debe ingresar la Patente');
                document.all("txtPatente").focus();
                return false;
            }

            if (trim(document.all("marca").value) == "Seleccione") {
                alert('Debe ingresar la Marca');
                document.all("marca").focus();
                return false;
            }

            if (trim(document.all("modelo").value) == "Seleccione") {
                alert('Debe ingresar el modelo');
                document.all("modelo").focus();
                return false;
            }

            if (confirm('Esta seguro de actualizar el bien mueble ?'))
                return true;
            return false;
        }

        function ValidarGuardar() {

            if (trim(document.all("txtPatente").value) == "") {
                alert('Debe ingresar la Patente');
                document.all("txtPatente").focus();
                return false;
            }

            if (trim(document.all("marca").value) == "Seleccione") {
                alert('Debe ingresar la Marca');
                document.all("marca").focus();
                return false;
            }

            if (trim(document.all("modelo").value) == "Seleccione") {
                alert('Debe ingresar el modelo');
                document.all("modelo").focus();
                return false;
            }

            if (confirm('Esta seguro de guardar el bien mueble ?'))
                return true;
            false;
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
    <form id="form1" runat="server">
    <table border="0" style="width: 800px">
        <tr>
            <td class="barra-titulo" colspan="4">SISTEMA DE COBRANZA</td>
        </tr>
        <tr>
            <td class="barra-sub-titulo" colspan="4">Mantenedor bien mueble</td>
        </tr>
        <tr>
            <td align="left" style="width: 20%">&nbsp;</td>
            <td align="left" style="width: 30%">&nbsp;</td>
            <td align="left" style="width: 20%">&nbsp;</td>
            <td align="left" class="auto-style1">
                <asp:CheckBox ID="Cbx_SinBienes" runat="server" Text="No se ubicaron nuevos bienes" AutoPostBack="True" OnCheckedChanged="Cbx_SinBienes_CheckedChanged" ClientIDMode="Static" />
            </td>
        </tr>

        <tr>
            <td align="left" style="width: 20%">Rut Deudor</td>
            <td align="left" style="width: 30%">
                <asp:TextBox ID="txtRut" runat="server"
                    Style="WIDTH: 120px; margin-left: 0px;" ClientIDMode="Static"></asp:TextBox>
                &nbsp;<asp:ImageButton ID="ImgBtn_Lupa" ImageUrl="~/images/iconos/Buscar.png" AlternateText='txtRut.Text' OnClientClick="return popupBMuebles();" runat="server" />
            </td>
            <td align="left" style="width: 20%">Fecha</td>
            <td align="left" class="auto-style1">
                <asp:TextBox ID="txt_FechaActual" runat="server" CssClass="control-calendario"></asp:TextBox>
            </td>
        </tr>

        <tr>
            <td align="left" style="width: 20%">Tipo Vehículo</td>
            <td align="left" style="width: 30%">
                <asp:DropDownList ID="tipovehiculo" runat="server" Enabled="False" AutoPostBack="True" Style="WIDTH: 180px; margin-left: 0px;">
                </asp:DropDownList>
            </td>
            <td align="left" style="width: 20%">Año Fabricación</td>
            <td align="left" class="auto-style1">
                <asp:TextBox ID="txtAnioFabricacion" runat="server" Style="WIDTH: 100px; margin-left: 0px;"></asp:TextBox>
            </td>
        </tr>

        <tr>
            <td align="left" style="width: 20%">Patente</td>
            <td align="left" style="width: 30%">
                <asp:TextBox ID="txtPatente" runat="server" Style="WIDTH: 100px; margin-left: 0px;"
                    ReadOnly="True" AutoPostBack="True" OnTextChanged="txtPatente_TextChanged"></asp:TextBox>
            </td>
            <td align="left" style="width: 20%">N° Motor</td>
            <td align="left" class="auto-style1">
                <asp:TextBox ID="txtMotor" runat="server" Style="WIDTH: 100px; margin-left: 0px;"
                    ReadOnly="True"></asp:TextBox>
            </td>
        </tr>

        <tr>
            <td align="left" style="width: 20%">Marca</td>
            <td align="left" style="width: 30%">
                <asp:DropDownList ID="marca" runat="server" Enabled="False"
                    Style="WIDTH: 180px; margin-left: 0px;"
                    OnSelectedIndexChanged="marca_SelectedIndexChanged" AutoPostBack="True">
                </asp:DropDownList>
                <asp:ImageButton ID="IBtn_Agregar_Marca" runat="server" OnClientClick="return Popup_Marca();" ImageUrl="~/images/iconos/icono_agregar.png" />
            </td>
            <td align="left" style="width: 20%">Modelo</td>
            <td align="left" class="auto-style1">
                <asp:DropDownList ID="modelo" runat="server" Enabled="False" Style="WIDTH: 180px; margin-left: 0px;">
                </asp:DropDownList>
                <asp:ImageButton ID="IBtn_Agregar_Modelo" runat="server" OnClientClick="return Popup_Modelo();" ImageUrl="~/images/iconos/icono_agregar.png" />
            </td>
        </tr>

        <tr>
            <td align="left" style="width: 20%">N° Chasis</td>
            <td align="left" style="width: 30%">
                <asp:TextBox ID="txtChassis" runat="server"
                    Style="WIDTH: 100px; margin-left: 0px;" ReadOnly="True"></asp:TextBox>
            </td>
            <td align="left" style="width: 20%">Color</td>
            <td align="left" class="auto-style1">
                <asp:DropDownList ID="color" runat="server" Enabled="False" Style="WIDTH: 180px; margin-left: 0px;">
                </asp:DropDownList>
            </td>
        </tr>

        <tr>
            <td align="left" style="width: 20%">Limitaciones</td>
            <td align="left" style="width: 30%">
                <asp:DropDownList ID="limitaciones" runat="server" Enabled="False" Style="WIDTH: 180px; margin-left: 0px;">
                    <asp:ListItem Value="0">Seleccione</asp:ListItem>
                    <asp:ListItem Value="1">Prenda</asp:ListItem>
                    <asp:ListItem Value="2">Embargo</asp:ListItem>
                    <asp:ListItem Value="3">Otros</asp:ListItem>
                </asp:DropDownList>
            </td>
            <td align="left" style="width: 20%">Estado</td>
            <td align="left" class="auto-style1">
                <asp:DropDownList ID="estado" runat="server" Enabled="False" Style="WIDTH: 180px; margin-left: 0px;">
                    <asp:ListItem Value="N">Nuevo</asp:ListItem>
                    <asp:ListItem Value="U">Usado</asp:ListItem>
                </asp:DropDownList>
            </td>
        </tr>

        <tr>
            <td align="left" class="barra-sub-titulo" colspan="4">Documento</td>
        </tr>

        <tr>
            <td align="left" colspan="4">
                <asp:FileUpload ID="filesubir" runat="server"
                    Style="margin-left: 0px;" Width="100%" />
            </td>
        </tr>

        <tr>
            <td align="right" class="barra-sub-titulo" colspan="4">
                <asp:Button ID="btnBuscar" runat="server" CssClass="boton" Text="Buscar"
                    OnClientClick="return ValidarBuscar();" OnClick="btnBuscar_Click" />
                <asp:Button ID="btnGuardar" runat="server" CssClass="boton" Text="Guardar"
                    OnClientClick="return ValidarGuardar();" OnClick="btnGuardar_Click"
                    Visible="False" />
                <asp:Button ID="btnActualizar" runat="server" CssClass="boton" Text="Actualizar"
                    OnClientClick="return ValidarActualizar();" Visible="False"
                    OnClick="btnActualizar_Click" />
                <asp:Button ID="btnGuardar_Bienes" runat="server" CssClass="boton" Text="Guardar"
                    Visible="False" OnClick="btnGuardar_Bienes_Click" />

                <asp:Button ID="btnCancelar" runat="server" CssClass="boton" Text="Cancelar"
                    OnClick="btnCancelar_Click" />

                <asp:Button ID="btnInformeNegativo" runat="server" CssClass="boton" Text="Informe Negativo" OnClick="btnInformeNegativo_Click" ClientIDMode="Static" />

            </td>
        </tr>

        </table>
                <asp:HiddenField ID="CodCliente" runat="server" />
                <asp:HiddenField ID="hdfValorInformeNegativo" runat="server" ClientIDMode="Static" EnableViewState="False" />
            </form>
</body>
</html>
