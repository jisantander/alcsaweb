<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Prenda.aspx.cs" Inherits="CobranzaALC.Cobranza.Prendas.Prenda" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head id="Head1" runat="server">
    <title>ALC Asesorìa Legal y Crediticía Ltda</title>
   
<link href="../../css/alc2.css" rel="stylesheet" type="text/css" />
<script src="../../js/funciones.js" type="text/javascript"></script>

<script language="javascript" type="text/javascript">





    function validarutvendedor() {

        if (trim(document.all("txtrutvendedor").value) == "") {
            alert('Debe ingresar rut vendedor');
            document.all("txtrutvendedor").focus();
            return false;
        }

        if (!(ChequeaRut(document.all("txtrutvendedor")))) {
            alert('Rut no es válido');
            document.all("txtrutvendedor").focus();
            document.all("txtrutvendedor").select();

            return false;
        }

        return true;

    }


    function validarut() {

        if (trim(document.all("txtrutaval").value) == "") {
            alert('Debe ingresar rut val');
            document.all("txtrutaval").focus();
            return false;
        }

        if (!(ChequeaRut(document.all("txtrutaval")))) {
            alert('Rut no es válido');
            document.all("txtrutaval").focus();
            document.all("txtrutaval").select();

            return false;
        }

        return true;

    }


    function sacafocus() {
        document.all("txtfechamora").focus();
    }

    function sacafecha() {

        if (!(trim(document.all("txtfechavcto").value) == '')) {
            var dia = '', mes = '', anio = '', aniomas = 0;
            var fecha = document.all("txtfechavcto").value

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


    function Validarepre1() {
        if (!(trim(document.all("txtrutrepre1").value) == "")) {

            if (!(ChequeaRut(document.all("txtrutrepre1")))) {
                alert('Rut no es válido');
                document.all("txtrutrepre1").value = "";
                document.all("txtrutrepre1").focus();

            }
        }

    }

    function Validarepre2() {
        if (!(trim(document.all("txtrutrepre2").value) == "")) {

            if (!(ChequeaRut(document.all("txtrutrepre2")))) {
                alert('Rut no es válido');
                document.all("txtrutrepre2").value = "";
                document.all("txtrutrepre2").focus();

            }
        }

    }

    function ValidarGuardar() {


        //        if(trim(document.all("filesubir").value) == '')
        //        {
        //          alert("Seleccione documento a digitalizar");
        //          return false;
        //        } 





        if (trim(document.all("txtrutaval").value) == "") {
            alert('Debe ingresar aval');
            document.all("txtrutaval").focus();
            return false;
        }

        if (!(ChequeaRut(document.all("txtrutaval")))) {
            alert('Rut no es válido');
            document.all("txtrutaval").focus();
            document.all("txtrutaval").select();

            return false;
        }

        if (trim(document.all("bienmueble").value) == "Seleccione") {
            alert('Debe ingresar un bien mueble');
            document.all("bienmueble").focus();
            return false;
        }


        if (!(document.all("txtrutvendedor").value == "")) {

            if (!(ChequeaRut(document.all("txtrutvendedor")))) {
                alert('Rut no es válido');
                document.all("txtrutvendedor").focus();
                document.all("txtrutvendedor").select();

                return false;
            }
        }



        if (!(document.all("txtfecha").value == "")) {

            if (!(EsFecha(document.all("txtfecha").value, 'dma'))) {
                alert('Ingrese fecha  válida, Ej. 01-09-2010');
                document.all("txtfecha").focus();
                return false;
            }
        }







        if (confirm('Esta seguro de guardar la información ?')) {
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
            width: 33px;
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
            width: 270px;
        }
        .style6
        {
            width: 252px;
        }
        .style10
        {
            height: 16px;
        }
        .style11
        {
            FONT-WEIGHT: normal;
            FONT-SIZE: 12px;
            COLOR: #493f46;
            FONT-FAMILY: "Gill Sans MT", Arial;
            width: 133px;
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
        <TABLE align=center border=0 style="width: 696px"  >
          <TBODY> 
          <TR> 
            <TD height="214" width="100%" valign="top"> 
            
            <!-- Zona de Titulo -->
            
              <TABLE borderColor=#c8e3f9 cellSpacing=0 cellPadding=0 
                        width=100% border=1>
                <TBODY> 
                <TR> 
                  <TD align="left"  bgColor=#eeeeee><b>&nbsp;<asp:Label ID="titulo" 
                          runat="server" ></asp:Label>
                      </b></TD>
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
               
                  <table border="0" bgColor=#e6ecf2 border=0 style="width: 718px">
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
                        <td align="right" class="style11" >Digitalizar :</td>
                        <td  align="left" class="style6" >
                             
                             <asp:FileUpload ID="filesubir" runat="server" 
                                 style="WIDTH: 300px; margin-left: 0px;" Enabled="False" />
                             
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
                        <td align="right" class="style11" >Cliente :</td>
                        <td  align="left" class="style6" >
                             <asp:TextBox ID="txtCliente" runat="server"  ReadOnly="true"
                                style="WIDTH: 300px; margin-left: 0px;"></asp:TextBox>
                        </td>
                        <td align="right" class="style3" ></td>
                        <td  align=left>
                            
                        </td>
                    </tr>
                    
                      <tr>
                        <td align="right" class="style11" >Nº Operación :</td>
                        <td  align="left" class="style6" >
                             <asp:TextBox ID="txtNroOperacion" runat="server"  ReadOnly="true"
                                style="WIDTH: 300px; margin-left: 0px;"></asp:TextBox>
                        </td>
                        <td align="right" class="style3" ></td>
                        <td  align=left>
                            
                        </td>
                    </tr>
                   
                      <tr>
                        <td align="right" class="style11" >Beneficiario :</td>
                        <td  align="left" class="style6" >
                           <asp:TextBox ID="txtdeudor" runat="server" ReadOnly="true"
                                style="WIDTH: 300px; margin-left: 0px;"></asp:TextBox>

                        </td>
                        
                         <td align="right" class="style3" >Rut :</td>
                        <td  align=left>
                            
                          <asp:TextBox ID="txtrutdeudor" runat="server" 
                                style="WIDTH: 100px; margin-left: 0px;" ReadOnly="True"></asp:TextBox>
                            
                        </td>
                        
                    </tr>
                    
                    
                       <tr>
                        <td align="right" class="style11" >Aval :</td>
                        <td  align="left" class="style5" >
                        

                           <asp:TextBox ID="txtnomaval" runat="server" ReadOnly="true"
                                style="WIDTH: 300px; margin-left: 0px;"></asp:TextBox>
                           
                        </td>
                        
                         <td align="right" class="style3" >Rut :</td>
                        <td  align=left class="style10">
                          
                          <asp:TextBox ID="txtrutaval" runat="server" 
                                style="WIDTH: 100px; margin-left: 0px;" 
                               ></asp:TextBox>
                           <asp:ImageButton ID="ImageButton1" runat="server" OnClientClick="return validarut();"  
                                        ImageUrl="~/images/lupa.jpg" onclick="ImageButton1_Click" />
                        </td>
                        
                    </tr>
                    
                    
                    
                    
                   <tr>
                        <td align="right" class="style11" >Ejecutivo :</td>
                        <td  align="left" class="style6" >
                          <asp:DropDownList ID="ejecutivos" runat="server"  
                                style="WIDTH: 250px; margin-left: 0px; ">
                            </asp:DropDownList>

                        </td>
                        
                         <td align="right" class="style3" ></td>
                        <td  align=left>
                            
                        </td>
                    </tr>
                     <tr>
                        <td align="right" class="style11" >Plataforma :</td>
                        <td  align="left" class="style6" >
                          
                          <asp:DropDownList ID="sucursal" runat="server"  
                                style="WIDTH: 250px; margin-left: 0px; ">
                            </asp:DropDownList>
                          
                          
                        </td>
                        <td align="right" class="style3" ></td>
                        <td  align=left>
                           
                        </td>
                    </tr>
                    
                    <tr>
                        <td align="right" class="style11" >Bien Mueble :</td>
                        <td  align="left" class="style6" >
                          <asp:UpdatePanel ID="UpdatePanel5" runat="server">
                                <ContentTemplate>
                          <asp:DropDownList ID="bienmueble" runat="server"  
                                style="WIDTH: 250px; margin-left: 0px; " AutoPostBack="True" 
                                onselectedindexchanged="bienmueble_SelectedIndexChanged">
                            </asp:DropDownList>
                            </ContentTemplate>
                                </asp:UpdatePanel> 
                          
                          
                        </td>
                        <td align="right" class="style3" ></td>
                        <td  align=left>
                           
                        </td>
                    </tr>
                    
                    <!-- -->
                    
                    
                     <tr>
                        <td align="right" class="style11" >Tipo Vehiculo :</td>
                        <td  align="left" class="style6" >
                        <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                                <ContentTemplate>
                          <asp:TextBox ID="txtTipoVehiculo" runat="server" onKeyPress="return acceptNum(event)"
                                style="WIDTH: 300px; margin-left: 0px;"></asp:TextBox>
                                </ContentTemplate>
                                </asp:UpdatePanel> 
                        </td>
                        <td align="right" class="style3" ></td>
                        <td  align=left>
                           
                        </td>
                    </tr>

                    <tr>
                        <td align="right" class="style11" >Año Fabricación :</td>
                        <td  align="left" class="style6" >
                        <asp:UpdatePanel ID="UpdatePanel2" runat="server">
                                <ContentTemplate>
                          <asp:TextBox ID="txtaniofabricacion" runat="server" onKeyPress="return acceptNum(event)"
                                style="WIDTH: 300px; margin-left: 0px;"></asp:TextBox>
                                 </ContentTemplate>
                                </asp:UpdatePanel> 
                        </td>
                        <td align="right" class="style3" ></td>
                        <td  align=left>
                           
                        </td>
                    </tr>
                    
                    <tr>
                        <td align="right" class="style11" >Patente :</td>
                        <td  align="left" class="style6" >
                        <asp:UpdatePanel ID="UpdatePanel3" runat="server">
                                <ContentTemplate>
                          <asp:TextBox ID="txtpatente" runat="server" onKeyPress="return acceptNum(event)"
                                style="WIDTH: 300px; margin-left: 0px;"></asp:TextBox>
                                 </ContentTemplate>
                                </asp:UpdatePanel> 
                        </td>
                        <td align="right" class="style3" ></td>
                        <td  align=left>
                           
                        </td>
                    </tr>
                    
                    <tr>
                        <td align="right" class="style11" >Marca :</td>
                        <td  align="left" class="style6" >
                        <asp:UpdatePanel ID="UpdatePanel4" runat="server">
                                <ContentTemplate>
                          <asp:TextBox ID="txtmarca" runat="server" onKeyPress="return acceptNum(event)"
                                style="WIDTH: 300px; margin-left: 0px;"></asp:TextBox>
                                 </ContentTemplate>
                                </asp:UpdatePanel> 
                        </td>
                        <td align="right" class="style3" ></td>
                        <td  align=left>
                           
                        </td>
                    </tr>
                    
                    <tr>
                        <td align="right" class="style11" >Nº Chassis :</td>
                        <td  align="left" class="style6" >
                        <asp:UpdatePanel ID="UpdatePanel6" runat="server">
                                <ContentTemplate>
                          <asp:TextBox ID="txtchassis" runat="server" onKeyPress="return acceptNum(event)"
                                style="WIDTH: 300px; margin-left: 0px;"></asp:TextBox>
                                 </ContentTemplate>
                                </asp:UpdatePanel> 
                        </td>
                        <td align="right" class="style3" ></td>
                        <td  align=left>
                           
                        </td>
                    </tr>
                    
                    
                    <tr>
                        <td align="right" class="style11" >Estado :</td>
                        <td  align="left" class="style6" >
                        <asp:UpdatePanel ID="UpdatePanel7" runat="server">
                                <ContentTemplate>
                          <asp:TextBox ID="txtEstado" runat="server" onKeyPress="return acceptNum(event)"
                                style="WIDTH: 300px; margin-left: 0px;"></asp:TextBox>
                                </ContentTemplate>
                                </asp:UpdatePanel> 
                        </td>
                        <td align="right" class="style3" ></td>
                        <td  align=left>
                           
                        </td>
                    </tr>
                    
                    
                    
                       <tr>
                        <td align="right" class="style11" >Proveedor Vehiculo :</td>
                        <td  align="left" class="style6" >
                          <asp:DropDownList ID="proveedor" runat="server"  
                                style="WIDTH: 250px; margin-left: 0px; ">
                            </asp:DropDownList>

                        </td>
                        
                         <td align="right" class="style3" ></td>
                        <td  align=left>
                            
                        </td>
                    </tr>
                    
                    <tr>
                        <td align="right" class="style11" >Vendedor :</td>
                        <td  align="left" class="style6" >
                          <asp:TextBox ID="txtnomvendedor" runat="server" onKeyPress="return acceptNum(event)"
                                style="WIDTH: 300px; margin-left: 0px;" ReadOnly="True"></asp:TextBox>
                        </td>
                        <td align="right" class="style3" >Rut :</td>
                        <td  align=left>
                            
                          <asp:TextBox ID="txtrutvendedor" runat="server" 
                                style="WIDTH: 100px; margin-left: 0px;"></asp:TextBox>
                        
                            <asp:ImageButton ID="ImageButton2" OnClientClick="return validarutvendedor();" runat="server" ImageUrl="~/images/lupa.jpg" 
                                onclick="ImageButton2_Click" />
                        </td>
                    </tr>
                    
                     <tr>
                        <td align="right" class="style11" >Monto :</td>
                        <td  align="left" class="style6" >
                          <asp:TextBox ID="txtmonto" runat="server" MaxLength="10" onKeyPress="return acceptNum(event)"
                                style="WIDTH: 150px; margin-left: 0px;"></asp:TextBox>
                        </td>
                        <td align="right" class="style3" ></td>
                        <td  align=left>
                           
                        </td>
                    </tr>
                   
                    
                    
                    
                   
                    
                    <tr>
                        <td align="right" class="style11" >Observación :</td>
                        <td  align="left" class="style4" colspan="3" >
                        
                          <asp:TextBox ID="txtobservacion" runat="server" 
                                style="WIDTH: 400px; margin-left: 0px;" Height="61px" TextMode="MultiLine"></asp:TextBox>
                               
                        </td>
                       
                    </tr>
                    
                     <tr>
                        <td align="right" class="style11" >Fecha :</td>
                        <td  align="left" class="style6" >
                          <asp:TextBox ID="txtfecha" runat="server"  MaxLength="10" 
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
                    
                        <asp:Button ID="btnBuscar" runat="server" CssClass="boton" Text="Guardar" OnClientClick="return ValidarGuardar();" onclick="btnBuscar_Click" 
                            
                            />
                    
                            
                      <%-- <asp:Button ID="btnGuardar" runat="server" CssClass="boton" Text="Guardar" 
                            OnClientClick="return ValidarGuardar();"  />
                            
                            <asp:Button ID="btnActualizar" runat="server" CssClass="boton" Text="Actualizar" 
                            OnClientClick="return ValidarActualizar();" Visible="False" 
                            />--%>
                   
                       <asp:Button ID="btnCancelar" runat="server" CssClass="boton" Text="Cancelar" onclick="btnCancelar_Click" 
                             />
                       
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
         
         <asp:HiddenField ID="hiddidcobranza" runat="server" />
         
         
                        <asp:HiddenField ID="CodCliente"  runat="server" />
                        
                        <asp:HiddenField ID="swCobranza"  runat="server" Value="0" />
                        <asp:HiddenField ID="hiddProceso"  runat="server" />
                        
      </FORM>
      
    </TD>
  </TR>
  </TBODY> 
</TABLE>

</body>
</html>
