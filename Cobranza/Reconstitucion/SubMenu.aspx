<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="SubMenu.aspx.cs" Inherits="CobranzaALC.Cobranza.Reconstitucion.SubMenu" %>


<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">


<html xmlns="http://www.w3.org/1999/xhtml" >
<head id="Head1" runat="server">
    <title>ALC Asesorìa Legal y Crediticía Ltda</title>
<link href="../../css/alc2.css" rel="stylesheet" type="text/css" />
<script src="../../js/funciones.js" type="text/javascript"></script>


<style type="text/css">
   
table.TablaResultados
{ 
margin:3px 3px 0px 3px;
border:1px solid #000000;
width:99%;
color:Black;
/*color:#fefefe;*/

font-size:0.85em;
vertical-align:middle;
text-align:left;
}

table.TablaResultados tr.TituloResultados_Division td
{
font-size:0.54em;
font-weight:Bold;
text-align:Center;
vertical-align:middle;
color:#000000;
margin:0px 0px 0px 0px;
padding:2px 3px 2px 2px;
background:#DCE3EC;
border:1px solid #5D86B4;
height:20px;
}


table.TablaResultados td.TituloResultados
{
font-size1:3.54em;
font-weight:Bold;
text-align:Center;
vertical-align:middle;
color:#000000;
margin:0px 0px 0px 0px;
padding:2px 3px 2px 2px;
background:#DCE3EC;
height:20px;
}


table.TablaResultados tr.TituloResultados
{
font-size:1.00em;
font-weight:Bold;
text-align:Center;
vertical-align:middle;
color:#000000;
margin:0px 0px 0px 0px;
padding:2px 3px 2px 2px;
background:#D2DCE8; /*#DCE3EC;*/
height:20px;
}

table.TablaResultados tr.FilaAlternaResultados
{
font-size:1.00em;
vertical-align:middle;
text-align:left;	
color:#000000;
margin:0px 0px 0px 0px;
padding:2px 3px 2px 2px;
background:#EBEDEF;
height:20px;
}
    
</style>

    
<script language="javascript" type="text/javascript">


    function Ir(pagina, estado) {

        if (trim(estado) == 'A') {
            document.location.href = pagina;

        } else {
            alert('Cobranza se encuentra términada');
        }
    }


    function ValidarBuscar() {

        if (document.all("txtRut").value == "" && document.all("txtNroOperacion").value == "") {
            alert('Debe ingresar como mínimo un filtro');
            document.all("txtRut").focus();
            return false;
        }


        if (!(document.all("txtRut").value == "")) {
            if (!(ChequeaRut(document.all("txtRut")))) {
                alert('Rut no es válido');
                document.all("txtRut").focus();
                document.all("txtRut").select();

                return false;
            }
        }


        //        if (document.all("txtNroOperacion").value == "")
        //        {
        //           alert('Debe ingresar N° de operación');
        //           document.all("txtNroOperacion").focus();
        //           return false;
        //        }

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
            width: 1241px;
        }
        .style3
        {
            FONT-WEIGHT: normal;
            FONT-SIZE: 12px;
            COLOR: #493f46;
            FONT-FAMILY: "Gill Sans MT", Arial;
            width: 104px;
        }
         .style6
         {
             width: 210px;
         }
    </style>
    </head>
<body  >
      
      <FORM runat="server" id="Formulario"   >
      
      

    
  
  <TABLE cellSpacing="0" cellPadding="0" border="0" style="width: 662px">
  <TBODY> 
  <TR> 
    <TD width="633" height=50 valign="top" bgcolor="#336699"  xbackground="../../images/banner2.jpg"> 
      <TABLE align=right border=0 style="width: 364px">
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
    
        <TABLE align=center border=0 style="width: 723px"  >
          <TBODY> 
          <TR> 
            <TD height="114" width="100%" valign="top"> 
            
            <!-- Zona de Titulo -->
            
              <TABLE borderColor=#c8e3f9 cellSpacing=0 cellPadding=0 
                        width=100% border=1>
                <TBODY> 
                <TR> 
                  <TD align="left"  bgColor=#eeeeee><b>&nbsp;SELECCIONE OPCIÓN</b></TD>
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
              <table borderColor=#c8e3f9 cellSpacing=0 cellPadding=0 width="730 px" border=1 height="100" >
              <tr>
              <td align="left">
                  <!-- Inicio Filtros -->
                  <center>
                   <asp:Panel ID="pnlBotones" runat="server">
                      <table border="0" bgColor=#e6ecf2 border=0 style="width:100%">
                    <tr>
                     <td class="textos22"  colspan="4">
                     
                     
                        <asp:Button ID="Button4" runat="server" 
                             Text="INGRESO RECONSTITUCIÓN" Width="483px" onclick="Button4_Click" Enabled="False" 
                              />
                             <br/>
                    
                             
                         <asp:Button ID="Button1" runat="server" 
                             Text="CONSULTA Y EDICIÓN RECONSTITUCIÓN" Width="483px" 
                             onclick="Button1_Click" Enabled="False" />
                             <br/>
                             
                             <asp:Button ID="Button3" runat="server" Text="ASIGNAR OT" 
                             Width="483px" onclick="Button3_Click" Enabled="False"   />
                             
                             
                             <br/>
                             
                             <asp:Button ID="Button5" runat="server" Text="REASIGNAR OT" 
                             Width="483px"  Enabled="False" onclick="Button5_Click"   />
                             
                             <br/>
                             
                             <asp:Button ID="Button6" runat="server" Text="EXPORTAR BITACORA ESTADOS A EXCEL" 
                             Width="483px"  Enabled="False" onclick="Button6_Click"  />
                             <br/>
                             
                             <asp:Button ID="Button7" runat="server" Text="EXPORTAR GASTOS A EXCEL" 
                             Width="483px"  Enabled="False" onclick="Button7_Click"   />
                             
                             <br/>
                         <asp:Button ID="Button2" runat="server" Text="CARGA DE PLANILLA EXCEL (CSV)" 
                             Width="483px" onclick="Button2_Click" Enabled="False" />
                             
                             
                             
                                
                             <br/>
                         <asp:Button ID="Button8" runat="server" Text="CONSULTA GASTOS" 
                             Width="483px" onclick="Button8_Click"  />
                        </td>
                    </tr>
                   
                    
              <%--       <tr>
                        <td align="right" class="style2" >Número Operación :</td>
                        <td  align="left" class="style4"  colspan="2">
                            &nbsp;</td>
                       
                    </tr>   --%>
                    
                    
                    
                  </table>
                   </asp:Panel>
                  </center>
                  <!-- Fin Filtros -->
              </td>
              </tr>
            
            <tr>
              <td valign="top">
                  <!-- Inicio Grilla -->
                           
                           
                  
                  <br />
                
     
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
         
              
            </TD>
          </TR>
          </TBODY> 
            <asp:HiddenField ID="hddPERFIL" runat="server" />
        </TABLE>
        <div align="left"><font size="2">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        Estado Nº 359 Piso 13, Santiago - Chile | Teléfonos : 633 3115 - 633 3483 
          </font> </div>
         
    </TD>
  </TR>
  </TBODY> 
</TABLE>

      </FORM>
      
    </body>
</html>
