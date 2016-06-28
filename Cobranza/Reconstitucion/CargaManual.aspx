<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="CargaManual.aspx.cs" Inherits="CobranzaALC.Cobranza.Reconstitucion.CargaManual" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">


<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>ALC Asesorìa Legal y Crediticía Ltda</title>
<link href="../../css/alc2.css" rel="stylesheet" type="text/css" />
<script src="../../js/funciones.js" type="text/javascript"></script>
<link href="../../css/start/jquery-ui-1.10.3.custom.min.css" rel="stylesheet" />

<script type="text/javascript" src="../../js/jquery-1.10.2.min.js"></script>
    <script type="text/javascript" src="../../js/jquery-ui-1.10.3.custom.min.js"></script>
    <script type="text/javascript" src="../../js/datepicker-es.js"></script>
    <script language="javascript" type="text/javascript">
        $(document).ready(function () {
            $('.control-fecha').datepicker({
                changeMonth: true,
                changeYear: true,
                yearRange: "1900:2060",
                showWeek: true
            });
        }); 

        function ValidarBuscar() {
        if (!(trim(document.all("txtfechacontabilizacion").value)) == "") {
            if (!(EsFecha(document.all("txtfechacontabilizacion").value, 'dma'))) {
                alert('Debe ingresar fecha  válida, Ej. 01-09-2010');
                document.all("txtfechacontabilizacion").focus();
                return false;
            }
        }
        return true;
    }
   

    function ValidarGuardar() {

        if (trim(document.all("cbxRemesas").value) == "Seleccione") {
            alert('Debe seleccionar fecha remesa');
            document.all("cbxRemesas").focus();
            return false;
        }


        if (trim(document.all("txtSubProducto").value) == "") {
            alert('Debe ingresar SubProducto (si no tiene ingrese "SIN")');
            document.all("txtSubProducto").focus();
            return false;
        }


        if (trim(document.all("txtProducto").value) == "") {
            alert('Debe ingresar Producto');
            document.all("txtProducto").focus();
            return false;
        }


        if (trim(document.all("txtNroOperacion").value) == "") {
            alert('Debe ingresar N° Operación');
            document.all("txtNroOperacion").focus();
            return false;
        }


        if (trim(document.all("txtRut").value) == "") {
            alert('Debe ingresar Rut');
            document.all("txtRut").focus();
            return false;
        }


        if (trim(document.all("txtDv").value) == "") {
            alert('Debe ingresar dv');
            document.all("txtDv").focus();
            return false;
        }


        if (trim(document.all("txtDeudor").value) == "") {
            alert('Debe ingresar nombre deudor');
            document.all("txtDeudor").focus();
            return false;
        }

        if (trim(document.all("txtDireccion").value) == "") {
            alert('Debe ingresar dirección');
            document.all("txtDireccion").focus();
            return false;
        }

        if (trim(document.all("txtComuna").value) == "") {
            alert('Debe ingresar comuna');
            document.all("txtComuna").focus();
            return false;
        }



        if (confirm('Esta seguro de guardar el caso ?')) {

            return true;

        } else return false;
    }

    function Popup() {
        var url;
        url = 'ReconExcel.aspx';

        pWin = window.open(url, 'newWin', 'width=900,height=650,scrollbars=1,resizable=yes,satus=0,menubar=yes,top=10,left=100')
        if (window.pWin)
            pWin.focus()

        return false;
    }

    function Ir(pagina) {




        //         if(trim(estado) == 'A')
        //          {
        document.location.href = pagina;
        //            
        //          }else{ 
        //            alert('Cobranza se encuentra términada'); 
        //          } 
    }

    function ValidarBuscar() {








        if (!(trim(document.all("txtFechaRemesa").value)) == "") {
            if (!(EsFecha(document.all("txtFechaRemesa").value, 'dma'))) {
                alert('Debe ingresar fecha  válida, Ej. 01-09-2010');
                document.all("txtFechaRemesa").focus();
                return false;
            }
        }



        /*
                if(document.all("txtRut").value == "" && document.all("txtNroOperacion").value == "")
                {
                   alert('Debe ingresar como mínimo un filtro');
                   document.all("txtRut").focus();
                   return false;
                } 
        
               
                if(!(document.all("txtRut").value == ""))
                {
                    if(!(ChequeaRut(document.all("txtRut"))))
                    {
                       alert('Rut no es válido');
                       document.all("txtRut").focus();
                       document.all("txtRut").select();
                       
                       return false;
                    }
                }
               
          */


        return true;

    }



 </script>
 
 

     <style type="text/css">
        .style2
        {
            FONT-WEIGHT: normal;
            FONT-SIZE: 12px;
            COLOR: #493f46;
            FONT-FAMILY: "Gill Sans MT", Arial;
            width: 132px;
        }
         .style4
         {
             width: 90px;
         }
         .style6
         {
             width: 210px;
         }
    </style>
    </head>
