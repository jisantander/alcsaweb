<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Pagare.aspx.cs" Inherits="CobranzaALC.Cobranza.Procesos.Pagare" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head id="Head1" runat="server">
    <title>ALC Asesorìa Legal y Crediticía Ltda</title>
   
<link href="../../css/alc2.css" rel="stylesheet" type="text/css" />
<script src="../../js/funciones.js" type="text/javascript"></script>

<script language="javascript" type="text/javascript">


    function sacafocus() {
        document.all("txtfechamora").focus();
    }

    function sacafecha() {

        if (!(trim(document.all("txtfechamora").value) == '')) {
            var dia = '', mes = '', anio = '', aniomas = 0;
            var fecha = document.all("txtfechamora").value

            dia = fecha.substring(0, 2);
            mes = fecha.substring(3, 5);
            anio = fecha.substring(6, 10);
            aniomas = eval(anio) + 1;

            document.all("txtfechaprescripcion").value = dia + '-' + mes + '-' + aniomas.toString();

        } else document.all("txtfechaprescripcion").value = '';

    }

    function Actividades() {

        var valor = '';
        var url = '';

        valor = document.all("swCobranza").value;
        url = 'MostrarCuotaColegio.aspx?Codigo=' + valor;

        Ir(url, '900', '650');

        return false;
    }


    function Ir(url, ancho, alto) {
        pWin = window.open(url, 'newWin', 'width=' + ancho + ',height=' + alto + ',scrollbars=1,satus=0,menubar=no,top=10,left=100')
        if (window.pWin)
            pWin.focus()

        return false;
    }

    function ValidarEliminar() {

        if (confirm('Esta seguro de eliminar el cliente ?')) {

            return true;

        } else return false;
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



        if (confirm('Esta seguro de actualizar el bien mueble ?')) {

            return true;

        } else return false;
    }

    function ValidarGuardar() {


        alert('Antes de crear tabla y programar, revisar en reunión.\nAsi se evitan los multiples cambios');
        return false;

        if (trim(document.all("filesubir").value) == '') {
            alert("Seleccione documento a digitalizar");
            return false;
        }


        if (trim(document.all("txtCodigoFamilia").value) == "") {
            alert('Debe ingresar la código familia');
            document.all("txtCodigoFamilia").focus();
            return false;
        }

        if (trim(document.all("tipodocumento").value) == "Seleccione") {
            alert('Debe ingresar el tipo de documento');
            document.all("tipodocumento").focus();
            return false;
        }

        if (trim(document.all("txtnrocuota").value) == "") {
            alert('Debe ingresar número de cuotas');
            document.all("txtnrocuota").focus();
            return false;
        }

        if (trim(document.all("txtmontocapital").value) == "") {
            alert('Debe ingresar monto de capital');
            document.all("txtmontocapital").focus();
            return false;
        }

        if (trim(document.all("txtfechamora").value) == "") {
            alert('Debe ingresar fecha de mora');
            document.all("txtfechamora").focus();
            return false;
        }

        if (!(EsFecha(document.all("txtfechamora").value, 'dma'))) {
            alert('Ingrese fecha de mora válida, Ej. 01-09-2010');
            document.all("txtfechamora").focus();
            return false;
        }



        if (trim(document.all("txtfechaingresocobranza").value) == "") {
            alert('Debe ingresar fecha ingreso de cobranza');
            document.all("txtfechaingresocobranza").focus();
            return false;
        }

        if (!(EsFecha(document.all("txtfechaingresocobranza").value, 'dma'))) {
            alert('Ingrese fecha ingreso cobranza válida, Ej. 01-09-2010');
            document.all("txtfechaingresocobranza").focus();
            return false;
        }


        if (trim(document.all("meses").value) == "0") {
            alert('Debe ingresar el mes de la mora');
            document.all("meses").focus();
            return false;
        }







        if (confirm('Esta seguro de guardar la cuota colegio ?')) {
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
        .style3
        {
            FONT-WEIGHT: normal;
            FONT-SIZE: 12px;
            COLOR: #493f46;
            FONT-FAMILY: "Gill Sans MT", Arial;
            width: 104px;
        }
        .style4
        {
            width: 299px;
        }
        .style5
        {
            FONT-WEIGHT: normal;
            FONT-SIZE: 12px;
            COLOR: #493f46;
            FONT-FAMILY: "Gill Sans MT", Arial;
            width: 163px;
        }
    </style>
 
</head>
<body  >


 <TABLE cellSpacing="0" cellPadding="0" width="633" border="0">
  <TBODY> 
  <TR> 
    <TD width="633" height=50 valign="top" bgcolor="#336699" xbackground="../../images/banner2.jpg"> 
      <TABLE width=313 align=right border=0>
        <TBODY> 
        <TR> 
          <TD class=titulo align=right>SISTEMA DE COBRANZA</TD>
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
            <TD height="214" width="100%" valign="top"> 
            
            <!-- Zona de Titulo -->
            
              <TABLE borderColor=#c8e3f9 cellSpacing=0 cellPadding=0 
                        width=100% border=1>
                <TBODY> 
                <TR> 
                  <TD align="left"  bgColor=#eeeeee><b>&nbsp;PAGARE</b></TD>
                </TR>
                </TBODY> 
              </TABLE>
              <TABLE height=7 width=345>
                <TBODY> 
                <TR> 
                  <TD>
                     
                    </TD>
                </TR>
                </TBODY> 
              </TABLE>
              
              <!-- Tabla Cuerpo Inicio -->
              
              <table borderColor=#c8e3f9 cellSpacing=0 cellPadding=0 width=633 border=1 height="100" >
              <tr>
              <td valign="top">
               
                  <table border="0" bgColor=#e6ecf2 border=0 style="width: 698px">
                    <tr>
                     <td class="textos22"  colspan="4">&nbsp;</td>
                    </tr>
                    
              <%--      <tr>
                        <td align="right" class="style2" >Rut Deudor :</td>
                        <td  align="left" class="style1" >
                            <asp:TextBox ID="txtRut" runat="server" 
                                style="WIDTH: 120px; margin-left: 0px; "></asp:TextBox>
                                <font color="red" size="-2"><b> Ej. 12324654-6</b></font>
                            </td>
                        <td align="right" class="style3" ></td>
                        <td  align=left>
                        
                        </td>
                    </tr>--%>
                    
                    
                    
                     <tr>
                        <td align="right" class="style5" >Digitalizar :</td>
                        <td  align="left" class="style4" >
                             
                             <asp:FileUpload ID="filesubir" runat="server" style="WIDTH: 300px; margin-left: 0px;" />
                             
                        </td>
                        <td align="right" class="style3" ></td>
                        <td  align=left>
                            
                        </td>
                    </tr>
                    
                    <tr>
                        <td  colspan="4">
                        <hr width="100%"/>
                        </td>
                    </tr>
                    <tr>
                        <td align="right" class="style5" >N° Operación:</td>
                        <td  align="left" class="style4" >
                             <asp:TextBox ID="txtCliente" runat="server"  ReadOnly="true"
                                style="WIDTH: 150px; margin-left: 0px;"></asp:TextBox>
                        </td>
                        <td align="right" class="style3" ></td>
                        <td  align=left>
                            
                        </td>
                    </tr>
                      <tr>
                        <td align="right" class="style5" >N° Pagare :</td>
                        <td  align="left" class="style4" >
                           <asp:TextBox ID="txtdeudor" runat="server" ReadOnly="true"
                                style="WIDTH:150px; margin-left: 0px;"></asp:TextBox>

                        </td>
                        
                         <td align="right" class="style3" ></td>
                        <td  align=left>
                            
                        </td>
                        
                        
                    </tr>
                    
              
                    
                    
                    
                      <tr>
                        <td align="right" class="style5" >Rut Deudor:</td>
                        <td  align="left" class="style4" >
                          <asp:TextBox ID="txtoperacion" runat="server" 
                                style="WIDTH: 300px; margin-left: 0px;" ReadOnly="True"></asp:TextBox>
                        </td>
                        <td align="right" class="style3" ></td>
                        <td  align=left>
                           
                        </td>
                    </tr>
                    
                     <tr>
                        <td align="right" class="style5" >Nombre Deudor:</td>
                        <td  align="left" class="style4" >
                          <asp:TextBox ID="txtproducto" runat="server" 
                                style="WIDTH: 300px; margin-left: 0px;" ReadOnly="True"></asp:TextBox>
                        </td>
                        <td align="right" class="style3" ></td>
                        <td  align=left>
                           
                        </td>
                    </tr>
                    
                      <tr>
                        <td align="right" class="style5" >Dirección Deudor:</td>
                        <td  align="left" class="style4" >
                          <asp:TextBox ID="txtCodigoFamilia" runat="server" 
                                style="WIDTH: 300px; margin-left: 0px;"></asp:TextBox>
                        </td>
                        <td align="right" class="style3" ></td>
                        <td  align=left>
                           
                        </td>
                    </tr>
                    
                    
                    
                     <tr>
                        <td align="right" class="style5" >Comuna:</td>
                        <td  align="left" class="style4" >
                          <asp:TextBox ID="TextBox1" runat="server" 
                                style="WIDTH: 300px; margin-left: 0px;"></asp:TextBox>
                        </td>
                        <td align="right" class="style3" ></td>
                        <td  align=left>
                           
                        </td>
                    </tr>
                    
                     <tr>
                        <td align="right" class="style5" >Nombre Aval:</td>
                        <td  align="left" class="style4" >
                          <asp:TextBox ID="TextBox2" runat="server" 
                                style="WIDTH: 150px; margin-left: 0px;"></asp:TextBox>
                        </td>
                        <td align="right" class="style3" ></td>
                        <td  align=left>
                           
                        </td>
                    </tr>
                    
                     <tr>
                        <td align="right" class="style5" >Rut Aval:</td>
                        <td  align="left" class="style4" >
                          <asp:TextBox ID="TextBox3" runat="server" 
                                style="WIDTH: 300px; margin-left: 0px;"></asp:TextBox>
                        </td>
                        <td align="right" class="style3" ></td>
                        <td  align=left>
                           
                        </td>
                    </tr>
                    
                     <tr>
                        <td align="right" class="style5" >Dirección Aval :</td>
                        <td  align="left" class="style4" >
                          <asp:TextBox ID="TextBox4" runat="server" 
                                style="WIDTH: 300px; margin-left: 0px;"></asp:TextBox>
                        </td>
                        <td align="right" class="style3" ></td>
                        <td  align=left>
                           
                        </td>
                    </tr>
                    
                    
                   <tr>
                        <td align="right" class="style5" >Monto DDA:</td>
                        <td  align="left" class="style4" >
                          <asp:DropDownList ID="tipodocumento" runat="server"  
                                style="WIDTH: 250px; margin-left: 0px; ">
                            </asp:DropDownList>

                        </td>
                        
                         <td align="right" class="style3" ></td>
                        <td  align=left>
                            
                        </td>
                        
                        
                    </tr>
                       
                       <tr>
                        <td align="right" class="style5" >Monto Total Deuda.:</td>
                        <td  align="left" class="style4" >
                          <asp:TextBox ID="txtnrocuota" runat="server" onKeyPress="return acceptNum(event)"
                                style="WIDTH: 150px; margin-left: 0px;"></asp:TextBox>
                        </td>
                        <td align="right" class="style3" ></td>
                        <td  align=left>
                           
                        </td>
                    </tr>
                    
                     <tr>
                        <td align="right" class="style5" >Fecha Suscripción:</td>
                        <td  align="left" class="style4" >
                          <asp:TextBox ID="TextBox5" runat="server" onKeyPress="return acceptNum(event)"
                                style="WIDTH: 150px; margin-left: 0px;"></asp:TextBox>
                        </td>
                        <td align="right" class="style3" ></td>
                        <td  align=left>
                           
                        </td>
                    </tr>
                    
                     <tr>
                        <td align="right" class="style5" >Suma Inicial Suscripción:</td>
                        <td  align="left" class="style4" >
                          <asp:TextBox ID="TextBox6" runat="server" onKeyPress="return acceptNum(event)"
                                style="WIDTH: 150px; margin-left: 0px;"></asp:TextBox>
                        </td>
                        <td align="right" class="style3" ></td>
                        <td  align=left>
                           
                        </td>
                    </tr>
                    
                     <tr>
                        <td align="right" class="style5" >N° Cuotas:</td>
                        <td  align="left" class="style4" >
                          <asp:TextBox ID="TextBox7" runat="server" onKeyPress="return acceptNum(event)"
                                style="WIDTH: 150px; margin-left: 0px;"></asp:TextBox>
                        </td>
                        <td align="right" class="style3" ></td>
                        <td  align=left>
                           
                        </td>
                    </tr>
                    
                    
                    <tr>
                        <td align="right" class="style5" >Tasa de Interes:</td>
                        <td  align="left" class="style4" >
                          <asp:TextBox ID="TextBox8" runat="server" onKeyPress="return acceptNum(event)"
                                style="WIDTH: 150px; margin-left: 0px;"></asp:TextBox>
                        </td>
                        <td align="right" class="style3" ></td>
                        <td  align=left>
                           
                        </td>
                    </tr>
                    
                         <tr>
                            <td align="right" class="style5" >Vcto. 1 Cuota:</td>
                            <td  align="left" class="style4" >
                              <asp:TextBox ID="TextBox9" runat="server" onKeyPress="return acceptNum(event)"
                                    style="WIDTH: 150px; margin-left: 0px;"></asp:TextBox>
                            </td>
                            <td align="right" class="style3" ></td>
                            <td  align=left>
                               
                            </td>
                        </tr>
                    
                         <tr>
                            <td align="right" class="style5" >Vcto. Siguientes Cuotas:</td>
                            <td  align="left" class="style4" >
                              <asp:TextBox ID="TextBox10" runat="server" onKeyPress="return acceptNum(event)"
                                    style="WIDTH: 150px; margin-left: 0px;"></asp:TextBox>
                            </td>
                            <td align="right" class="style3" ></td>
                            <td  align=left>
                               
                            </td>
                        </tr>
                        
                        
                         <tr>
                            <td align="right" class="style5" >Monto 1 era. Cuotas:</td>
                            <td  align="left" class="style4" >
                              <asp:TextBox ID="TextBox11" runat="server" onKeyPress="return acceptNum(event)"
                                    style="WIDTH: 150px; margin-left: 0px;"></asp:TextBox>
                            </td>
                            <td align="right" class="style3" ></td>
                            <td  align=left>
                               
                            </td>
                        </tr>
                        
                         <tr>
                            <td align="right" class="style5" >Monto Última Cuota:</td>
                            <td  align="left" class="style4" >
                              <asp:TextBox ID="TextBox12" runat="server" onKeyPress="return acceptNum(event)"
                                    style="WIDTH: 150px; margin-left: 0px;"></asp:TextBox>
                            </td>
                            <td align="right" class="style3" ></td>
                            <td  align=left>
                               
                            </td>
                        </tr>
                        
                         <tr>
                            <td align="right" class="style5" >Fecha Mora:</td>
                            <td  align="left" class="style4" >
                              <asp:TextBox ID="TextBox13" runat="server" onKeyPress="return acceptNum(event)"
                                    style="WIDTH: 150px; margin-left: 0px;"></asp:TextBox>
                            </td>
                            <td align="right" class="style3" ></td>
                            <td  align=left>
                               
                            </td>
                        </tr>
                        
                        <tr>
                            <td align="right" class="style5" >Fecha Prescripción:</td>
                            <td  align="left" class="style4" >
                              <asp:TextBox ID="TextBox14" runat="server" onKeyPress="return acceptNum(event)"
                                    style="WIDTH: 150px; margin-left: 0px;"></asp:TextBox>
                            </td>
                            <td align="right" class="style3" ></td>
                            <td  align=left>
                               
                            </td>
                        </tr>    
                    
                    <tr>
                            <td align="right" class="style5" >Fecha Liquidación:</td>
                            <td  align="left" class="style4" >
                              <asp:TextBox ID="TextBox15" runat="server" onKeyPress="return acceptNum(event)"
                                    style="WIDTH: 150px; margin-left: 0px;"></asp:TextBox>
                            </td>
                            <td align="right" class="style3" ></td>
                            <td  align=left>
                               
                            </td>
                        </tr>
                        
                        <tr>
                            <td align="right" class="style5" >Comuna Exhorto:</td>
                            <td  align="left" class="style4" >
                              <asp:TextBox ID="TextBox16" runat="server" onKeyPress="return acceptNum(event)"
                                    style="WIDTH: 150px; margin-left: 0px;"></asp:TextBox>
                            </td>
                            <td align="right" class="style3" ></td>
                            <td  align=left>
                               
                            </td>
                        </tr>    
                        
                        
                        
            <%--         <tr>
                     <td class="textos22"  colspan="4">&nbsp;</td>
                    </tr>--%>
                    
                  </table>
 
              </td>
            </tr>
            
            
            </table>
            
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
                    
                        <asp:Button ID="btnBuscar" runat="server" CssClass="boton" Text="Buscar" 
                           OnClientClick="return ValidarBuscar();" onclick="btnBuscar_Click" 
                            Visible="False" />
                    
                            
                       <asp:Button ID="btnGuardar" runat="server" CssClass="boton" Text="Guardar" 
                            OnClientClick="return ValidarGuardar();" onclick="btnGuardar_Click" />
                            
                            <asp:Button ID="btnActualizar" runat="server" CssClass="boton" Text="Actualizar" 
                            OnClientClick="return ValidarActualizar();" Visible="False" 
                            onclick="btnActualizar_Click" />
                   
                       <asp:Button ID="btnCancelar" runat="server" CssClass="boton" Text="Cancelar" 
                            onclick="btnCancelar_Click" />
                       
                     </div>
                  </td>
                </tr>
              </table>
              
            </TD>
          </TR>
          </TBODY> 
        </TABLE>
        <div align="center"><font size="2">Estado Nº 359 Piso 13, Santiago - Chile | Teléfonos : 633 3115 - 633 3483 
          </font> </div>
         
                        <asp:HiddenField ID="CodCliente"  runat="server" />
                        
                        <asp:HiddenField ID="swCobranza"  runat="server" Value="0" />
                        
      </FORM>
      
    </TD>
  </TR>
  </TBODY> 
</TABLE>

</body>
</html>
