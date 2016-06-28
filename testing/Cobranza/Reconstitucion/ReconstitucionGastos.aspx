<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ReconstitucionGastos.aspx.cs" Inherits="CobranzaALC.Cobranza.Reconstitucion.ReconstitucionGastos" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head id="Head1" runat="server">
    <title>ALC Asesorìa Legal y Crediticía Ltda</title>
    <link href="../../css/alc2.css" rel="stylesheet" type="text/css" />
    <script src="../../js/funciones.js" type="text/javascript"></script>

<script language="javascript" type="text/javascript">


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

        var valor = '';
        var url = '';

        valor = document.all("hiddidjuicio").value;
        url = 'MostrarDetalleGastos.aspx?Codigo=' + valor;

        Ir(url, '750', '600');

        return false;
    }


    function Ir(url, ancho, alto) {
        pWin = window.open(url, 'newWin', 'width=' + ancho + ',height=' + alto + ',scrollbars=1,satus=0,menubar=no,top=10,left=210')
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


        //Válidar Usuario y Receptor ó Proveedor gasto simultáneamente sólo uno de ellos
        //            if(document.all("usuario").value == 'Seleccione' && document.all("receptor").value == 'Seleccione' && trim(document.all("txtProveedor").value) == '' && trim(document.all("txtRutProveedor").value) == '')
        //            {
        //               alert('Debe ingresar un responsable'); 
        //               return false;
        //            }
        //            
        //            var sw = 0;
        //            var swdes = '';
        //            
        //            if(!(document.all("usuario").value == 'Seleccione'))sw++;
        //            
        //            if(!(document.all("receptor").value == 'Seleccione'))sw++;
        //            
        //            
        //            if(trim(document.all("txtProveedor").value) !=  '' || trim(document.all("txtRutProveedor").value) !=  '')
        //            { 
        //               sw++;
        //               swdes = 'proveedor'
        //            }
        //            
        //            
        //            if(sw > 1)
        //            {
        //               alert('Debe ingresar solo un responsable');
        //               return false;
        //            }
        //            
        //        
        //       
        //            
        //            if(swdes == 'proveedor')
        //            {
        //                
        //                if(trim(document.all("txtProveedor").value) == "")
        //                {
        //                   alert('Debe ingresar nombre del proveedor');
        //                   document.all("txtProveedor").focus();
        //                   return false;
        //                
        //                }else if(trim(document.all("txtRutProveedor").value) == "")
        //                {
        //                  
        //                   alert('Debe ingresar rut  del proveedor');
        //                   document.all("txtRutProveedor").focus();
        //                   return false;
        //                
        //                }
        //                
        //                
        //            
        //            }



        if (trim(document.all("cbxTipoGastos").value) == "Seleccione") {
            alert('Debe ingresar tipo de gasto ');
            document.all("cbxTipoGastos").focus();
            return false;
        }

        if (trim(document.all("cbxFormaPago").value) == "0") {
            alert('Debe ingresar forma de pago ');
            document.all("cbxFormaPago").focus();
            return false;
        }

        if (trim(document.all("cbxEstadoGasto").value) == "0") {
            alert('Debe ingresar estado de gasto ');
            document.all("cbxEstadoGasto").focus();
            return false;
        }

        if (trim(document.all("txtNroDocumento").value) == "") {
            alert('Debe ingresar N° de documento ');
            document.all("txtNroDocumento").focus();
            return false;
        }


        if (document.all("txtMontoGasto").value == "") {
            alert('Ingresar monto de gasto');
            document.all("txtMontoGasto").focus();
            return false;
        }


        //            if(!(document.all("estadogasto").value == "0"))
        //            {
        //            
        //                if(trim(document.all("txtfechaestadogasto").value) == "" )
        //                {
        //                  alert('Ingrese fecha estado gasto');
        //                  document.all("txtfechaestadogasto").focus();
        //                  
        //                  return false;
        //                } 
        //            }
        //            
        //          
        //            if (document.all("tipogastoadmin").value == 'Seleccione' && document.all("tipogastojudi").value == 'Seleccione' && document.all("tipogastopre").value == 'Seleccione' )
        //            {
        //              
        //               alert('Seleccione un tipo de gasto');
        //               document.all("tipogastoadmin").focus();
        //               return false;
        //            }
        //            
        //            if (!(document.all("tipogastoadmin").value == 'Seleccione'))
        //            {
        //                if (trim(document.all("txtMontoadmin").value) == "")
        //                {
        //                   alert('Debe ingresar monto gasto administrativo ');
        //                   document.all("txtMontoadmin").focus();
        //                   return false;
        //                }
        //            
        //            }
        //            
        //            
        //            if (!(document.all("tipogastojudi").value == 'Seleccione'))
        //            {
        //                if (trim(document.all("txtMontojudi").value) == "")
        //                {
        //                   alert('Debe ingresar monto gasto judicial ');
        //                   document.all("txtMontojudi").focus();
        //                   return false;
        //                }
        //            }
        //            
        //            if (!(document.all("tipogastopre").value == 'Seleccione'))
        //            { 
        //                if (trim(document.all("txtMontopre").value) == "")
        //                {
        //                   alert('Debe ingresar monto gasto prejudicial ');
        //                   document.all("txtMontopre").focus();
        //                   return false;
        //                }
        //            }


        if (confirm('Esta seguro de guardar el gasto ?')) {
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
        .style4
        {
            width: 301px;
        }
        .style6
        {
            FONT-WEIGHT: normal;
            FONT-SIZE: 12px;
            COLOR: #493f46;
            FONT-FAMILY: "Gill Sans MT", Arial;
            width: 167px;
        }
        .style7
        {
            FONT-WEIGHT: normal;
            FONT-SIZE: 12px;
            COLOR: #493f46;
            FONT-FAMILY: "Gill Sans MT", Arial;
            width: 205px;
        }
    </style>
 
</head>
<body>


 <TABLE cellSpacing=0 cellPadding=0 width=633 border=0>
  <TBODY> 
  <%--<TR> 
    <TD width="633" height=50 valign="top" bgcolor="#336699" xbackground="../../images/banner2.jpg"> 
      <TABLE align=right border=0 style="width: 373px">
        <TBODY> 
        <TR> 
          <TD class=titulo align=right>SISTEMA DE RECONSTITUCIONES</TD>
        </TR>
        </TBODY> 
      </TABLE>
    </TD>
  </TR>--%>
  <TR> 
    <TD height="394" valign="top" class=textos>
      <CENTER>
      </CENTER>
      
      <FORM runat="server" id="Formulario"   >
      
        <TABLE align=center border=0 style="width: 795px"  >
          <TBODY> 
          <TR> 
                      <!---->          
            <TD height="163" width="100%" valign="top"> 
            
            <!-- Zona de Titulo -->
            
              <TABLE borderColor=#c8e3f9 cellSpacing=0 cellPadding=0 
                        width=100% border=1>
                <TBODY> 
                <TR> 
                  <TD align="left"  bgColor=#eeeeee><b>&nbsp;INGRESO GASTOS </b></TD>
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
               
                  <table border="0" bgColor=#e6ecf2 border=0 style="width: 789px">
                    <tr>
                     <td class="textos22"  colspan="4">&nbsp;</td>
                    </tr>
                    
                     <tr>
                        <td align="right" class="style7" >Rut :</td>
                        <td  align="left" class="style4" >
                            <asp:TextBox ID="txtRut" runat="server"  ReadOnly=true
                                style="WIDTH: 150px; margin-left: 0px;" ></asp:TextBox>
                        </td>
                        <td align="right" class="style6" ><%--Cliente :--%></td>
                        <td  align=left style="margin-left: 40px">
                           <%-- <asp:TextBox ID="txtCliente" runat="server" 
                                style="WIDTH: 250px; margin-left: 0px;" ReadOnly="True"></asp:TextBox>--%>
                        </td>
                    </tr>
                    
                     <tr>
                        <td align="right" class="style7" >Nombre :</td>
                        <td  align="left" class="style4" >
                            <asp:TextBox ID="txtnombre" runat="server"  ReadOnly=true
                                style="WIDTH: 400px; margin-left: 0px;" ></asp:TextBox>
                        </td>
                        <td align="right" class="style6" ><%--Cliente :--%></td>
                        <td  align=left style="margin-left: 40px">
                           <%-- <asp:TextBox ID="txtCliente" runat="server" 
                                style="WIDTH: 250px; margin-left: 0px;" ReadOnly="True"></asp:TextBox>--%>
                        </td>
                    </tr>
                    
                    <tr>
                        <td align="right" class="style7" >OT :</td>
                        <td  align="left" class="style4" >
                            <asp:TextBox ID="txtOT" runat="server"  ReadOnly=true
                                style="WIDTH: 150px; margin-left: 0px;" ></asp:TextBox>
                        </td>
                        <td align="right" class="style6" ><%--Cliente :--%></td>
                        <td  align=left style="margin-left: 40px">
                           <%-- <asp:TextBox ID="txtCliente" runat="server" 
                                style="WIDTH: 250px; margin-left: 0px;" ReadOnly="True"></asp:TextBox>--%>
                        </td>
                    </tr>
                    
                    
                      
                    <tr>
                        <td align="right" class="style7" >Responsable :</td>
                        <td  align="left" class="style4" >
                            <asp:TextBox ID="txtResponsable" runat="server"  ReadOnly=true
                                style="WIDTH: 400px; margin-left: 0px;" ></asp:TextBox>
                        </td>
                        <td align="right" class="style6" ><%--Cliente :--%></td>
                        <td  align=left style="margin-left: 40px">
                           <%-- <asp:TextBox ID="txtCliente" runat="server" 
                                style="WIDTH: 250px; margin-left: 0px;" ReadOnly="True"></asp:TextBox>--%>
                        </td>
                    </tr>
                     <tr>
                        <td align="right" class="style7" >N° Operación :</td>
                        <td  align="left" class="style4" >
                            <asp:TextBox ID="txtnrooperacion" runat="server"  ReadOnly=true
                                style="WIDTH: 150px; margin-left: 0px;" ></asp:TextBox>
                        </td>
                        <td align="right" class="style6" ><%--Cliente :--%></td>
                        <td  align=left style="margin-left: 40px">
                           <%-- <asp:TextBox ID="txtCliente" runat="server" 
                                style="WIDTH: 250px; margin-left: 0px;" ReadOnly="True"></asp:TextBox>--%>
                        </td>
                    </tr>
                    <tr>
                        <td align="right" class="style7" >Fecha Gasto :</td>
                        <td  align="left" class="style4" >
                            <asp:TextBox ID="txtFechaGasto" runat="server"  ReadOnly=true
                                style="WIDTH: 150px; margin-left: 0px;" ></asp:TextBox>
                        </td>
                        <td align="right" class="style6" ><%--Cliente :--%></td>
                        <td  align=left style="margin-left: 40px">
                           <%-- <asp:TextBox ID="txtCliente" runat="server" 
                                style="WIDTH: 250px; margin-left: 0px;" ReadOnly="True"></asp:TextBox>--%>
                        </td>
                    </tr>
                    
                    <tr>
                        <td align="right" class="style7" >Tipo de Gastos :</td>
                        <td  align="left" class="style4" >
                            <asp:DropDownList ID="cbxTipoGastos" runat="server" style="WIDTH: 350px; margin-left: 0px;">
                              
                                </asp:DropDownList>
                        </td>
                        <td align="right" class="style6" ><%--Deudor:--%></td>
                        <td  align=left>
                            <%--<asp:TextBox ID="txtNomDeudor" runat="server" 
                                style="WIDTH: 250px; margin-left: 0px;" ReadOnly="True"></asp:TextBox>--%>
                        </td>
                    </tr>
                    
                   <%-- <tr>
                        <td align="right" class="style2" >Producto :</td>
                        <td  align="left" class="style4" >
                            <asp:TextBox ID="txtProducto" runat="server" 
                                style="WIDTH: 150px; margin-left: 0px;" ReadOnly="True"></asp:TextBox>
                        </td>
                        <td align="right" class="style3" >Sub Producto:</td>
                        <td  align=left>
                            <asp:TextBox ID="txtSubProducto" runat="server" 
                                style="WIDTH: 250px; margin-left: 0px;" ReadOnly="True"></asp:TextBox>
                        </td>
                    </tr>--%>
                    
                     <tr>
                        <td align="right" class="style7" >Forma de Pago :</td>
                        <td  align=left class="style4">
                            <asp:DropDownList ID="cbxFormaPago" runat="server" style="WIDTH: 290px; margin-left: 0px;">
                                <asp:ListItem Value="0">Seleccione</asp:ListItem>  
                                <asp:ListItem Value="1">Efectivo</asp:ListItem>
                                <asp:ListItem Value="2">Cheque</asp:ListItem>
                                <asp:ListItem Value="3" >Transferencia Electronica</asp:ListItem>
                                </asp:DropDownList>
                        </td>
                         <td align="right" class="style6" ><%--Tribunal :--%></td>
                        <td  align="left" >
                             <%--<asp:TextBox ID="txtTribunal" runat="server" 
                                style="WIDTH: 250px; margin-left: 0px;" ReadOnly="True"></asp:TextBox>--%>
                        </td>
                    </tr>
                    
                     <tr>
                        <td align="right" class="style7" >Estado Gasto :</td>
                        <td  align=left class="style4">
                            <asp:DropDownList ID="cbxEstadoGasto" runat="server" style="WIDTH: 290px; margin-left: 0px;">
                               <asp:ListItem Value="0">Seleccione</asp:ListItem>
                                <asp:ListItem Value="PAGADO">Pagado</asp:ListItem>
                                <asp:ListItem Value="SOLICITADO">Solicitado</asp:ListItem>
                                <asp:ListItem Value="PENDIENTE">Pendiente</asp:ListItem>
                                <asp:ListItem Value="RECEPCION_BOLETA">Recepción boleta</asp:ListItem>
                                
                                </asp:DropDownList>
                        </td>
                         <td align="right" class="style6" ><%--Tribunal :--%></td>
                        <td  align="left" >
                             <%--<asp:TextBox ID="txtTribunal" runat="server" 
                                style="WIDTH: 250px; margin-left: 0px;" ReadOnly="True"></asp:TextBox>--%>
                        </td>
                    </tr>
                    
                    <!-- Gasto Administrativo -->
                       <tr>
                        <td align="right" class="style7" >N° Documento :</td>
                        <td  align="left" class="style4" >
                          <asp:TextBox ID="txtNroDocumento" runat="server" 
                                style="WIDTH: 100px; margin-left: 0px;"></asp:TextBox>
                        </td>
                        <td align="right" class="style6" ></td>
                        <td  align=left>
                        <%--
                          <asp:Button ID="btnDetalleGastos" runat="server" Visible="true" CssClass="boton2" Text="Ver detalle" 
                    OnClientClick="return DetalleGastos();"/>     --%>
                    
                    
                     <asp:Button ID="btnDetalleGastos" runat="server" CssClass="boton2" Text="Ver detalle"  Visible=false
                    OnClientClick="alert('En construcción');"/>  
                        
                        </td>
                    </tr>
                   
                    
                     <tr>
                        <td align="right" class="style7" >Ingrese Monto Gasto $ :</td>
                        <td  align=left class="style4">
                            <asp:TextBox ID="txtMontoGasto" runat="server"  onKeyPress="return acceptNum(event)"
                                style="WIDTH: 150px; margin-left: 0px;"></asp:TextBox>
                        </td>
                         <td align="right" class="style6" ></td>
                        <td  align="left" >
                            &nbsp;</td>
                    </tr>
                    
               
              <tr>
                        <td align="right" class="style7" >Observaciones:</td>
                        <td  align="left" class="style4" colspan="3" >
                        
                          <asp:TextBox ID="txtobservacion" runat="server" 
                                style="WIDTH: 600px; margin-left: 0px;" Height="170px" TextMode="MultiLine"></asp:TextBox>
                               
                        </td>
                       
                    </tr>
               
                    
                    
                    <!-- Fin Gasto Administrativo -->
                     <tr>
                     <td class="textos22"  colspan="4">&nbsp;</td>
                    </tr>
                    
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
                            OnClientClick="return ValidarBuscar();" 
                            Visible="False" />
                            
                       <asp:Button ID="btnGuardar" runat="server" CssClass="boton" Text="Guardar" onclick="btnGuardar_Click" 
                            OnClientClick="return ValidarGuardar();"   />
                            
                       <asp:Button ID="btnActualizar" runat="server" CssClass="boton" Text="Actualizar" 
                            OnClientClick="return ValidarActualizar();" Visible="False"  />
                   
                       <asp:Button ID="btnEliminar" runat="server" CssClass="boton" Text="Eliminar" Visible="False"
                           
                           OnClientClick="return ValidarEliminar();"   />
     
     
                     <asp:Button ID="Button1" runat="server" CssClass="boton" Text="Imprimir" OnClientClick="window.print();"
                          Visible="true"   />
                          
                       <asp:Button ID="btnCancelar" runat="server" CssClass="boton" Text="Salir" OnClientClick="window.close();"
                          Visible="true"   />
                          
                          
                            
                       
                     </div>
                  </td>
                </tr>
              </table>
              
            </TD>
          </TR>
          </TBODY> 
        </TABLE>
       <%-- <div align="center"><font size="2">Estado Nº 359 Piso 13, Santiago - Chile | Teléfonos : 633 3115 - 633 3483 
          </font> </div>--%>
          <asp:HiddenField ID="hddOT" runat="server" />
          
      </FORM>
      
    </TD>
  </TR>
  </TBODY> 
</TABLE>

</body>
</html>
