<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Digitalizar.aspx.cs" Inherits="CobranzaALC.Cobranza.Reconstitucion.Digitalizar" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head id="Head1" runat="server">
    <title>ALC Asesorìa Legal y Crediticía Ltda</title>
<link href="../../css/alc2.css" rel="stylesheet" type="text/css" />
<script src="../../js/funciones.js" type="text/javascript"></script>

<script language="javascript" type="text/javascript">


    function MostrarDocumento(documento) {

        //DESARROLLO  
        //url = 'http://localhost:1828/DIGITALIZADOS/' + documento;


        //TESTING
        // url = 'http://www.alcsa.cl/alctesting/DIGITALIZADOS/' + documento;


        //PRODUCCION
        url = 'http://www.alcsa.cl/DIGITALIZADOS/' + documento;


        //window.opener.location.href=url;

        window.open(url, '_blank')

        //parent.location.href=url;


        //pWin = window.open (url, 'newWin', 'width=800,height=650,scrollbars=1,satus=0,menubar=no,top=10,left=100')
        //	    
        //	    if (window.pWin) 
        //		    pWin.focus()

        return false;
    }

    function Ir(pagina, estado) {

        if (trim(estado) == 'A') {
            document.location.href = pagina;

        } else {
            alert('Cobranza se encuentra términada');
        }
    }


    function ValidarBuscar() {

        if (trim(document.all("txtRut").value) == "") {
            alert('Debe ingresar rut del deudor');
            document.all("txtRut").focus();
            return false;
        }


        if (!(ChequeaRut(document.all("txtRut")))) {
            alert('Rut no es válido');
            document.all("txtRut").focus();
            document.all("txtRut").select();

            return false;
        }


        return true;

    }

    function ValidarDigitalizar() {




        if (trim(document.all("filesubir").value) == '') {
            alert("Seleccione documento a digitalizar");
            return false;
        }


        if (confirm('Esta seguro de digitalizar el documento ?')) {
            return true;
        } else {
            return false;
        }

        //        if(trim(document.all("txtFolio").value) == '')
        //        {
        //          alert("Debe ingresar el N° de folio");
        //          return false;
        //        }


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
        .style3
        {
             FONT-WEIGHT: normal;
             FONT-SIZE: 12px;
             COLOR: #493f46;
             FONT-FAMILY: "Gill Sans MT", Arial;
             width: 17px;
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
      
      

    
  
  <TABLE cellSpacing="0" cellPadding="0" width="750" border="0">
  <TBODY> 
  <TR> 
    <TD width="633" height=50 valign="top" bgcolor="#336699"  xbackground="../../images/banner2.jpg"> 
      <TABLE align=right border=0 style="width: 367px">
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
                  <TD align="left"  bgColor=#eeeeee><b>&nbsp;DIGITALIZAR DOCUMENTOS</b></TD>
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
              <table borderColor=#c8e3f9 cellSpacing=0 cellPadding=0 width=750 border=1 height="100" >
              <tr>
              <td align="left">
                  <!-- Inicio Filtros -->
                      <table border="0" width="100%" bgColor=#e6ecf2 border=0>
                    <tr>
                     <td class="textos22"  colspan="4">&nbsp;</td>
                    </tr>
                    
                     <tr>
                        <td align="right" class="style2" >Digitalizar :</td>
                        <td  align="left" class="style6" >
                             
                             <asp:FileUpload ID="filesubir" runat="server" 
                                 style="WIDTH: 350px; margin-left: 0px;" Enabled="False" />
                            </td>
                        <td align="right" class="style3" ></td>
                        <td  align=left>
                            
                              <%--<asp:Button ID="Button1" runat="server" CssClass="boton" Text="Buscar" OnClientClick="return ValidarBuscar();" onclick="btnBuscar_Click" />--%>
                              
                               <asp:Button ID="Button2" runat="server" CssClass="boton" Text="Digitalizar" 
                                  OnClientClick="return ValidarDigitalizar();"  
                                  onclick="Button2_Click"  />
                             
                            
                        </td>
                    </tr>
                    
              
                 
                  
               
                    
                     <tr>
                     <td class="textos22"  colspan="4">&nbsp;</td>
                    </tr>
                    
                  </table>
                  
                  <!-- Fin Filtros -->
              </td>
              </tr>
            
            <tr>
              <td valign="top">
                  <!-- Inicio Grilla -->
                          <asp:GridView ID="Grilla" runat="server" 
                                          OnRowCommand="Deshabilitar"
                                         AllowPaging="True"  
                                         PageSize="1000"
                                         AutoGenerateColumns="False"
                                         Width="750" 
                                         CellPadding="4" ForeColor="#333333" 
                                         GridLines="None"> 
                            <Columns>
                          
                          
                           <asp:TemplateField HeaderText="Id"  HeaderStyle-HorizontalAlign="Left">
                                <HeaderStyle Wrap="true" Width="70"></HeaderStyle>
                                <ItemStyle Wrap="false" ></ItemStyle>
                                <ItemTemplate>
                                <asp:Label ID="lblCodigo" runat="server" Text='<%# Bind("id_digi") %>' SortExpression = "Codigo" SortDirection="ASC"></asp:Label>
                              </ItemTemplate>
                             </asp:TemplateField>
                             
                              <asp:TemplateField HeaderText="OT"  HeaderStyle-HorizontalAlign="Left">
                                <HeaderStyle Wrap="true" Width="70"></HeaderStyle>
                                <ItemStyle Wrap="false" ></ItemStyle>
                                <ItemTemplate>
                                <asp:Label ID="lblCodigo" runat="server" Text='<%# Bind("OT") %>' SortExpression = "Codigo" SortDirection="ASC"></asp:Label>
                              </ItemTemplate>
                             </asp:TemplateField>
                      
                             <asp:TemplateField    HeaderText="Nombre Documento" HeaderStyle-HorizontalAlign="Left">
                             <HeaderStyle Wrap="true" Width="490"></HeaderStyle>
                             <ItemStyle Wrap="false" ></ItemStyle>
                              <ItemTemplate>
                               <asp:Label ID="lblNombre1" runat="server" Text='<%# Bind("urldocumento") %>' SortExpression = "Descripcion" SortDirection="ASC"></asp:Label>
                              </ItemTemplate>
                             </asp:TemplateField>
                             
                             <asp:TemplateField    HeaderText="Usuario" HeaderStyle-HorizontalAlign="Left">
                             <HeaderStyle Wrap="true" Width="490"></HeaderStyle>
                             <ItemStyle Wrap="false" ></ItemStyle>
                              <ItemTemplate>
                               <asp:Label ID="lblNombre1m" runat="server" Text='<%# Bind("usuario") %>' SortExpression = "Descripcion" SortDirection="ASC"></asp:Label>
                              </ItemTemplate>
                             </asp:TemplateField>
                             
                             
                             
                             <asp:TemplateField    HeaderText="Fecha Carga" HeaderStyle-HorizontalAlign="Left">
                             <HeaderStyle Wrap="true" Width="490"></HeaderStyle>
                             <ItemStyle Wrap="false" ></ItemStyle>
                              <ItemTemplate>
                               <asp:Label ID="lblNombre2" runat="server" Text='<%# Bind("fecha") %>' SortExpression = "Descripcion" SortDirection="ASC"></asp:Label>
                              </ItemTemplate>
                             </asp:TemplateField>
                             
                           <%--   <asp:TemplateField    HeaderText="Descripción">
                             <HeaderStyle Wrap="true" Width="490"></HeaderStyle>
                             <ItemStyle Wrap="true" ></ItemStyle>
                              <ItemTemplate>
                               <asp:Label ID="lblNombre2m" runat="server" Text='<%# Bind("descripcion") %>' SortExpression = "Descripcion" SortDirection="ASC"></asp:Label>
                              </ItemTemplate>
                             </asp:TemplateField>--%>
                             
                            <asp:TemplateField HeaderText="Ver"  >
                              <ItemTemplate>
                               <a href="#" onclick="javascript:MostrarDocumento('<%# Eval("urldocumento")%>');" ><asp:Image ID="Image1" runat="server" ImageUrl="~/images/lupa.jpg" ToolTip="Ver Documento"  /></a> 
                              </ItemTemplate>
                             </asp:TemplateField>
                           
                        <%--    <asp:TemplateField HeaderText="Eliminar"   >
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
                            Visible="False" />
                   
                       <asp:Button ID="btnCancelar" runat="server" CssClass="boton" Text="Salir"  OnClientClick="javascript:window.close();"
                            />
                       
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


 <asp:HiddenField ID="hddOT" runat="server" />
 
      </FORM>
   
      
    </body>
</html>