<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ComprobanteRendicion.aspx.cs" Inherits="CobranzaALC.Cobranza.Abonos.ComprobanteRendicion" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head id="Head1" runat="server">
    <title>ALC Asesorìa Legal y Crediticía Ltda</title>
    <style type="text/css">
        .style1
        {
            height: 23px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    <table border="0" cellpadding="0" cellspacing="0" style="width: 641px">
  <tr> 
    <td width="669" height="26" valign="top"> 
      <table width="100%" border="1" cellpadding="0" cellspacing="0">
        <tr> 
          <td width="669" height="26" valign="top"> 
            <div xalign="center"><b>
            <asp:Image ID="Image1" runat="server" Width="158px" Height="48px" 
                    ImageUrl="~/images/logo.jpg" />
          
            &nbsp;&nbsp;<b>COMPROBANTE DE RENDICIÓN</b> 
           
            &nbsp;&nbsp&nbsp Nº&nbsp <asp:Label ID="nroRendicion" runat="server" ></asp:Label>
                
                </b></div>
          </td>
        </tr>
      </table>
    </td>
  </tr>
  <tr> 
    <td valign="top" height="253"> 
      <table width="100%" border="0" cellpadding="0" cellspacing="0">
        <tr> 
          <td width="192" height="23" valign="top" bgcolor="#CCCCCC"> &nbsp;<b>Cliente</b></td>
          <td bgcolor="#FFFFCC" valign="top" colspan="2">
              &nbsp;<asp:Label ID="txtcliente" runat="server" ></asp:Label>
        </td>
        </tr>
        
        <tr> 
          <td valign="top" height="23" bgcolor="#CCCCCC">&nbsp;<b>Rut Cliente</b></td>
          <td valign="top" colspan="2" bgcolor="#FFFFCC">&nbsp;<asp:Label ID="txtRutCliente" runat="server" ></asp:Label></td>
        </tr>
        
        <tr> 
          <td valign="top" height="23" bgcolor="#CCCCCC">&nbsp;<b>N° Operación</b></td>
          <td valign="top" colspan="2" bgcolor="#FFFFCC">&nbsp;<asp:Label ID="txtNroOperacion" runat="server" ></asp:Label></td>
        </tr>
        
        
        
        <tr> 
          <td height="23" valign="top" bgcolor="#CCCCCC">&nbsp;<b>Fecha Comprobante</b></td>
          <td valign="top" colspan="2" bgcolor="#FFFFCC">&nbsp;<asp:Label ID="txtFechaComprobante" runat="server" ></asp:Label></td>
        </tr>
        
         <tr> 
          <td valign="top" bgcolor="#CCCCCC" class="style1">&nbsp;<b>Forma de Pago</b></td>
          <td valign="top" colspan="2" bgcolor="#FFFFCC" class="style1">&nbsp;<asp:Label ID="txtFormaPago" runat="server" ></asp:Label></td>
        </tr>
        <tr> 
          <td height="23" valign="top" bgcolor="#CCCCCC"><b>&nbsp;Monto Rendido</b></td>
          <td valign="top" colspan="2" bgcolor="#FFFFCC">&nbsp;<asp:Label ID="txtMontoRendido" runat="server" ></asp:Label></td>
        </tr>
        
        <!-- CHEQUE SIEMPRE  -->
        
        <tr> 
          <td height="23" valign="top" colspan=3 ><b>&nbsp;Datos del documento de rendición</b></td>
        
        </tr>
     
        <tr> 
          <td height="23" valign="top" bgcolor="#CCCCCC"><b>&nbsp;Banco</b></td>
          <td valign="top" colspan="2" bgcolor="#FFFFCC">&nbsp;<asp:Label ID="txtBanco" runat="server" ></asp:Label></td>
        </tr>
           <tr> 
          <td height="23" valign="top" bgcolor="#CCCCCC"><b>&nbsp;N° Cheque</b></td>
          <td valign="top" colspan="2" bgcolor="#FFFFCC">&nbsp;<asp:Label ID="txtNroCheque" runat="server" ></asp:Label></td>
        </tr>
           <tr> 
          <td height="23" valign="top" bgcolor="#CCCCCC"><b>&nbsp;Serie</b></td>
          <td valign="top" colspan="2" bgcolor="#FFFFCC">&nbsp;<asp:Label ID="txtSerie" runat="server" ></asp:Label></td>
        </tr>
           <tr> 
          <td height="23" valign="top" bgcolor="#CCCCCC"><b>&nbsp;Fecha del Cheque</b></td>
          <td valign="top" colspan="2" bgcolor="#FFFFCC">&nbsp;<asp:Label ID="txtFechaCheque" runat="server" ></asp:Label></td>
        </tr>
           <tr> 
          <td height="23" valign="top" bgcolor="#CCCCCC"><b>&nbsp;N° Cta. Cte.</b></td>
          <td valign="top" colspan="2" bgcolor="#FFFFCC">&nbsp;<asp:Label ID="txtCtaCte" runat="server" ></asp:Label></td>
        </tr>   
        
        <%--<tr> 
          <td height="23" valign="top" bgcolor="#CCCCCC"><b>&nbsp;Fecha Comprobante</b></td>
          <td valign="top" colspan="2" bgcolor="#FFFFCC">&nbsp;<asp:Label ID="fecha" runat="server" ></asp:Label></td>
        </tr>
        --%>
          
      
        
 
       
    
        
        <tr> 
          <td height="25" colspan="3" valign="top">&nbsp;<asp:Label ID="lblAsociados" runat="server" ></asp:Label>
          
            <asp:GridView ID="GridView1" runat="server" CellPadding="4" ForeColor="#333333" style="width: 641px"
        GridLines="None">
        <RowStyle BackColor="#EFF3FB" />
        <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
        <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
        <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
        <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
        <EditRowStyle BackColor="#2461BF" />
        <AlternatingRowStyle BackColor="White" />
    </asp:GridView>
          
          </td>
        </tr>
        <tr> 
          <td valign="top" colspan="2" height="90">&nbsp;</td>
          <td width="193" valign="top"> 
            <div align="center"><br>
              <br>
              <br>
              <font size="2"><u>Firma y Timbre</u></font><br/>
              <font size="2"><u>Jefe Finanzas</u></font>
               </div>
          </td>
        </tr>
        <tr> 
          <td height="0"><font size="2"><asp:Label ID="usuario" runat="server" ></asp:Label></font> </td>
          <td></td>
          <td></td>
        </tr>
        <tr> 
          <td height="1"><font size="2">Hora : <asp:Label ID="hora" runat="server" ></asp:Label></font></td>
          <td width="284"></td>
          <td></td>
        </tr>
      </table>
    </td>
  </tr>
</table>

    </div>
    </form>
</body>
</html>
 <script language="javascript" type="text/javascript">

     window.print();

    </script>