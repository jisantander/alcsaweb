<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ReporteJuicioGeneral.aspx.cs" Inherits="CobranzaALC.Cobranza.ConsultaEspecial.ReporteJuicioGeneral" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head id="Head1" runat="server">
    <title>Reporte Reconstituciones</title>
    <style type="text/css">
        .style1 {
            width: 750px;
        }
        .style2
        {
            font-size: smaller;
        }
        .style3
        {
            font-size: medium;
            font-weight: bold;
        }
        .style4
        {
            height: 23px;
        }
        .style5
        {
            text-decoration: underline;
            font-size: small;
            font-weight: bold;
        }
        .style6
        {
            font-size: small;
        }
        .style7
        {
            font-size: small;
            width: 182px;
        }
        .style14
        {
            font-size: medium;
        }
        .style16
        {
            font-size: small;
            width: 291px;
        }
        </style>
</head>
<body onload="javascript:window.print();">
    <form id="form1" runat="server">
    
    
    <asp:Image ID="Image1" runat="server" ImageUrl="../../images/logo.jpg" />
     <br/><br/>
     <blockquote>
    <table class="style1">
        <tr>
            <td colspan="2" align="center">
                 <span class="style3">ALC Asesoría Legal y Crediticia - Sistema de Gestión de Garantías</span><br 
                     class="style14"/>
                 <span class="style2">Informe&nbsp; Estado de Juicio</span><br 
                     class="style2"/>
                 
                 <span class="style2">Fecha Informe: <asp:Label ID="lblFechaInforme" runat="server" ></asp:Label>
               
                </span>
               
                </td>
            <td align="center">
                 &nbsp;</td>
        </tr>
        
        
        <tr>
            <td colspan="2" align="center" class="style4">
                   &nbsp;
               
                </td>
            <td align="center" class="style4">
                   &nbsp;</td>
        </tr>
        
         <tr>
            <td colspan="2" align="left" class="style5">
                INFORME DE JUICIO</td>
            <td align="left" class="style5">
                </td>
        </tr>
        
         <tr>
            <td colspan="2" align="center" class="style4">
                   &nbsp;
               
                </td>
            <td align="center" class="style4">
                   &nbsp;</td>
        </tr>
        
     <%--   <tr>
            <td colspan="2" align="left" class="style11">
                ANTECEDENTES DEL CLIENTE
            </td>
            <td align="left" class="style11">
                &nbsp;</td>
        </tr>--%>
        
        
        <tr runat="server" id="lblot">
            <td class="style7" >
                CLIENTE </td>
            <td class="style16">
                :
            <asp:Label ID="txtCliente" runat="server" ></asp:Label></td>
            <td class="style6">
                &nbsp;</td>
        </tr>
        
         <tr runat="server" id="lblestado0t">
            <td class="style7" >
                NOMBRE DEUDOR</td>
            <td class="style16">
                :
            <asp:Label ID="txtNomDeudor" runat="server" ></asp:Label></td>
            <td class="style6">
                &nbsp;</td>
        </tr>
        
         <tr runat="server" id="lblresponsable">
            <td class="style7" >
                RUT</td>
            <td class="style16">
                :
             <asp:Label ID="txtRutDeudor" runat="server" ></asp:Label></td>
            <td class="style6">
                &nbsp;</td>
        </tr>
        
        <tr runat="server" id="lblsubproducto">
            <td class="style7" >
                OPERACION</td>
            <td class="style16">
                :
             <asp:Label ID="txtOperacion" runat="server" ></asp:Label></td>
            <td class="style6">
                &nbsp;</td>
        </tr>
        
         <tr runat="server" id="lblproducto">
            <td class="style7" >
                 </td>
            <td class="style16">
                :
            <asp:Label ID="txtprod" runat="server" ></asp:Label></td>
            <td class="style6">
                &nbsp;</td>
        </tr>
      
           <tr runat="server" id="lbltipodocumento">
            <td class="style7" >
                 PROCEDIMIENTO</td>
            <td class="style16">
                :
            <asp:Label ID="txtProcedimiento" runat="server" ></asp:Label></td>
            <td class="style6">
                &nbsp;</td>
        </tr>
        


    <tr runat="server" id="lblnrooperacion">
            <td class="style7" >
                 TRIBUNAL</td>
            <td class="style16">
                :
            <asp:Label ID="txtTribunal" runat="server" ></asp:Label></td>
            <td class="style6">
                &nbsp;</td>
        </tr>
 
 
    <tr runat="server" id="lblrutcliente">
            <td class="style7" >
                 ROL</td>
            <td class="style16">
                :
            <asp:Label ID="txtrol" runat="server" ></asp:Label></td>
            <td class="style6">
                &nbsp;</td>
        </tr>
 
    <tr runat="server" id="lbldv">
            <td class="style7" >
                 CUANTIA</td>
            <td class="style16">
                :
            <asp:Label ID="txtCuantia" runat="server" ></asp:Label></td>
            <td class="style6">
                &nbsp;</td>
        </tr>
 

 
  

        

      
        
        
        
        
        
        
     <%--   <tr>
            <td class="style7" >
                Conservador </td>
            <td class="style6">
                :
            <asp:Label ID="lblConservador" runat="server" ></asp:Label></td>
        </tr>
        <tr>
            <td class="style7" >
                Inscripción de Dominio</td>
            <td class="style6">
                : Fs. <asp:Label ID="lblFojasdominio" runat="server" ></asp:Label>
                N° <asp:Label ID="lblNroDominio" runat="server"></asp:Label></td>
        </tr>
          <tr>
            <td class="style7" >
                Año dominio</td>
            <td class="style6">
                :
            <asp:Label ID="lblAnioDominio" runat="server" ></asp:Label></td>
        </tr>
          <tr>
            <td class="style7" >
                Inscripción 1° Hipoteca</td>
            <td class="style6">
                : Fs. <asp:Label ID="lblFsInscripcionHipoteca" runat="server" ></asp:Label>
                N° <asp:Label ID="lblNroInscripcionHipoteca" runat="server" ></asp:Label></td>
        </tr>
          <tr>
            <td class="style7" >
                Año Hipoteca</td>
            <td class="style6">
                :
            <asp:Label ID="lblAnioHipoteca" runat="server" ></asp:Label></td>
        </tr>
          <tr>
            <td class="style7" >
                Inscripción 1° Prohibición</td>
            <td class="style6">
                : Fs. <asp:Label ID="lblInscriProhibicion" runat="server" ></asp:Label>
                N° <asp:Label ID="lblNroProhibicion" runat="server" ></asp:Label></td>
        </tr>
        
         <tr>
            <td class="style7" >
                Año Prohicicion</td>
            <td class="style6">
                :
            <asp:Label ID="lblAnioProhibicion" runat="server" ></asp:Label></td>
        </tr>--%>
        
        
        <%--   <tr>
            <td colspan="2" align="center" class="style4">
                   &nbsp;
               
                </td>
        </tr>--%>
        
      <%--    <tr>
            <td class="style7" >
                Notaria</td>
            <td class="style6">
                :
            <asp:Label ID="lblNotaria" runat="server" ></asp:Label></td>
        </tr>
          <tr>
            <td class="style7" >
                Fecha Escritura</td>
            <td class="style6">
                :
            <asp:Label ID="lblFechaEscritura" runat="server" ></asp:Label></td>
        </tr>
          <tr>
            <td class="style7" >
                Localidad Notario </td>
            <td class="style6">
                :
            <asp:Label ID="lblLocalidadNotario" runat="server" ></asp:Label></td>
        </tr>--%>
        
