<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AbonoParcial.aspx.cs" Inherits="CobranzaALC.Cobranza.Abonos.AbonoParcial" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" >
<head id="Head1" runat="server">
    <title>ALC Asesorìa Legal y Crediticía Ltda</title>
    <link href="../../css/alc2.css" rel="stylesheet" type="text/css" />
    <script src="../../js/funciones.js" type="text/javascript"></script>

<script language="javascript" type="text/javascript">



    function MostrarDocumento(id_abono_parcial) {

        url = 'ComprobanteParcial.aspx?id_abono_parcial=' + id_abono_parcial;

        pWin = window.open(url, 'newWin', 'width=680,height=650,scrollbars=1,satus=0,menubar=no,top=10,left=100')
        if (window.pWin)
            pWin.focus()

        return false;
    }


    function validafpago() {


        document.all("txtMonto").value = "0";
        document.all("txtIntereses").value = "0";
        document.all("txtGastos").value = "0";
        document.all("txtIntAdicional").value = "0";
        document.all("txthonorarios").value = "0";
        document.all("txtdeschonorarios").value = "0";
        document.all("txtotrosdescuentos").value = "0";
        document.all("txtdescintereses").value = "0";
        document.all("txttotal").value = "0";
        document.all("txtMontoAbono").value = "0";

        document.all("txtFechaPago").value = "";





        if (trim(document.all("hiddTipoMoneda").value) == "5") {

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


        } else document.all("txtFechaPago").value = "";

        return true;

    }


    function ValidaParcial() {




        if (trim(document.all("txtMontoParcial").value) == "") {
            alert('Debe ingresar monto parcial');
            document.all("txtMontoParcial").focus();
            return false;
        }


        if (confirm('Esta seguro de ingresar abono parcial ?')) {
            return true;

        } else return false;


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


        if (trim(document.all("txtNroComprobante").value) == "") {
            alert('Debe ingresar N° comprobante');
            document.all("txtNroComprobante").focus();
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

        //        if (trim(document.all("banco").value) == "Seleccione")
        //        {
        //           alert('Debe seleccionarel banco');
        //           document.all("banco").focus();
        //           return false;
        //        }

        if (trim(document.all("txtNroCheque").value) == "") {
            alert('Debe ingresar N° cheque');
            document.all("txtNroCheque").focus();
            return false;
        }


        if (trim(document.all("txtSerie").value) == "") {
            alert('Debe ingresar serie');
            document.all("txtSerie").focus();
            return false;
        }

        if (trim(document.all("txtMontoAbono").value) == "") {
            alert('Debe ingresar monto abono');
            document.all("txtMontoAbono").focus();
            return false;
        }







        //            if(!(ChequeaRut(document.all("txtGirador"))))
        //            {
        //               alert('Rut no es válido');
        //               document.all("txtGirador").focus();
        //               document.all("txtGirador").select();
        //               
        //               return false;
        //             }




        //    
        //       
        //        
        //         if(!(ChequeaRut(document.all("txtGirador"))))
        //            {
        //               alert('Rut no es válido');
        //               document.all("txtGirador").focus();
        //               document.all("txtGirador").select();
        //               
        //               return false;
        //            }
        //            
        //        
        //            
        //        if(confirm('Esta seguro de guardar ?'))
        //        {    
        //            return true;
        //        
        //        }else return false; 

    }




    function validagastospagados() {

        if (trim(document.all("tipomoneda").value) == "5") {


            if (trim(document.all("txtFechaPago").value) == "") {
                alert('Debe ingresar la fecha de pago');
                document.all("txtFechaPago").focus();
                return false;
            }


            if (!(EsFecha(document.all("txtFechaPago").value, 'dma'))) {
                alert('Debe ingresar fecha  válida, Ej. 01-09-2010');
                document.all("txtFechaPago").focus();
                return false;
            }

        }



        //        var sumapagar = 0;
        //        sumapagar = parseFloat(document.all("txtvergastos").value) + parseFloat(document.all("txtverhonorarios").value);
        //        
        //        if(sumapagar > 0)
        //        {
        //           alert('Debe cancelar gastos y honorarios antes de pagar letras');
        //           return false;
        //        }



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
 
    <style type="text/css">
        .style1
        {
            width: 750px;
        }
        
        .styletd
        {
          background-color:red;
          color:White;
          font-weight: bold;
        }
        	
        .style2
        {
            FONT-WEIGHT: normal;
            FONT-SIZE: 12px;
            COLOR: #493f46;
            FONT-FAMILY: "Gill Sans MT", Arial;
            width: 116px;
        }
        .style4
        {
            FONT-WEIGHT: normal;
            FONT-SIZE: 12px;
            COLOR: #493f46;
            FONT-FAMILY: "Gill Sans MT", Arial;
            width: 133px;
        }
        .style5
        {
            width: 157px;
        }
    </style>
 
</head>
<body>


 <TABLE cellSpacing=0 cellPadding=0 width=633 border=0>
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
                             
            <TD height="163" width="100%" valign="top"> 
            
            <!-- Zona de Titulo -->
            
              <TABLE borderColor=#c8e3f9 cellSpacing=0 cellPadding=0 
                        width=100% border=1>
                <TBODY> 
                <TR> 
                  <TD align="left"  bgColor=#eeeeee><b>&nbsp;ABONO PARCIAL</b></TD>
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
               
                  <table border="0" bgColor=#e6ecf2 border=0 style="width: 846px">
                    <tr>
                     <td class="textos22"  colspan="4">&nbsp;</td>
                    </tr>
                    
                    <tr>
                        <td align="right" class="style2" >N° Operación :</td>
                        <td  align="left" class="style1" >
                            <asp:TextBox ID="txtNroOperacion" runat="server" 
                                style="WIDTH: 150px; margin-left: 0px;" ReadOnly="True"></asp:TextBox>
                        </td>
                        <td align="right" class="style4" >Cliente :</td>
                        <td  align=left style="margin-left: 40px">
                            <asp:TextBox ID="txtCliente" runat="server" 
                                style="WIDTH: 250px; margin-left: 0px;" ReadOnly="True"></asp:TextBox>
                        </td>
                    </tr>
                    
                    <tr>
                        <td align="right" class="style2" >Rut Deudor :</td>
                        <td  align="left" class="style1" >
                            <asp:TextBox ID="txtRutDeudor" runat="server" 
                                style="WIDTH: 150px; margin-left: 0px;" ReadOnly="True"></asp:TextBox>
                        </td>
                        <td align="right" class="style4" >Deudor:</td>
                        <td  align=left>
                            <asp:TextBox ID="txtNomDeudor" runat="server" 
                                style="WIDTH: 250px; margin-left: 0px;" ReadOnly="True"></asp:TextBox>
                        </td>
                    </tr>
                    
                    <tr>
                        <td align="right" class="style2" >Fecha :</td>
                        <td  align=left class="style1" colspan="3">
                            <asp:TextBox ID="txtFecha" runat="server"   ReadOnly=true
                                style="WIDTH: 120px; margin-left: 0px;"  Width="232px"></asp:TextBox>
                        </td>
                    </tr>
                    
                
                    
                    
                    
                     
                    
                    
                    
                        
                    <!-- -->
                        <tr>
                        <td align="right" class="style2" ><b>Ingrese Monto Parcial:</b> </td>
                        <td  align=left class="style1" >
                       
                            <asp:TextBox ID="txtMontoParcial" runat="server" onKeyPress="return acceptNum(event)"
                                style="WIDTH: 150px; margin-left: 0px;"  Width="232px"></asp:TextBox>
                                 &nbsp;&nbsp;
                           <asp:Button ID="Button1" runat="server"  CssClass="boton2" Text="Guardar"   OnClientClick="return ValidaParcial();"
                                onclick="Button1_Click"  />
                        </td>
                        
                        
                         <td align="right" class="style4" >Total Parcial</td>
                        <td  align="left" >
                        
                          <asp:TextBox ID="txtTotalParcial" runat="server" ReadOnly="true" 
                                style="WIDTH: 150px; margin-left: 0px;"  Width="232px"></asp:TextBox>
                             
                         
                        </td>
                        
                        
                        
                    </tr>
                    
                    <!-- -->
                      <tr>
                    
                        <td  align=left class="style1" colspan="5">
                        <br/>
                         <TABLE borderColor=#c8e3f9 cellSpacing=0 cellPadding=0 
                        width=100% border=1>
                <TBODY> 
                <TR> 
                  <TD align="left"  bgColor=#eeeeee><b>&nbsp;DETALLE ABONO PARCIAL</b></TD>
                </TR>
                </TBODY> 
              </TABLE>
                            
                       <%--  <asp:Panel ID="pnlDetalle" style="OVERFLOW:scroll; width:800; position:relative;overflow-x:hidden;table-layout: fixed;" runat="server">
                       --%> 
                              <asp:GridView ID="grilla" runat="server" 
                                         
                                         AllowPaging="True"  
                                         PageSize="100"
                                         AutoGenerateColumns="False"
                                         Width="850" 
                                         OnRowCommand="Deshabilitar"
                                         CellPadding="4" ForeColor="#333333" 
                                         GridLines="None" 
                                  > 
                            <Columns>
                          
                          
                          
                                <asp:TemplateField HeaderText="Id Abono Parcial" Visible="true">
                                <HeaderStyle Wrap="true" Width="70" HorizontalAlign="Left"></HeaderStyle>
                                <ItemStyle Wrap="false" ></ItemStyle>
                                <ItemTemplate>
                                <asp:Label ID="lblidcuota" Visible="true" runat="server" Text='<%# Bind("id_abonoparcial") %>' SortExpression = "Codigo" SortDirection="ASC"></asp:Label>
                              </ItemTemplate>
                             </asp:TemplateField>
                          
                          
                           <asp:TemplateField HeaderText="Monto Abono">
                                <HeaderStyle Wrap="true" Width="70" HorizontalAlign="Left"></HeaderStyle>
                                <ItemStyle Wrap="false" ></ItemStyle>
                                <ItemTemplate>
                                <asp:Label ID="lblnrodoc1" runat="server" Text='<%# Bind("montoparcial") %>' SortExpression = "Codigo" SortDirection="ASC"></asp:Label>
                              </ItemTemplate>
                             </asp:TemplateField>
                         
                           <asp:TemplateField HeaderText="Estado">
                                <HeaderStyle Wrap="true" Width="70" HorizontalAlign="Left"></HeaderStyle>
                                <ItemStyle Wrap="false" ></ItemStyle>
                                <ItemTemplate>
                                <asp:Label ID="lblnrodoc1" runat="server" Text='<%# Bind("estadodesc") %>' SortExpression = "Codigo" SortDirection="ASC"></asp:Label>
                              </ItemTemplate>
                             </asp:TemplateField>
                         
                         
                           <asp:TemplateField HeaderText="Detalle (Normal/Excedente)">
                                <HeaderStyle Wrap="true" Width="70" HorizontalAlign="Left"></HeaderStyle>
                                <ItemStyle Wrap="false" ></ItemStyle>
                                <ItemTemplate>
                                <asp:Label ID="lblnrodoc1" runat="server" Text='<%# Bind("tipodesc") %>' SortExpression = "Codigo" SortDirection="ASC"></asp:Label>
                              </ItemTemplate>
                             </asp:TemplateField>
                             
                             
                              <asp:TemplateField HeaderText="Fecha Pago">
                                <HeaderStyle Wrap="true" Width="70" HorizontalAlign="Left"></HeaderStyle>
                                <ItemStyle Wrap="false" ></ItemStyle>
                                <ItemTemplate>
                                <asp:Label ID="lblnrodoc2" runat="server" Text='<%# Bind("fproceso") %>' SortExpression = "Codigo" SortDirection="ASC"></asp:Label>
                              </ItemTemplate>
                             </asp:TemplateField>
                      
                       <asp:TemplateField HeaderText="N° Comprobante Abono Caja Asociado">
                                <HeaderStyle Wrap="true" Width="70" HorizontalAlign="Left"></HeaderStyle>
                                <ItemStyle Wrap="false" ></ItemStyle>
                                <ItemTemplate>
                                <asp:Label ID="lblnrodoc2" runat="server" Text='<%# Bind("id_abono_comprobante") %>' SortExpression = "Codigo" SortDirection="ASC"></asp:Label>
                              </ItemTemplate>
                             </asp:TemplateField>
        
                             
                               <asp:TemplateField HeaderText="Imprimir Comprobante Parcial"  ItemStyle-HorizontalAlign="Center" >
                              <ItemTemplate>
                               <a href="#" onclick="javascript:MostrarDocumento('<%# Eval("id_abonoparcial")%>');" ><asp:Image ID="Image1" runat="server" ImageUrl="~/images/lupa.jpg" ToolTip="Ver Comprobante Abono Parcial "  /></a> 
                              </ItemTemplate>
                             </asp:TemplateField>
                        
                             
                             
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
                            
                          <%--    <asp:TemplateField    HeaderText="Nro. Cuota">
                             <HeaderStyle Wrap="true" Width="490" HorizontalAlign="Left"></HeaderStyle>
                             <ItemStyle Wrap="false" ></ItemStyle>
                              <ItemTemplate>
                               <asp:Label ID="lblNombre1m" runat="server" Text='<%# Bind("nrocuota") %>' SortExpression = "Descripcion" SortDirection="ASC"></asp:Label>
                              </ItemTemplate>
                             </asp:TemplateField>--%>
                           
                        </td>
                    </tr>
                  
                    
                    <!-- 2 -->
                   
                    <!-- 2 -->
                  
                  
                      <!-- 3 -->  
                     
              
              
              
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
                    <asp:Button ID="Button2" runat="server"  CssClass="boton2" Text="Pagos" onclick="Button2_Click"  
                                 />
                                 
                     <%--   <asp:Button ID="btnBuscar" runat="server" CssClass="boton" Text="Buscar" 
                            OnClientClick="return ValidarBuscar();"
                            Visible="False" />
                  
                  
                       <asp:Button ID="Button1" runat="server" Visible="false"  CssClass="boton2" Text="Imprime Abono" 
                            OnClientClick="return Ir();"  />
                            
                  
                       
              
                  
                       <asp:Button ID="btnGuardar"  runat="server" CssClass="boton2" Text="Guardar" 
                            OnClientClick="return ValidarGuardar();" onclick="btnGuardar_Click1" />
                  
                  
                  
                   
                       <asp:Button ID="btnActualizar" runat="server" CssClass="boton" Text="Actualizar" 
                            OnClientClick="return ValidarActualizar();" Visible="False"  />
                   
                       <asp:Button ID="btnEliminar" runat="server" CssClass="boton" Text="Eliminar" Visible="False"
                           
                           OnClientClick="return ValidarEliminar();"   />
                   
                   
                   <asp:Button ID="Button3" runat="server" CssClass="boton" Text="Pagos" onclick="Button3_Click" 
                             />
                            
                       <asp:Button ID="btnCancelar" runat="server" CssClass="boton" Text="Cancelar"  Visible="false"
                            onclick="btnCancelar_Click" />--%>
                       
                     </div>
                  </td>
                </tr>
              </table>
              
            </TD>
          </TR>
          <tr>
            <td>
          
               
            </td>
          </tr>
           
            <TR> 
            <TD  valign="top" xbgcolor="#CCCCCC"> 
                               <%--    <asp:TemplateField    HeaderText="Nro. Cuota">
                             <HeaderStyle Wrap="true" Width="490" HorizontalAlign="Left"></HeaderStyle>
                             <ItemStyle Wrap="false" ></ItemStyle>
                              <ItemTemplate>
                               <asp:Label ID="lblNombre1m" runat="server" Text='<%# Bind("nrocuota") %>' SortExpression = "Descripcion" SortDirection="ASC"></asp:Label>
                              </ItemTemplate>
                             </asp:TemplateField>--%>
                                
          </TD>
          </TR>
          
                            <%--     <asp:TemplateField HeaderText="Liberar"   >
                            <HeaderStyle  HorizontalAlign="Center"></HeaderStyle>
                             <ItemStyle  HorizontalAlign="Center"></ItemStyle>
                              <ItemTemplate>
                               <asp:ImageButton ID="ImageButton1" runat="server" ImageUrl="~/images/b_borrar.gif"  OnClientClick="return confirm('¿Está seguro que desea liberar la letra ?')" CommandName="Deshabilitar" />
                              </ItemTemplate>
                             </asp:TemplateField>--%>
           
            <TR> 
            <TD  valign="top" xbgcolor="#CCCCCC"> 
                                <%--    <asp:TemplateField    HeaderText="Nro. Cuota">
                             <HeaderStyle Wrap="true" Width="490" HorizontalAlign="Left"></HeaderStyle>
                             <ItemStyle Wrap="false" ></ItemStyle>
                              <ItemTemplate>
                               <asp:Label ID="lblNombre1m" runat="server" Text='<%# Bind("nrocuota") %>' SortExpression = "Descripcion" SortDirection="ASC"></asp:Label>
                              </ItemTemplate>
                             </asp:TemplateField>--%>
                                
          </TD>
          </TR>
          
                            <%--     <asp:TemplateField HeaderText="Liberar"   >
                            <HeaderStyle  HorizontalAlign="Center"></HeaderStyle>
                             <ItemStyle  HorizontalAlign="Center"></ItemStyle>
                              <ItemTemplate>
                               <asp:ImageButton ID="ImageButton1" runat="server" ImageUrl="~/images/b_borrar.gif"  OnClientClick="return confirm('¿Está seguro que desea liberar la letra ?')" CommandName="Deshabilitar" />
                              </ItemTemplate>
                             </asp:TemplateField>--%> <%--    <asp:TemplateField    HeaderText="Nro. Cuota">
                             <HeaderStyle Wrap="true" Width="490" HorizontalAlign="Left"></HeaderStyle>
                             <ItemStyle Wrap="false" ></ItemStyle>
                              <ItemTemplate>
                               <asp:Label ID="lblNombre1m" runat="server" Text='<%# Bind("nrocuota") %>' SortExpression = "Descripcion" SortDirection="ASC"></asp:Label>
                              </ItemTemplate>
                             </asp:TemplateField>--%>
          
          
          
          
  
           <!-- Inicio -->
           
           
           
          
       
          
          </TBODY> 
        </TABLE>

 
                                
          <asp:HiddenField ID="hiddidcobranza" runat="server" />
          
         
     
          
          
      </FORM>
      
    </TD>
  </TR>
  </TBODY> 
</TABLE>

</body>
</html>