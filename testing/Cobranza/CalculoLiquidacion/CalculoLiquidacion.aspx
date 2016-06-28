<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="CalculoLiquidacion.aspx.cs" Inherits="CobranzaALC.Cobranza.CalculoLiquidacion.CalculoLiquidacion" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head id="Head1" runat="server">
    <title>ALC Asesorìa Legal y Crediticía Ltda</title>
     <link href="../../css/alc2.css" rel="stylesheet" type="text/css" />
    <script src="../../js/funciones.js" type="text/javascript"></script>

<script language="javascript" type="text/javascript">

    function calcular() {
        var suma = 0;
        var resta = 0;
        var total = 0;
        var intereses = 0;
        var honorarios = 0;

        /////////////////////////
        //alert(document.all("lblhonorarios").value);
        //alert(document.all("txtCapital").value);
        ////////////////




        intereses = parseFloat(document.all("txtCapital").value.replace(".", "")) * parseFloat(document.all("lblintereses").value);
        honorarios = parseFloat(document.all("txtCapital").value.replace(".", "")) * parseFloat(document.all("lblhonorarios").value);

        alert('INTERESES   : ' + intereses.toString());
        alert('HONORARIOS  : ' + honorarios.toString());

        suma = parseFloat(document.all("txtCapital").value.replace(".", "")) + parseFloat(document.all("lbladmin").value.replace(".", "")) + parseFloat(document.all("lbljudi").value.replace(".", "")) + parseFloat(document.all("lblpre").value.replace(".", "")) + intereses + honorarios;
        resta = parseFloat(document.all("lbldescuentointereses").value) + parseFloat(document.all("lbldescuentohonorarios").value) + parseFloat(document.all("lblotrosdescuentos").value) + parseFloat(document.all("lblabonos").value.replace(".", ""));




        total = suma - resta;

        document.all("TOTAL").value = AddPuntoMil(total.toString().replace(".", ","));


    }

    function AddPuntoMil(nStr) {
        nStr += '';
        x = nStr.split(',');
        x1 = x[0];
        x2 = x.length > 1 ? ',' + x[1] : '';
        var rgx = /(\d+)(\d{3})/;
        while (rgx.test(x1)) {
            x1 = x1.replace(rgx, '$1' + '.' + '$2');
        }
        return x1 + x2;
    }

    function SumarTotal() {

        document.all("TOTAL").value = "0";

        var Total = 0;
        var frm = document.forms[0];


        for (i = 0; i < frm.elements.length; i++) {
            if (frm.elements[i].type == "checkbox") {
                if (frm.elements[i].checked) {
                    //alert(frm.elements[i].value);
                    Total = parseFloat(Total) + parseFloat(frm.elements[i].value);
                }
            }
        }

        document.all("txtCapital").value = Total.toString();  //AddPuntoMil(Total.toString()); 

        //http://soporte.miarroba.es/152498/7230775-sumar-valor-de-checkbox-de-formulario/      

    }



    function Actividades() {

        var valor = '';
        var url = '';

        valor = document.all("hiddCobranza").value;
        url = '../Procesos/MostrarActividadesPrejudiciales.aspx?Codigo=' + valor;

        Ir(url, '900', '650');

        return false;
    }


    function Ir(url, ancho, alto) {
        pWin = window.open(url, 'newWin', 'width=' + ancho + ',height=' + alto + ',scrollbars=1,satus=0,menubar=no,top=10,left=100')
        if (window.pWin)
            pWin.focus()

        return false;
    }

   </script>
    

    <style type="text/css">
        .style1
        {
            width: 118px;
        }
        .style2
        {
            width: 118px;
            height: 16px;
        }
        .style3
        {
            height: 16px;
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
      
        <TABLE align=center border=0 style="width: 720px"  >
          <TBODY> 
          <TR> 
                      <!---->          
            <TD height="163" width="100%" valign="top"> 
            
            <!-- Zona de Titulo -->
            
              <TABLE borderColor=#c8e3f9 cellSpacing=0 cellPadding=0 
                        width=100% border=1>
                <TBODY> 
                <TR> 
                  <TD align="left"  bgColor=#eeeeee><b>&nbsp;LIQUIDACIÓN AL 
                      <asp:Label ID="fechita" runat="server" Text="Label"></asp:Label>
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
               
                 
 
 
 
   <TABLE class=celdas  style="width: 720px"
style="BORDER-RIGHT: #006699; BORDER-TOP: #006699; BORDER-LEFT: #006699; BORDER-BOTTOM: #006699" 
cellSpacing=0 cellPadding=0 width="100%" bgColor=#cfe4ee border=0>
    <TBODY> 
    <TR bgColor=#333366> 
      <TD colSpan=2><B><font color="#FFFFFF">&nbsp;<font size="2">INFORMACION COBRANZA</font></font></B></TD>
    </TR>
 
 
  <TR>
      <TD vAlign=top bgColor=#0080c0 class="style1"><FONT 
      color=#ffffff>&nbsp;&nbsp;<B><font size="2">Cliente</font></B></FONT></TD>
      <TD vAlign=top><font size="2">&nbsp;
          <asp:Label ID="lblCliente" runat="server" ></asp:Label>
        </font></TD>
    </TR>
 
 <TR>
      <TD vAlign=top bgColor=#0080c0 class="style1"><FONT 
      color=#ffffff>&nbsp;&nbsp;<B><font size="2">Deudor</font></B></FONT></TD>
      <TD vAlign=top><font size="2">&nbsp;
          <asp:Label ID="lblDeudor" runat="server" ></asp:Label>
        </font></TD>
    </TR>
    <TR>
      <TD vAlign=top bgColor=#0080c0 class="style1"><FONT 
      color=#ffffff>&nbsp;&nbsp;<B><font size="2">Rut Deudor</font></B></FONT></TD>
      <TD vAlign=top><font size="2">&nbsp;
          <asp:Label ID="lblRutDeudor" runat="server" ></asp:Label>
        </font></TD>
    </TR>
    <TR>
      <TD vAlign=top bgColor=#0080c0 class="style1"><FONT 
      color=#ffffff>&nbsp;&nbsp;<B><font size="2">N° Operación</font></B></FONT></TD>
      <TD vAlign=top><font size="2">&nbsp;
          <asp:Label ID="lblnrooperacion" runat="server" ></asp:Label>
        </font></TD>
    </TR>
    <TR>
      <TD vAlign=top bgColor=#0080c0 class="style1"><FONT 
      color=#ffffff>&nbsp;&nbsp;<B><font size="2">Tipo</font></B></FONT></TD>
      <TD vAlign=top><font size="2">&nbsp;
          <asp:Label ID="lbltipo" runat="server" ></asp:Label>
        </font></TD>
    </TR>
    
    <TR>
      <TD vAlign=top bgColor=#0080c0 class="style1"><FONT 
      color=#ffffff>&nbsp;&nbsp;<B><font size="2">Tribunal</font></B></FONT></TD>
      <TD vAlign=top><font size="2">&nbsp;
          <asp:Label ID="lbltribunal" runat="server" ></asp:Label>
        </font></TD>
    </TR>
  
    <TR>
      <TD vAlign=top bgColor=#0080c0 class="style2"><FONT 
      color=#ffffff>&nbsp;&nbsp;<B><font size="2">Rol</font></B></FONT></TD>
      <TD vAlign=top class="style3"><font size="2">&nbsp;
          <asp:Label ID="lblRol" runat="server" ></asp:Label>
        </font></TD>
    </TR>
    
      <TR bgColor=#333366> 
      <TD colSpan=2><B><font color="#FFFFFF">&nbsp;<font size="2">DETALLE DOCUMENTOS</font></font></B></TD>
    </TR>
    
    
    <TR>
      <td colspan="2">
         <asp:GridView ID="Grilla" runat="server" 
                                         EmptyDataText="<b>No existen documentos registrados</b>"
                                         AutoGenerateColumns="False"
                                         Width="100%" 
                                         CellPadding="4" ForeColor="#333333" 
                                         GridLines="None" > 
                            <Columns>
                          
                              <asp:TemplateField HeaderText="Tipo Documento">
                                <HeaderStyle Wrap="true" Width="200"></HeaderStyle>
                                <ItemStyle Wrap="false" ></ItemStyle>
                                <ItemTemplate>
                                <asp:Label ID="lblCodigo" runat="server" Text='<%# Bind("docu") %>' SortExpression = "Codigo" SortDirection="ASC"></asp:Label>
                              </ItemTemplate>
                             </asp:TemplateField>
                      
                             <asp:TemplateField    HeaderText="N° Documento">
                             <HeaderStyle Wrap="true" Width="200"></HeaderStyle>
                             <ItemStyle Wrap="false" ></ItemStyle>
                              <ItemTemplate>
                               <asp:Label ID="lblNombre" runat="server" Text='<%#Bind("nrodocu") %>' SortExpression = "Descripcion" SortDirection="ASC"></asp:Label>
                              </ItemTemplate>
                             </asp:TemplateField>
                             
                             <asp:TemplateField    HeaderText="Monto ($)">
                             <HeaderStyle Wrap="true" Width="490"></HeaderStyle>
                             <ItemStyle Wrap="false" ></ItemStyle>
                              <ItemTemplate>
                               <asp:Label ID="lblNombre" runat="server" Text='<%#Evaluar(Eval("monto")) %>' SortExpression = "Descripcion" SortDirection="ASC"></asp:Label>
                              </ItemTemplate>
                             </asp:TemplateField>
                            <asp:TemplateField    HeaderText="Seleccion">
                             <HeaderStyle Wrap="true" Width="490"></HeaderStyle>
                             <ItemStyle Wrap="false" ></ItemStyle>
                              <ItemTemplate>
                               <input name="opCheck" runat="server" type="checkbox" id="opCheck" value='<%#Bind("monto")%>' onclick="SumarTotal();" /> 
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
                            </asp:GridView>
      </td>
    </TR>
    
    
      <TR bgColor=#333366> 
      <TD colSpan=2><B><font color="#FFFFFF">&nbsp;<font size="2">DETALLE COBRANZA</font></font></B></TD>
    </TR>
 
 
  <TR>
      <TD vAlign=top bgColor=#0080c0 class="style1"><FONT 
      color=#ffffff>&nbsp;&nbsp;<B><font size="2">Capital</font></B></FONT></TD>
      <TD vAlign=top><font size="2">&nbsp;
          
          $<asp:TextBox ID="txtCapital" runat="server" CssClass="AnulaText" 
              ReadOnly="True"></asp:TextBox>
        </font></TD>
    </TR>
 
 <TR>
      <TD vAlign=top bgColor=#0080c0 class="style1"><FONT 
      color=#ffffff>&nbsp;&nbsp;<B><font size="2">Gastos Administrativos</font></B></FONT></TD>
      <TD vAlign=top><font size="2">&nbsp;
      
       $<asp:TextBox ID="lbladmin" runat="server" CssClass="AnulaText" ReadOnly="True"></asp:TextBox>
              
          
        </font></TD>
    </TR>
 <TR>
      <TD vAlign=top bgColor=#0080c0 class="style1"><FONT 
      color=#ffffff>&nbsp;&nbsp;<B><font size="2">Gastos Judiciales</font></B></FONT></TD>
      <TD vAlign=top><font size="2">&nbsp;
          $<asp:TextBox ID="lbljudi" runat="server" CssClass="AnulaText" ReadOnly="True"></asp:TextBox>
          
        </font></TD>
    </TR>
    
 <TR>
      <TD vAlign=top bgColor=#0080c0 class="style1"><FONT 
      color=#ffffff>&nbsp;&nbsp;<B><font size="2">Gastos PreJudiciales</font></B></FONT></TD>
      <TD vAlign=top><font size="2">&nbsp;
          $<asp:TextBox ID="lblpre" runat="server" CssClass="AnulaText" ReadOnly="True"></asp:TextBox>
         
        </font></TD>
    </TR>
 
 <TR>
      <TD vAlign=top bgColor=#0080c0 class="style1"><FONT 
      color=#ffffff>&nbsp;&nbsp;<B><font size="2">Intereses </font></B></FONT></TD>
      <TD vAlign=top><font size="2">&nbsp;&nbsp;&nbsp;
          <asp:TextBox ID="lblintereses" MaxLength="4" style="WIDTH: 25px; margin-left: 0px;" runat="server" CssClass="AnulaText" ReadOnly="True"></asp:TextBox>%
        
        </font></TD>
    </TR>
 
 <TR>
      <TD vAlign=top bgColor=#0080c0 class="style1"><FONT 
      color=#ffffff>&nbsp;&nbsp;<B><font size="2">Descuento Intereses</font></B></FONT></TD>
      <TD vAlign=top><font size="2">&nbsp;
          $<asp:TextBox ID="lbldescuentointereses" runat="server" CssClass="AnulaText" ReadOnly="True"></asp:TextBox>
          
        </font></TD>
    </TR>
    
    <TR>
      <TD vAlign=top bgColor=#0080c0 class="style1"><FONT 
      color=#ffffff>&nbsp;&nbsp;<B><font size="2">Honorarios</font></B></FONT></TD>
      <TD vAlign=top><font size="2">&nbsp;&nbsp;&nbsp;
          
           <asp:TextBox ID="lblhonorarios" MaxLength="4" style="WIDTH: 25px; margin-left: 0px;" runat="server" CssClass="AnulaText" ReadOnly="True"></asp:TextBox>%
          
        </font></TD>
    </TR>
    
     <TR>
      <TD vAlign=top bgColor=#0080c0 class="style1"><FONT 
      color=#ffffff>&nbsp;&nbsp;<B><font size="2">Descuento Honorarios</font></B></FONT></TD>
      <TD vAlign=top><font size="2">&nbsp;
          
          $<asp:TextBox ID="lbldescuentohonorarios" runat="server" CssClass="AnulaText" ReadOnly="True"></asp:TextBox>
        </font></TD>
    </TR>
   
    <TR>
      <TD vAlign=top bgColor=#0080c0 class="style1"><FONT 
      color=#ffffff>&nbsp;&nbsp;<B><font size="2">Otros Descuento</font></B></FONT></TD>
      <TD vAlign=top><font size="2">&nbsp;
      $<asp:TextBox ID="lblotrosdescuentos" runat="server" CssClass="AnulaText" ReadOnly="True"></asp:TextBox>
          
        </font></TD>
    </TR>
    
    
    <!-- select (500000 * honorarios)/100  from parametros -->
     <TR>
      <TD vAlign=top bgColor=#0080c0 class="style1"><FONT 
      color=#ffffff>&nbsp;&nbsp;<B><font size="2">Abonos</font></B></FONT></TD>
      <TD vAlign=top><font size="2">&nbsp;
          $<asp:TextBox ID="lblabonos"  runat="server" CssClass="AnulaText" ReadOnly="True"></asp:TextBox>

        </font></TD>
    </TR>
    
    
    <TR>
      <TD vAlign=top bgColor="#333366" class="style1"><FONT 
      color="#FFFFFF">&nbsp;&nbsp;<B><font size="2">TOTAL LIQUIDACIÓN</font></B></FONT></TD>
      <TD vAlign=top><font size="2">&nbsp;
          $<asp:TextBox ID="TOTAL"  runat="server" CssClass="AnulaText" ReadOnly="True"></asp:TextBox>

        </font></TD>
    </TR>
    
    
<%--    
    <TR>
      <TD vAlign=top bgColor=#0080c0 class="style1"><FONT 
      color=#ffffff>&nbsp;&nbsp;<B><font size="2">Cantidad de Documentos</font></B></FONT></TD>
      <TD vAlign=top><font size="2">&nbsp;
          <asp:Label ID="lblcantidad" runat="server" ></asp:Label>
        </font></TD>
    </TR>--%>
    
    </TABLE>
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
              
     
                            <asp:Button ID="Button1" runat="server" CssClass="boton2" Text="Ver Actividades" 
                            OnClientClick="return Actividades();" 
                            Visible="False"  />
                            
                        <input type="button" ID="Button2" value="Cancelar" class="boton"   OnClick="javascript: history.go(-1);" />
                        &nbsp;<input type="button" ID="Button3" value="Calcular" class="boton"   OnClick="javascript: calcular();" />
                         
                           
                              
                              
                    </TD>
                       
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
          <asp:HiddenField ID="hiddCobranza" runat="server" />
          
           <asp:HiddenField ID="hddTipoCobranza" runat="server" />
          
      </FORM>
      
    </TD>
  </TR>
  </TBODY> 
</TABLE>
</body>
</html>