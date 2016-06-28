<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ConsultaCobranza.aspx.cs" Inherits="CobranzaALC.Cobranza.ConsultaEspecial.ConsultaCobranza" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head id="Head1" runat="server">
    <title>ALC Asesorìa Legal y Crediticía Ltda</title>
    <link href="../../css/alc2.css" rel="stylesheet" type="text/css" />
    <script src="../../js/funciones.js" type="text/javascript"></script>

<script language="javascript" type="text/javascript">

    function Actividades() {
        alert('Me falta enlazar');
        return false;
    }

    function IrJudicial(url, ancho, alto) {
        pWin = window.open(url, 'newWin', 'width=' + ancho + ',height=' + alto + ',scrollbars=1,satus=0,menubar=no,top=10,left=100')
        if (window.pWin)
            pWin.focus()

        return false;
    }

    function Ir(indice) {

        //   url = 'http://localhost:1826/documentos/' + url;

        var url = '';

        if (indice == '1') {
            url = document.all("doc1").value;
        }

        if (indice == '2') {
            url = document.all("doc2").value;;
        }


        url = 'http://www.alcsa.cl/documentos/' + url;

        pWin = window.open(url, 'newWin', 'width=800,height=650,scrollbars=1,satus=0,menubar=no,top=10,left=100')
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

        if (trim(document.all("filesubir").value) == '') {
            alert("Seleccione documento a digitalizar");
            return false;
        }

        if (trim(document.all("txtRol").value) == "") {
            alert('Debe ingresar el rol');
            document.all("txtRol").focus();
            return false;
        }

        if (trim(document.all("txtFechaIngCorte").value) == "") {
            alert('Debe ingresar fecha ingreso a la corte');
            document.all("txtFechaIngCorte").focus();
            return false;
        }

        if (confirm('Esta seguro de guardar el juicio ?')) {
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
        .style1
        {
            width: 153px;
        }
        .style3
        {
            FONT-WEIGHT: normal;
            FONT-SIZE: 12px;
            COLOR: #493f46;
            FONT-FAMILY: "Gill Sans MT", Arial;
            width: 46px;
        }
        .style4
        {
            width: 346px;
        }
        .style5
        {
            FONT-WEIGHT: normal;
            FONT-SIZE: 12px;
            COLOR: #493f46;
            FONT-FAMILY: "Gill Sans MT", Arial;
            width: 68px;
        }
        .style6
        {
            FONT-WEIGHT: normal;
            FONT-SIZE: 12px;
            COLOR: #493f46;
            FONT-FAMILY: "Gill Sans MT", Arial;
            width: 91px;
        }
        .style7
        {
            FONT-WEIGHT: normal;
            FONT-SIZE: 12px;
            COLOR: #493f46;
            FONT-FAMILY: "Gill Sans MT", Arial;
            width: 165px;
        }
    </style>
 
</head>
<body>


 <TABLE cellSpacing=0 cellPadding=0 border=0 style="width: 764px">
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
      
        <TABLE width=633 align=center border=0  >
          <TBODY> 
          <TR> 
                      <!---->          
            <TD height="163" width="100%" valign="top"> 
            
            <!-- Zona de Titulo -->
            
              <TABLE borderColor=#c8e3f9 cellSpacing=0 cellPadding=0 
                        width=100% border=1>
                <TBODY> 
                <TR> 
                  <TD align="left"  bgColor=#eeeeee><b>&nbsp;CONSULTA COBRANZA POR N° OPERACION :&nbsp;<asp:Label 
                          ID="lblnrooperacion" runat="server" ></asp:Label>
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
              <table borderColor=#c8e3f9 cellSpacing=0 cellPadding=0 width=100% border=1 height="100" >
              <tr>
              <td xvalign="top">
               
                  <table border="0" bgColor="#EFF3FB" border=0 style="width: 100%">
                   <%-- <tr>
                     <td class="textos22"  colspan="4">&nbsp;</td>
                    </tr>--%>
                     <tr xbgcolor=507CD1  >
                        <td  colspan="4" >
                        <font xcolor=white><b>&nbsp;Antecedentes del Deudor</b></font>
                        </td>
                    </tr>
                    <tr>
                        <td align="left" class="style6" >&nbsp;Deudor :</td>
                        <td  align="left" class="style1" >
                            <asp:TextBox ID="txtdeudor" runat="server" 
                                style="WIDTH: 350px; margin-left: 0px;" ReadOnly="True"></asp:TextBox>
                        </td>
                        <td align="left" class="style3" >&nbsp;&nbsp;Rut :</td>
                        <td  align=left style="margin-left: 40px">
                            <asp:TextBox ID="txtrutdeudor" runat="server" 
                                style="WIDTH: 100px; margin-left: 0px;" ReadOnly="True"></asp:TextBox>
                        </td>
                    </tr>
                    
                    <tr>
                        <td align="right" class="style6" >&nbsp;Representante :</td>
                        <td  align="left" class="style1" >
                            <asp:TextBox ID="txtrepresentante" runat="server" 
                                style="WIDTH: 350px; margin-left: 0px;" ReadOnly="True"></asp:TextBox>
                        </td>
                        <td align="left" class="style3" >&nbsp;&nbsp;Rut :</td>
                        <td  align=left>
                            <asp:TextBox ID="txtrutrepresentante" runat="server" 
                                style="WIDTH: 100px; margin-left: 0px;" ReadOnly="True"></asp:TextBox>
                        </td>
                    </tr>
                    
                    <tr>
                        <td align="right" class="style6" >&nbsp;Estado :</td>
                        <td  align="left" class="style1" >
                            <asp:TextBox ID="txtestado" runat="server" 
                                style="WIDTH: 150px; margin-left: 0px;" ReadOnly="True"></asp:TextBox>
                        </td>
                        <td align="left" class="style3" >&nbsp;&nbsp;</td>
                        <td  align=left>
                            
                    </tr>
                    
                    
                  
                    
                  </table>
 
              </td>
            </tr>
            </table>
           
            <%
             string rut = Request.QueryString["rutdeudor"];
             string id_juicios = Request.QueryString["id_juicios"];   
            %>
           
 <iframe src="http://www.alcsa.cl/Cobranza/ConsultaEspecial/GrillaDomicilios.aspx?rut=<%=rut%>"
      width="100%" height="105" scrolling="auto"> Texto alternativo para navegadores que no aceptan iframes </iframe> 
 <br/><br/>
 
   <iframe src="http://www.alcsa.cl/Cobranza/ConsultaEspecial/GrillaTelefonos.aspx?rut=<%=rut%>"
      width="100%" height="105" scrolling="auto"> Texto alternativo para navegadores que no aceptan iframes </iframe> 
 
       
              <!-- Tabla Cuerpo Inicio  ::http://www.alcsa.cl/ -->
              <table borderColor=#c8e3f9 cellSpacing=0 cellPadding=0 width=633 border=1 height="100" >
              <tr>
              <td valign="top">
               
                  <table border="0" bgColor=#e6ecf2 border=0 style="width: 771px">
                    <tr>
                     <td class="textos22"  colspan="4">&nbsp;</td>
                    </tr>
                       <tr xbgcolor=507CD1  >
                        <td  colspan="4" >
                        <font xcolor=white><b>&nbsp;Antecedentes de la Cobranza</b></font>
                        </td>
                    </tr>
                    <tr>
                        <td align="left" class="style7" >Cliente :</td>
                        <td  align="left" class="style4" >
                            <asp:TextBox ID="txtcliente" runat="server" 
                                style="WIDTH: 350px; margin-left: 0px;" ReadOnly="True"></asp:TextBox>
                        </td>
                        <td align="left" class="style5" >&nbsp;</td>
                        <td  align=left style="margin-left: 40px">
                            &nbsp;</td>
                    </tr>
                    <tr>
                        <td align="left" class="style7" >N° Operación :</td>
                        <td  align="left" class="style4" >
                            <asp:TextBox ID="txtnrooperacion" runat="server" 
                                style="WIDTH: 350px; margin-left: 0px;" ReadOnly="True"></asp:TextBox>
                        </td>
                        <td align="left" class="style5" >&nbsp;</td>
                        <td  align=left style="margin-left: 40px">
                            <asp:Button ID="btnPoder" runat="server" CssClass="boton2" 
                                OnClientClick="return IrJudicial('http://www.poderjudicial.cl/index2.php?pagina1=estados_causas.php','900','650');" 
                                Text="Poder Judicial" Visible="true" />
                                                        </td>
                    </tr>
                    <tr>
                        <td align="left" class="style7" >Monto Cobranza :</td>
                        <td  align="left" class="style4" >
                            <asp:TextBox ID="txtmontocobranza" runat="server" 
                                style="WIDTH: 350px; margin-left: 0px;" ReadOnly="True"></asp:TextBox>
                        </td>
                        <td align="left" class="style5" >&nbsp;</td>
                        <td  align=left style="margin-left: 40px">
                            <asp:Button ID="btnActividades" runat="server" CssClass="boton2" 
                                OnClientClick="return Actividades();" Text="Ir a Act. Judiciales" Visible="true" />
                                                        </td>
                    </tr>
                    <tr>
                        <td align="left" class="style7" >Fecha Prescripción :</td>
                        <td  align="left" class="style4" >
                            <asp:TextBox ID="txtfechaprescripcion" runat="server" 
                                style="WIDTH: 350px; margin-left: 0px;" ReadOnly="True"></asp:TextBox>
                        </td>
                        <td align="left" class="style5" >&nbsp;</td>
                        <td  align=left style="margin-left: 40px">
                            &nbsp;</td>
                    </tr>
                    <tr>
                        <td align="left" class="style7" >Abonos :</td>
                        <td  align="left" class="style4" >
                            <asp:TextBox ID="txtabono" runat="server" 
                                style="WIDTH: 350px; margin-left: 0px;" ReadOnly="True"></asp:TextBox>
                        </td>
                        <td align="left" class="style5" >&nbsp;</td>
                        <td  align=left style="margin-left: 40px">
                            &nbsp;</td>
                    </tr>
                    
                     <tr>
                        <td align="left" class="style7" >Gastos Judiciales :</td>
                        <td  align="left" class="style4" >
                            <asp:TextBox ID="txtgastosjudiciales" runat="server" 
                                style="WIDTH: 350px; margin-left: 0px;" ReadOnly="True"></asp:TextBox>
                        </td>
                        <td align="left" class="style5" >&nbsp;</td>
                        <td  align=left style="margin-left: 40px">
                            &nbsp;</td>
                    </tr>
                    
                    <tr>
                        <td align="left" class="style7" >Gastos Administrativos :</td>
                        <td  align="left" class="style4" >
                            <asp:TextBox ID="txtgastosadministrativos" runat="server" 
                                style="WIDTH: 350px; margin-left: 0px;" ReadOnly="True"></asp:TextBox>
                        </td>
                        <td align="left" class="style5" >&nbsp;</td>
                        <td  align=left style="margin-left: 40px">
                            &nbsp;</td>
                    </tr>
                    
                    <tr>
                        <td align="left" class="style7" >Total Cobranza :</td>
                        <td  align="left" class="style4" >
                            <asp:TextBox ID="txttotalcobranza" runat="server" 
                                style="WIDTH: 350px; margin-left: 0px;" ReadOnly="True"></asp:TextBox>
                        </td>
                        <td align="left" class="style5" >&nbsp;</td>
                        <td  align=left style="margin-left: 40px">
                            &nbsp;</td>
                    </tr>
                    
                    <tr>
                        <td align="left" class="style7" >Titulo en Cobranza :</td>
                        <td  align="left" class="style4" >
                           
                            <asp:TextBox ID="txttitulocobranza" runat="server" 
                                style="WIDTH: 350px; margin-left: 0px;" ReadOnly="True"></asp:TextBox>
                            
                        </td>
                        <td align="left" class="style5" >
                             <a href="#" onclick="javascript:Ir('1');" ><asp:Image ID="Image1" runat="server" ImageUrl="~/images/b_editar.gif" ToolTip="Mostrar documento"  /></a>&nbsp;</td>
                        <td  align=left style="margin-left: 40px">
                            &nbsp;</td>
                    </tr>
                    <tr>
                        <td align="left" class="style7" >Cantidad de Documentos :</td>
                        <td  align="left" class="style4" >
                            <asp:TextBox ID="txtcantidaddedocumentos" runat="server" 
                                style="WIDTH: 350px; margin-left: 0px;" ReadOnly="True"></asp:TextBox>
                        </td>
                        <td align="left" class="style5" >&nbsp;</td>
                        <td  align=left style="margin-left: 40px">
                            &nbsp;</td>
                    </tr>
                    
                    <tr>
                        <td align="left" class="style7" >Fecha Ingreso Demanda :</td>
                        <td  align="left" class="style4" >
                            <asp:TextBox ID="txtfechaingresodemanda" runat="server" 
                                style="WIDTH: 350px; margin-left: 0px;" ReadOnly="True"></asp:TextBox>
                        </td>
                        <td align="left" class="style5" >&nbsp;</td>
                        <td  align=left style="margin-left: 40px">
                            &nbsp;</td>
                    </tr>
                    
                    <tr>
                        <td align="left" class="style7" >Dias en Cobranza :</td>
                        <td  align="left" class="style4" >
                            <asp:TextBox ID="txtdiascobranza" runat="server" 
                                style="WIDTH: 350px; margin-left: 0px;" ReadOnly="True"></asp:TextBox>
                        </td>
                        <td align="left" class="style5" >&nbsp;</td>
                        <td  align=left style="margin-left: 40px">
                            &nbsp;</td>
                    </tr>
                    
                    <tr>
                        <td align="left" class="style7" >Juzgado:</td>
                        <td  align="left" class="style4" >
                            <asp:TextBox ID="txtjuzgado" runat="server" 
                                style="WIDTH: 350px; margin-left: 0px;" ReadOnly="True"></asp:TextBox>
                        </td>
                        <td align="left" class="style5" >&nbsp;</td>
                        <td  align=left style="margin-left: 40px">
                            &nbsp;</td>
                    </tr>
                    
                    <tr>
                        <td align="left" class="style7" >Rol:</td>
                        <td  align="left" class="style4" >
                            <asp:TextBox ID="txtrol" runat="server" 
                                style="WIDTH: 350px; margin-left: 0px;" ReadOnly="True"></asp:TextBox>
                        </td>
                        <td align="left" class="style5" >
                             <a href="#" onclick="javascript:Ir('2');" ><asp:Image ID="Image2" runat="server" ImageUrl="~/images/b_editar.gif" ToolTip="Mostrar documento"  /></a>&nbsp;</td>
                        <td  align=left style="margin-left: 40px">
                            &nbsp;</td>
                    </tr>
                    
                    <tr>
                        <td align="left" class="style7" >Estado Juicio:</td>
                        <td  align="left" class="style4" >
                            <asp:TextBox ID="txtestadojuicio" runat="server" 
                                style="WIDTH: 350px; margin-left: 0px;" ReadOnly="True"></asp:TextBox>
                        </td>
                        <td align="left" class="style5" >&nbsp;</td>
                        <td  align=left style="margin-left: 40px">
                            &nbsp;</td>
                    </tr>
                    
                    <tr>
                        <td align="left" class="style7" >Último Trámite Judicial:</td>
                        <td  align="left" class="style4" >
                            <asp:TextBox ID="txtultimotramitejudi" runat="server" 
                                style="WIDTH: 350px; margin-left: 0px;" ReadOnly="True"></asp:TextBox>
                        </td>
                        <td align="left" class="style5" >&nbsp;&nbsp;Fecha :</td>
                        <td  align=left style="margin-left: 40px">
                                                       <asp:TextBox ID="txtfechaultitraju" runat="server" 
                                style="WIDTH: 100px; margin-left: 0px;" ReadOnly="True"></asp:TextBox>
                        </td>
                    </tr>
                    
                      <tr>
                        <td align="left" class="style7" >Próximo Trámite Judicial:</td>
                        <td  align="left" class="style4" >
                            <asp:TextBox ID="txtproxtramitejudi" runat="server" 
                                style="WIDTH: 350px; margin-left: 0px;" ReadOnly="True"></asp:TextBox>
                        </td>
                        <td align="left" class="style5" >&nbsp;&nbsp;Fecha :</td>
                        <td  align=left style="margin-left: 40px">
                                                       <asp:TextBox ID="txtfechaproximotrajud" runat="server" 
                                style="WIDTH: 100px; margin-left: 0px;" ReadOnly="True"></asp:TextBox>
                        </td>
                    </tr>
                    
                      <tr>
                        <td align="left" class="style7" >Abogado:</td>
                        <td  align="left" class="style4" >
                            <asp:TextBox ID="txtabogado" runat="server" 
                                style="WIDTH: 350px; margin-left: 0px;" ReadOnly="True"></asp:TextBox>
                        </td>
                        <td align="left" class="style5" >&nbsp;</td>
                        <td  align=left style="margin-left: 40px">
                            &nbsp;</td>
                    </tr>
                      <tr>
                        <td align="left" class="style7" >Procurador:</td>
                        <td  align="left" class="style4" >
                            <asp:TextBox ID="txtprocurador" runat="server" 
                                style="WIDTH: 350px; margin-left: 0px;" ReadOnly="True"></asp:TextBox>
                        </td>
                        <td align="left" class="style5" >&nbsp;</td>
                        <td  align=left style="margin-left: 40px">
                            &nbsp;</td>
                    </tr>
                    
                    <!-- FINNNNNN -->
                    
             <tr>
                     <td class="textos22"  colspan="4">&nbsp;</td>
                    </tr>
                    
                  </table>
 
              </td>
            </tr>
            </table>
            
                <!-- Tabla Cuerpo Fin -->
               <iframe src="http://www.alcsa.cl/Cobranza/ConsultaEspecial/GrillaExhorto.aspx?idjuicio=<%=id_juicios%>"
      width="100%" height="105" scrolling="auto"> Texto alternativo para navegadores que no aceptan iframes </iframe> 
 
              
            </TD>
          </TR>
          <TR> 
            <TD  valign="top" bgcolor="#CCCCCC"> 
              
              <!-- Zona de Botoneras -->
              <table width="100%" border="0" cellpadding="0" cellspacing="0">
                <tr> 
                  <td width="600" height="35" > 
                    <div align="center"> 
           <%--             <asp:Button ID="btnBuscar" runat="server" CssClass="boton" Text="Buscar" 
                            OnClientClick="return ValidarBuscar();"  
                            Visible="False" />
                            
                       <asp:Button ID="btnGuardar" runat="server" CssClass="boton" Text="Guardar" 
                            OnClientClick="return ValidarGuardar();"  />
                   
                       <asp:Button ID="btnActualizar" runat="server" CssClass="boton" Text="Actualizar" 
                            OnClientClick="return ValidarActualizar();" Visible="False"  />
                   
                       <asp:Button ID="btnEliminar" runat="server" CssClass="boton" Text="Eliminar" Visible="False"
                           
                           OnClientClick="return ValidarEliminar();"   />--%>
                   
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
          
          <asp:HiddenField ID="doc1" runat="server" />
          <asp:HiddenField ID="doc2" runat="server" />
          
          
          
      </FORM>
      
    </TD>
  </TR>
  </TBODY> 
</TABLE>

</body>
</html>