<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Cobranza.aspx.cs" Inherits="CobranzaALC.Cobranza.Procesos.Cobranza" %>


<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>ALC Asesorìa Legal y Crediticía Ltda</title>
    <link href="../../css/alc2.css" rel="stylesheet" type="text/css" />
    <link href="../../css/alc_estilo.css" rel="stylesheet" />
    <link href="../../css/start/jquery-ui-1.10.3.custom.min.css" rel="stylesheet" />

    <script src="../../js/funciones.js" type="text/javascript"></script>
    <script type="text/javascript" src="../../js/jquery-1.10.2.min.js"></script>
    <script type="text/javascript" src="../../js/jquery-ui-1.10.3.custom.min.js"></script>

    <script language="javascript" type="text/javascript">
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

            if ($('#hdfMostrarMensaje').val() != '1') return;
            $('#pTextoArchivo').hide();

            if (parseInt($('#hdfIdDocumento').val()) > 0) {
                $('#pTextoArchivo').show();
                $('#divMensaje').dialog('option', 'buttons', {
                    'Generar Código Barra': function () {
                        var ruta = '../Documentos/Descargar.aspx?id=' + $('#hdfIdDocumento').val() + '&tipo=DCFIS&ruta=General/GeneradorCodigoBarra.aspx';
                        window.open(ruta, 'descarga_archivo', '');
                        $(this).dialog("close");
                    },
                    'Cerrar': function () {
                        $(this).dialog("close");
                    }
                });
            }

            $("#divMensaje").dialog('open');
        });

        function ValidarEliminar() {
            if (confirm('Esta seguro de eliminar la cobranza ?'))
                return true;
            else return false;
        }

        function ValidarActualizar() {

            if (confirm('Esta seguro de actualizar la cobranza ?')) {
                if (document.all("txtRazonSocial").value == "") {
                    alert('Debe ingresar la Razón Social');
                    document.all("txtRazonSocial").focus();
                    return false;
                }
                return true;
            }
            return false;
        }

        function ValidarGuardar() {
            if (document.all("cliente").value == 'Seleccione') {
                alert("Debe seleccionar el cliente.");
                document.all("cliente").focus();
                return false;
            }

            if (document.all("txtNoperacion").value == "") {
                alert('Debe ingresar el número de operación');
                document.all("txtNoperacion").focus();
                return false;
            }

            if (document.all("tipoprocedimiento").value == 'Seleccione') {
                alert("Debe ingresar el procedimiento");
                document.all("tipoprocedimiento").focus();
                return false;
            }

            if (document.all("materia").value == '') {
                alert("Debe ingresar la matería");
                document.all("materia").focus();
                return false;
            }

            if (document.all("producto").value == '') {
                alert("Debe ingresar el producto");
                document.all("producto").focus();
                return false;
            }

            return true;
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
        <asp:ScriptManager ID="ScriptManager1" runat="server">
        </asp:ScriptManager>

        <table cellspacing="0" cellpadding="0" width="733px" border="0">
            <tbody>
                <tr>
                    <td class="barra-titulo" colspan="4">SISTEMA DE COBRANZa</td>
                </tr>
                <tr>
                    <td class="barra-sub-titulo" colspan="4">INGRESO DE COBRANZA</td>
                </tr>
                <tr>
                    <td align="right" style="width: 15%">Rut Deudor :</td>
                    <td align="left" style="width: 35%" >
                        <asp:TextBox ID="txtRut" runat="server" Width="95%"></asp:TextBox>
                        
                    </td>
                    <td align="left" style="width: 15%"><font color="red" size="-2"><b>Ej. 12324654-6</b></font></td>

                    <td align="left" style="width: 35%"></td>
                </tr>
                <tr>
                    <td align="right" style="width: 15%">Nombre :</td>
                    <td align="left"  colspan="3">
                        <asp:TextBox ID="txtNombre" runat="server" ReadOnly="true" Width="95%"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td align="right" style="width: 15%">Cliente :</td>
                    <td align="left" colspan="3">
                        <asp:DropDownList ID="cliente" runat="server"
                            Enabled="False" Width="95%" AutoPostBack="True" OnSelectedIndexChanged="cliente_SelectedIndexChanged">
                        </asp:DropDownList>
                    </td>
                </tr>
                <tr>
                    <td align="right" style="width: 15%">REMESA :</td>
                    <td align="left" colspan="3">
                        <asp:DropDownList ID="ddlRemesas" runat="server" Width="95%" DataValueField="ID" DataTextField="Nombre" Enabled="False">
                        </asp:DropDownList>
                    </td>
                </tr>
                <tr>
                    <td align="right" style="width: 15%">N° Operación :</td>
                    <td align="left" style="width: 35%" >
                        <asp:TextBox ID="txtNoperacion" MaxLength="12" runat="server"
                             ReadOnly="True" Width="95%"></asp:TextBox>
                    </td>
                    <td align="right" style="width: 15%"></td>
                    <td align="left" style="width: 35%"></td>
                </tr>
                <tr>
                    <td align="right" style="width: 15%">Número Sucursal :</td>
                    <td align="left" style="width: 35%" >
                        <asp:TextBox ID="txtNumero" MaxLength="9" runat="server"
                             ReadOnly="True" Width="95%"></asp:TextBox>
                    </td>
                    <td align="right" style="width: 15%"></td>
                    <td align="left" style="width: 35%"></td>
                </tr>
                <tr>
                    <td align="right" style="width: 15%">Tipo :</td>
                    <td align="left" style="width: 35%" >
                        <asp:UpdatePanel ID="UpdatePanel4" runat="server">
                            <ContentTemplate>
                                <asp:DropDownList ID="tipocobranza" runat="server" AutoPostBack="True"
                                    OnSelectedIndexChanged="tipocobranza_SelectedIndexChanged"
                                    Enabled="False" Width="95%">
                                    <asp:ListItem Value="J">JUDICIAL</asp:ListItem>
                                    <asp:ListItem Value="P">PRE-JUDICIAL</asp:ListItem>
                                    <asp:ListItem Value="A">PRENDA</asp:ListItem>
                                </asp:DropDownList>
                            </ContentTemplate>
                        </asp:UpdatePanel>
                    </td>
                    <td align="right" style="width: 15%"></td>
                    <td align="left" style="width: 35%"></td>
                </tr>
                <tr>
                    <td align="right" style="width: 15%">Procedimiento :</td>
                    <td align="left" style="width: 35%" >
                        <asp:UpdatePanel ID="UpdatePanel3" runat="server">
                            <ContentTemplate>
                                <asp:DropDownList ID="tipoprocedimiento"  runat="server" Enabled="False"
                                    AutoPostBack="True"
                                    OnSelectedIndexChanged="tipoprocedimiento_SelectedIndexChanged" Width="95%">
                                </asp:DropDownList>
                            </ContentTemplate>
                        </asp:UpdatePanel>
                    </td>
                    <td align="right" style="width: 15%">Matería :</td>
                    <td align="left" style="width: 35%">
                        <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                            <ContentTemplate>
                                <asp:DropDownList ID="materia" runat="server"  Enabled="False"
                                    AutoPostBack="True" OnSelectedIndexChanged="materia_SelectedIndexChanged" Width="95%">
                                </asp:DropDownList>
                            </ContentTemplate>
                        </asp:UpdatePanel>
                    </td>
                </tr>
                <tr>
                    <td align="right" style="width: 15%">Producto :</td>
                    <td align="left" style="width: 35%" >
                        <asp:UpdatePanel ID="UpdatePanel2" runat="server">
                            <ContentTemplate>
                                <asp:DropDownList ID="producto" runat="server"  Enabled="False" Width="95%">
                                </asp:DropDownList>
                            </ContentTemplate>
                        </asp:UpdatePanel>
                    </td>

                    <td align="right" style="width: 15%"></td>
                    <td align="left" style="width: 35%"></td>
                </tr>
                <tr>
                    <td class="barra-sub-titulo" colspan="4" align="right">
                        <asp:Button ID="btnBuscar" runat="server" CssClass="boton" Text="Buscar"
                            OnClientClick="return ValidarBuscar();" OnClick="btnBuscar_Click" />
                        &nbsp;<asp:Button ID="btnGuardar" runat="server" CssClass="boton" Text="Guardar"
                            OnClientClick="return ValidarGuardar();" OnClick="btnGuardar_Click"
                            Visible="False" />
                        &nbsp;<asp:Button ID="btnCancelar" runat="server" CssClass="boton" Text="Cancelar"
                            OnClick="btnCancelar_Click" />
                    </td>
                </tr>
                <tr>
                    <td style="text-align: center" colspan="4">
                        <font size="2">Estado Nº 359 Piso 13, Santiago - Chile | Teléfonos : 633 3115 - 633 3483 
                        </font>
                        <asp:HiddenField ID="hdfMostrarMensaje" runat="server" Value="0" EnableViewState="false" />
                        <asp:HiddenField ID="hdfIdDocumento" runat="server" Value="0" EnableViewState="false" />
                    </td>
                </tr>
            </tbody>
        </table>

        <div id="divMensaje" title="Cobranza">
            <p>La cobranza se guardo correctamente.</p>
            <p id="pTextoArchivo">¿Desea generar el código de barra del archivo que subió al guardar la cobranza?</p>
        </div>
    </form>
</body>
</html>
