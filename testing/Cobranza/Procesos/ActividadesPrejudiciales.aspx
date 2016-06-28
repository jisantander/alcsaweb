<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ActividadesPrejudiciales.aspx.cs" Inherits="CobranzaALC.Cobranza.Procesos.ActividadesPrejudiciales" %>


<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head id="Head1" runat="server">
    <title>ALC Asesorìa Legal y Crediticía Ltda</title>
    <link href="../../css/alc2.css" rel="stylesheet" type="text/css" />
    <script src="../../js/funciones.js" type="text/javascript"></script>

<script language="javascript" type="text/javascript">


    function Actividades() {

        var valor = '';
        var url = '';

        valor = document.all("hiddidCobranza").value;
        url = 'MostrarActividadesPrejudiciales.aspx?Codigo=' + valor;

        Ir(url, '900', '650');

        return false;
    }


    function Ir(url, ancho, alto) {
        pWin = window.open(url, 'newWin', 'width=' + ancho + ',height=' + alto + ',scrollbars=1,satus=0,menubar=no,top=10,left=100')
        if (window.pWin)
            pWin.focus()

        return false;
    }

    function ValidarGuardar() {


        //            if(document.all("hiddtramite").value == "T")
        //            {
        //              alert('Juicio se encuentra términado y sus respectivas actividades');
        //              return false;
        //            }


        if (trim(document.all("txtFechatramite").value) == "") {
            alert('Debe ingresar fecha de actividad');
            document.all("txtFechatramite").focus();
            return false;
        }


        var mensaje = 'Esta seguro de guardar la actividad prejudicial ?';

        //if(document.all("tramite").value == "9" ||document.all("tramite").value == "10" || document.all("tramite").value == "11" || document.all("tramite").value == "12")
        // {
        //   mensaje = '¿Acaba de seleccionar término de exhorto, está seguro?';
        //}

        if (confirm(mensaje)) {
            return true;

        } else return false;


    }

