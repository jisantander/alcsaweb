<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ActividadesDocuEstandard2.aspx.cs" Inherits="CobranzaALC.Cobranza.Procesos.ActividadesDocuEstandard2" %>


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

        valor = document.all("hiddidjuicio").value;
        url = 'MostrarActividades.aspx?Codigo=' + valor + '&tipo=ESTANDARD2';

        IrJudicial(url, '900', '650');

        return false;
    }


    function IrJudicial(url, ancho, alto) {
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




        var fecha
        fecha = new Date();

        //Fecha actual
        var l_hoy = new Date(Date());
        var l_dia = l_hoy.getDate();
        var l_mes = l_hoy.getMonth() + 1;
        var l_ano = l_hoy.getFullYear();

        if (l_mes < 10) l_mes = '0' + l_mes;
        if (l_dia < 10) l_dia = '0' + l_dia;

        var fecha = l_dia + '/' + l_mes + '/' + l_ano;





        if (trim(document.all("txtFechatramite").value) == "") {
            alert('Debe ingresar fecha de trámite');
            document.all("txtFechatramite").focus();
            return false;
        }


        if (!(EsFecha(document.all("txtFechatramite").value, 'dma'))) {
            alert('Debe ingresar Fecha de trámite. válida, Ej. 01-09-2010');
            document.all("txtFechatramite").focus();
            return false;
        }

        if (compare_dates(document.all("txtFechatramite").value, fecha)) {
            alert("Fecha de trámite no puede ser mayor a la fecha actual");
            return false;
        }


        if (!(trim(document.all("txtFechaSubTramite").value) == "")) {
            if (!(EsFecha(document.all("txtFechaSubTramite").value, 'dma'))) {
                alert('Debe ingresar Fecha de subtrámite. válida, Ej. 01-09-2010');
                document.all("txtFechaSubTramite").focus();
                return false;
            }

        }



        var mensaje = 'Esta seguro de guardar la actividad del juicio ?';

        if (document.all("hiddtermino").value == 'S' || document.all("hiddsubtramitegeneral").value == 'S') {
            mensaje = '¿Acaba de seleccionar término de juicio, está seguro?';
        }

        if (confirm(mensaje)) {
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
            width: 109px;
        }
        .style4
        {
            width: 308px;
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
      
        <TABLE align=center border=0 style="width: 834px"  >
          <TBODY> 
          <TR> 
                      <!---->          
            <TD height="163" width="100%" valign="top"> 
            
            <!-- Zona de Titulo -->
            
              <TABLE borderColor=#c8e3f9 cellSpacing=0 cellPadding=0 
                        width=100% border=1>
                <TBODY> 
                <TR> 
                  <TD align="left"  bgColor=#eeeeee><b>&nbsp;INGRESO ACTIVIDAD JUDICIAL</b></TD>
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
               
                  <table border="0" bgColor=#e6ecf2 border=0 style="width: 833px">
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
                        <td align="right" class="style2" >Procedimiento :</td>
                        <td  align="left" class="style4" >
                            <asp:TextBox ID="txtProcedimiento" runat="server" 
                                style="WIDTH: 150px; margin-left: 0px;" ReadOnly="True"></asp:TextBox>
                        </td>
                        <td align="right" class="style3" >Materia:</td>
                        <td  align=left>
                            <asp:TextBox ID="txtMateria" runat="server" 
                                style="WIDTH: 250px; margin-left: 0px;" ReadOnly="True"></asp:TextBox>
                        </td>
                    </tr>
                    
                     <tr>
                        <td align="right" class="style2" >Producto :</td>
                        <td  align=left class="style4">
                            <asp:TextBox ID="txtProducto" runat="server" 
                                style="WIDTH: 100px; margin-left: 0px;" ReadOnly="True"></asp:TextBox>
                        </td>
                         <td align="right" class="style3" ></td>
                        <td  align="left" >
                             
                        </td>
                    </tr>
                    
                     <tr>
                        <td align="right" class="style2" >Rol-Rit :</td>
                        <td  align=left class="style4">
                            <asp:TextBox ID="txtRol" runat="server" 
                                style="WIDTH: 150px; margin-left: 0px;" ReadOnly="True"></asp:TextBox>
                        </td>
                         <td align="right" class="style3" >Tribunal :</td>
                        <td  align="left" >
                             <asp:TextBox ID="txtTribunal" runat="server" 
                                style="WIDTH: 250px; margin-left: 0px;" ReadOnly="True"></asp:TextBox>
                        </td>
                    </tr>
                    
                    <tr>
                        <td align="right" class="style2" >Fecha Ing. Corte :</td>
                        <td  align=left class="style4">
                            <asp:TextBox ID="txtFechaIngCorte" runat="server" 
                                style="WIDTH: 100px; margin-left: 0px;" ReadOnly="True"></asp:TextBox>
                        </td>
                         <td align="right" class="style3" ></td>
                        <td  align="left" >
                             
                        </td>
                    </tr>
                    
                    
                    <tr>
                        <td align="right" class="style2" >Trámite :</td>
                        <td  align="left" class="style4" >
                               <asp:DropDownList ID="tramite" runat="server" 
                                style="WIDTH: 350px; margin-left: 0px;" AutoPostBack="True" onselectedindexchanged="tramite_SelectedIndexChanged" 
                                >
                            </asp:DropDownList>
                            
                           
                        </td>
                        <td align="right" class="style3" >Próxima Gestión:</td>
                        <td  align=left>
                                <asp:TextBox ID="txtproxtramite" runat="server" 
                                style="WIDTH: 270px; margin-left: 0px;" ReadOnly="True"></asp:TextBox>
                        </td>
                    </tr>
                    
                    
                    
                     <tr>
                        <td align="right" class="style2" >Fecha Trámite :</td>
                        <td  align="left" class="style4" >
                          <asp:TextBox ID="txtFechatramite" runat="server"  MaxLength="10"
                                style="WIDTH: 100px; margin-left: 0px;"></asp:TextBox>
                        </td>
                        <td align="right" class="style3" >Fec.Próx.Gestión:</td>
                        <td  align=left>
                           <asp:TextBox ID="txtFechaproxgestion" runat="server" 
                                style="WIDTH: 100px; margin-left: 0px;" ReadOnly="True"></asp:TextBox>
                        </td>
                    </tr>
                    
                    <tr>
                        <td align="right" class="style2" >Sub Trámite :</td>
                        <td  align="left" class="style4" >
                           <asp:DropDownList ID="subtramite" runat="server" 
                                style="WIDTH: 280px; margin-left: 0px;" AutoPostBack="True" 
                                onselectedindexchanged="subtramite_SelectedIndexChanged" >
                            </asp:DropDownList>
                        </td>
                        <td align="right" class="style3" >Fec. Sub Trámite:</td>
                        <td  align=left>
                           <asp:TextBox ID="txtFechaSubTramite" runat="server"  MaxLength="10"
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
                                        
                   <asp:Button ID="btnPoder" runat="server" Visible="true" CssClass="boton2" Text="Poder Judicial" 
                          OnClientClick="return IrJudicial('http://www.poderjudicial.cl/index2.php?pagina1=estados_causas.php','900','650');"  />
                   <asp:Button ID="btnActividades" runat="server" Visible="true" CssClass="boton2" Text="Ver Actividades" 
                    OnClientClick="return Actividades();"/> 
                                
                      
                   
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
          <asp:HiddenField ID="hiddindice" runat="server" />
          <asp:HiddenField ID="hiddproxima" runat="server" />
          <asp:HiddenField ID="hiddestadoingreso" runat="server" />
          <asp:HiddenField ID="hiddtermino" runat="server" />
          <asp:HiddenField ID="hiddsubtramitegeneral" runat="server" />
          
          
          
          
          <asp:HiddenField ID="hiddidCobranza" runat="server" />
          <asp:HiddenField ID="hiddGuardar" runat="server" /> 
          
          <asp:HiddenField ID="hiddEstadoAvanze" runat="server" /> 
          
          
          <asp:HiddenField ID="HiddFechatramite" runat="server" />
          <asp:HiddenField ID="Hiddsubtramite" runat="server" />
          
          
          
      </FORM>
      
    </TD>
  </TR>
  </TBODY> 
</TABLE>

</body>
</html>
