<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ComprobanteParcial.aspx.cs" Inherits="CobranzaALC.Cobranza.Abonos.ComprobanteParcial" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" >
<head id="Head1" runat="server">
    <title>ALC Asesorìa Legal y Crediticía Ltda</title>
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
          
            &nbsp;&nbsp;<b>COMPROBANTE DE ABONO PARCIAL</b> 
           
            &nbsp;&nbsp&nbsp Nº <asp:Label ID="nroabono" runat="server" ></asp:Label>
                
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
              &nbsp;<asp:Label ID="cliente" runat="server" ></asp:Label>
        </td>
        </tr>
        
        
        
        <tr> 
          <td valign="top" height="23" bgcolor="#CCCCCC">&nbsp;<b>Nombre Deudor</b></td>
          <td valign="top" colspan="2" bgcolor="#FFFFCC">&nbsp;<asp:Label ID="deudor" runat="server" ></asp:Label></td>
        
        
        
        
        
        </tr>
        
        <tr> 
          <td valign="top" height="23" bgcolor="#CCCCCC">&nbsp;<b>Rut Deudor</b></td>
          <td valign="top" colspan="2" bgcolor="#FFFFCC">&nbsp;<asp:Label ID="rutdeudor" runat="server" ></asp:Label></td>
        </tr>
        
        
     <%--   
        <tr> 
          <td height="23" valign="top" bgcolor="#CCCCCC">&nbsp;<b>Nombre Girador</b></td>
          <td valign="top" colspan="2" bgcolor="#FFFFCC">&nbsp;<asp:Label ID="NombreGirador" runat="server" ></asp:Label></td>
        </tr>
        
         <tr> 
          <td height="23" valign="top" bgcolor="#CCCCCC">&nbsp;<b>Rut Girador</b></td>
          <td valign="top" colspan="2" bgcolor="#FFFFCC">&nbsp;<asp:Label ID="RutGirador" runat="server" ></asp:Label></td>
        </tr>--%>
        <tr> 
          <td height="23" valign="top" bgcolor="#CCCCCC"><b>&nbsp;Operaci&oacute;n</b></td>
          <td valign="top" colspan="2" bgcolor="#FFFFCC">&nbsp;<asp:Label ID="operacion" runat="server" ></asp:Label></td>
        </tr>
        <tr> 
          <td height="23" valign="top" bgcolor="#CCCCCC"><b>&nbsp;Fecha abono</b></td>
          <td valign="top" colspan="2" bgcolor="#FFFFCC">&nbsp;<asp:Label ID="fecha" runat="server" ></asp:Label></td>
        </tr>
        
          
        <tr> 
          <td height="23" valign="top" bgcolor="#CCCCCC">&nbsp;<b>Forma de Pago</b></td>
          <td valign="top" colspan="2" bgcolor="#FFFFCC">&nbsp;<asp:Label ID="TipoMoneda" runat="server" ></asp:Label></td>
        </tr>
        <tr> 
          <td height="23" valign="top" bgcolor="#CCCCCC"><b>&nbsp;Monto Abono</b></td>
          <td valign="top" colspan="2" bgcolor="#FFFFCC">&nbsp;<asp:Label ID="montoabono" runat="server" ></asp:Label></td>
        </tr>
        
     <%--   <tr> 
          <td height="23" valign="top" bgcolor="#CCCCCC"><b>&nbsp;Última Fecha Pago</b></td>
          <td valign="top" colspan="2" bgcolor="#FFFFCC">&nbsp;<asp:Label ID="ultfechapago" runat="server" ></asp:Label></td>
        </tr>--%>
        
      <%--  <tr> 
          <td height="23" valign="top" bgcolor="#CCCCCC">&nbsp;<b>Concepto </b></td>
          <td valign="top" colspan="2" bgcolor="#FFFFCC">&nbsp;<asp:Label ID="concepto" runat="server" ></asp:Label></td>
        </tr>--%>
        
        <!-- REQ -->
       <%-- <tr> 
          <td height="23" valign="top" bgcolor="#CCCCCC">&nbsp;<b>Nº Cheque</b></td>
          <td valign="top" colspan="2" bgcolor="#FFFFCC">&nbsp;<asp:Label ID="nrocheque" runat="server" ></asp:Label></td>
        </tr>--%>
        
        <tr> 
          <td height="23" valign="top" bgcolor="#CCCCCC">&nbsp;<b>Comprobante Asociado</b></td>
          <td valign="top" colspan="2" bgcolor="#FFFFCC">&nbsp;<asp:Label ID="idasociado" runat="server" ></asp:Label></td>
        </tr>
        
      <%--  <tr> 
          <td height="23" valign="top" bgcolor="#CCCCCC">&nbsp;<b>Fecha Deposito</b></td>
          <td valign="top" colspan="2" bgcolor="#FFFFCC">&nbsp;<asp:Label ID="fechadeposito" runat="server" ></asp:Label></td>
        </tr>--%>
        
       
        
       <%-- <tr> 
          <td height="23" valign="top" bgcolor="#CCCCCC">&nbsp;<b>Tipo Comprobante</b></td>
          <td valign="top" colspan="2" bgcolor="#FFFFCC">&nbsp;<asp:Label ID="TipoComprobante" runat="server" ></asp:Label></td>
        </tr>
      --%>
        
        <%-- <tr> 
          <td height="23" valign="top" bgcolor="#CCCCCC">&nbsp;<b>Serie</b></td>
          <td valign="top" colspan="2" bgcolor="#FFFFCC">&nbsp;<asp:Label ID="Serie" runat="server" ></asp:Label></td>
        </tr>--%>
        
      <%--    <tr> 
          <td height="23" valign="top" bgcolor="#CCCCCC">&nbsp;<b>Documento</b></td>
          <td valign="top" colspan="2" bgcolor="#FFFFCC">&nbsp;<asp:Label ID="uno" runat="server" ></asp:Label> de <asp:Label ID="dos" runat="server" ></asp:Label> </td>
        </tr>--%>
        
       <%-- <tr> 
          <td height="23" valign="top" bgcolor="#CCCCCC">&nbsp;<b>Boleta Honorarios</b></td>
          <td valign="top" colspan="2" bgcolor="#FFFFCC">&nbsp;<asp:Label ID="BoletaHonorarios" runat="server" ></asp:Label></td>
        </tr>--%>
        
        
        <tr> 
          <td height="25" colspan="3" valign="top">&nbsp;
            Nota: Este Comprobante no reemplaza el comprobante de ingreso a caja (Sólo es un comprobante de abono parcial) y
            autorizo a la Empresa ALC a efectuar las imputaciones que correspondan.  
            
            
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
              <font size="2"><u>Firma y Timbre Cajero</u></font> </div>
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

     //       window.print();

    </script>