</script>

 <style type="text/css">
        .style2
        {
            FONT-WEIGHT: normal;
            FONT-SIZE: 12px;
            COLOR: #493f46;
            FONT-FAMILY: "Gill Sans MT", Arial;
            width: 116px;
        }
        .style3
        {
         FONT-WEIGHT: normal;
         FONT-SIZE: 12px;
         COLOR: #493f46;
         FONT-FAMILY: "Gill Sans MT", Arial;
         width: 133px;
     }
        .style4
        {
            width: 220px;
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
      
        <TABLE align=center border=0 style="width: 736px"  >
          <TBODY> 
          <TR> 
                      <!---->          
            <TD height="163" width="100%" valign="top"> 
            
            <!-- Zona de Titulo -->
            
              <TABLE borderColor=#c8e3f9 cellSpacing=0 cellPadding=0 
                        width=100% border=1>
                <TBODY> 
                <TR> 
                  <TD align="left"  bgColor=#eeeeee><b>&nbsp;INGRESO ACTIVIDADES PREJUDICIALES</b></TD>
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
               
                  <table border="0" bgColor=#e6ecf2 border=0 style="width: 735px">
                    <tr>
                     <td class="textos22"  colspan="4">&nbsp;</td>
                    </tr>
                    
                    <tr>
                        <td align="right" class="style2" >N° Operación :</td>
                        <td  align="left" class="style4" >
                            <asp:TextBox ID="txtNroOperacion" runat="server" 
                                style="WIDTH: 150px; margin-left: 0px;" ReadOnly="True"></asp:TextBox>
                        </td>
                        <td align="right" class="style3" >Cliente :</td>
                        <td  align=left style="margin-left: 40px">
                            <asp:TextBox ID="txtCliente" runat="server" 
                                style="WIDTH: 250px; margin-left: 0px;" ReadOnly="True"></asp:TextBox>
                        </td>
                    </tr>
                    
        
                    
                    
                    
                    <tr>
                        <td align="right" class="style2" >Rut Deudor :</td>
                        <td  align="left" class="style4" >
                            <asp:TextBox ID="txtRutDeudor" runat="server" 
                                style="WIDTH: 150px; margin-left: 0px;" ReadOnly="True"></asp:TextBox>
                        </td>
                        <td align="right" class="style3" >Deudor:</td>
                        <td  align=left>
                            <asp:TextBox ID="txtNomDeudor" runat="server" 
                                style="WIDTH: 250px; margin-left: 0px;" ReadOnly="True"></asp:TextBox>
                        </td>
                    </tr>
                    
               
    
                    
                    
                        <tr>
                        <td align="right" class="style2" >Actividad :</td>
                        <td  align="left" class="style4" >
                            <asp:DropDownList ID="tramite" runat="server" 
                                style="WIDTH: 250px; margin-left: 0px;"  >
                                 
                            </asp:DropDownList>
                        </td>
                        <td align="right" class="style3" ><%--Próxima Gestión:--%>Próxima Gestión :</td>
                        <td  align=left>
                                                         <asp:DropDownList ID="proxima" runat="server" 
                                style="WIDTH: 250px; margin-left: 0px;"  >
                                 
                            </asp:DropDownList>
                        </td>
                    </tr>
                    
                     <tr>
                        <td align="right" class="style2" >Fecha Actividad :</td>
                        <td  align="left" class="style4" >
                          <asp:TextBox ID="txtFechatramite" runat="server" 
                                style="WIDTH: 100px; margin-left: 0px;"></asp:TextBox>
                        </td>
                        <td align="right" class="style3" ><%--Fec.Próx.Gestión:--%>Fec.Próx.Gestión :</td>
                        <td  align=left>
                          <asp:TextBox ID="txtFechaproxgestion" runat="server" 
                                style="WIDTH: 100px; margin-left: 0px;"></asp:TextBox>
                            </td>
                    </tr>
                    

                     
                     <tr>
                        <td align="right" class="style2" >Observación:</td>
                        <td  align="left" class="style4"  >
                          <asp:TextBox ID="observacion" runat="server"  
                                 TextMode="MultiLine" MaxLength="10" Width="250px" Height="50px" ></asp:TextBox>
                        </td>
                         <td align="right" class="style3" ></td>
                        <td  align=left>
                                        
                   <%--<asp:Button ID="btnPoder" runat="server" Visible="true" CssClass="boton2" Text="Poder Judicial" 
                          OnClientClick="return IrJudicial('http://www.poderjudicial.cl/index2.php?pagina1=estados_causas.php','900','650');"  />--%>
                   <asp:Button ID="btnActividades" runat="server" Visible="true" CssClass="boton2" Text="Ver Actividades" 
                          
                                OnClientClick="return Actividades();" 
                                />
                      
                   
                        </td>
                        
                    </tr>
                    
                    
                    
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
                            OnClientClick="return ValidarBuscar();" onclick="btnBuscar_Click" 
                            Visible="False" />
                            
                       <asp:Button ID="btnGuardar" runat="server" CssClass="boton" Text="Guardar" 
                            OnClientClick="return ValidarGuardar();" onclick="btnGuardar_Click" />
                   
                       <asp:Button ID="btnActualizar" runat="server" CssClass="boton" Text="Actualizar" 
                            OnClientClick="return ValidarActualizar();" Visible="False" onclick="btnActualizar_Click" />
                   
                       <asp:Button ID="btnEliminar" runat="server" CssClass="boton" Text="Eliminar" Visible="False"
                           
                           OnClientClick="return ValidarEliminar();"  onclick="btnEliminar_Click" />
     
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
          <asp:HiddenField ID="hiddidjuicio" runat="server" />
          <asp:HiddenField ID="hiddtramite" runat="server" />
          <asp:HiddenField ID="hiddidCobranza" runat="server" />
          <asp:HiddenField ID="hiddGuardar" runat="server" /> 
          
          <asp:HiddenField ID="HiddFechatramite" runat="server" />
          <asp:HiddenField ID="Hiddsubtramite" runat="server" />
          
          
          <asp:HiddenField ID="HiddConsulta" runat="server" />
          
          
      </FORM>
      
    </TD>
  </TR>
  </TBODY> 
</TABLE>

</body>
</html>
