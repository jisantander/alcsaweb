<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ReporteOtrosMarca.aspx.cs" Inherits="CobranzaALC.Cobranza.Reconstitucion.ReporteOtrosMarca" %>


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
            width: 103px;
        }
        .style14
        {
            font-size: medium;
        }
        .style16
        {
            font-size: small;
            width: 194px;
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
                 <span class="style2">Informe Devolución Expediente Legal de Garantías</span><br 
                     class="style2"/>
                 <span class="style2">Detalle de Documentos</span><br class="style2" />
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
             <%-- INFORME DE TITULOS RECONSTITUIDOS --%> 
                <asp:Label ID="lblTITULO" runat="server" ></asp:Label>
              
            </td>
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
                OT </td>
            <td class="style16">
                :
            <asp:Label ID="txtOT" runat="server" ></asp:Label></td>
            <td class="style6">
                &nbsp;</td>
        </tr>
        
         <tr runat="server" id="lblestado0t">
            <td class="style7" >
                Estado OT :</td>
            <td class="style16">
                :
            <asp:Label ID="txtEstadoOT" runat="server" ></asp:Label></td>
            <td class="style6">
                &nbsp;</td>
        </tr>
        
         <tr runat="server" id="lblresponsable">
            <td class="style7" >
                Responsable  :</td>
            <td class="style16">
                :
            <asp:Label ID="txtResponsable" runat="server" ></asp:Label></td>
            <td class="style6">
                &nbsp;</td>
        </tr>
        
        <tr runat="server" id="lblsubproducto">
            <td class="style7" >
                Sub Producto  :</td>
            <td class="style16">
                :
            <asp:Label ID="txtsubproducto" runat="server" ></asp:Label></td>
            <td class="style6">
                &nbsp;</td>
        </tr>
        
         <tr runat="server" id="lblproducto">
            <td class="style7" >
                 Producto  :</td>
            <td class="style16">
                :
            <asp:Label ID="txtprod" runat="server" ></asp:Label></td>
            <td class="style6">
                &nbsp;</td>
        </tr>
      
           <tr runat="server" id="lbltipodocumento">
            <td class="style7" >
                 Tipo Documento  :</td>
            <td class="style16">
                :
            <asp:Label ID="txtTipoDoc" runat="server" ></asp:Label></td>
            <td class="style6">
                &nbsp;</td>
        </tr>
        


    <tr runat="server" id="lblnrooperacion">
            <td class="style7" >
                 N° Operación  :</td>
            <td class="style16">
                :
            <asp:Label ID="txtnrooperacion" runat="server" ></asp:Label></td>
            <td class="style6">
                &nbsp;</td>
        </tr>
 
 
    <tr runat="server" id="lblrutcliente">
            <td class="style7" >
                 Rut Cliente  :</td>
            <td class="style16">
                :
            <asp:Label ID="txtrutcliente" runat="server" ></asp:Label></td>
            <td class="style6">
                &nbsp;</td>
        </tr>
 
    <tr runat="server" id="lbldv">
            <td class="style7" >
                 Dv  :</td>
            <td class="style16">
                :
            <asp:Label ID="txtdv" runat="server" ></asp:Label></td>
            <td class="style6">
                &nbsp;</td>
        </tr>
 
    <tr runat="server" id="lblnombrecliente">
            <td class="style7" >
                 Nombre Cliente   :</td>
            <td class="style16">
                :
            <asp:Label ID="txtnombrecliente" runat="server" ></asp:Label></td>
            <td class="style6">
                &nbsp;</td>
        </tr>
 
  <tr runat="server" id="lbldireccion">
            <td class="style7" >
                 Dirección   :</td>
            <td class="style16">
                :
            <asp:Label ID="txtdireccion" runat="server" ></asp:Label></td>
            <td class="style6">
                &nbsp;</td>
        </tr>
 
  <tr runat="server" id="lblcomuna">
            <td class="style7" >
                 Comuna   :</td>
            <td class="style16">
                :
            <asp:Label ID="txtcomuna" runat="server" ></asp:Label></td>
            <td class="style6">
                &nbsp;</td>
        </tr>
  
  <tr runat="server" id="lblconservador">
            <td class="style7" >
                 Conservador   :</td>
            <td class="style16">
                :
            <asp:Label ID="txtconservador" runat="server" ></asp:Label></td>
            <td class="style6">
                &nbsp;</td>
        </tr>
  
  <tr runat="server" id="lblregion">
            <td class="style7" >
                 Región   :</td>
            <td class="style16">
                :
            <asp:Label ID="txtregion" runat="server" ></asp:Label></td>
            <td class="style6">
                &nbsp;</td>
        </tr>
  
   <tr runat="server" id="lblfojasdominio">
            <td class="style7" >
                 Fojas Dominio   :</td>
            <td class="style16">
                :
            <asp:Label ID="txtfojasdominio" runat="server" ></asp:Label></td>
            <td class="style6">
                &nbsp;</td>
        </tr>
 
  
   <tr runat="server" id="lblnrodominio">
            <td class="style7" >
                 N° Dominio  :</td>
            <td class="style16">
                :
            <asp:Label ID="txtnumerodominio" runat="server" ></asp:Label></td>
            <td class="style6">
                &nbsp;</td>
        </tr>

   <tr runat="server" id="lblaniodominio">
            <td class="style7" >
                 Año Dominio  :</td>
            <td class="style16">
                :
            <asp:Label ID="txtaniodominio" runat="server" ></asp:Label></td>
            <td class="style6">
                &nbsp;</td>
        </tr>

   <tr runat="server" id="lblfojashipoteca">
            <td class="style7" >
                Fojas Hipoteca  :</td>
            <td class="style16">
                :
            <asp:Label ID="txtfojashipoteca" runat="server" ></asp:Label></td>
            <td class="style6">
                &nbsp;</td>
        </tr>
             
              <tr runat="server" id="lblnrohipoteca">
            <td class="style7" >
                N° Hipoteca  :</td>
            <td class="style16">
                :
            <asp:Label ID="txtnumerohipoteca" runat="server" ></asp:Label></td>
            <td class="style6">
                &nbsp;</td>
        </tr>                 
 
 
             
              <tr runat="server" id="lblaniohipoteca">
            <td class="style7" >
               Año Hipoteca  :</td>
            <td class="style16">
                :
            <asp:Label ID="txtaniohipoteca" runat="server" ></asp:Label></td>
            <td class="style6">
                &nbsp;</td>
        </tr>
        
            <tr runat="server" id="lblfojasprohibiciones">
            <td class="style7" >
               Fojas Prohibición  :</td>
            <td class="style16">
                :
            <asp:Label ID="txtfojasprohibicion" runat="server" ></asp:Label></td>
            <td class="style6">
                &nbsp;</td>
        </tr>
        
        
              <tr runat="server" id="lblnroprohibiciones">
            <td class="style7" >
               N° Prohibición  :</td>
            <td class="style16">
                :
            <asp:Label ID="txtnumeroprohibicion" runat="server" ></asp:Label></td>
            <td class="style6">
                &nbsp;</td>
        </tr>
        
        
           <tr runat="server" id="lblanioprohibiciones">
            <td class="style7" >
               Año Prohibición :</td>
            <td class="style16">
                :
            <asp:Label ID="txtanioprohibicion" runat="server" ></asp:Label></td>
            <td class="style6">
                &nbsp;</td>
        </tr>
        
           <tr runat="server" id="lblfechacontabilizacion">
            <td class="style7" >
               Fecha Contabilización :</td>
            <td class="style16">
                :
            <asp:Label ID="txtfechacontabilizacion" runat="server" ></asp:Label></td>
            <td class="style6">
                &nbsp;</td>
        </tr>
        
        
          <tr runat="server" id="lblfechaentrega">
            <td class="style7" >
               Fecha Entrega :</td>
            <td class="style16">
                :
            <asp:Label ID="txtfechaentrega" runat="server" ></asp:Label></td>
            <td class="style6">
                &nbsp;</td>
        </tr>
        
         
          <tr runat="server" id="lblfechaescritura">
            <td class="style7" >
               Fecha Escritura :</td>
            <td class="style16">
                :
            <asp:Label ID="txtfechaescritura" runat="server" ></asp:Label></td>
            <td class="style6">
                &nbsp;</td>
        </tr>
        
           <tr runat="server" id="lblnotaria">
            <td class="style7" >
              Notaria:</td>
            <td class="style16">
                :
            <asp:Label ID="txtnotaria" runat="server" ></asp:Label></td>
            <td class="style6">
                &nbsp;</td>
        </tr>
        
                   <tr runat="server" id="lblcomunanotaria">
            <td class="style7" >
              Comuna Notaria :</td>
            <td class="style16">
                :
            <asp:Label ID="txtcomunanotaria" runat="server" ></asp:Label></td>
            <td class="style6">
                &nbsp;</td>
        </tr>
        
        
                   <tr  runat="server" id="lblrepertorio">
            <td class="style7" >
              Repertorio:</td>
            <td class="style16">
                :
            <asp:Label ID="txtreportorio" runat="server" ></asp:Label></td>
            <td class="style6">
                &nbsp;</td>
        </tr>
        
        
                   <tr runat="server" id="lblprotocolo">
            <td class="style7" >
              Protocolo:</td>
            <td class="style16">
                :
            <asp:Label ID="txtprotocolo" runat="server" ></asp:Label></td>
            <td class="style6">
                &nbsp;</td>
        </tr>
        
        
                   <tr runat="server" id="lblestado">
            <td class="style7" >
              Estado :</td>
            <td class="style16">
                :
            <asp:Label ID="cbxEstado" runat="server" ></asp:Label></td>
            <td class="style6">
                &nbsp;</td>
        </tr>
        
        
                   <tr runat="server" id="lblfechaestado">
            <td class="style7" >
              Fecha Estado :</td>
            <td class="style16">
                :
            <asp:Label ID="txtfechaestado" runat="server" ></asp:Label></td>
            <td class="style6">
                &nbsp;</td>
        </tr>
    
                   <tr runat="server" id="lblobservacion">
            <td class="style7" >
             Observación:</td>
            <td class="style16">
                :
            <asp:Label ID="txtobservacion" runat="server"  ></asp:Label></td>
            <td class="style6">
                &nbsp;</td>
        </tr>
            
            
                   <tr runat="server" id="lblnrocarillas">
            <td class="style7" >
             N° Carillas :</td>
            <td class="style16">
                :
            <asp:Label ID="txtnrocarillas" runat="server" ></asp:Label></td>
            <td class="style6">
                &nbsp;</td>
        </tr>
      
                   <tr runat="server" id="lblfactura">
            <td class="style7" >
           Factura :</td>
            <td class="style16">
                :
            <asp:Label ID="txtfactura" runat="server" ></asp:Label></td>
            <td class="style6">
                &nbsp;</td>
        </tr>  
        
        
                   <tr runat="server" id="lblfechafactura">
            <td class="style7" >
           Fecha Factura :</td>
            <td class="style16">
                :
            <asp:Label ID="txtfechafactura" runat="server" ></asp:Label></td>
            <td class="style6">
                &nbsp;</td>
        </tr>  
        
        
                   <tr runat="server" id="lblmontofactura">
            <td class="style7" >
           Monto Factura:</td>
            <td class="style16">
                :
            <asp:Label ID="txtmontofactura" runat="server" ></asp:Label></td>
            <td class="style6">
                &nbsp;</td>
        </tr>  
        
        
        
                   <tr runat="server" id="lblfecharemesa">
            <td class="style7" >
          Fecha Remesa:</td>
            <td class="style16">
                :
            <asp:Label ID="txtfecha_producto" runat="server" ></asp:Label></td>
            <td class="style6">
                &nbsp;</td>
        </tr>  
        
        
                   <tr runat="server" id="lblremesa">
            <td class="style7" >
          Remesa :</td>
            <td class="style16">
                :
            <asp:Label ID="txtproducto_remesa" runat="server" ></asp:Label></td>
            <td class="style6">
                &nbsp;</td>
        </tr>  
        
        
           <tr runat="server" id="lblcentrocosto">
            <td class="style7" >
          Centro Costo  :</td>
            <td class="style16">
                :
            <asp:Label ID="txtcentrocosto" runat="server" ></asp:Label></td>
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
        
 <%--    <tr runat="server" id="observacion1">
            <td class="style7" >
                Observaciones </td>
            <td class="style16">
                :
            <asp:Label ID="lblObservacion" runat="server" ></asp:Label></td>
            <td class="style6">
                &nbsp;</td>
        </tr>--%>
       
         <tr>
            <td colspan="2" align="center" class="style4">
                   &nbsp;
               
                </td>
            <td align="center" class="style4">
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
                   <i><b>José Santander Robles<br/>
                    Abogado</b>  
               
                </i>  
               
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