<%--          <tr>
            <td colspan="2" align="center" class="style4">
                   &nbsp;
               
                </td>
        </tr>
        
          <tr>
            <td colspan="2" align="left" class="style11">
             DOCUMENTOS QUE SE ADJUNTA
            </td>
        </tr>
        
        
         <tr>
            <td class="style8" colspan="2" >
               
                <b>*</b> Copia de Inscripción de Dominio Vigente<br/>
                <b>*</b> Certificado de Hipotecas y Gravámenes<br/>
                <b>*</b> Copia de Escritura de Mutuo e Hipoteca<br/>
               </td>
        </tr>
        
        
          
          <tr>
            <td colspan="2" align="center" class="style4">
                   &nbsp;
               
                </td>
        </tr>
        
          <tr>
            <td colspan="2" align="left" class="style11">
             GASTOS Y HONORARIOS
            </td>
        </tr>--%>
        
        
<%--        <tr>
            <td colspan="2">
            <TABLE class=celdas  style="width: 250px"
style="BORDER-RIGHT: #006699; BORDER-TOP: #006699; BORDER-LEFT: #006699; BORDER-BOTTOM: #006699" 
cellSpacing=0 cellPadding=0 width="100%" bgColor=#cfe4ee border=0>
    <TBODY> 
  
 
  <TR>
      <TD vAlign=top class="style9"><FONT class="style12">&nbsp;<B><font size="2">TOTAL</font></B></FONT></TD>
      <TD vAlign=top class="style13"><font size="2"><span class="style12"><b>&nbsp;: $
          <asp:Label ID="lblTOTAL" runat="server" ></asp:Label>
          </b></span>
        </font></TD>
    </TR>
 
 <TR>
      <TD vAlign=top class="style9"><FONT class="style12">&nbsp;<B><font size="2">N° DE FACTURA</font></B></FONT></TD>
      <TD vAlign=top class="style13"><font size="2"><span class="style12"><b>&nbsp;:
          <asp:Label ID="lblNROFACTURA" runat="server" ></asp:Label>
          </b></span>
        </font></TD>
    </TR>

    
    </TABLE>
            
            </td>
        </tr>--%>
        
