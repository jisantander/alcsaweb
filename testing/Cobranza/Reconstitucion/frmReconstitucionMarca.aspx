<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="frmReconstitucionMarca.aspx.cs" Inherits="CobranzaALC.Cobranza.Reconstitucion.frmReconstitucionMarca" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">


<html xmlns="http://www.w3.org/1999/xhtml" >
<head id="Head1" runat="server">
    <title>Ingreso Formulario</title>
    <link href="../../css/alc2.css" rel="stylesheet" type="text/css" />
    <script src="../../js/funciones.js" type="text/javascript"></script>

<script language="javascript" type="text/javascript">


    function ImprimirInforme() {

        url = 'ReporteOtrosMarca.aspx?ot=' + document.all("txtOT").value;
        url += '&txtTitulo=' + document.all("txtTitulo").value;
        url += '&txtEstadoOT=' + document.all("txtEstadoOT").value;
        url += '&txtResponsable=' + document.all("txtResponsable").value;
        url += '&txtsubproducto=' + document.all("txtsubproducto").value;
        url += '&txtprod=' + document.all("txtprod").value;
        url += '&txtTipoDoc=' + document.all("txtTipoDoc").value;
        url += '&txtnrooperacion=' + document.all("txtnrooperacion").value;
        url += '&txtrutcliente=' + document.all("txtrutcliente").value;
        url += '&txtdv=' + document.all("txtdv").value;
        url += '&txtnombrecliente=' + document.all("txtnombrecliente").value;
        url += '&txtdireccion=' + document.all("txtdireccion").value;
        url += '&txtcomuna=' + document.all("txtcomuna").value;
        url += '&txtconservador=' + document.all("txtconservador").value;
        url += '&txtregion=' + document.all("txtregion").value;
        url += '&txtfojasdominio=' + document.all("txtfojasdominio").value;
        url += '&txtnumerodominio=' + document.all("txtnumerodominio").value;
        url += '&txtaniodominio=' + document.all("txtaniodominio").value;
        url += '&txtfojashipoteca=' + document.all("txtfojashipoteca").value;
        url += '&txtnumerohipoteca=' + document.all("txtnumerohipoteca").value;
        url += '&txtaniohipoteca=' + document.all("txtaniohipoteca").value;
        url += '&txtfojasprohibicion=' + document.all("txtfojasprohibicion").value;
        url += '&txtnumeroprohibicion=' + document.all("txtnumeroprohibicion").value;
        url += '&txtanioprohibicion=' + document.all("txtanioprohibicion").value;
        url += '&txtfechacontabilizacion=' + document.all("txtfechacontabilizacion").value;
        url += '&txtfechaentrega=' + document.all("txtfechaentrega").value;
        url += '&txtfechaescritura=' + document.all("txtfechaescritura").value;
        url += '&txtnotaria=' + document.all("txtnotaria").value;
        url += '&txtcomunanotaria=' + document.all("txtcomunanotaria").value;
        url += '&txtreportorio=' + document.all("txtreportorio").value;
        url += '&txtprotocolo=' + document.all("txtprotocolo").value;
        url += '&cbxEstado=' + document.all("cbxEstado").value;
        url += '&txtfechaestado=' + document.all("txtfechaestado").value;
        url += '&txtobservacion=' + document.all("txtobservacion").value;
        url += '&txtnrocarillas=' + document.all("txtnrocarillas").value;
        url += '&txtfactura=' + document.all("txtfactura").value;
        url += '&txtfechafactura=' + document.all("txtfechafactura").value;
        url += '&txtmontofactura=' + document.all("txtmontofactura").value;
        url += '&txtfecha_producto=' + document.all("txtfecha_producto").value;
        url += '&txtremesa=' + document.all("txtproducto").value;
        url += '&txtcentrocosto=' + document.all("txtcentrocosto").value;



        pWin = window.open(url, 'newWin', 'width=750,height=650,scrollbars=1,satus=0,menubar=no,top=10,left=100')
        //if (window.pWin)
        //  pWin.focus()

        return false;
    }


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
        nombre = document.all("txtnombrecliente").value



        url = 'ReconstitucionGastos.aspx?OT=' + OT + "&nrooperacion=" + nrooperacion + "&rut=" + rut + "&nombre=" + nombre;

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




        alert('Desarrollo fin de semana 28-29 abril ');

        return false;

        //        if (!(ChequeaRut(document.all("txtRut")))) {
        //            alert('Rut no es válido');
        //            document.all("txtRut").focus();
        //            document.all("txtRut").select();

        //            return false;
        //        }


        //        if (document.all("txtRut").value == "") {
        //            alert('Debe ingresar el Rut');
        //            document.all("txtRut").focus();
        //            return false;
        //        }

        //        return true;

    }

 </script>
 
    <style type="text/css">
 
        .style2
        {
            FONT-WEIGHT: normal;
            FONT-SIZE: 12px;
            COLOR: #493f46;
            FONT-FAMILY: "Gill Sans MT", Arial;
            width: 151px;
        }
        .style3
        {
            FONT-WEIGHT: normal;
            FONT-SIZE: 12px;
            COLOR: #493f46;
            FONT-FAMILY: "Gill Sans MT", Arial;
            width: 151px;
            height: 26px;
        }
        .style4
        {
            height: 26px;
        }
        </style>
 