<body  >
   
     
      <FORM runat="server" id="Formulario"   >
      
      

    
  
  <TABLE cellSpacing="0" cellPadding="0" width="633" border="0">
  <TBODY> 
  <TR> 
    <TD width="633" height=50 valign="top" bgcolor="#336699"  xbackground="../../images/banner2.jpg"> 
      <TABLE width=500 align=right border=0>
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
      
      
   <asp:ScriptManager ID="ScriptManager1" runat="server">
    </asp:ScriptManager>
    
        <TABLE width=633 align=center border=0  >
          <TBODY> 
          <TR> 
            <TD height="114" width="100%" valign="top"> 
            
            <!-- Zona de Titulo -->
            
              <TABLE borderColor=#c8e3f9 cellSpacing=0 cellPadding=0 
                        width=100% border=1>
                <TBODY> 
                <TR> 
                  <TD align="left"  bgColor=#eeeeee><b>&nbsp;INGRESO CARGA MANUAL</b></TD>
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
              <td align="left">
                  <!-- Inicio Filtros -->
                      <table border="0" width="100%" bgColor=#e6ecf2 border=0>
                    <tr>
                     <td class="textos22"  colspan="2">&nbsp;</td>
                    </tr>
                    
                    
                       <tr>
                        <td align="right" class="style2" >Fecha Remesa :</td>
                        <td  align="left" class="style4">
                              
                               <asp:DropDownList ID="cbxRemesas" runat="server"  
                                 style="WIDTH: 350px; margin-left: 0px;" AutoPostBack="True" 
                                   onselectedindexchanged="cbxRemesas_SelectedIndexChanged">
                            </asp:DropDownList>   
                                 
                                
                        </td>
                    </tr>   
                    
                    
                       <tr>
                        <td align="right" class="style2" >Fecha Contabilización:</td>
                        <td  align="left" class="style4">
                    
                            <asp:TextBox ID="txtfechacontabilizacion" runat="server" 
                               CssClass="control-fecha"></asp:TextBox>                      
                                
                        </td>
                    </tr>   
                    
                    
                      <tr>
                        <td align="right" class="style2" >Total Remesa :</td>
                        <td  align="left" class="style4">
                           <asp:TextBox ID="txtTotalRemesa" runat="server"    ReadOnly="true"
                                style="WIDTH: 50px; margin-left: 0px; "></asp:TextBox>
                        </td>
                    </tr>   
                    
                    
                    
                     <tr>
                        <td align="right" class="style2" >Sub Producto :</td>
                        <td  align="left" class="style4">
                           <asp:TextBox ID="txtSubProducto" runat="server"  
                                style="WIDTH: 220px; margin-left: 0px; "></asp:TextBox>
                        </td>
                    </tr>   
                    
                    
                     <tr>
                        <td align="right" class="style2" >Producto :</td>
                        <td  align="left" class="style4">
                           <asp:TextBox ID="txtProducto" runat="server"  
                                style="WIDTH: 220px; margin-left: 0px; "></asp:TextBox>
                        </td>
                    </tr>   
                    
                    
                     <tr>
                        <td align="right" class="style2" >Número Operación :</td>
                        <td  align="left" class="style4">
                           <asp:TextBox ID="txtNroOperacion" runat="server"  
                                style="WIDTH: 220px; margin-left: 0px; "></asp:TextBox>
                        </td>
                    </tr>   
                    
                     <tr>
                        <td align="right" class="style2" >Rut Deudor :</td>
                        <td  align="left" class="style6" >
                            <asp:TextBox ID="txtRut" runat="server"  MaxLength="10"
                                style="WIDTH: 120px; margin-left: 0px; " Width="138px"></asp:TextBox>
                                dv:
                                 <asp:TextBox ID="txtDv" runat="server" MaxLength="1" 
                                style="WIDTH: 20px; margin-left: 0px;"></asp:TextBox>
                              
                            </td>
                    </tr>
                  
                   <tr>
                        <td align="right" class="style2" >Nombre Deudor :</td>
                        <td  align="left" class="style4">
                           <asp:TextBox ID="txtDeudor" runat="server"  
                                style="WIDTH: 350px; margin-left: 0px; "></asp:TextBox>
                        </td>
                    </tr>   
                  
                  
                  
                   <tr>
                        <td align="right" class="style2" >Dirección :</td>
                        <td  align="left" class="style4">
                           <asp:TextBox ID="txtDireccion" runat="server"  
                                style="WIDTH: 350px; margin-left: 0px; "></asp:TextBox>
                        </td>
                    </tr>   
                    
                    
                     <tr>
                        <td align="right" class="style2" >Comuna :</td>
                        <td  align="left" class="style4">
                           <asp:TextBox ID="txtComuna" runat="server"  
                                style="WIDTH: 350px; margin-left: 0px; "></asp:TextBox>
                        </td>
                    </tr>   
                    
                  
            
                    
                     <tr>
                     <td class="textos22"  colspan="2">&nbsp;</td>
                    </tr>
                    
                  </table>
                  
                  <!-- Fin Filtros -->
              </td>
              </tr>
            
            <tr>
              <td valign="top">
                  <!-- Inicio Grilla -->
                           
                  
                  <!-- Fin Grilla -->
              </td>
              </tr>
             <%--<tr>
              <td valign="top">
                 Total registros : 
              
              </td>
              </tr>--%>
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
                           OnClientClick="return ValidarBuscar();"  
                            Visible="False" />
                    
                            
                       <asp:Button ID="btnGuardar" runat="server" CssClass="boton" Text="Guardar" 
                            OnClientClick="return ValidarGuardar();" 
                            Visible="true" onclick="btnGuardar_Click" />
                   
                       <asp:Button ID="btnCancelar" runat="server" CssClass="boton" Text="Cancelar" 
                             Visible="False" />
                       
                     </div>
                  </td>
                </tr>
              </table>
              
            </TD>
          </TR>
          </TBODY> 
        </TABLE>
        <div align="left"><font size="2">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        Estado Nº 359 Piso 13, Santiago - Chile | Teléfonos : 633 3115 - 633 3483 
          </font> </div>
         
    </TD>
  </TR>
  </TBODY> 
      
</TABLE>
<asp:HiddenField ID="hddFechaEntrega" runat="server" />


      </FORM>
      
    </body>
</html>
