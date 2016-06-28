<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="frmReconstitucion.aspx.cs" Inherits="CobranzaALC.Cobranza.Reconstitucion.frmReconstitucion" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" MostrarBitacoraEstados"http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>Ingreso Formulario</title>
    <link href="../../css/alc2.css" rel="stylesheet" type="text/css" />
    <script src="../../js/funciones.js" type="text/javascript"></script>

    <script language="javascript" type="text/javascript">
        function GuardarFormulario() {
            if (trim(document.all("txtdireccion").value) == "") {

                alert('Debe ingresar la dirección');
                document.all("txtdireccion").focus();
                return false;
            }

            if (trim(document.all("txtcomuna").value) == "") {

                alert('Debe ingresar la comuna');
                document.all("txtcomuna").focus();
                return false;
            }

            if (trim(document.all("txtconservador").value) == "") {

                alert('Debe ingresar el conservador');
                document.all("txtconservador").focus();
                return false;
            }

            if (trim(document.all("txtregion").value) == "") {

                alert('Debe ingresar la región');
                document.all("txtregion").focus();
                return false;
            }

            if (!(trim(document.all("txtfechacontabilizacion").value) == "")) {
                if (!(EsFecha(document.all("txtfechacontabilizacion").value, 'dma'))) {
                    alert('Debe ingresar fecha  válida, Ej. 01-09-2010');
                    document.all("txtfechacontabilizacion").focus();
                    return false;
                }
            }

            if (!(trim(document.all("txtfechaescritura").value) == "")) {
                if (!(EsFecha(document.all("txtfechaescritura").value, 'dma'))) {
                    alert('Debe ingresar fecha  válida, Ej. 01-09-2010');
                    document.all("txtfechaescritura").focus();
                    return false;
                }
            }

            if (trim(document.all("txtobservacion").value) == "") {

                alert('Debe ingresar una observación');
                document.all("txtobservacion").focus();
                return false;

            }

            if (!(trim(document.all("txtfechafactura").value) == "")) {
                if (!(EsFecha(document.all("txtfechafactura").value, 'dma'))) {
                    alert('Debe ingresar fecha  válida, Ej. 01-09-2010');
                    document.all("txtfechafactura").focus();
                    return false;
                }
            }

            if (confirm('Esta seguro de actualizar la información editada ?')) {

                return true;

            } else return false;
        }


        function MostrarDocumento() {

            /*
            if(document.all("hddCodigoEstado").value != '900' && document.all("hddCodigoEstado").value != '800' && document.all("hddCodigoEstado").value != '902' )
            {
              alert('Atención! Solo se pueden imprimir documentos con estado TERMINADO o TRAMITAR VOLUNTARIA'); 
              return false;
            } 
          */

            var OT = '';
            OT = document.all("hiddOT").value;

            url = 'MenuReporte.aspx?ot=' + OT;
            //url = 'reporte.aspx?ot=' + OT;

            pWin = window.open(url, 'newWin', 'width=750,height=650,scrollbars=1,satus=0,menubar=no,top=10,left=100')
            if (window.pWin)
                pWin.focus()

            return false;
        }



        function Reversar() {
            var OT = '';
            OT = document.all("hiddOT").value;

            var Url = "Reversar.aspx?OT=" + OT;

            var strFeatures = "dialogTop=100px; dialogLeft=270px; dialogWidth=770px;dialogHeight=400px; center=yes; help=no;status=no; font-family:Arial;font-size:12px"
            objNewWindow = window.showModalDialog(Url, "NewWin", strFeatures)


            window.location.reload();




        }





        function EditarGastos() {


            var OT = '';
            OT = document.all("hiddOT").value;


            var nrooperacion = '';
            nrooperacion = document.all("txtnrooperacion").value;

            var rut = ''
            rut = document.all("txtrutcliente").value + '-' + document.all("txtdv").value;

            var nombre = '';
            nombre = document.all("txtnombrecliente").value


            url = 'ReconstitucionGastosEdicion.aspx?OT=' + OT + "&nrooperacion=" + nrooperacion + "&rut=" + rut + "&nombre=" + nombre;

            pWin = window.open(url, 'newWin', 'width=810,height=620,scrollbars=1,satus=0,menubar=no,top=10,left=100')
            if (window.pWin)
                pWin.focus()

            return false;



        }

        function Gastos() {


            var OT = '';
            OT = document.all("hiddOT").value;

            var nrooperacion = '';
            nrooperacion = document.all("txtnrooperacion").value;

            var rut = ''
            rut = document.all("txtrutcliente").value + '-' + document.all("txtdv").value;

            var nombre = '';
            nombre = document.all("txtnombrecliente").value;

            var responsable = '';
            responsable = document.all("txtResponsable").value;



            url = 'ReconstitucionGastos.aspx?OT=' + OT + "&nrooperacion=" + nrooperacion + "&rut=" + rut + "&nombre=" + nombre + "&responsable=" + responsable;

            pWin = window.open(url, 'newWin', 'width=810,height=620,scrollbars=1,satus=0,menubar=no,top=10,left=100')
            if (window.pWin)
                pWin.focus()

            return false;



        }







        function Digitalizar() {


            var OT = '';
            OT = document.all("hiddOT").value;

            url = 'Digitalizar.aspx?ot=' + OT;

            pWin = window.open(url, 'newWin', 'width=770,height=650,scrollbars=1,satus=0,menubar=no,top=10,left=100')
            if (window.pWin)
                pWin.focus()

            return false;
        }



        function MostrarBitacoraEstados() {


            var OT = '';
            OT = document.all("hiddOT").value;

            url = 'BitacoraEstados.aspx?ot=' + OT;

            pWin = window.open(url, 'newWin', 'width=650,height=650,scrollbars=1,satus=0,menubar=no,top=10,left=100')
            if (window.pWin)
                pWin.focus()

            return false;
        }

        function validarut() {

            if (trim(document.all("txtGirador").value) == "") {
                alert('Debe ingresar girador');
                document.all("txtGirador").focus();
                return false;
            }

            if (!(ChequeaRut(document.all("txtGirador")))) {
                alert('Rut no es válido');
                document.all("txtGirador").focus();
                document.all("txtGirador").select();

                return false;
            }

            return true;

        }


        function Ir() {

            if (trim(document.all("txtFecha").value) == "") {
                alert('Debe ingresar fecha abono');
                document.all("txtFecha").focus();
                return false;
            }

            if (trim(document.all("txtMontoAbono").value) == "") {
                alert('Debe ingresar monto abono');
                document.all("txtMontoAbono").focus();
                return false;
            }

            if (trim(document.all("ConceptoAbono").value) == "Seleccione") {
                alert('Debe seleccionar un concepto de abono');
                document.all("ConceptoAbono").focus();
                return false;
            }

            if (trim(document.all("tipomoneda").value) == "Seleccione") {
                alert('Debe seleccionar tipo de moneda');
                document.all("tipomoneda").focus();
                return false;
            }


            //Vàlidar CHEQUE 

            if (trim(document.all("hiddTipoMoneda").value) == "5") {

                if (trim(document.all("banco").value) == "Seleccione") {
                    alert('Debe seleccionar el banco');
                    document.all("banco").focus();
                    return false;
                }


                if (trim(document.all("txtFechaPago").value) == "") {
                    alert('Debe ingresar fecha de pago');
                    document.all("txtFechaPago").focus();
                    return false;
                }


                if (!(EsFecha(document.all("txtFechaPago").value, 'dma'))) {
                    alert('Debe ingresar fecha  válida, Ej. 01-09-2010');
                    document.all("txtFechaPago").focus();
                    return false;
                }


                if (trim(document.all("txtNroCheque").value) == "") {
                    alert('Debe ingresar Nº de cheque');
                    document.all("txtNroCheque").focus();
                    return false;
                }

                if (trim(document.all("txtGirador").value) == "") {
                    alert('Debe ingresar girador');
                    document.all("txtGirador").focus();
                    return false;
                }

                if (!(ChequeaRut(document.all("txtGirador")))) {
                    alert('Rut no es válido');
                    document.all("txtGirador").focus();
                    document.all("txtGirador").select();

                    return false;
                }

                if (trim(document.all("txtnomgirador").value) == "") {
                    alert('Girador no se encuentra registrado');
                    document.all("txtnomgirador").focus();
                    return false;
                }

                if (trim(document.all("txtSerie").value) == "") {
                    alert('Debe ingresar Serie');
                    document.all("txtSerie").focus();
                    return false;
                }



            }




            var pagina = 'ComprobanteAbono.aspx?';

            var cliente = document.all("txtCliente").value;
            var deudor = document.all("txtNomDeudor").value;
            var rutdeudor = document.all("txtRutDeudor").value;
            var operacion = document.all("txtNroOperacion").value;
            var fecha = document.all("txtFecha").value;
            var montoabono = document.all("txtMontoAbono").value;
            var concepto = document.all("hiddConcepto").value;
            //REQ 
            var nrocheque = document.all("txtNroCheque").value;
            var banquito = document.all("hiddBanco").value;
            var fdeposito = document.all("txtFechaPago").value;
            var rutgirador = document.all("txtGirador").value;
            var nomgirador = document.all("txtnomgirador").value;

            pagina = pagina + 'cliente=' + cliente + '&deudor=' + deudor + '&operacion=' + operacion + '&fecha=' + fecha + '&montoabono=' + montoabono + '&concepto=' + concepto + '&rutdeudor=' + rutdeudor + '&nrocheque=' + nrocheque + '&banquito=' + banquito + '&fdeposito=' + fdeposito + '&rutgirador=' + rutgirador + '&nomgirador=' + nomgirador;

            //alert(pagina);

            popup(pagina, '710', '500');


        }


        function popup(url, ancho, alto) {
            pWin = window.open(url, 'newWin', 'width=' + ancho + ',height=' + alto + ',scrollbars=1,satus=0,menubar=no,top=10,left=100')
            if (window.pWin)
                pWin.focus()

            return false;
        }






        function ValidarEliminar() {

            if (confirm('Esta seguro de eliminar el deudor ?')) {

                return true;

            } else return false;
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

            } else return false;
        }

        function ValidarGuardar() {

            if (trim(document.all("txtFecha").value) == "") {
                alert('Debe ingresar fecha abono');
                document.all("txtFecha").focus();
                return false;
            }


            if (!(EsFecha(document.all("txtFecha").value, 'dma'))) {
                alert('Debe ingresar fecha  válida, Ej. 01-09-2010');
                document.all("txtFecha").focus();
                return false;
            }



            if (trim(document.all("txtMontoAbono").value) == "") {
                alert('Debe ingresar monto abono');
                document.all("txtMontoAbono").focus();
                return false;
            }

            if (trim(document.all("ConceptoAbono").value) == "Seleccione") {
                alert('Debe seleccionar un concepto de abono');
                document.all("ConceptoAbono").focus();
                return false;
            }


            if (trim(document.all("tipomoneda").value) == "Seleccione") {
                alert('Debe seleccionar tipo de moneda');
                document.all("tipomoneda").focus();
                return false;
            }

            //Vàlidar CHEQUE 

            if (trim(document.all("hiddTipoMoneda").value) == "5") {

                if (trim(document.all("banco").value) == "Seleccione") {
                    alert('Debe seleccionar el banco');
                    document.all("banco").focus();
                    return false;
                }


                if (trim(document.all("txtFechaPago").value) == "") {
                    alert('Debe ingresar fecha de pago');
                    document.all("txtFechaPago").focus();
                    return false;
                }


                if (!(EsFecha(document.all("txtFechaPago").value, 'dma'))) {
                    alert('Debe ingresar fecha  válida, Ej. 01-09-2010');
                    document.all("txtFechaPago").focus();
                    return false;
                }



                if (trim(document.all("txtNroCheque").value) == "") {
                    alert('Debe ingresar Nº de cheque');
                    document.all("txtNroCheque").focus();
                    return false;
                }

                if (trim(document.all("txtGirador").value) == "") {
                    alert('Debe ingresar girador');
                    document.all("txtGirador").focus();
                    return false;
                }

                if (!(ChequeaRut(document.all("txtGirador")))) {
                    alert('Rut no es válido');
                    document.all("txtGirador").focus();
                    document.all("txtGirador").select();

                    return false;
                }
                if (trim(document.all("txtnomgirador").value) == "") {
                    alert('Girador no se encuentra registrado');
                    document.all("txtnomgirador").focus();
                    return false;
                }

                if (trim(document.all("txtSerie").value) == "") {
                    alert('Debe ingresar Serie');
                    document.all("txtSerie").focus();
                    return false;
                }

            }

            if (confirm('Esta seguro de guardar el abono ?')) {
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

    <style type="text/css">
        .style2 {
            FONT-WEIGHT: normal;
            FONT-SIZE: 12px;
            COLOR: #493f46;
            FONT-FAMILY: "Gill Sans MT", Arial;
            width: 151px;
        }

        .style3 {
            FONT-WEIGHT: normal;
            FONT-SIZE: 12px;
            COLOR: #493f46;
            FONT-FAMILY: "Gill Sans MT", Arial;
            width: 151px;
            height: 26px;
        }

        .style4 {
            height: 26px;
        }
    </style>

</head>
<body>
    <table cellspacing="0" cellpadding="0" width="633" border="0">
        <tbody>
            <tr>
                <td width="633" height="50" valign="top" bgcolor="#336699" xbackground="../../images/banner2.jpg">
                    <table align="right" border="0" style="width: 373px">
                        <tbody>
                            <tr>
                                <td class="titulo" align="right">SISTEMA DE RECONSTITUCIONES</td>
                            </tr>
                        </tbody>
                    </table>
                </td>
            </tr>
            <tr>
                <td height="394" valign="top" class="textos">
                    <br>
                    <center>
                    </center>

                    <form runat="server" id="Formulario">
                        <asp:ScriptManager ID="ScriptManager1" runat="server">
                        </asp:ScriptManager>
                        <table width="633" align="center" border="0">
                            <tbody>
                                <tr>
                                    <!---->
                                    <td height="163" width="100%" valign="top">

                                        <!-- Zona de Titulo -->

                                        <table bordercolor="#c8e3f9" cellspacing="0" cellpadding="0"
                                            width="100%" border="1">
                                            <tbody>
                                                <tr>
                                                    <td align="left" bgcolor="#eeeeee"><b>&nbsp;EDICIÓN RECONSTITUCIONES</b></td>
                                                </tr>
                                            </tbody>
                                        </table>
                                        <table height="7" style="width: 847px">
                                            <tbody>
                                                <tr>
                                                    <td></td>
                                                </tr>
                                            </tbody>
                                        </table>

                                        <!-- Tabla Cuerpo Inicio -->
                                        <asp:Panel ID="pnlFORMULARIO" runat="server">



                                            <table bordercolor="#c8e3f9" cellspacing="0" cellpadding="0" width="633" border="1" height="100">
                                                <tr>
                                                    <td valign="top">

                                                        <table border="0" bgcolor="#e6ecf2" border="0" style="width: 846px">
                                                            <tr>
                                                                <td class="textos22" colspan="2">&nbsp;</td>
                                                            </tr>

                                                            <tr>
                                                                <td align="right" class="style2">OT :</td>
                                                                <td align="left">
                                                                    <asp:TextBox ID="txtOT" runat="server" Style="WIDTH: 400px; margin-left: 0px;" Enabled="false"></asp:TextBox>

                                                                </td>
                                                            </tr>

                                                            <tr>
                                                                <td align="right" class="style2">Estado OT :</td>
                                                                <td align="left">
                                                                    <asp:TextBox ID="txtEstadoOT" Text="EN PROCESO" runat="server" Style="WIDTH: 400px; margin-left: 0px;" Enabled="false"></asp:TextBox>

                                                                </td>
                                                            </tr>

                                                            <tr>
                                                                <td align="right" class="style2">Responsable :</td>
                                                                <td align="left">
                                                                    <asp:TextBox ID="txtResponsable" Text="MARCELO REABARREN LEON" runat="server" Style="WIDTH: 400px; margin-left: 0px;" Enabled="false"></asp:TextBox>

                                                                </td>
                                                            </tr>

                                                            <tr>
                                                                <td align="right" class="style2">Sub Producto :</td>
                                                                <td align="left">
                                                                    <asp:TextBox ID="txtsubproducto" runat="server"
                                                                        Style="WIDTH: 400px; margin-left: 0px;" Enabled="False"></asp:TextBox>
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td align="right" class="style2">Producto :</td>
                                                                <td align="left">
                                                                    <asp:TextBox ID="txtprod" runat="server"
                                                                        Style="WIDTH: 400px; margin-left: 0px;" Enabled="False"></asp:TextBox>
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td align="right" class="style2">Tipo Documento :</td>
                                                                <td align="left">
                                                                    <asp:TextBox ID="txtTipoDoc" runat="server" Style="WIDTH: 400px; margin-left: 0px;"></asp:TextBox>
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td align="right" class="style2">N° Operación :</td>
                                                                <td align="left">
                                                                    <asp:TextBox ID="txtnrooperacion" runat="server"
                                                                        Style="WIDTH: 400px; margin-left: 0px;" Enabled="False"></asp:TextBox>
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td align="right" class="style2">Rut Cliente :</td>
                                                                <td align="left">
                                                                    <asp:TextBox ID="txtrutcliente" runat="server" onKeyPress="return acceptNum(event)"
                                                                        Style="WIDTH: 400px; margin-left: 0px;" Enabled="False"></asp:TextBox>
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td align="right" class="style2">Dv :</td>
                                                                <td align="left">
                                                                    <asp:TextBox ID="txtdv" runat="server" Style="WIDTH: 400px; margin-left: 0px;"
                                                                        Enabled="False"></asp:TextBox>
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td align="right" class="style2">Nombre Cliente :</td>
                                                                <td align="left">
                                                                    <asp:TextBox ID="txtnombrecliente" runat="server"
                                                                        Style="WIDTH: 400px; margin-left: 0px;" Enabled="False"></asp:TextBox>
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td align="right" class="style2">Dirección :</td>
                                                                <td align="left">
                                                                    <asp:TextBox ID="txtdireccion" runat="server"
                                                                        Style="WIDTH: 400px; margin-left: 0px;"></asp:TextBox>
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td align="right" class="style2">Comuna :</td>
                                                                <td align="left">
                                                                    <asp:TextBox ID="txtcomuna" runat="server"
                                                                        Style="WIDTH: 400px; margin-left: 0px;"></asp:TextBox>
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td align="right" class="style2">Conservador :</td>
                                                                <td align="left">
                                                                    <asp:TextBox ID="txtconservador" runat="server"
                                                                        Style="WIDTH: 400px; margin-left: 0px;"></asp:TextBox>
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td align="right" class="style2">Región :</td>
                                                                <td align="left">
                                                                    <asp:TextBox ID="txtregion" runat="server"
                                                                        Style="WIDTH: 400px; margin-left: 0px;"></asp:TextBox>
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td align="right" class="style2">Fojas Dominio :</td>
                                                                <td align="left">
                                                                    <asp:TextBox ID="txtfojasdominio" runat="server" Style="WIDTH: 400px; margin-left: 0px;"></asp:TextBox>
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td align="right" class="style2">N° Dominio :</td>
                                                                <td align="left">
                                                                    <asp:TextBox ID="txtnumerodominio" runat="server" Style="WIDTH: 400px; margin-left: 0px;"></asp:TextBox>
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td align="right" class="style2">Año Dominio :</td>
                                                                <td align="left">
                                                                    <asp:TextBox ID="txtaniodominio" onKeyPress="return acceptNum(event)" runat="server" Style="WIDTH: 400px; margin-left: 0px;"></asp:TextBox>
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td align="right" class="style2">Fojas Hipoteca :</td>
                                                                <td align="left">
                                                                    <asp:TextBox ID="txtfojashipoteca" runat="server" Style="WIDTH: 400px; margin-left: 0px;"></asp:TextBox>
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td align="right" class="style2">N° Hipoteca :</td>
                                                                <td align="left">
                                                                    <asp:TextBox ID="txtnumerohipoteca" runat="server" Style="WIDTH: 400px; margin-left: 0px;"></asp:TextBox>
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td align="right" class="style2">Año Hipoteca :</td>
                                                                <td align="left">
                                                                    <asp:TextBox ID="txtaniohipoteca" runat="server" Style="WIDTH: 400px; margin-left: 0px;"></asp:TextBox>
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td align="right" class="style2">Fojas Prohibición :</td>
                                                                <td align="left">
                                                                    <asp:TextBox ID="txtfojasprohibicion" runat="server" Style="WIDTH: 400px; margin-left: 0px;"></asp:TextBox>
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td align="right" class="style3">N° Prohibición :</td>
                                                                <td align="left" class="style4">
                                                                    <asp:TextBox ID="txtnumeroprohibicion" runat="server" Style="WIDTH: 400px; margin-left: 0px;"></asp:TextBox>
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td align="right" class="style2">Año Prohibición :</td>
                                                                <td align="left">
                                                                    <asp:TextBox ID="txtanioprohibicion" onKeyPress="return acceptNum(event)" runat="server" Style="WIDTH: 400px; margin-left: 0px;"></asp:TextBox>
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td align="right" class="style2">Fecha Contabilización :</td>
                                                                <td align="left">
                                                                    <asp:TextBox ID="txtfechacontabilizacion" runat="server"
                                                                        Style="WIDTH: 400px; margin-left: 0px;" ReadOnly="True"></asp:TextBox>
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td align="right" class="style2">Fecha Entrega :</td>
                                                                <td align="left">
                                                                    <asp:TextBox ID="txtfechaentrega" runat="server"
                                                                        Style="WIDTH: 400px; margin-left: 0px;" Enabled="False"></asp:TextBox>
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td align="right" class="style2">Fecha Escritura :</td>
                                                                <td align="left">
                                                                    <asp:TextBox ID="txtfechaescritura" MaxLength="10" runat="server" Style="WIDTH: 400px; margin-left: 0px;"></asp:TextBox>
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td align="right" class="style2">Notaria :</td>
                                                                <td align="left">
                                                                    <asp:TextBox ID="txtnotaria" runat="server" Style="WIDTH: 400px; margin-left: 0px;"></asp:TextBox>
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td align="right" class="style2">Comuna Notaria :</td>
                                                                <td align="left">
                                                                    <asp:TextBox ID="txtcomunanotaria" runat="server" Style="WIDTH: 400px; margin-left: 0px;"></asp:TextBox>
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td align="right" class="style2">Repertorio :</td>
                                                                <td align="left">
                                                                    <asp:TextBox ID="txtreportorio" runat="server" Style="WIDTH: 400px; margin-left: 0px;"></asp:TextBox>
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td align="right" class="style2">Protocolo :</td>
                                                                <td align="left">
                                                                    <asp:TextBox ID="txtprotocolo" runat="server" Style="WIDTH: 400px; margin-left: 0px;"></asp:TextBox>
                                                                </td>
                                                            </tr>

                                                            <tr>
                                                                <td align="right" class="style2">Estado :</td>
                                                                <td align="left">

                                                                    <asp:DropDownList ID="cbxEstado" Style="WIDTH: 402px; margin-left: 0px;"
                                                                        runat="server" AutoPostBack="True"
                                                                        OnSelectedIndexChanged="cbxEstado_SelectedIndexChanged">
                                                                    </asp:DropDownList>

                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td align="right" class="style2">Fecha Estado :</td>
                                                                <td align="left">
                                                                    <asp:TextBox ID="txtfechaestado" runat="server"
                                                                        Style="WIDTH: 400px; margin-left: 0px;" Enabled="False"></asp:TextBox>
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td align="right" class="style2">Observación :</td>
                                                                <td align="left">
                                                                    <asp:TextBox ID="txtobservacion" runat="server" Style="margin-left: 0px;"
                                                                        Height="107px" TextMode="MultiLine" Width="655px"></asp:TextBox>
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td align="right" class="style2">N° Carillas :</td>
                                                                <td align="left">
                                                                    <asp:TextBox ID="txtnrocarillas" runat="server" Style="WIDTH: 400px; margin-left: 0px;"></asp:TextBox>
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td align="right" class="style2">Factura :</td>
                                                                <td align="left">
                                                                    <asp:TextBox ID="txtfactura" runat="server" Style="WIDTH: 400px; margin-left: 0px;"></asp:TextBox>
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td align="right" class="style2">Fecha Factura :</td>
                                                                <td align="left">
                                                                    <asp:TextBox ID="txtfechafactura" MaxLength="10" runat="server" Style="WIDTH: 400px; margin-left: 0px;"></asp:TextBox>
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td align="right" class="style2">Monto Factura :</td>
                                                                <td align="left">
                                                                    <asp:TextBox ID="txtmontofactura" onKeyPress="return acceptNum(event)" runat="server" Style="WIDTH: 400px; margin-left: 0px;"></asp:TextBox>
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td align="right" class="style2">Fecha Remesa :</td>
                                                                <td align="left">
                                                                    <asp:TextBox ID="txtfecha_producto" runat="server"
                                                                        Style="WIDTH: 400px; margin-left: 0px;" Enabled="False"></asp:TextBox>
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td align="right" class="style2">Remesa :</td>
                                                                <td align="left">
                                                                    <asp:TextBox ID="txtproducto" runat="server"
                                                                        Style="WIDTH: 400px; margin-left: 0px;" Enabled="False"></asp:TextBox>
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td align="right" class="style2">Centro Costo :</td>
                                                                <td align="left">
                                                                    <asp:TextBox ID="txtcentrocosto" runat="server" Style="WIDTH: 400px; margin-left: 0px;"></asp:TextBox>
                                                                </td>
                                                            </tr>

                                                        </table>

                                                    </td>
                                                </tr>
                                            </table>

                                        </asp:Panel>

                                        <!-- Tabla Cuerpo Fin -->

                                    </td>
                                </tr>
                                <tr>
                                    <td valign="top" bgcolor="#CCCCCC">
                                        <!-- Zona de Botoneras -->
                                        <table width="100%" border="0" cellpadding="0" cellspacing="0">
                                            <tr>
                                                <td width="600" height="35">
                                                    <div align="center">
                                                        <asp:Button ID="btnBuscar" runat="server" CssClass="boton" Text="Buscar" OnClientClick="return ValidarBuscar();" Visible="False" />
                                                        <asp:Button ID="Button1" runat="server" Visible="false" CssClass="boton2" Text="Imprime Abono" OnClientClick="return Ir();" />
                                                        <asp:Button ID="btnGuardar" runat="server" OnClientClick="return GuardarFormulario()" CssClass="boton2" Text="Guardar" OnClick="btnGuardar_Click" />
                                                        <asp:Button ID="Button2" runat="server" CssClass="boton2" Text="Emitir Informe" OnClientClick="return MostrarDocumento();" />
                                                        <asp:Button ID="btnActualizar" runat="server" CssClass="boton" Text="Actualizar" OnClientClick="return ValidarActualizar();" Visible="False" />
                                                        <asp:Button ID="btnEliminar" runat="server" CssClass="boton" Text="Eliminar" Visible="False" OnClientClick="return ValidarEliminar();" />
                                                        <asp:Button ID="btnBitacora" runat="server" CssClass="boton" Text="Bitacora" OnClientClick="return MostrarBitacoraEstados();" />
                                                        <asp:Button ID="btnDigitalizar" runat="server" CssClass="boton" OnClientClick="return Digitalizar();" Text="Digitalizar" />
                                                        
                                                        <asp:Button ID="btnReversarDos" runat="server" Text="Reversar" CssClass="boton" OnClientClick="return Reversar();"/>

                                                        
                                                        <asp:Button ID="btnGastos" runat="server" CssClass="boton2" OnClientClick="return Gastos();" Text="Ingreso Gastos" />
                                                        <asp:Button ID="btnEditarGastos" runat="server" CssClass="boton2" OnClientClick="return EditarGastos();" Text="Editar Gastos" />
                                                        <asp:Button ID="btnCancelar" Visible="false" runat="server" CssClass="boton" Text="Cancelar" />
                                                    </div>
                                                </td>
                                            </tr>
                                        </table>
                                    </td>
                                </tr>
                                <tr>
                                    <td><%--
                        <TABLE borderColor=#c8e3f9 cellSpacing=0 cellPadding=0 
                                        width=100% border=1>
                                <TBODY> 
                                <TR> 
                                  <TD align="left"  bgColor=#eeeeee><b>&nbsp;DETALLE</b></TD>
                                </TR>
                                </TBODY> 
                              </TABLE>--%>
                                    </td>
                                </tr>
                                <tr>
                                    <td valign="top" xbgcolor="#CCCCCC">
                                        <asp:GridView ID="Grilla" runat="server"
                                            EmptyDataText="<b>No existen abonos registrados</b>"
                                            AllowPaging="True"
                                            PageSize="1000"
                                            AutoGenerateColumns="False"
                                            Width="100%"
                                            CellPadding="4" ForeColor="#333333"
                                            GridLines="None" Style="margin-right: 0px">
                                            <Columns>

                                                <asp:TemplateField HeaderText="Concepto Abono">
                                                    <HeaderStyle Wrap="true" Width="180"></HeaderStyle>
                                                    <ItemStyle Wrap="false"></ItemStyle>
                                                    <ItemTemplate>
                                                        <asp:Label ID="lblCodigo" runat="server" Text='<%# Bind("concepto") %>' SortExpression="Codigo" SortDirection="ASC"></asp:Label>
                                                    </ItemTemplate>
                                                </asp:TemplateField>


                                                <asp:TemplateField HeaderText="Fecha">
                                                    <HeaderStyle Wrap="true" Width="100"></HeaderStyle>
                                                    <ItemStyle Wrap="false"></ItemStyle>
                                                    <ItemTemplate>
                                                        <asp:Label ID="lblNombre" runat="server" Text='<%# Bind("fecha") %>' SortExpression="Descripcion" SortDirection="ASC"></asp:Label>
                                                    </ItemTemplate>
                                                </asp:TemplateField>

                                                <asp:TemplateField HeaderText="Tipo Moneda">
                                                    <HeaderStyle Wrap="true"></HeaderStyle>
                                                    <ItemStyle Wrap="false"></ItemStyle>
                                                    <ItemTemplate>
                                                        <asp:Label ID="lblNombre" runat="server" Text='<%# Bind("moneda") %>' SortExpression="Descripcion" SortDirection="ASC"></asp:Label>
                                                    </ItemTemplate>
                                                </asp:TemplateField>

                                                <asp:TemplateField HeaderText="Fecha Pago">
                                                    <HeaderStyle Wrap="true"></HeaderStyle>
                                                    <ItemStyle Wrap="false"></ItemStyle>
                                                    <ItemTemplate>
                                                        <asp:Label ID="lblNombre" runat="server" Text='<%# Bind("fechapago") %>' SortExpression="Descripcion" SortDirection="ASC"></asp:Label>
                                                    </ItemTemplate>
                                                </asp:TemplateField>

                                                <asp:TemplateField HeaderText="Boleta Honorarios">
                                                    <HeaderStyle Wrap="true"></HeaderStyle>
                                                    <ItemStyle Wrap="false"></ItemStyle>
                                                    <ItemTemplate>
                                                        <asp:Label ID="lblNombre" runat="server" Text='<%# Bind("boleta") %>' SortExpression="Descripcion" SortDirection="ASC"></asp:Label>
                                                    </ItemTemplate>
                                                </asp:TemplateField>


                                                <asp:TemplateField HeaderText="Imprimir Comprobante">
                                                    <ItemTemplate>
                                                        <a href="#" onclick="javascript:MostrarDocumento('<%# Eval("id_abono")%>');">
                                                            <asp:Image ID="Image1" runat="server" ImageUrl="~/images/lupa.jpg" ToolTip="Ver Comprobante Abono" /></a>
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                <%-- 
                                            <asp:TemplateField HeaderText="Eliminar"   >
                                            <HeaderStyle  HorizontalAlign="Center"></HeaderStyle>
                                             <ItemStyle  HorizontalAlign="Center"></ItemStyle>
                                              <ItemTemplate>
                                               <asp:ImageButton ID="ImageButton1" runat="server" ImageUrl="~/images/b_borrar.gif"  OnClientClick="return confirm('¿Está seguro que desea eliminar documento ?')" CommandName="Deshabilitar" />
                                              </ItemTemplate>
                                             </asp:TemplateField>--%>
                                            </Columns>

                                            <PagerSettings Mode="NextPreviousFirstLast"
                                                FirstPageText="<<"
                                                LastPageText=">>"
                                                PageButtonCount="3" />

                                            <HeaderStyle CssClass="cabezabrilla" />
                                            <RowStyle BackColor="#EFF3FB" />
                                            <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                                            <PagerStyle BackColor="#2461BF" ForeColor="White" />
                                            <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                                            <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                                            <EditRowStyle BackColor="#2461BF" />
                                            <AlternatingRowStyle BackColor="White" />
                                        </asp:GridView>

                                    </td>
                                </tr>
                            </tbody>
                        </table>
                        <div align="center">
                            <font size="2"><%--  <asp:TemplateField HeaderText="Ver"  >
                              <ItemTemplate>
                               <a href="#" onclick="javascript:MostrarDocumento('<%# Eval("urldocumento")%>');" ><asp:Image ID="Image1" runat="server" ImageUrl="~/images/lupa.jpg" ToolTip="Ver Documento"  /></a> 
                              </ItemTemplate>
                             </asp:TemplateField>
                           
                            <asp:TemplateField HeaderText="Eliminar"   >
                            <HeaderStyle  HorizontalAlign="Center"></HeaderStyle>
                             <ItemStyle  HorizontalAlign="Center"></ItemStyle>
                              <ItemTemplate>
                               <asp:ImageButton ID="ImageButton1" runat="server" ImageUrl="~/images/b_borrar.gif"  OnClientClick="return confirm('¿Está seguro que desea eliminar documento ?')" CommandName="Deshabilitar" />
                              </ItemTemplate>
                             </asp:TemplateField>--%>
                            </font>
                        </div>

                        <asp:HiddenField ID="hiddOT" runat="server" />
                        <asp:HiddenField ID="hddUserResponsable" runat="server" />

                        <!-- Para BITACORA ESTADOS -->
                        <asp:HiddenField ID="hddCodigoEstado" runat="server" />
                        <asp:HiddenField ID="hddFechaEstado" runat="server" />
                        <asp:HiddenField ID="hddObservacion" runat="server" />
                    </form>
                </td>
            </tr>
        </tbody>
    </table>

</body>
</html>