</head>
<body>


 <TABLE cellSpacing=0 cellPadding=0 width=633 border=0>
  <TBODY> 
  <TR> 
    <TD width="633" height=50 valign="top" bgcolor="#336699" xbackground="../../images/banner2.jpg"> 
      <TABLE align=right border=0 style="width: 373px">
        <TBODY> 
        <TR> 
          <TD class=titulo align=right>SISTEMA DE RECONSTITUCIONES</TD>
        </TR>
        </TBODY> 
      </TABLE>
    </TD>
  </TR>
  <TR> 
    <TD height="394" valign="top" class=textos><BR>
      <CENTER>
      </CENTER>
      
      <FORM runat="server" id="Formulario"   >
       <asp:ScriptManager ID="ScriptManager1" runat="server">
    </asp:ScriptManager>
        <TABLE width=633 align=center border=0  >
          <TBODY> 
          <TR> 
                      <!---->          
            <TD height="163" width="100%" valign="top"> 
            
            <!-- Zona de Titulo -->
            
              <TABLE borderColor=#c8e3f9 cellSpacing=0 cellPadding=0 
                        width=100% border=1>
                <TBODY> 
                <TR> 
                  <TD align="left"  bgColor=#eeeeee><b>&nbsp;ARMADO INFORME RECONSTITUCIÓN</b></TD>
                </TR>
                </TBODY> 
              </TABLE>
              <TABLE height=7 style="width: 847px">
                <TBODY> 
                <TR> 
                  <TD>
                     
                    </TD>
                </TR>
                </TBODY> 
              </TABLE>
              
              <!-- Tabla Cuerpo Inicio -->
                <asp:Panel ID="pnlFORMULARIO" runat="server">
             
              
              
              <table borderColor=#c8e3f9 cellSpacing=0 cellPadding=0 width=633 border=1 height="100" >
              <tr>
              <td valign="top">
               
                  <table border="0" bgColor=#e6ecf2 border=0 style="width: 846px">
                    <tr>
                     <td class="textos22"  colspan="2">&nbsp;</td>
                    </tr>
                    
                    
                    <tr>
                        <td align="right" class="style2" >Titulo Informe :</td>
                        <td  align="left">
                          <asp:TextBox ID="txtTitulo"   runat="server" style="WIDTH: 400px; margin-left: 0px;" ></asp:TextBox> 
                           
                        </td>
                    </tr>
                    
                    <tr>
                        <td align="right" class="style2" >OT :</td>
                        <td  align="left">
                          <asp:TextBox ID="txtOT"  runat="server" style="WIDTH: 400px; margin-left: 0px;" ></asp:TextBox> 
                           
                        </td>
                    </tr>
                    
                    
                       
                    
                    <tr>
                        <td align="right" class="style2" >Estado OT :</td>
                        <td  align="left">
                          <asp:TextBox ID="txtEstadoOT"   runat="server" style="WIDTH: 400px; margin-left: 0px;" ></asp:TextBox> 
                           
                        </td>
                    </tr>
                    
                    <tr>
                        <td align="right" class="style2" >Responsable :</td>
                        <td  align="left">
                          <asp:TextBox ID="txtResponsable"   runat="server" style="WIDTH: 400px; margin-left: 0px;" ></asp:TextBox> 
                           
                        </td>
                    </tr>
                    
                    <tr>
                        <td align="right" class="style2" >Sub Producto :</td>
                        <td  align="left">
                            <asp:TextBox ID="txtsubproducto" runat="server" 
                                style="WIDTH: 400px; margin-left: 0px;"  ></asp:TextBox> 
                        </td>
                    </tr>
                    <tr>
                        <td align="right" class="style2" >Producto :</td>
                        <td  align="left">
                            <asp:TextBox ID="txtprod" runat="server" 
                                style="WIDTH: 400px; margin-left: 0px;"  ></asp:TextBox> 
                        </td>
                    </tr>
                    <tr>
                        <td align="right" class="style2" >Tipo Documento :</td>
                        <td  align="left">
                            <asp:TextBox ID="txtTipoDoc" runat="server" style="WIDTH: 400px; margin-left: 0px;" ></asp:TextBox> 
                        </td>
                    </tr>
                    <tr>
                        <td align="right" class="style2" >N° Operación :</td>
                        <td  align="left">
                            <asp:TextBox ID="txtnrooperacion" runat="server" 
                                style="WIDTH: 400px; margin-left: 0px;"  ></asp:TextBox> 
                        </td>
                    </tr>
                    <tr>
                        <td align="right" class="style2" >Rut Cliente :</td>
                        <td  align="left">
                            <asp:TextBox ID="txtrutcliente" runat="server" 
                                style="WIDTH: 400px; margin-left: 0px;"  ></asp:TextBox> 
                        </td>
                    </tr>
                    <tr>
                        <td align="right" class="style2" >Dv :</td>
                        <td  align="left">
                            <asp:TextBox ID="txtdv" runat="server" style="WIDTH: 400px; margin-left: 0px;" 
                                 ></asp:TextBox> 
                        </td>
                    </tr>
                    <tr>
                        <td align="right" class="style2" >Nombre Cliente :</td>
                        <td  align="left">
                            <asp:TextBox ID="txtnombrecliente" runat="server" 
                                style="WIDTH: 400px; margin-left: 0px;"  ></asp:TextBox> 
                        </td>
                    </tr>
                    <tr>
                        <td align="right" class="style2" >Dirección :</td>
                        <td  align="left">
                            <asp:TextBox ID="txtdireccion" runat="server" 
                                style="WIDTH: 400px; margin-left: 0px;"  ></asp:TextBox> 
                        </td>
                    </tr>
                    <tr>
                        <td align="right" class="style2" >Comuna :</td>
                        <td  align="left">
                            <asp:TextBox ID="txtcomuna" runat="server" 
                                style="WIDTH: 400px; margin-left: 0px;"  ></asp:TextBox> 
                        </td>
                    </tr>
                    <tr>
                        <td align="right" class="style2" >Conservador :</td>
                        <td  align="left">
                            <asp:TextBox ID="txtconservador" runat="server" 
                                style="WIDTH: 400px; margin-left: 0px;"  ></asp:TextBox> 
                        </td>
                    </tr>
                    <tr>
                        <td align="right" class="style2" >Región :</td>
                        <td  align="left">
                            <asp:TextBox ID="txtregion" runat="server" 
                                style="WIDTH: 400px; margin-left: 0px;"  ></asp:TextBox> 
                        </td>
                    </tr>
                    <tr>
                        <td align="right" class="style2" >Fojas Dominio :</td>
                        <td  align="left">
                            <asp:TextBox ID="txtfojasdominio" runat="server" style="WIDTH: 400px; margin-left: 0px;" ></asp:TextBox> 
                        </td>
                    </tr>
                    <tr>
                        <td align="right" class="style2" >N° Dominio :</td>
                        <td  align="left">
                            <asp:TextBox ID="txtnumerodominio" runat="server" style="WIDTH: 400px; margin-left: 0px;" ></asp:TextBox> 
                        </td>
                    </tr>
                    <tr>
                        <td align="right" class="style2" >Año Dominio :</td>
                        <td  align="left">
                            <asp:TextBox ID="txtaniodominio"  runat="server" style="WIDTH: 400px; margin-left: 0px;" ></asp:TextBox> 
                        </td>
                    </tr>
                    <tr>
                        <td align="right" class="style2" >Fojas Hipoteca :</td>
                        <td  align="left">
                            <asp:TextBox ID="txtfojashipoteca" runat="server" style="WIDTH: 400px; margin-left: 0px;" ></asp:TextBox> 
                        </td>
                    </tr>
                    <tr>
                        <td align="right" class="style2" >N° Hipoteca :</td>
                        <td  align="left">
                            <asp:TextBox ID="txtnumerohipoteca" runat="server" style="WIDTH: 400px; margin-left: 0px;" ></asp:TextBox> 
                        </td>
                    </tr>
                    <tr>
                        <td align="right" class="style2" >Año Hipoteca :</td>
                        <td  align="left">
                            <asp:TextBox ID="txtaniohipoteca" runat="server" style="WIDTH: 400px; margin-left: 0px;" ></asp:TextBox> 
                        </td>
                    </tr>
                    <tr>
                        <td align="right" class="style2" >Fojas Prohibición :</td>
                        <td  align="left">
                            <asp:TextBox ID="txtfojasprohibicion" runat="server" style="WIDTH: 400px; margin-left: 0px;" ></asp:TextBox> 
                        </td>
                    </tr>
                    <tr>
                        <td align="right" class="style3" >N° Prohibición :</td>
                        <td  align="left" class="style4">
                            <asp:TextBox ID="txtnumeroprohibicion" runat="server" style="WIDTH: 400px; margin-left: 0px;" ></asp:TextBox> 
                        </td>
                    </tr>
                    <tr>
                        <td align="right" class="style2" >Año Prohibición :</td>
                        <td  align="left">
                            <asp:TextBox ID="txtanioprohibicion"  runat="server" style="WIDTH: 400px; margin-left: 0px;" ></asp:TextBox> 
                        </td>
                    </tr>
                    <tr>
                        <td align="right" class="style2" >Fecha Contabilización :</td>
                        <td  align="left">
                            <asp:TextBox ID="txtfechacontabilizacion" runat="server" 
                                style="WIDTH: 400px; margin-left: 0px;"  ></asp:TextBox> 
                        </td>
                    </tr>
                    <tr>
                        <td align="right" class="style2" >Fecha Entrega :</td>
                        <td  align="left">
                            <asp:TextBox ID="txtfechaentrega" runat="server" 
                                style="WIDTH: 400px; margin-left: 0px;"  ></asp:TextBox> 
                        </td>
                    </tr>
                    <tr>
                        <td align="right" class="style2" >Fecha Escritura :</td>
                        <td  align="left">
                            <asp:TextBox ID="txtfechaescritura" MaxLength="10" runat="server" style="WIDTH: 400px; margin-left: 0px;" ></asp:TextBox> 
                        </td>
                    </tr>
                    <tr>
                        <td align="right" class="style2" >Notaria :</td>
                        <td  align="left">
                            <asp:TextBox ID="txtnotaria" runat="server" style="WIDTH: 400px; margin-left: 0px;" ></asp:TextBox> 
                        </td>
                    </tr>
                    <tr>
                        <td align="right" class="style2" >Comuna Notaria :</td>
                        <td  align="left">
                            <asp:TextBox ID="txtcomunanotaria" runat="server" style="WIDTH: 400px; margin-left: 0px;" ></asp:TextBox> 
                        </td>
                    </tr>
                    <tr>
                        <td align="right" class="style2" >Repertorio :</td>
                        <td  align="left">
                            <asp:TextBox ID="txtreportorio" runat="server" style="WIDTH: 400px; margin-left: 0px;" ></asp:TextBox> 
                        </td>
                    </tr>
                    <tr>
                        <td align="right" class="style2" >Protocolo :</td>
                        <td  align="left">
                            <asp:TextBox ID="txtprotocolo" runat="server" style="WIDTH: 400px; margin-left: 0px;" ></asp:TextBox> 
                        </td>
                    </tr>
                  
                    <tr>
                        <td align="right" class="style2" >Estado :</td>
                        <td  align="left">
                            
                             <asp:TextBox ID="cbxEstado" runat="server" style="WIDTH: 400px; margin-left: 0px;" ></asp:TextBox> 
                             
                           
                            
                        </td>
                    </tr>
                    <tr>
                        <td align="right" class="style2" >Fecha Estado :</td>
                        <td  align="left">
                            <asp:TextBox ID="txtfechaestado" runat="server" 
                                style="WIDTH: 400px; margin-left: 0px;"  ></asp:TextBox> 
                        </td>
                    </tr>
                    <tr>
                        <td align="right" class="style2" >Observación :</td>
                        <td  align="left">
                            <asp:TextBox ID="txtobservacion" runat="server" style="margin-left: 0px;" 
                                 Height="107px" TextMode="MultiLine" Width="655px"></asp:TextBox> 
                        </td>
                    </tr>
                    <tr>
                        <td align="right" class="style2" >N° Carillas :</td>
                        <td  align="left">
                            <asp:TextBox ID="txtnrocarillas" runat="server" style="WIDTH: 400px; margin-left: 0px;" ></asp:TextBox> 
                        </td>
                    </tr>
                    <tr>
                        <td align="right" class="style2" >Factura :</td>
                        <td  align="left">
                            <asp:TextBox ID="txtfactura" runat="server" style="WIDTH: 400px; margin-left: 0px;" ></asp:TextBox> 
                        </td>
                    </tr>
                    <tr>
                        <td align="right" class="style2" >Fecha Factura :</td>
                        <td  align="left">
                            <asp:TextBox ID="txtfechafactura" MaxLength="10" runat="server" style="WIDTH: 400px; margin-left: 0px;" ></asp:TextBox> 
                        </td>
                    </tr>
                    <tr>
                        <td align="right" class="style2" >Monto Factura :</td>
                        <td  align="left">
                            <asp:TextBox ID="txtmontofactura"  runat="server" style="WIDTH: 400px; margin-left: 0px;" ></asp:TextBox> 
                        </td>
                    </tr>
                    <tr>
                        <td align="right" class="style2" >Fecha Remesa :</td>
                        <td  align="left">
                            <asp:TextBox ID="txtfecha_producto" runat="server" 
                                style="WIDTH: 400px; margin-left: 0px;"  ></asp:TextBox> 
                        </td>
                    </tr>
                    <tr>
                        <td align="right" class="style2" >Remesa :</td>
                        <td  align="left">
                            <asp:TextBox ID="txtproducto" runat="server" 
                                style="WIDTH: 400px; margin-left: 0px;"  ></asp:TextBox> 
                        </td>
                    </tr>
                    <tr>
                        <td align="right" class="style2" >Centro Costo :</td>
                        <td  align="left">
                            <asp:TextBox ID="txtcentrocosto" runat="server" style="WIDTH: 400px; margin-left: 0px;" ></asp:TextBox> 
                        </td>
                    </tr>
     
                  </table>
 
              </td>
            </tr>
            </table>
            
               </asp:Panel>
            
                <!-- Tabla Cuerpo Fin -->
              
            </TD>
          </TR>
          <TR> 
            <TD  valign="top" bgcolor="#CCCCCC"> 
              
              <!-- Zona de Botoneras -->
              <table width="100%" border="0" cellpadding="0" cellspacing="0">
                <tr> 
                  <td width="600" height="35" > 
                    <div align="center"> 
                        <asp:Button ID="btnImprimir" runat="server" CssClass="boton2" 
                            Text="Imprimir Reporte"  OnClientClick="ImprimirInforme();" 
                              />
                             
                  
                  <%--
                       <asp:Button ID="Button1" runat="server" Visible="false"  CssClass="boton2" Text="Imprime Abono" 
                            OnClientClick="return Ir();"   />
                            
                  --%>
       
                  
                  
           
              
                
                             
                             
                             
                 
                       
                     </div>
                  </td>
                </tr>
              </table>
              
            </TD>
          </TR>
            <td<%-->
                        <TABLE borderColor=#c8e3f9 cellSpacing=0 cellPadding=0 
                        width=100% border=1>
                <TBODY> 
                <TR> 
                  <TD align="left"  bgColor=#eeeeee><b>&nbsp;DETALLE</b></TD>
                </TR>
                </TBODY> 
              </TABLE>--%>
               
            </td>
          
          <TR> 
            <TD  valign="top" xbgcolor="#CCCCCC"> 
                                <%--<asp:GridView ID="Grilla" runat="server" 
                                         EmptyDataText="<b>No existen abonos registrados</b>"
                                          
                                         AllowPaging="True"  
                                         PageSize="1000"
                                         AutoGenerateColumns="False"
                                         Width="100%" 
                                         CellPadding="4" ForeColor="#333333" 
                                         GridLines="None" style="margin-right: 0px"> 
                            <Columns>
                          
                              <asp:TemplateField HeaderText="Concepto Abono">
                                <HeaderStyle Wrap="true" Width="180"></HeaderStyle>
                                <ItemStyle Wrap="false" ></ItemStyle>
                                <ItemTemplate>
                                <asp:Label ID="lblCodigo" runat="server" Text='<%# Bind("concepto") %>' SortExpression = "Codigo" SortDirection="ASC"></asp:Label>
                              </ItemTemplate>
                             </asp:TemplateField>
                      
                             
                             <asp:TemplateField    HeaderText="Fecha">
                             <HeaderStyle Wrap="true" Width="100"></HeaderStyle>
                             <ItemStyle Wrap="false" ></ItemStyle>
                              <ItemTemplate>
                               <asp:Label ID="lblNombre" runat="server" Text='<%# Bind("fecha") %>' SortExpression = "Descripcion" SortDirection="ASC"></asp:Label>
                              </ItemTemplate>
                             </asp:TemplateField>
                             
                              <asp:TemplateField    HeaderText="Tipo Moneda">
                             <HeaderStyle Wrap="true" ></HeaderStyle>
                             <ItemStyle Wrap="false" ></ItemStyle>
                              <ItemTemplate>
                               <asp:Label ID="lblNombre" runat="server" Text='<%# Bind("moneda") %>' SortExpression = "Descripcion" SortDirection="ASC"></asp:Label>
                              </ItemTemplate>
                             </asp:TemplateField>
                             
                              <asp:TemplateField    HeaderText="Fecha Pago">
                             <HeaderStyle Wrap="true" ></HeaderStyle>
                             <ItemStyle Wrap="false" ></ItemStyle>
                              <ItemTemplate>
                               <asp:Label ID="lblNombre" runat="server" Text='<%# Bind("fechapago") %>' SortExpression = "Descripcion" SortDirection="ASC"></asp:Label>
                              </ItemTemplate>
                             </asp:TemplateField>
                             
                              <asp:TemplateField    HeaderText="Boleta Honorarios">
                             <HeaderStyle Wrap="true" ></HeaderStyle>
                             <ItemStyle Wrap="false" ></ItemStyle>
                              <ItemTemplate>
                               <asp:Label ID="lblNombre" runat="server" Text='<%# Bind("boleta") %>' SortExpression = "Descripcion" SortDirection="ASC"></asp:Label>
                              </ItemTemplate>
                             </asp:TemplateField>
                             
                             
                            <asp:TemplateField HeaderText="Imprimir Comprobante"  >
                              <ItemTemplate>
                               <a href="#" onclick="javascript:MostrarDocumento('<%# Eval("id_abono")%>');" ><asp:Image ID="Image1" runat="server" ImageUrl="~/images/lupa.jpg" ToolTip="Ver Comprobante Abono"  /></a> 
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
                               PageButtonCount="3"
                               /> 
                            
                            <HeaderStyle CssClass="cabezabrilla" />
                            <RowStyle BackColor="#EFF3FB" />
                            <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                            <PagerStyle BackColor="#2461BF" ForeColor="White"  />
                            <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                            <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                            <EditRowStyle BackColor="#2461BF" />
                            <AlternatingRowStyle BackColor="White" />
                            </asp:GridView>
                                
          </TD>
          </TR>
          
          </TBODY> 
        </TABLE>
        <div align="center"><font size="2"><%--  <asp:TemplateField HeaderText="Ver"  >
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
          </font> </div>
          
          <asp:HiddenField ID="hiddOT" runat="server" />
          <asp:HiddenField ID="hddUserResponsable" runat="server" />
          
          <!-- Para BITACORA ESTADOS -->
          <asp:HiddenField ID="hddCodigoEstado" runat="server" />
          <asp:HiddenField ID="hddFechaEstado" runat="server" />
          <asp:HiddenField ID="hddObservacion" runat="server" />
          
          
          
          
      </FORM>
    </TD>
  </TR>
  </TBODY> 
</TABLE>

</body>
</html>
