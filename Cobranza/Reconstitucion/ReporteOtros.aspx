<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ReporteOtros.aspx.cs" Inherits="CobranzaALC.Cobranza.Reconstitucion.ReporteOtros" %>

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
            width: 237px;
        }
        .style11
        {
            font-size: small;
            font-weight: bold;
        }
        .style14
        {
            font-size: medium;
        }
        .style15
        {
            font-size: small;
            font-weight: bold;
            height: 19px;
        }
        .style16
        {
            font-size: small;
            width: 194px;
        }
        .style17
        {
            width: 194px;
        }
        </style>
</head>
<body>
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
            <td colspan="2" align="left" class="style11">
                ANTECEDENTES DEL CLIENTE
            </td>
            <td align="left" class="style11">
                &nbsp;</td>
        </tr>
        
        
        <tr>
            <td class="style7" >
                Nombre / Razón Social </td>
            <td class="style16">
                :
            <asp:Label ID="lblNombre" runat="server" ></asp:Label></td>
            <td class="style6">
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style7" >
                Rut</td>
            <td class="style16">
                :
            <asp:Label ID="lblRut" runat="server" ></asp:Label>-<asp:Label ID="lblDv" runat="server" ></asp:Label></td>
            <td class="style6">
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style7" >
                N° Operación</td>
            <td class="style16">
                :
            <asp:Label ID="lblNumeroOperacion" runat="server" ></asp:Label></td>
            <td class="style6">
                &nbsp;</td>
        </tr>
        
        <%--   <tr>
            <td colspan="2" align="center" class="style4">
                   &nbsp;
               
                </td>
        </tr>--%>
        
         <tr>
            <td colspan="2" align="left" class="style11">
             ANTECEDENTES DE GARANTIA
            </td>
            <td align="left" class="style11">
                &nbsp;</td>
        </tr>
        
        <!-- -->
         <tr>
            <td class="style7" >
                Ubicación del Inmueble </td>
            <td class="style16">
                :
            <asp:Label ID="lblUbicacionInmueble" runat="server" ></asp:Label></td>
            <td class="style6">
                &nbsp;</td>
        </tr>
        
        
         <tr>
            <td colspan="2" align="left" class="style15">
             ANTECEDENTES DE ESCRITURA DE ALZAMIENTO
            </td>
            <td align="left" class="style15">
                &nbsp;</td>
        </tr>
        
         <tr runat="server" id="FechaEscritura">
            <td class="style7" >
                Fecha Escritura </td>
            <td class="style16">
                :
            <asp:Label ID="lblFechaEscritura" runat="server" ></asp:Label></td>
            <td class="style6">
                &nbsp;</td>
        </tr>
        
        <tr runat="server" id="Notario">
            <td class="style7" >
                Notario</td>
            <td class="style16">
                :
            <asp:Label ID="lblNotario" runat="server" ></asp:Label></td>
            <td class="style6">
                &nbsp;</td>
        </tr>
        
        <tr runat="server" id="RepertorioNotaria">
            <td class="style7" >
                Repertorio Notaria </td>
            <td class="style16">
                :
            <asp:Label ID="lblRepertorioNotaria" runat="server" ></asp:Label></td>
            <td class="style6">
                &nbsp;</td>
        </tr>
        
         <tr runat="server" id="conservador">
            <td class="style7" >
                Conservador</td>
            <td class="style16">
                :
            <asp:Label ID="lblconservador" runat="server" ></asp:Label></td>
            <td class="style6">
                &nbsp;</td>
        </tr>
        
        
        
         <tr>
            <td colspan="2" align="left" class="style11">
             SERVICIO DESARROLLADO
            </td>
            <td align="left" class="style11">
                &nbsp;</td>
        </tr>
        
        
        <%-- <tr>
            <td colspan="2" align="left" class="style11">
             DOCUMENTOS&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
             &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
             &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
             &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
             &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
             
            </td>
        </tr>
        --%>
        
        
        <tr >
            <td  class="style11">
             DOCUMENTOS
            <td class="style11" >
               &nbsp; UF
            </td>
            
               
            
            <td  class="style11">
                VALOR EN PESOS             </td>
            
               
            
        </tr>
        
        
        
        
        
         <tr runat="server" id="CertHipGravamenes">
            <td class="style7" >
                Obtención Cert. Hipotecas y Gravámenes</td>
            <td class="style16">
                :
            <asp:Label ID="lblCertHipGravamenesUF" runat="server" ></asp:Label>
            
            
            
            </td>
            <td class="style6">
            <asp:Label ID="lblCertHipGravamenesPESOS" runat="server" ></asp:Label>
            
                &nbsp;</td>
        </tr>
        
         <tr runat="server" id="CertDominio">
            <td class="style7" >
                Obtención Cert. Dominio</td>
            <td class="style16">
                :
            <asp:Label ID="CertDominioUF" runat="server" ></asp:Label>
            
            </td>
            <td class="style6">
                <asp:Label ID="CertDominioPESOS" runat="server" ></asp:Label></td>
        </tr>
        
         <tr runat="server" id="Endoso">
            <td class="style7" >
                Endoso</td>
            <td class="style16">
                :
            <asp:Label ID="EndosoUF" runat="server" ></asp:Label>
            
            </td>
            <td class="style6">
                <asp:Label ID="EndosoPESOS" runat="server" ></asp:Label></td>
        </tr>
        
         <tr runat="server" id="CertDicom">
            <td class="style7" >
                Certificado de Dicom</td>
            <td class="style16">
                :
            <asp:Label ID="CertDicomUF" runat="server" ></asp:Label>
            
           
            
            </td>
            <td class="style6">
                 <asp:Label ID="CertDicomPESOS" runat="server" ></asp:Label></td>
        </tr>
        
         <tr runat="server" id="AlzamientoEmbargo">
            <td class="style7" >
                Alzamiento de Embargo</td>
            <td class="style16">
                :
            <asp:Label ID="AlzamientoEmbargoUF" runat="server" ></asp:Label>
            
            
            
            </td>
            <td class="style6">
                <asp:Label ID="AlzamientoEmbargoPESOS" runat="server" ></asp:Label></td>
        </tr>
        
         <tr runat="server" id="AlzamientoMedidaPrecautoria">
            <td class="style7" >
                Alzamiento de Medida Precautoria</td>
            <td class="style16">
                :
            <asp:Label ID="AlzamientoMedidaPrecautoriaUF" runat="server" ></asp:Label>
            
            
            
            </td>
            <td class="style6">
                <asp:Label ID="AlzamientoMedidaPrecautoriaPESOS" runat="server" ></asp:Label></td>
        </tr>
        
        
         <tr runat="server" id="AlzamientosHipotecas">
            <td class="style7" >
                Alzamientos Hipotecas</td>
            <td class="style16">
                :
            <asp:Label ID="AlzamientosHipotecasUF" runat="server" ></asp:Label>
            
            
            
            </td>
            <td class="style6">
                <asp:Label ID="AlzamientosHipotecasPESOS" runat="server" ></asp:Label></td>
        </tr>
        
        
         <tr runat="server" id="AlzamientoProhibiciones">
            <td class="style7" >
                Alzamientos Prohibiciones</td>
            <td class="style16">
                :
            <asp:Label ID="AlzamientoProhibicionesUF" runat="server" ></asp:Label>
            
            
            
            </td>
            <td class="style6">
               <asp:Label ID="AlzamientoProhibicionesPESOS" runat="server" ></asp:Label></td>
        </tr>
        
        
  
        
        
         <tr runat="server" id="ReconstitucionEscritura">
            <td class="style7" >
                Reconstitución Escritura</td>
            <td class="style16">
                :
            <asp:Label ID="ReconstitucionEscrituraUF" runat="server" ></asp:Label>
            
           
            
            </td>
            <td class="style6">
                 <asp:Label ID="ReconstitucionEscrituraPESOS" runat="server" ></asp:Label></td>
        </tr>
        
         <tr runat="server" id="ConformidadAlzamiento">
            <td class="style7" >
                Conformidad Alzamiento</td>
            <td class="style16">
                :
            <asp:Label ID="ConformidadAlzamientoUF" runat="server" ></asp:Label>
            
            
            
            </td>
            <td class="style6">
                <asp:Label ID="ConformidadAlzamientoPESOS" runat="server" ></asp:Label></td>
        </tr>
        
         <tr runat="server" id="EscrituraAdjudicacion">
            <td class="style7" >
                Escritura de Adjudicación</td>
            <td class="style16">
                :
            <asp:Label ID="EscrituraAdjudicacionUF" runat="server" ></asp:Label>
            
           
            
            </td>
            <td class="style6">
                <asp:Label ID="EscrituraAdjudicacionPESOS" runat="server" ></asp:Label></td>
        </tr>
        
         <tr runat="server" id="Total">
            <td class="style7" >
                TOTAL</td>       
            <td class="style16">
                :
            <asp:Label ID="TotalUF" runat="server" ></asp:Label>
            
            
            
            </td>
            <td class="style6">
                <asp:Label ID="TotalPESOS" runat="server" ></asp:Label></td>
        </tr>
        
                <tr>
            <td colspan="2" align="left" class="style11">
             DOCUMENTACIÓN QUE SE ADJUNTA
            </td>
            <td align="left" class="style11">
                &nbsp;</td>
        </tr>
        
        
          <tr runat="server" id="CertGravaProhibiciones1">
            <td class="style7" >
                Certificado Gravámenes y Prohibiciones 1°</td>
            <td class="style16">
                :
            <asp:Label ID="CertGravaProhibiciones" runat="server" ></asp:Label></td>
            <td class="style6">
                &nbsp;</td>
        </tr>
        

  <tr runat="server" id="copiaInsDominioVig1">
            <td class="style7" >
                Copia Inscripción con dominio Vigente</td>
            <td class="style16">
                :
            <asp:Label ID="copiaInsDominioVig" runat="server" ></asp:Label></td>
            <td class="style6">
                &nbsp;</td>
        </tr>


  <tr runat="server" id="CertGravaProhib21">
            <td class="style7" >
                Certificado Gravámenes y Prohibiciones 2°</td>
            <td class="style16">
                :
            <asp:Label ID="CertGravaProhib2" runat="server" ></asp:Label></td>
            <td class="style6">
                &nbsp;</td>
        </tr>


  <tr runat="server" id="CopiaEscrituraAlzamiento1">
            <td class="style7" >
                Copia de Escritura de Alzamiento</td>
            <td class="style16">
                :
            <asp:Label ID="CopiaEscrituraAlzamiento" runat="server" ></asp:Label></td>
            <td class="style6">
                &nbsp;</td>
        </tr>


  <tr runat="server" id="CopiaEscrmutuohipo1">
            <td class="style7" >
                Copia Escritura Mutuo e Hipoteca</td>
            <td class="style16">
                :
            <asp:Label ID="CopiaEscrmutuohipo" runat="server" ></asp:Label></td>
            <td class="style6">
                &nbsp;</td>
        </tr>


  <tr runat="server" id="FotocopiaEscAlzamiento1">
            <td class="style7" >
                Fotocopia Escritura ALzamiento</td>
            <td class="style16">
                :
            <asp:Label ID="FotocopiaEscAlzamiento" runat="server" ></asp:Label></td>
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
        
     <tr runat="server" id="observacion1">
            <td class="style7" >
                Observaciones </td>
            <td class="style16">
                :
            <asp:Label ID="lblObservacion" runat="server" ></asp:Label></td>
            <td class="style6">
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



    <script language="javascript" type="text/javascript">
        window.print();
    </script>