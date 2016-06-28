<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Abonos.aspx.cs" Inherits="CobranzaALC.Cobranza.Abonos.Abonos" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head id="Head1" runat="server">
    <title>ALC Asesorìa Legal y Crediticía Ltda</title>
    <link href="../../css/alc2.css" rel="stylesheet" type="text/css" />
    <script src="../../js/funciones.js" type="text/javascript"></script>

<script language="javascript" type="text/javascript">

    function MostrarDocumento(id_abono) {



        url = 'ComprobanteAbono.aspx?id_abono=' + id_abono;

        pWin = window.open(url, 'newWin', 'width=680,height=650,scrollbars=1,satus=0,menubar=no,top=10,left=100')
        if (window.pWin)
            pWin.focus()

        return false;
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




        if (trim(document.all("txtFecha").value) == "") {
            alert('Debe ingresar fecha abono');
            document.all("txtFecha").focus();
            return false;
        }


        if (!(EsFecha(document.all("txtFecha").value, 'dma'))) {
            alert('Debe ingresar fecha  válida, Ej. 01-09-2010');
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

        }//valida cheque

        var sumapagar = 0;

        sumapagar = parseFloat(document.all("txtvergastos").value) + parseFloat(document.all("txtverhonorarios").value);


        if (parseFloat(document.all("txtMontoAbono").value) < sumapagar) {
            alert('Monto de abono es menor al pago de gastos y honorarios');
            return false;
        }


        if (confirm('Esta seguro de guardar el abono ?')) {
            return true;

        } else return false;
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



        var sumapagar = 0;
        sumapagar = parseFloat(document.all("txtvergastos").value) + parseFloat(document.all("txtverhonorarios").value);

        if (sumapagar > 0) {
            alert('Debe cancelar gastos y honorarios antes de pagar letras');
            return false;
        }

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
            width: 153px;
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
                      <!---->          
            <TD height="163" width="100%" valign="top"> 
            
            <!-- Zona de Titulo -->
            
              <TABLE borderColor=#c8e3f9 cellSpacing=0 cellPadding=0 
                        width=100% border=1>
                <TBODY> 
                <TR> 
                  <TD align="left"  bgColor=#eeeeee><b>&nbsp;INGRESO ABONOS</b></TD>
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
              
              
              
             
                                
                                
                                    <asp:HiddenField ID="hiddSwPAgo" runat="server" />
              
             
                                
                                
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
                            <asp:TextBox ID="txtFecha" runat="server"  MaxLength="10"
                                style="WIDTH: 120px; margin-left: 0px;"  Width="232px"></asp:TextBox>
                        </td>
                    </tr>
                    
                    
                      <tr>
                        <td align="right" class="style2" ></td>
                        <td  align=center class="style1" colspan="4">
                        
                            <asp:Panel ID="pnlPagos" runat="server" Width="576px" >
                            <asp:Button ID="Button2" runat="server" Visible="true"  CssClass="boton2" 
                                    Text="Pagar Letras"  OnClientClick="return validagastospagados()" onclick="Button2_Click" />
                                    
                            <asp:Button ID="Button3" runat="server" Visible="false"  CssClass="boton2" 
                                    Text="Ocultar" onclick="Button3_Click" />
                                    
                                    
                                    
                                    &nbsp;&nbsp;
                                    <asp:Label  ID="lbltasa" runat="server" Text="Tasa de Interés" Visible=false></asp:Label>
                                   
                                
                       <asp:DropDownList ID="tipotasa" runat="server"   Visible=false
                                 style="WIDTH: 180px; margin-left: 0px;"> 
                                  
                              <asp:ListItem Value="TIC">Corriente</asp:ListItem>
                             
                            </asp:DropDownList>
                            
                         </asp:Panel>
                        </td>
                      </tr>  
                    
                      <tr>
                        <td align="right" class="style2" ></td>
                        <td  align=center class="style1" colspan="4">
                       
                            
                         <asp:Panel ID="pnlLetras" runat="server" Visible=false  >
                        
                            
                             
                              <asp:GridView ID="grillapagletras" runat="server" 
                                          OnRowCommand="Habilitar"
                                         AllowPaging="True"  
                                         PageSize="1"
                                         AutoGenerateColumns="False"
                                         Width="500" 
                                        
                                         CellPadding="4" ForeColor="#333333" 
                                         GridLines="None" 
                                  > 
                            <Columns>
                          
                            <asp:TemplateField HeaderText="">
                                <HeaderStyle Wrap="true" Width="70"></HeaderStyle>
                                <ItemStyle Wrap="false" ></ItemStyle>
                                <ItemTemplate>
                                <asp:Label Visible=false ID="lblCodigo" runat="server" Text='<%# Bind("id") %>' SortExpression = "Codigo" SortDirection="ASC"></asp:Label>
                              </ItemTemplate>
                             </asp:TemplateField>
                             
                              <asp:TemplateField HeaderText="N° Doc.">
                                <HeaderStyle Wrap="true" Width="70"></HeaderStyle>
                                <ItemStyle Wrap="false" ></ItemStyle>
                                <ItemTemplate>
                                <asp:Label ID="lblnrodoc" runat="server" Text='<%# Bind("nrodoc") %>' SortExpression = "Codigo" SortDirection="ASC"></asp:Label>
                              </ItemTemplate>
                             </asp:TemplateField>
                      
                             <asp:TemplateField    HeaderText="Monto">
                             <HeaderStyle Wrap="true" Width="490"></HeaderStyle>
                             <ItemStyle Wrap="false" ></ItemStyle>
                              <ItemTemplate>
                               <asp:Label ID="lblNombre1" runat="server" Text='<%# Bind("monto") %>' SortExpression = "Descripcion" SortDirection="ASC"></asp:Label>
                              </ItemTemplate>
                             </asp:TemplateField>
                             
                             <asp:TemplateField    HeaderText="F. Vencimiento">
                             <HeaderStyle Wrap="true" Width="490"></HeaderStyle>
                             <ItemStyle Wrap="false" ></ItemStyle>
                              <ItemTemplate>
                               <asp:Label ID="lblNombre1m" runat="server" Text='<%# Bind("fvencimiento") %>' SortExpression = "Descripcion" SortDirection="ASC"></asp:Label>
                              </ItemTemplate>
                             </asp:TemplateField>
                             
                             
                             <asp:TemplateField    HeaderText="N° Cuota">
                             <HeaderStyle Wrap="true" Width="490"></HeaderStyle>
                             <ItemStyle Wrap="false" ></ItemStyle>
                              <ItemTemplate>
                               <asp:Label ID="lblNombre2" runat="server" Text='<%# Bind("nrocuota") %>' SortExpression = "Descripcion" SortDirection="ASC"></asp:Label>
                              </ItemTemplate>
                             </asp:TemplateField>
                          
                           
                            <asp:TemplateField HeaderText="Pagar Letra"   >
                            <HeaderStyle  HorizontalAlign="Center"></HeaderStyle>
                             <ItemStyle  HorizontalAlign="Center"></ItemStyle>
                              <ItemTemplate>
                               <asp:ImageButton ID="ImageButton1" Width="19" Height="19" ToolTip="Haga click para pagar letra" runat="server" ImageUrl="~/images/peso.jpg"  OnClientClick="return confirm('¿Está seguro que desea pagar está letra ?')" CommandName="Habilitar" />
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
                            
                           </asp:Panel>
                            
                         
                           
                        </td>
                    </tr>
                    
                  <tr   class="styletd" >
                    <td colspan=5 align=center>
                      Capital : 
                      <asp:TextBox ID="txtvercapital" runat="server" 
                                style="WIDTH: 100px; margin-left: 0px;text-align:right" ReadOnly=true ></asp:TextBox>
                                &nbsp;&nbsp;
                                Gastos (Adm-Jud-PreJud) : 
                      <asp:TextBox ID="txtvergastos" runat="server"  ReadOnly=true
                                style="WIDTH: 100px; margin-left: 0px;text-align:right" ></asp:TextBox>
                                &nbsp;&nbsp;
                                Honorarios :
                                  <asp:TextBox ID="txtverhonorarios"  runat="server"  ReadOnly=true Text="0" 
                                style="WIDTH: 100px; margin-left: 0px;text-align:right" ></asp:TextBox>
                        <asp:CheckBox ID="chkHonorarios" runat="server" AutoPostBack=true 
                            oncheckedchanged="chkHonorarios_CheckedChanged" />
                    </td>
                    
                  </tr>
                  
                    <tr>
                        <td align="right" class="style2" ><%--Total Cobranza:--%></td>
                        <td  align=left class="style1" >
                            <%--<asp:TextBox ID="txtSaldoCobranza" runat="server" 
                                style="WIDTH: 150px; margin-left: 0px;text-align:right"  Width="232px" ReadOnly="True"></asp:TextBox>--%>
                        </td>
                        
                        <td align="right" class="style4" >&nbsp;</td>
                        <td  align=left class="style1" >
                            &nbsp;</td>
                    </tr>
                    
                    
                      <tr>
                        <td align="right" class="style2" ><%--Total Abonos:--%></td>
                        <td  align=left class="style1" >
                          <%-- <asp:TextBox ID="txtSaldoAbono" runat="server" 
                                style="WIDTH: 150px; margin-left: 0px;text-align:right"  Width="232px" ReadOnly="True"></asp:TextBox>--%>
                         
                        </td>
                        
                        <td align="right" class="style4" >&nbsp;</td>
                        <td  align=left class="style1" >
                          
                    </tr>
                    
                     <tr>
                        <td align="right" class="style2" ><%--<b>SALDO COBRANZA:</b>--%></td>
                        <td  align=left class="style1" >
                        <b>
                           <%-- <asp:TextBox ID="txtSaldoCobranza2" runat="server" 
                                style="WIDTH: 150px; margin-left: 0px;text-align:right"  Width="232px" ReadOnly="True"></asp:TextBox>--%>
                        </b>
                        </td>
                        
                        <td align="right" class="style4" ></td>
                        <td  align=left class="style1" >
                           
                        </td>
                    </tr>
                    
                     <tr>
                       <td colspan="4" align="center" >
                        
                        
                           
                       </td>
                     </tr>
                    
                    
                    
                     <tr>
                        <td align="right" class="style2" >Monto Abono:</td>
                        <td  align=left class="style1" >
                            <asp:TextBox ID="txtMontoAbono" runat="server" MaxLength="9" onKeyPress="return acceptNum(event)"
                                style="WIDTH: 150px; margin-left: 0px;"  Width="232px"></asp:TextBox>
                        </td>
                        
                        
                         <td align="right" class="style4" >Tipo Comprobante:</td>
                        <td  align="left" >
                        
                          <asp:DropDownList ID="TipoComprobante" runat="server"  
                                 style="WIDTH: 180px; margin-left: 0px;" 
                                  >
                              <asp:ListItem Value="1">Ingreso</asp:ListItem>
                              <asp:ListItem Value="2">Egreso</asp:ListItem>
                            </asp:DropDownList>
                        </td>
                        
                        
                        
                    </tr>
                     <tr>
                        <td align="right" class="style2" >Concepto Abono :</td>
                        <td  align=left class="style1">
                             <asp:DropDownList ID="ConceptoAbono" runat="server"  
                                 style="WIDTH: 180px; margin-left: 0px;" AutoPostBack="True" 
                                 onselectedindexchanged="ConceptoAbono_SelectedIndexChanged" >
                            </asp:DropDownList>
                        </td>
                         <td align="right" class="style4" >Boleta Honorarios:</td>
                        <td  align="left" >
                        
                        <asp:TextBox ID="txtBoletaHonorarios" runat="server" MaxLength="40" 
                                style="WIDTH: 200px; margin-left: 0px;"  Width="232px"></asp:TextBox>
                        </td>
                    </tr>
                   
                   <tr>
                        <td align="right" class="style2" >Tipo Moneda :</td>
                        <td  align=left class="style1">
                             <asp:DropDownList ID="tipomoneda" runat="server"  
                                 style="WIDTH: 180px; margin-left: 0px;" AutoPostBack="True" onselectedindexchanged="tipomoneda_SelectedIndexChanged" 
                                  >
                            </asp:DropDownList>
                        </td>
                        
                         <td align="right" class="style4"  >Girador :</td>
                        <td  align="left" >
                        
                         <asp:UpdatePanel ID="UpdatePanel5" runat="server">
                                <ContentTemplate>
                            <asp:TextBox ID="txtGirador" runat="server"  
                                style="WIDTH: 150px; margin-left: 0px;" 
                                 ></asp:TextBox>
                                
                                    <asp:ImageButton ID="ImageButton1" runat="server" OnClientClick="return validarut();"  
                                        ImageUrl="images/lupa.jpg" onclick="ImageButton1_Click" />
                                
 </ContentTemplate>
                                </asp:UpdatePanel> 
                                </td>
                            
                            
                            
                    </tr>
                   
                   <tr>
                        <td align="right" class="style2" >Banco:</td>
                        <td  align=left class="style1">
                             <asp:DropDownList ID="banco" runat="server"  
                                 style="WIDTH: 180px; margin-left: 0px;" AutoPostBack="True" onselectedindexchanged="banco_SelectedIndexChanged" 
                                  >
                            </asp:DropDownList>
                        </td>
                         <td align="right" class="style4" >Nombre Girador :</td>
                        <td  align="left" >
                        
 <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                                <ContentTemplate>

                                                    <asp:TextBox ID="txtnomgirador" runat="server" 
                                style="WIDTH: 300px; margin-left: 0px;" Enabled="False" ></asp:TextBox>
                                
                                
 </ContentTemplate>
                                </asp:UpdatePanel> 
                                
                        </td>
                    </tr>
                       <tr>
                        <td  align="right" class="style2" >Fecha Pago:</td>
                        <td  align=left class="style1" >
                            <asp:TextBox ID="txtFechaPago" runat="server" MaxLength="10" 
                                style="WIDTH: 150px; margin-left: 0px;"  Width="232px"></asp:TextBox>
                        </td>
                        
                        <td align="right" class="style4" >Documento:</td>
                        <td  align=left class="style1" >
                           
                            <asp:DropDownList ID="docuno" runat="server">
                                <asp:ListItem>1</asp:ListItem>
                                <asp:ListItem>2</asp:ListItem>
                                <asp:ListItem>3</asp:ListItem>
                                <asp:ListItem>4</asp:ListItem>
                                <asp:ListItem>5</asp:ListItem>
                                <asp:ListItem>6</asp:ListItem>
                            </asp:DropDownList>
                        <font class="style2" >De</font>
                        <asp:DropDownList ID="docdos" runat="server">
                                <asp:ListItem>1</asp:ListItem>
                                <asp:ListItem>2</asp:ListItem>
                                <asp:ListItem>3</asp:ListItem>
                                <asp:ListItem>4</asp:ListItem>
                                <asp:ListItem>5</asp:ListItem>
                                <asp:ListItem>6</asp:ListItem>
                            </asp:DropDownList>
                        </td>
                        
                        
                        
                    </tr>
                   
                       <tr>
                        <td align="right" class="style2" >Nº Cheque:</td>
                        <td  align=left class="style1" colspan="3">
                            <asp:TextBox ID="txtNroCheque" runat="server" MaxLength="30" 
                                style="WIDTH: 200px; margin-left: 0px;"  Width="232px"></asp:TextBox>
                        </td>
                    </tr>
                   
                     <tr>
                        <td align="right" class="style2" >Serie:</td>
                        <td  align=left class="style1" colspan="3">
                            <asp:TextBox ID="txtSerie" runat="server" MaxLength="40" 
                                style="WIDTH: 200px; margin-left: 0px;"  Width="232px"></asp:TextBox>
                        </td>
                    </tr>
                   
                     <tr  >
                        <td align="right" class="style2"   >Observaciòn :</td>
                        <td  align="left" class="style1" colspan="3" >
                           <asp:TextBox ID="txtObservacion" runat="server" 
                                style="WIDTH: 400px; margin-left: 0px;" TextMode="MultiLine" Width="180px" 
                                Rows="5"></asp:TextBox>

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
                  
                  
                       <asp:Button ID="Button1" runat="server" Visible="false"  CssClass="boton2" Text="Imprime Abono" 
                            OnClientClick="return Ir();" onclick="Button1_Click"  />
                            
                  
                       <asp:Button ID="btnGuardar" runat="server" CssClass="boton2" Text="Guardar Abono" 
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
          <tr>
            <td>
                        <TABLE borderColor=#c8e3f9 cellSpacing=0 cellPadding=0 
                        width=100% border=1>
                <TBODY> 
                <TR> 
                  <TD align="left"  bgColor=#eeeeee><b>&nbsp;<%--RESUMEN COBRANZA Y ABONOS--%></b></TD>
                </TR>
                </TBODY> 
              </TABLE>
               
            </td>
          </tr>
           
            <TR> 
            <TD  valign="top" xbgcolor="#CCCCCC"> 
                               <%-- <asp:GridView ID="grillaresumen" runat="server" 
                                         EmptyDataText="<b>No existe información</b>"
                                          
                                         AllowPaging="True"  
                                         PageSize="3"
                                         AutoGenerateColumns="False"
                                         Width="100%" 
                                         CellPadding="4" ForeColor="#333333" 
                                         GridLines="None" style="margin-right: 0px"> 
                            <Columns>
                          
                              <asp:TemplateField HeaderText="Capital">
                                <HeaderStyle Wrap="true" Width="90" HorizontalAlign=Left></HeaderStyle>
                                <ItemStyle Wrap="false" ></ItemStyle>
                                <ItemTemplate>
                                <asp:Label ID="lblCodigo" runat="server" Text='<%# Bind("capital") %>' SortExpression = "Codigo" SortDirection="ASC"></asp:Label>
                              </ItemTemplate>
                             </asp:TemplateField>
                      
                      
                            
                      
                      
                      
                             <asp:TemplateField    HeaderText="Intereses">
                             <HeaderStyle Wrap="true" Width="90" HorizontalAlign=Left></HeaderStyle>
                             <ItemStyle Wrap="false" ></ItemStyle>
                              <ItemTemplate>
                               <asp:Label ID="lblNombre" runat="server" Text='<%# Bind("intereses") %>' SortExpression = "Descripcion" SortDirection="ASC"></asp:Label>
                              </ItemTemplate>
                             </asp:TemplateField>
                             
                             <asp:TemplateField    HeaderText="Gastos (Adm-Judi-PreJudi)">
                             <HeaderStyle Wrap="true" Width="90" HorizontalAlign=Left></HeaderStyle>
                             <ItemStyle Wrap="false" ></ItemStyle>
                              <ItemTemplate>
                               <asp:Label ID="lblNombre" runat="server" Text='<%# Bind("gastos") %>' SortExpression = "Descripcion" SortDirection="ASC"></asp:Label>
                              </ItemTemplate>
                             </asp:TemplateField>
                             
                             
                               <asp:TemplateField    HeaderText="Honorarios">
                             <HeaderStyle Wrap="true" Width="90" HorizontalAlign=Left></HeaderStyle>
                             <ItemStyle Wrap="false" ></ItemStyle>
                              <ItemTemplate>
                               <asp:Label ID="lblNombre" runat="server" Text='<%# Bind("honorarios") %>' SortExpression = "Descripcion" SortDirection="ASC"></asp:Label>
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
                            </asp:GridView>--%>
                                
          </TD>
          </TR>
          
           <%-- <tr>
            <td>
                        <TABLE borderColor=#c8e3f9 cellSpacing=0 cellPadding=0 
                        width=100% border=1>
                <TBODY> 
                <TR> 
                  <TD align="left"  bgColor=#eeeeee><b>&nbsp;DETALLE SUB TOTAL ABONOS</b></TD>
                </TR>
                </TBODY> 
              </TABLE>
               
            </td>
          </tr>--%>
           
            <TR> 
            <TD  valign="top" xbgcolor="#CCCCCC"> 
                                <%--<asp:GridView ID="grillaabonos" runat="server" 
                                         EmptyDataText="<b>No existe información</b>"
                                          
                                         AllowPaging="True"  
                                         PageSize="3"
                                         AutoGenerateColumns="False"
                                         Width="100%" 
                                         CellPadding="4" ForeColor="#333333" 
                                         GridLines="None" style="margin-right: 0px"> 
                            <Columns>
                          
                              <asp:TemplateField HeaderText="Abonos">
                                <HeaderStyle Wrap="true" Width="90" HorizontalAlign=Left></HeaderStyle>
                                <ItemStyle Wrap="false" ></ItemStyle>
                                <ItemTemplate>
                                <asp:Label ID="lblCodigo" runat="server" Text='<%# Bind("abonos") %>' SortExpression = "Codigo" SortDirection="ASC"></asp:Label>
                              </ItemTemplate>
                             </asp:TemplateField>
                      
                          
                              <asp:TemplateField HeaderText="Desc. Intereses">
                                <HeaderStyle Wrap="true" Width="90" HorizontalAlign=Left></HeaderStyle>
                                <ItemStyle Wrap="false" ></ItemStyle>
                                <ItemTemplate>
                                <asp:Label ID="lblCodigo" runat="server" Text='<%# Bind("descuentointereses") %>' SortExpression = "Codigo" SortDirection="ASC"></asp:Label>
                              </ItemTemplate>
                             </asp:TemplateField>
                      
                      
                            
                      
                      
                      
                             <asp:TemplateField    HeaderText="Desc. Honorarios">
                             <HeaderStyle Wrap="true" Width="90" HorizontalAlign=Left></HeaderStyle>
                             <ItemStyle Wrap="false" ></ItemStyle>
                              <ItemTemplate>
                               <asp:Label ID="lblNombre" runat="server" Text='<%# Bind("descuentohonorarios") %>' SortExpression = "Descripcion" SortDirection="ASC"></asp:Label>
                              </ItemTemplate>
                             </asp:TemplateField>
                             
                             <asp:TemplateField    HeaderText="Otros Descuentos">
                             <HeaderStyle Wrap="true" Width="90" HorizontalAlign=Left></HeaderStyle>
                             <ItemStyle Wrap="false" ></ItemStyle>
                              <ItemTemplate>
                               <asp:Label ID="lblNombre" runat="server" Text='<%# Bind("otrodescuentos") %>' SortExpression = "Descripcion" SortDirection="ASC"></asp:Label>
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
                            </asp:GridView>--%>
                                
          </TD>
          </TR>
          
        <%--  <tr>
            <td>
                        <TABLE borderColor=#c8e3f9 cellSpacing=0 cellPadding=0 
                        width=100% border=1>
                <TBODY> 
                <TR> 
                  <TD align="left"  bgColor=#eeeeee><b>&nbsp;DETALLE CAPITAL</b></TD>
                </TR>
                </TBODY> 
              </TABLE>
               
            </td>
          </tr>--%>
          
          <%--  <TR> 
            <TD  valign="top" xbgcolor="#CCCCCC"> 
                                <asp:GridView ID="Grilla2" runat="server" 
                                         EmptyDataText="<b>No existen cuotas registradas</b>"
                                          
                                         AllowPaging="True"  
                                         PageSize="1000"
                                         AutoGenerateColumns="False"
                                         Width="100%" 
                                         CellPadding="4" ForeColor="#333333" 
                                         GridLines="None" style="margin-right: 0px"> 
                            <Columns>
                          
                              <asp:TemplateField HeaderText="N° Documento">
                                <HeaderStyle Wrap="true" Width="180" HorizontalAlign=Left></HeaderStyle>
                                <ItemStyle Wrap="false" ></ItemStyle>
                                <ItemTemplate>
                                <asp:Label ID="lblCodigo" runat="server" Text='<%# Bind("nrodocumento") %>' SortExpression = "Codigo" SortDirection="ASC"></asp:Label>
                              </ItemTemplate>
                             </asp:TemplateField>
                      
                             <asp:TemplateField    HeaderText="N° Cuota">
                             <HeaderStyle Wrap="true" Width="100" HorizontalAlign=Left></HeaderStyle>
                             <ItemStyle Wrap="false" ></ItemStyle>
                              <ItemTemplate>
                               <asp:Label ID="lblNombre" runat="server" Text='<%# Bind("nrocuota") %>' SortExpression = "Descripcion" SortDirection="ASC"></asp:Label>
                              </ItemTemplate>
                             </asp:TemplateField>
                             
                             <asp:TemplateField    HeaderText="Fecha Vcto.">
                             <HeaderStyle Wrap="true" Width="100" HorizontalAlign=Left></HeaderStyle>
                             <ItemStyle Wrap="false" ></ItemStyle>
                              <ItemTemplate>
                               <asp:Label ID="lblNombre" runat="server" Text='<%# Bind("fechavencimiento") %>' SortExpression = "Descripcion" SortDirection="ASC"></asp:Label>
                              </ItemTemplate>
                             </asp:TemplateField>
                             
                              <asp:TemplateField    HeaderText="Monto Documento">
                             <HeaderStyle Wrap="true" HorizontalAlign=Left></HeaderStyle>
                             <ItemStyle Wrap="false" ></ItemStyle>
                              <ItemTemplate>
                               <asp:Label ID="lblNombre" runat="server" Text='<%# Bind("montocapital") %>' SortExpression = "Descripcion" SortDirection="ASC"></asp:Label>
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
                                
          </TD>
          </TR>--%>
          
          
          
          
          <tr>
            <td>
                        <TABLE borderColor=#c8e3f9 cellSpacing=0 cellPadding=0 
                        width=100% border=1>
                <TBODY> 
                <TR> 
                  <TD align="left"  bgColor=#eeeeee><b>&nbsp;DETALLE ABONOS</b></TD>
                </TR>
                </TBODY> 
              </TABLE>
               
            </td>
          </tr>
          
           <!-- Inicio -->
           
           
           
          
          <!-- Inicio -->
          
          <TR> 
            <TD  valign="top" xbgcolor="#CCCCCC"> 
                                <asp:GridView ID="Grilla" runat="server" 
                                         EmptyDataText="<b>No existen abonos registrados</b>"
                                          
                                         AllowPaging="True"  
                                         PageSize="1000"
                                         AutoGenerateColumns="False"
                                         Width="100%" 
                                         CellPadding="4" ForeColor="#333333" 
                                         GridLines="None" style="margin-right: 0px"> 
                            <Columns>
                          
                              <asp:TemplateField HeaderText="Concepto Abono">
                                <HeaderStyle Wrap="true" Width="180" HorizontalAlign=Left></HeaderStyle>
                                <ItemStyle Wrap="false" ></ItemStyle>
                                <ItemTemplate>
                                <asp:Label ID="lblCodigo" runat="server" Text='<%# Bind("concepto") %>' SortExpression = "Codigo" SortDirection="ASC"></asp:Label>
                              </ItemTemplate>
                             </asp:TemplateField>
                      
                             <asp:TemplateField    HeaderText="Monto Abono">
                             <HeaderStyle Wrap="true" Width="100" HorizontalAlign=Left></HeaderStyle>
                             <ItemStyle Wrap="false" ></ItemStyle>
                              <ItemTemplate>
                               <asp:Label ID="lblNombre" runat="server" Text='<%#Evaluar(Eval("montoabono")) %>' SortExpression = "Descripcion" SortDirection="ASC"></asp:Label>
                              </ItemTemplate>
                             </asp:TemplateField>
                             
                             <asp:TemplateField    HeaderText="Fecha">
                             <HeaderStyle Wrap="true" Width="100" HorizontalAlign=Left></HeaderStyle>
                             <ItemStyle Wrap="false" ></ItemStyle>
                              <ItemTemplate>
                               <asp:Label ID="lblNombre" runat="server" Text='<%# Bind("fecha") %>' SortExpression = "Descripcion" SortDirection="ASC"></asp:Label>
                              </ItemTemplate>
                             </asp:TemplateField>
                             
                              <asp:TemplateField    HeaderText="Tipo Moneda">
                             <HeaderStyle Wrap="true" HorizontalAlign=Left ></HeaderStyle>
                             <ItemStyle Wrap="false" ></ItemStyle>
                              <ItemTemplate>
                               <asp:Label ID="lblNombre" runat="server" Text='<%# Bind("moneda") %>' SortExpression = "Descripcion" SortDirection="ASC"></asp:Label>
                              </ItemTemplate>
                             </asp:TemplateField>
                             
                              <asp:TemplateField    HeaderText="Fecha Pago">
                             <HeaderStyle Wrap="true" HorizontalAlign=Left ></HeaderStyle>
                             <ItemStyle Wrap="false" ></ItemStyle>
                              <ItemTemplate>
                               <asp:Label ID="lblNombre" runat="server" Text='<%# Bind("fechapago") %>' SortExpression = "Descripcion" SortDirection="ASC"></asp:Label>
                              </ItemTemplate>
                             </asp:TemplateField>
                             
                              <asp:TemplateField    HeaderText="Boleta Honorarios">
                             <HeaderStyle Wrap="true" HorizontalAlign=Left></HeaderStyle>
                             <ItemStyle Wrap="false" ></ItemStyle>
                              <ItemTemplate>
                               <asp:Label ID="lblNombre" runat="server" Text='<%# Bind("boleta") %>' SortExpression = "Descripcion" SortDirection="ASC"></asp:Label>
                              </ItemTemplate>
                             </asp:TemplateField>
                             
                             
                            <asp:TemplateField HeaderText="Imprimir Comprobante"  >
                              <ItemTemplate>
                               <a href="#" onclick="javascript:MostrarDocumento('<%# Eval("id_abono")%>');" ><asp:Image ID="Image1" runat="server" ImageUrl="~/images/lupa.jpg" ToolTip="Ver Comprobante Abono"  /></a> 
                              </ItemTemplate>
                             </asp:TemplateField>
                          <%-- 
                            <asp:TemplateField HeaderText="Eliminar"   >
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
                                
          </TD>
          </TR>
          
          
          
          <!-- fin -->
          
          </TBODY> 
        </TABLE>
        <div align="center"><font size="2"><%--  <asp:TemplateField HeaderText="Ver"  >
                              <ItemTemplate>
                               <a href="#" onclick="javascript:MostrarDocumento('<%# Eval("urldocumento")%>');" ><asp:Image ID="Image1" runat="server" ImageUrl="~/images/lupa.jpg" ToolTip="Ver Documento"  /></a> 
                              </ItemTemplate>
                             </asp:TemplateField>
                           
                            <asp:TemplateField HeaderText="Eliminar"   >
                            <HeaderStyle  HorizontalAlign="Center"></HeaderStyle>
                             <ItemStyle  HorizontalAlign="Center"></ItemStyle>
                              <ItemTemplate>
                               <asp:ImageButton ID="ImageButton1" runat="server" ImageUrl="~/images/b_borrar.gif"  OnClientClick="return confirm('¿Está seguro que desea eliminar documento ?')" CommandName="Deshabilitar" />
                              </ItemTemplate>
                             </asp:TemplateField>--%>
          </font> </div>
          <asp:HiddenField ID="hiddidcobranza" runat="server" />
          
         
          <asp:HiddenField ID="hiddConcepto" runat="server" />
          <asp:HiddenField ID="hiddTipoMoneda" runat="server" />
          <asp:HiddenField ID="hiddBanco" runat="server" />
          
          
          
          
          
          
          
      </FORM>
      
    </TD>
  </TR>
  </TBODY> 
</TABLE>

</body>
</html>

