<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="InformeGeneral.aspx.cs" Inherits="CobranzaALC.Cobranza.Reconstitucion.InformeGeneral" %>


<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
 
<html xmlns="http://www.w3.org/1999/xhtml" >
<head id="Head1" runat="server">
    <title>ALC Asesorìa Legal y Crediticía Ltda</title>
               
<link href="../../css/alc2.css" rel="stylesheet" type="text/css" />
<script src="../../js/funciones.js" type="text/javascript"></script>

<script language="javascript" type="text/javascript">



    function MostrarDocumento() {

        var OT = '';

        OT = document.all("hddOT").value;

        url = 'ReporteOtros.aspx?ot=' + OT;

        pWin = window.open(url, 'newWin', 'width=750,height=650,scrollbars=1,satus=0,menubar=no,top=10,left=100')
        //if (window.pWin)
        //  pWin.focus()

        return false;
    }



    function ValidarEliminar() {

        if (confirm('Esta seguro de eliminar el domicilio ?')) {

            return true;

        } else return false;
    }


    function ValidarActualizar() {

        if (confirm('Esta seguro de actualizar el domicilio ?')) {

            if (document.all("txtRazonSocial").value == "") {
                alert('Debe ingresar la Razón Social');
                document.all("txtRazonSocial").focus();
                return false;
            }

            return true;

        } else return false;
    }

    function ValidarGuardar() {

        if (trim(document.all("txtTitulo").value) == "") {
            alert('Debe ingresar el titulo del informe');
            document.all("txtTitulo").focus();
            return false;
        }




        if (confirm('Esta seguro de guardar la información?')) {
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
        .style5
        {
            FONT-WEIGHT: normal;
            FONT-SIZE: 12px;
            COLOR: #493f46;
            FONT-FAMILY: "Gill Sans MT", Arial;
            width: 268435216px;
        }
        .style6
        {
            font-weight: bold;
        }
        .style7
        {
            width: 248px;
        }
        .style8
        {
            width: 248px;
            height: 24px;
        }
        .style9
        {
            height: 24px;
        }
        </style>
 
</head>
<body  >


 <TABLE cellSpacing="0" cellPadding="0" width="633" border="0">
  <TBODY> 
  <TR> 
    <TD width="633" height=50 valign="top" bgcolor="#336699" xbackground="../../images/banner2.jpg"> 
      <TABLE align=right border=0 style="width: 358px">
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
      
        <TABLE width=633 align=center border=0  >
          <TBODY> 
          <TR> 
            <TD height="184" width="100%" valign="top"> 
            
            <!-- Zona de Titulo -->
            
              <TABLE borderColor=#c8e3f9 cellSpacing=0 cellPadding=0 
                        width=100% border=1>
                <TBODY> 
                <TR> 
                  <TD align="left"  bgColor=#eeeeee><b>&nbsp;INGRESO DATOS INFORME</b></TD>
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
               
                  <table border="0" width="633" bgColor=#e6ecf2 border=0>
                    <tr>
                     <td class="style5"  colspan="4">&nbsp;</td>
                    </tr>
                
                
      
                    
           
                    
                  <tr>
                   <td align="right" class="style7" >Titulo&nbsp; :</td>
                        <td  align=left>
                            <asp:TextBox ID="txtTitulo" runat="server" 
                                style="WIDTH: 350px; margin-left: 0px;"  Width="278px"></asp:TextBox>
                        </td> 
                   <td align="right" class="style3" ></td>
                        <td  align=left>
                   </td>
                  </tr>
                  
                                  <tr>
                   <td align="left" class="style6" colspan="2" >ANTECEDENTES DE ESCRITURA DE ALZAMIENTO</td>
                        <td  align=left>
                            
                        </td> 
                
                  </tr>    

                  <tr>
                   <td align="right" class="style7" >Fecha Escritura&nbsp; :</td>
                        <td  align=left>
                            <asp:TextBox ID="txtFechaEscritura" runat="server" 
                                style="WIDTH: 350px; margin-left: 0px;"  Width="278px"></asp:TextBox>
                        </td> 
                   <td align="right" class="style3" ></td>
                        <td  align=left>
                   </td>
                  </tr>
                  
                  <tr>
                   <td align="right" class="style7" >Notario&nbsp; :</td>
                        <td  align=left>
                            <asp:TextBox ID="txtNotario" runat="server" 
                                style="WIDTH: 350px; margin-left: 0px;"  Width="278px"></asp:TextBox>
                        </td> 
                   <td align="right" class="style3" ></td>
                        <td  align=left>
                   </td>
                  </tr>
                    

                  <tr>
                   <td align="right" class="style7" >Repertorio Notaria&nbsp; :</td>
                        <td  align=left>
                            <asp:TextBox ID="txtRepertorioNotaria" runat="server" 
                                style="WIDTH: 350px; margin-left: 0px;"  Width="278px"></asp:TextBox>
                        </td> 
                   <td align="right" class="style3" ></td>
                        <td  align=left>
                   </td>
                  </tr>
                       
                  <tr>
                   <td align="right" class="style7" >Conservador&nbsp; :</td>
                        <td  align=left>
                            <asp:TextBox ID="txtConservador" runat="server" 
                                style="WIDTH: 350px; margin-left: 0px;"  Width="278px"></asp:TextBox>
                        </td> 
                   <td align="right" class="style3" ></td>
                        <td  align=left>
                   </td>
                  </tr>   
              


                  <tr>
                   <td align="left" class="style6" colspan="2" >SERVICIO DESARROLLADO
                   
                   &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                   &nbsp;
                   UF&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                   &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    
                   VALOR EN PESOS
                   </td>
                        <td  align=left>
                            
                        </td> 
                
                  </tr>   
              
              
                                       
                  <tr>

                   <td align="right" class="style7" >Obtención Cert. Hipotecas y Gravámenes&nbsp; :</td>
                        <td  align=left>
                            <asp:TextBox ID="txtCertHipGravamenesUF" runat="server" 
                                style="WIDTH: 150px; margin-left: 0px;"  Width="278px"></asp:TextBox>
                                &nbsp;&nbsp;&nbsp;
                                 <asp:TextBox ID="txtCertHipGravamenesPESOS" runat="server" 
                                style="WIDTH: 150px; margin-left: 0px;"  Width="278px"></asp:TextBox>
                                
                                
                        </td> 
                   <td align="right" class="style3" ></td>
                        <td  align=left>
                   </td>
                  </tr>   
                   
                   <tr> 
                   <td align="right" class="style7" >Obtención Cert. dominio&nbsp; :</td>
                        <td  align=left>
                            <asp:TextBox ID="txtCertDominioUF" runat="server" 
                                style="WIDTH: 150px; margin-left: 0px;"  Width="278px"></asp:TextBox>
                          &nbsp;&nbsp;&nbsp;
                            <asp:TextBox ID="txtCertDominioPESOS" runat="server" 
                                style="WIDTH: 150px; margin-left: 0px;"  Width="278px"></asp:TextBox>           
                        </td> 
                   <td align="right" class="style3" ></td>
                        <td  align=left>
                   </td>
                  </tr>   
            
                   <tr>  
                   <td align="right" class="style7" >Endoso&nbsp; :</td>
                        <td  align=left>
                            <asp:TextBox ID="txtEndosoUF" runat="server" 
                                style="WIDTH: 150px; margin-left: 0px;"  Width="278px"></asp:TextBox>
                          &nbsp;&nbsp;&nbsp;
                          <asp:TextBox ID="txtEndosoPESOS" runat="server" 
                                style="WIDTH: 150px; margin-left: 0px;"  Width="278px"></asp:TextBox>        
                                
                                
                        </td> 
                   <td align="right" class="style3" ></td>
                        <td  align=left>
                   </td>
                  </tr>   
                  
                 <tr>  
                   <td align="right" class="style7" >Certificado de Dicom&nbsp; :</td>
                        <td  align=left>
                            <asp:TextBox ID="txtCertDicomUF" runat="server" 
                                style="WIDTH: 150px; margin-left: 0px;"  Width="278px"></asp:TextBox>
                                &nbsp;&nbsp;&nbsp;
                            <asp:TextBox ID="txtCertDicomPESOS" runat="server" 
                                style="WIDTH: 150px; margin-left: 0px;"  Width="278px"></asp:TextBox>        
                                
                                
                        </td> 
                   <td align="right" class="style3" ></td>
                        <td  align=left>
                   </td>
                  </tr>   
            
                 <tr>  
                   <td align="right" class="style7" >Alzamiento de Embargo&nbsp; :</td>
                        <td  align=left>
                            <asp:TextBox ID="txtAlzamientoEmbargoUF" runat="server" 
                                style="WIDTH: 150px; margin-left: 0px;"  Width="278px"></asp:TextBox>
                                &nbsp;&nbsp;&nbsp;
                                <asp:TextBox ID="txtAlzamientoEmbargoPESOS" runat="server" 
                                style="WIDTH: 150px; margin-left: 0px;"  Width="278px"></asp:TextBox>
                                
                        </td> 
                   <td align="right" class="style3" ></td>
                        <td  align=left>
                   </td>
                  </tr>   

                   <tr>  
                   <td align="right" class="style7" >Alzamiento de Medida Precautoria&nbsp; :</td>
                        <td  align=left>
                            <asp:TextBox ID="txtAlzamientoMedidaPrecautoriaUF" runat="server" 
                                style="WIDTH: 150px; margin-left: 0px;"  Width="278px"></asp:TextBox>
                                &nbsp;&nbsp;&nbsp;
                            <asp:TextBox ID="txtAlzamientoMedidaPrecautoriaPESOS" runat="server" 
                                style="WIDTH: 150px; margin-left: 0px;"  Width="278px"></asp:TextBox>    
                                
                        </td> 
                   <td align="right" class="style3" ></td>
                        <td  align=left>
                   </td>
                  </tr>   

                   <tr>  
                   <td align="right" class="style7" >Alzamientos Hipotecas&nbsp; :</td>
                        <td  align=left>
                            <asp:TextBox ID="txtAlzamientosHipotecasUF" runat="server" 
                                style="WIDTH: 150px; margin-left: 0px;"  Width="278px"></asp:TextBox>
                                &nbsp;&nbsp;&nbsp;
                                      <asp:TextBox ID="txtAlzamientosHipotecasPESOS" runat="server" 
                                style="WIDTH: 150px; margin-left: 0px;"  Width="278px"></asp:TextBox>
                                
                        </td> 
                   <td align="right" class="style3" ></td>
                        <td  align=left>
                   </td>
                  </tr>   


                   <tr>  
                   <td align="right" class="style7" >Alzamientos Prohibiciones&nbsp; :</td>
                        <td  align=left>
                            <asp:TextBox ID="txtAlzamientoProhibicionesUF" runat="server" 
                                style="WIDTH: 150px; margin-left: 0px;"  Width="278px"></asp:TextBox>
                                &nbsp;&nbsp;&nbsp;
                                     <asp:TextBox ID="txtAlzamientoProhibicionesPESOS" runat="server" 
                                style="WIDTH: 150px; margin-left: 0px;"  Width="278px"></asp:TextBox>
                        </td> 
                   <td align="right" class="style3" ></td>
                        <td  align=left>
                   </td>
                  </tr>   


                   <tr>  
                   <td align="right" class="style7" >Reconstitución Escritura&nbsp; :</td>
                        <td  align=left>
                            <asp:TextBox ID="txtReconstitucionEscrituraUF" runat="server" 
                                style="WIDTH: 150px; margin-left: 0px;"  Width="278px"></asp:TextBox>
                                &nbsp;&nbsp;&nbsp;
                                            <asp:TextBox ID="txtReconstitucionEscrituraPESOS" runat="server" 
                                style="WIDTH: 150px; margin-left: 0px;"  Width="278px"></asp:TextBox>
                                
                        </td> 
                   <td align="right" class="style3" ></td>
                        <td  align=left>
                   </td>
                  </tr>   

                   <tr>  
                   <td align="right" class="style7" >Conformidad Alzamiento&nbsp; :</td>
                        <td  align=left>
                            <asp:TextBox ID="txtConformidadAlzamientoUF" runat="server" 
                                style="WIDTH: 150px; margin-left: 0px;"  Width="278px"></asp:TextBox>
                                &nbsp;&nbsp;&nbsp;
                            <asp:TextBox ID="txtConformidadAlzamientoPESOS" runat="server" 
                                style="WIDTH: 150px; margin-left: 0px;"  Width="278px"></asp:TextBox>    
                                
                                
                        </td> 
                   <td align="right" class="style3" ></td>
                        <td  align=left>
                   </td>
                  </tr>   
  
                   <tr>  
                   <td align="right" class="style7" >Escritura de Adjudicación&nbsp; :</td>
                        <td  align=left>
                            <asp:TextBox ID="txtEscrituraAdjudicacionUF" runat="server" 
                                style="WIDTH: 150px; margin-left: 0px;"  Width="278px"></asp:TextBox>
                             &nbsp;&nbsp;&nbsp;
                              <asp:TextBox ID="txtEscrituraAdjudicacionPESOS" runat="server" 
                                style="WIDTH: 150px; margin-left: 0px;"  Width="278px"></asp:TextBox>    
                                
                                
                        </td> 
                   <td align="right" class="style3" ></td>
                        <td  align=left>
                   </td>
                  </tr>   
                   <tr>  
                   <td align="right" class="style7" ><b>TOTAL</b>&nbsp; :</td>
                        <td  align=left>
                            <asp:TextBox ID="txtTotalUF" runat="server" 
                                style="WIDTH: 150px; margin-left: 0px;"  Width="278px"></asp:TextBox>
                                &nbsp;&nbsp;&nbsp;
                            <asp:TextBox ID="txtTotalPESOS" runat="server" 
                                style="WIDTH: 150px; margin-left: 0px;"  Width="278px"></asp:TextBox>     
                                
                        </td> 
                   <td align="right" class="style3" ></td>
                        <td  align=left>
                   </td>
                  </tr>   
                  
                  
                  
                                              <tr>
                   <td align="left" class="style6" colspan="2" >DOCUMENTACIÓN QUE SE ADJUTA</td>
                        <td  align=left>
                            
                        </td> 
                
                  </tr>    

                  <tr>
                   <td align="right" class="style7" >Certificado Gravámenes y Prohibiciones 1°&nbsp; :</td>
                        <td  align=left>
                            <asp:TextBox ID="txtCertGravaProhibiciones" runat="server" 
                                style="WIDTH: 100px; margin-left: 0px;"  Width="278px"></asp:TextBox>
                        </td> 
                   <td align="right" class="style3" ></td>
                        <td  align=left>
                   </td>
                  </tr>



                <tr>
                   <td align="right" class="style7" >Copia Inscripción con dominio Vigente&nbsp; :</td>
                        <td  align=left>
                            <asp:TextBox ID="txtcopiaInsDominioVig" runat="server" 
                                style="WIDTH: 100px; margin-left: 0px;"  Width="278px"></asp:TextBox>
                        </td> 
                   <td align="right" class="style3" ></td>
                        <td  align=left>
                   </td>
                  </tr>

                <tr>
                   <td align="right" class="style7" >Certificado Gravámenes y Prohibiciones 2°&nbsp; :</td>
                        <td  align=left>
                            <asp:TextBox ID="txtCertGravaProhib2" runat="server" 
                                style="WIDTH: 100px; margin-left: 0px;"  Width="278px"></asp:TextBox>
                        </td> 
                   <td align="right" class="style3" ></td>
                        <td  align=left>
                   </td>
                  </tr>

                <tr>
                   <td align="right" class="style7" >Copia de Escritura de Alzamiento&nbsp; :</td>
                        <td  align=left>
                            <asp:TextBox ID="txtCopiaEscrituraAlzamiento" runat="server" 
                                style="WIDTH: 100px; margin-left: 0px;"  Width="278px"></asp:TextBox>
                        </td> 
                   <td align="right" class="style3" ></td>
                        <td  align=left>
                   </td>
                  </tr>



             <tr>
                   <td align="right" class="style7" >Copia Escritura Mutuo e Hipoteca&nbsp; :</td>
                        <td  align=left>
                            <asp:TextBox ID="txtCopiaEscrmutuohipo" runat="server" 
                                style="WIDTH: 100px; margin-left: 0px;"  Width="278px"></asp:TextBox>
                        </td> 
                   <td align="right" class="style3" ></td>
                        <td  align=left>
                   </td>
                  </tr>

 
 
             <tr>
                   <td align="right" class="style7" >Fotocopia Escritura ALzamiento&nbsp; :</td>
                        <td  align=left>
                            <asp:TextBox ID="txtFotocopiaEscAlzamiento" runat="server" 
                                style="WIDTH: 100px; margin-left: 0px;"  Width="278px"></asp:TextBox>
                        </td> 
                   <td align="right" class="style3" ></td>
                        <td  align=left>
                   </td>
                  </tr>
                  
                  
                  
                     <tr>
                   <td align="left" class="style7"  colspan="2">Observación&nbsp; :
                  
                           <asp:TextBox ID="txtObservacion" runat="server"  TextMode="MultiLine"
                                style="margin-left: 0px;"  Width="573px" Height="69px"></asp:TextBox>
                       </td> 
                  
                  </tr>
                   
            <tr>
                        <td align="right" class="style8" ></td>
                        <td  align="left" class="style9" >
                          

                        </td>
                        <td align="right" class="style9" ></td>
                        <td  align=left class="style9">
                         
                        </td>
                    </tr>
      <%--              
                    <tr>
                        <td align="right" class="style4" >Vigencia :</td>
                        <td  align="left" class="style1" >
                          <asp:DropDownList ID="vigencia" runat="server" 
                                 Enabled="False" onselectedindexchanged="vigencia_SelectedIndexChanged" style="WIDTH: 180px; margin-left: 0px; "
                                >
                              <asp:ListItem Value="1">Vigente</asp:ListItem>
                              <asp:ListItem Value="2">No Vigente</asp:ListItem>
                           </asp:DropDownList>
                        </td>
                        <td align="right" class="style3" >Fuente :</td>
                        <td  align=left>
                         <asp:DropDownList ID="fuente" runat="server" Enabled="False" style="WIDTH: 180px; margin-left: 0px; ">
                             <asp:ListItem Value="0">Seleccione</asp:ListItem>
                             <asp:ListItem Value="1">Cambio de Domicilio</asp:ListItem>
                             <asp:ListItem Value="2">No existe Domicilio</asp:ListItem>
                            </asp:DropDownList>
                        </td>
                    </tr>--%>
                    
                    <tr>
                     <td class="style5"  colspan="4"><%--&nbsp;<b>NOTA :</b> Recuerde que <b> NO</b> se pueden agregar estados de inicio y término. Solo estados simples--%></td>
                    </tr>
                    
                     <tr>
                     <td class="style5"  colspan="4">&nbsp;</td>
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
                    
                        <asp:Button ID="btnBuscar" runat="server" CssClass="boton" Text="Buscar"  Visible="False" 
                           OnClientClick="return ValidarBuscar();"  />
                    
                            
                       <asp:Button ID="btnGuardar" runat="server" CssClass="boton" Text="Guardar" 
                            OnClientClick="return ValidarGuardar();" Height="26px" onclick="btnGuardar_Click" 
                           />
                   
                       <asp:Button ID="btnCancelar" runat="server" OnClientClick="return MostrarDocumento();" CssClass="boton" Text="Imprimir"  
                            />
                       
                     </div>
                  </td>
                </tr>
              </table>
              
            </TD>
          </TR>
          </TBODY> 
        </TABLE>
        
        
                  <%--<asp:GridView ID="grilla" runat="server" CellPadding="4" ForeColor="#333333"  Width="640"
                    
                     AutoGenerateColumns="False"
                      GridLines="None">
                 
                      <Columns>
                      <asp:TemplateField HeaderText="Id">
                                <HeaderStyle Wrap="true" HorizontalAlign=Left></HeaderStyle>
                                <ItemStyle Wrap="false" HorizontalAlign=Left ></ItemStyle>
                                <ItemTemplate>
                                <asp:Label ID="lblCodigo21" runat="server" Text='<%# Bind("id") %>' SortExpression = "Codigo" SortDirection="ASC"></asp:Label>
                              </ItemTemplate>
                             </asp:TemplateField>
                             
                             
                               
                      <asp:TemplateField HeaderText="Descripción">
                                <HeaderStyle Wrap="true"  HorizontalAlign=Left></HeaderStyle>
                                <ItemStyle Wrap="false" ></ItemStyle>
                                <ItemTemplate>
                                <asp:Label ID="lblCodigo331" runat="server" Text='<%# Bind("descripcion") %>' SortExpression = "Codigo" SortDirection="ASC"></asp:Label>
                              </ItemTemplate>
                             </asp:TemplateField>
                           
                           
         
                      
                      
                   
                      </Columns>
                 
                 
                      <HeaderStyle CssClass="cabezabrilla" />
                            <RowStyle BackColor="#EFF3FB" />
                            <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                            <PagerStyle BackColor="#2461BF" ForeColor="White"  />
                            <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                            <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                            <EditRowStyle BackColor="#2461BF" />
                            <AlternatingRowStyle BackColor="White" />
                  </asp:GridView>--%>
                  <br/>
        
        <div align="center"><font size="2">Estado Nº 359 Piso 13, Santiago - Chile | Teléfonos : 633 3115 - 633 3483 
          </font> </div>
         
                        <asp:HiddenField ID="hddOT"  runat="server" />
      </FORM>
      
    </TD>
  </TR>
  </TBODY> 
</TABLE>







</body>
</html>