<%--           <tr>
            <td colspan="2" align="center" class="style4">
                   &nbsp;
               
                </td>
        </tr>--%>
        

       
         <tr>
            <td colspan="3" align="left" class="style4">
            &nbsp;<asp:GridView ID="grilla" runat="server">
                </asp:GridView>
               
                </td>
            
        </tr>
        
          <tr>
            <td colspan="3" align="left" class="style4">
            &nbsp;
               
                </td>
            
        </tr>
        
            <tr runat="server" id="Tr1">
            <td class="style7" >
                 ULTIMO ESTADO JUDICIAL</td>
            <td class="style16">
                :
            <asp:Label ID="Label1" runat="server" ></asp:Label></td>
            <td class="style6">
                &nbsp;</td>
        </tr>
        
        
          <tr runat="server" id="Tr2">
            <td class="style7" >
                 OBSERVACION</td>
            <td class="style16">
                :
            <asp:Label ID="Label2" runat="server" ></asp:Label></td>
            <td class="style6">
                &nbsp;</td>
        </tr>
        
        
           <tr>
            <td colspan="2" align="center">
        
        &nbsp;       
                </td>
            <td align="center">
        
                &nbsp;</td>
        </tr>
        
        
         <tr>
            <td colspan="2" align="center">
        
        &nbsp;       
                </td>
            <td align="center">
        
                &nbsp;</td>
        </tr>
        
           <tr>
            <td colspan="2" align="center">
        
        &nbsp;       
                </td>
            <td align="center">
        
                &nbsp;</td>
        </tr>
        
         <tr>
            <td colspan="2" align="center">
        
        &nbsp;       
                </td>
            <td align="center">
        
                &nbsp;</td>
        </tr>
        
             <tr>
            <td colspan="2" align="center">
                  <%-- <i><b>José Santander Robles<br/>
                    Abogado</b>  
               
                </i>  --%>
               
                </td>
            <td align="center">
                   &nbsp;</td>
        </tr>
        
    </table>


</blockquote>
    
    
    
    </form>

</body>
</html>


<%--
    <script language="javascript" type="text/javascript">
       window.print();
    </script>--%>