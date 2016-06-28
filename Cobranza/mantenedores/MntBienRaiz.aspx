<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="MntBienRaiz.aspx.cs" Inherits="CobranzaALC.Cobranza.mantenedores.MntBienRaiz" %>

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
            $('.boton-abrir-popupBRaiz').click(function () {
                var rut = $(this).attr('alt');
                var url = '../mantenedores/RelacionBienes/BienesRaicesDelCliente.aspx?rut=' + document.all("txtRut").value;
                var pWin = window.open(url, 'newWin', 'width=750,height=650,scrollbars=1,resizable=yes,satus=0,menubar=yes,top=10,left=100');
                pWin.focus();
                return false;
            });

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
                var ruta = '../Documentos/Descargar.aspx?id_propio=1&Parametros_DeudorRaiz=' + valor_informe + '&ruta=Formatos/Bienes/InformeBienRaiz_Negativa.aspx';
                window.open(ruta, 'descarga_archivo', '');
                $('#hdfValorInformeNegativo').val('');
            }
        });

        function MostrarOcultarBotonInformeNegativo() {
            if ($('#txtRut').val() != '' && $('#Cbx_SinBienes').is(':checked'))
                $('#btnInformeNegativo').show();
            else $('#btnInformeNegativo').hide();
        }

        function ValidarEliminar() {
            if (confirm('Esta seguro de eliminar el cliente ?'))
                return true;
            return false;
        }

        function ValidarActualizar() {
            if (confirm('Esta seguro de actualizar el cliente ?')) {
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
            if (document.all("regioncbr").value == '0' || document.all("regioncbr").value == '') {
                alert("Debe ingresar región CBR");
                document.all("regioncbr").focus();
                return false;
            }

            if (document.all("comunacbr").value == '0' || document.all("comunacbr").value == '') {
                alert("Debe ingresar localidad CBR");
                document.all("comunacbr").focus();
                return false;
            }

            if (!(trim(document.all("txtFechaEscritura").value) == "")) {
                if (!(EsFecha(document.all("txtFechaEscritura").value, 'dma'))) {
                    alert('Ingrese fecha escritura  válida, Ej. 01-09-2010');
                    document.all("txtFechaEscritura").focus();
                    return false;
                }
            }

            if (confirm('Esta seguro de guardar el bien raiz ?'))
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
</head>
<body>
    <form id="form1" runat="server">
        <table border="0" style="width: 800px">
            <tr>
                <td class="barra-titulo" colspan="4">SISTEMA DE COBRANZA</td>
            </tr>
            <tr>
                <td class="barra-sub-titulo" colspan="4">Mantenedor de bien raiz</td>
            </tr>
            <tr>
                <td align="left" style="width: 20%">&nbsp;</td>
                <td align="left" style="width: 30%">&nbsp;</td>
                <td align="left" style="width: 20%">&nbsp;</td>
                <td align="left" style="width: 30%">
                    <asp:CheckBox ID="Cbx_SinBienes" runat="server" Text="No se ubicaron nuevos bienes" AutoPostBack="True" OnCheckedChanged="Cbx_SinBienes_CheckedChanged" />
                </td>
            </tr>
            <tr>
                <td align="left" style="width: 20%">Rut Deudor</td>
                <td align="left" style="width: 30%">
                    <asp:TextBox ID="txtRut" runat="server" Width="70%"></asp:TextBox>
                    <asp:ImageButton ID="ImgBtn_Lupa" ImageUrl="~/images/iconos/Buscar.png" AlternateText='txtRut.Text' CssClass="boton-abrir-popupBRaiz" runat="server" />
                </td>
                <td align="left" style="width: 20%">Fecha</td>
                <td align="left" style="width: 30%">
                    <asp:TextBox ID="txt_FechaActual" runat="server" Width="95%" CssClass="control-calendario"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td align="right" class="barra-sub-titulo" colspan="4">
                    <asp:Button ID="btnBuscar" runat="server" CssClass="boton" Text="Buscar Deudor" OnClientClick="return ValidarBuscar();" OnClick="btnBuscar_Click" />
                </td>
            </tr>
            <!--<asp:Panel ID="PnlPrincipal" runat="server">-->
            <tr>
                <td align="left" style="width: 20%">Domicilio</td>
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
                <td align="left" style="width: 20%">Región</td>
                <td align="left" style="width: 30%">
                    <asp:TextBox ID="vistaregion" runat="server" ReadOnly="true" Width="95%"></asp:TextBox>
                </td>
                <td align="left" style="width: 20%">Comuna</td>
                <td align="left" style="width: 30%">
                    <asp:TextBox ID="vistacomuna" runat="server" ReadOnly="true" Width="95%"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td align="left" colspan="4" class="barra-sub-titulo">Inscripción Domicilio</td>
            </tr>
            <tr>
                <td align="left" style="width: 20%">Fojas Insc</td>
                <td align="left" style="width: 30%">
                    <asp:TextBox ID="txtFojaInsc" runat="server" onKeyPress="return acceptNum(event)"
                        Width="65%"></asp:TextBox>
                    <asp:DropDownList ID="tipofojainsc" runat="server" Width="28%">
                        <asp:ListItem Value=""></asp:ListItem>
                        <asp:ListItem Value="1">Vuelta</asp:ListItem>
                    </asp:DropDownList>
                </td>
                <td align="left" style="width: 20%">Nro. Insc.</td>
                <td align="left" style="width: 30%">
                    <asp:TextBox ID="txtNroInsc" runat="server" onKeyPress="return acceptNum(event)" Width="95%"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td align="left" style="width: 20%">Año Insc.</td>
                <td align="left" style="width: 30%">
                    <asp:TextBox ID="txtAnioInsc" runat="server" onKeyPress="return acceptNum(event)" Width="95%"></asp:TextBox>
                </td>
                <td align="left" style="width: 20%">Vigencia</td>
                <td align="left" style="width: 30%">
                    <asp:DropDownList ID="vigencia" runat="server" AutoPostBack="True" Width="95%">
                        <asp:ListItem Value="1">Vigente</asp:ListItem>
                        <asp:ListItem Value="2">No Vigente</asp:ListItem>
                    </asp:DropDownList>
                </td>
            </tr>
            <tr>
                <td align="left" style="width: 20%">Rol Avaluo</td>
                <td align="left" style="width: 30%">
                    <asp:TextBox ID="txtRolAvaluo" runat="server" Width="95%"></asp:TextBox>
                </td>
                <td align="left" style="width: 20%">Monto Avaluo</td>
                <td align="left" style="width: 30%">
                    <asp:TextBox ID="txtMontoavaluo" runat="server" onKeyPress="return acceptNum(event)" Width="95%"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td align="left" style="width: 20%">Limitaciones</td>
                <td align="left" style="width: 30%">
                    <asp:DropDownList ID="Limitaciones" runat="server" Width="95%">
                        <asp:ListItem Value="0">Seleccione</asp:ListItem>
                        <asp:ListItem Value="1">Transferida</asp:ListItem>
                        <asp:ListItem Value="2">Embargo</asp:ListItem>
                        <asp:ListItem Value="3">Bien Familiar</asp:ListItem>
                    </asp:DropDownList>
                </td>
                <td align="left" style="width: 20%">Fuente</td>
                <td align="left" style="width: 30%">
                    <asp:DropDownList ID="fuente" runat="server" Width="95%">
                        <asp:ListItem Value="0">Seleccione</asp:ListItem>
                        <asp:ListItem Value="1">Cliente</asp:ListItem>
                        <asp:ListItem Value="2">Dicom</asp:ListItem>
                        <asp:ListItem Value="3">Buscador ALC</asp:ListItem>
                        <asp:ListItem Value="4">Otros</asp:ListItem>

                    </asp:DropDownList>
                </td>
            </tr>
            <tr>
                <td align="left" colspan="4" class="barra-sub-titulo">Inscripción Hipoteca</td>
            </tr>
            <tr>
                <td align="left" style="width: 20%">Fojas 1ª Hip.</td>
                <td align="left" style="width: 30%">
                    <asp:TextBox ID="txtFoja1hip" runat="server" onKeyPress="return acceptNum(event)" Width="65%"></asp:TextBox>
                    <asp:DropDownList ID="tipofojahip1" runat="server" Width="28%">
                        <asp:ListItem Value=""></asp:ListItem>
                        <asp:ListItem Value="1">Vuelta</asp:ListItem>
                    </asp:DropDownList>


                </td>
                <td align="left" style="width: 20%">Nro. 1ª Hip.</td>
                <td align="left" style="width: 30%">
                    <asp:TextBox ID="txtNro1hip" runat="server" onKeyPress="return acceptNum(event)" Width="95%"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td align="left" style="width: 20%">Año 1ª Hip.</td>
                <td align="left" style="width: 30%">
                    <asp:TextBox ID="txtanio1hip" runat="server" onKeyPress="return acceptNum(event)" Width="95%"></asp:TextBox>
                </td>
                <td align="left" style="width: 20%">&nbsp;</td>
                <td align="left" style="width: 30%">&nbsp;</td>
            </tr>
            <tr>
                <td align="left" style="width: 20%">Fojas 2ª Hip.</td>
                <td align="left" style="width: 30%">
                    <asp:TextBox ID="txtFoj2hip" runat="server" onKeyPress="return acceptNum(event)" Width="65%"></asp:TextBox>
                    <asp:DropDownList ID="tipofojahip2" runat="server" Width="28%">
                        <asp:ListItem Value=""></asp:ListItem>
                        <asp:ListItem Value="1">Vuelta</asp:ListItem>
                    </asp:DropDownList>
                </td>
                <td align="left" style="width: 20%">Nro. 2ª Hip.</td>
                <td align="left" style="width: 30%">
                    <asp:TextBox ID="txtNro2hip" runat="server" onKeyPress="return acceptNum(event)" Width="95%"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td align="left" style="width: 20%">Año 2ª Hip.</td>
                <td align="left" style="width: 30%">
                    <asp:TextBox ID="txtAnio2hip" runat="server" onKeyPress="return acceptNum(event)" Width="95%"></asp:TextBox>
                </td>
                <td align="left" style="width: 20%">&nbsp;</td>
                <td align="left" style="width: 30%">&nbsp;</td>
            </tr>
            <tr>
                <td align="left" colspan="4" class="barra-sub-titulo">Inscripción Prohibición</td>
            </tr>
            <tr>
                <td align="left" style="width: 20%">Fojas Proh. 1ª</td>
                <td align="left" style="width: 30%">
                    <asp:TextBox ID="txtfojaproh1" runat="server" onKeyPress="return acceptNum(event)"></asp:TextBox>
                    <asp:DropDownList ID="tipofojaproh1" runat="server">
                        <asp:ListItem Value=""></asp:ListItem>
                        <asp:ListItem Value="1">Vuelta</asp:ListItem>
                    </asp:DropDownList>


                </td>
                <td align="left" style="width: 20%">Nro. Proh. 1ª</td>
                <td align="left" style="width: 30%">
                    <asp:TextBox ID="txtNroProh1" runat="server" onKeyPress="return acceptNum(event)" Width="95%"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td align="left" style="width: 20%">Año Proh. 1ª</td>
                <td align="left" style="width: 30%">
                    <asp:TextBox ID="txtAnioProh1" runat="server" onKeyPress="return acceptNum(event)" Width="95%"></asp:TextBox>
                </td>
                <td align="left" style="width: 20%">&nbsp;</td>
                <td align="left" style="width: 30%">&nbsp;</td>
            </tr>
            <tr>
                <td align="left" style="width: 20%">Fojas Proh. 2ª</td>
                <td align="left" style="width: 30%">
                    <asp:TextBox ID="txtFojaProh2" runat="server" onKeyPress="return acceptNum(event)"></asp:TextBox>

                    <asp:DropDownList ID="tipofojaproh2" runat="server">
                        <asp:ListItem Value=""></asp:ListItem>
                        <asp:ListItem Value="1">Vuelta</asp:ListItem>
                    </asp:DropDownList>


                </td>
                <td align="left" style="width: 20%">Nro. Proh. 2ª</td>
                <td align="left" style="width: 30%">
                    <asp:TextBox ID="txtNroProh2" runat="server" onKeyPress="return acceptNum(event)" Width="95%"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td align="left" style="width: 20%">Año Proh. 2ª</td>
                <td align="left" style="width: 30%">
                    <asp:TextBox ID="txtAnioProh2" runat="server" onKeyPress="return acceptNum(event)" Width="95%"></asp:TextBox>
                </td>
                <td align="left" style="width: 20%">&nbsp;</td>
                <td align="left" style="width: 30%">&nbsp;</td>
            </tr>
            <tr>
                <td align="left" colspan="4" class="barra-sub-titulo">Conservadores</td>
            </tr>
            <tr>
                <td align="left" style="width: 20%">Región CBR</td>
                <td align="left" style="width: 30%">
                    <asp:DropDownList ID="regioncbr" runat="server" AutoPostBack="True"
                        OnSelectedIndexChanged="regioncbr_SelectedIndexChanged" Width="95%">
                        <asp:ListItem Value="0">Seleccione</asp:ListItem>
                    </asp:DropDownList>
                </td>
                <td align="left" style="width: 20%">Localidad CBR</td>
                <td align="left" style="width: 30%">
                    <asp:DropDownList ID="comunacbr" runat="server" AutoPostBack="True" OnSelectedIndexChanged="comunacbr_SelectedIndexChanged" Width="95%">
                        <asp:ListItem Value="0">Seleccion</asp:ListItem>

                    </asp:DropDownList>
                </td>
            </tr>
            <tr>
                <td align="left" style="width: 20%">Conservador</td>
                <td align="left" style="width: 30%">
                    <asp:DropDownList ID="conservador" runat="server" Width="95%">
                        <asp:ListItem Value="0">Seleccione</asp:ListItem>

                    </asp:DropDownList>
                </td>
                <td align="left" style="width: 20%">&nbsp;</td>
                <td align="left" style="width: 30%">&nbsp;</td>
            </tr>
            <tr>
                <td align="left" style="width: 20%">Región Notaría</td>
                <td align="left" style="width: 30%">
                    <asp:DropDownList ID="regionnotaria" runat="server" AutoPostBack="True"
                        OnSelectedIndexChanged="regionnotaria_SelectedIndexChanged" Width="95%">
                    </asp:DropDownList></td>
                <td align="left" style="width: 20%">Localidad Notaría</td>
                <td align="left" style="width: 30%">
                    <asp:DropDownList ID="comunanotaria" runat="server" AutoPostBack="True"
                        OnSelectedIndexChanged="comunanotaria_SelectedIndexChanged" Width="95%">
                    </asp:DropDownList>
                </td>
            </tr>
            <tr>
                <td align="left" style="width: 20%">Notaría</td>
                <td align="left" style="width: 30%">
                    <asp:DropDownList ID="notaria" runat="server" Width="95%">
                    </asp:DropDownList>
                </td>
                <td align="left" style="width: 20%">Fecha Escritura</td>
                <td align="left" style="width: 30%">
                    <asp:TextBox ID="txtFechaEscritura" runat="server" Width="95%"></asp:TextBox>

                </td>
            </tr>
            <tr>
                <td align="left" class="barra-sub-titulo" colspan="4">Documento</td>
            </tr>
            <tr>
                <td align="left" style="width: 20%">Archivo</td>
                <td align="left" colspan="3">

                    <asp:FileUpload ID="filesubir" runat="server"
                        Style="WIDTH: 350px; margin-left: 0px;" Width="98%" />
                </td>
            </tr>
            <!--</asp:Panel>-->
            <tr>
                <td align="right" colspan="4" class="barra-sub-titulo">
                    <asp:Button ID="btnGuardar" runat="server" CssClass="boton" Text="Guardar"
                        OnClientClick="return ValidarGuardar();" Visible="False"
                        OnClick="btnGuardar_Click" />
                    <asp:Button ID="btnActualizar" runat="server" CssClass="boton" Text="Actualizar"
                        Visible="False" />
                    <asp:Button ID="btnEliminar" runat="server" CssClass="boton" Text="Eliminar" Visible="False" />
                    <asp:Button ID="btnCancelar" runat="server" CssClass="boton" Text="Cancelar" OnClick="btnCancelar_Click" />
                    <asp:Button ID="btnGuardar_Bienes" runat="server" CssClass="boton" Text="Guardar"
                        Visible="False" OnClick="btnGuardar_Bienes_Click" />
                    <asp:Button ID="btnInformeNegativo" runat="server" CssClass="boton" Text="Informe Negativo" OnClick="btnInformeNegativo_Click" />
                </td>
            </tr>
        </table>
        <asp:HiddenField ID="CodCliente" runat="server" />
        <asp:HiddenField ID="hdfValorInformeNegativo" runat="server" ClientIDMode="Static" EnableViewState="False" />
    </form>
</body>
</html>
