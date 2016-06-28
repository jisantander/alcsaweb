<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Reporte.aspx.cs" Inherits="CobranzaALC.Cobranza.Reconstitucion.Reporte" %>


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
            width: 156px;
        }
        .style8
        {
            font-size: small;
            height: 23px;
        }
        .style9
        {
            width: 112px;
            color: #FFFFFF;
            font-weight: bold;
            background-color: #3366CC;
        }
        .style11
        {
            font-size: small;
            font-weight: bold;
        }
        .style12
        {
            color: #FFFFFF;
        }
        .style13
        {
            background-color: #3366CC;
        }
        .style14
        {
            font-size: medium;
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
        </tr>
        
        
        <tr>
            <td colspan="2" align="center" class="style4">
                   &nbsp;
               
                </td>
        </tr>
        
         <tr>
            <td colspan="2" align="left" class="style5">
              INFORME DE TITULOS RECONSTITUIDOS  
              
            </td>
        </tr>
        
         <tr>
            <td colspan="2" align="center" class="style4">
                   &nbsp;
               
                </td>
        </tr>
        
        <tr>
            <td colspan="2" align="left" class="style11">
             ANTECEDENTES DEL DEUDOR
            </td>
        </tr>
        
        
        <tr>
            <td class="style7" >
                Nombre / Razón Social </td>
            <td class="style6">
                :
            <asp:Label ID="lblNombre" runat="server" ></asp:Label></td>
        </tr>
        <tr>
            <td class="style7" >
                Rut</td>
            <td class="style6">
                :
            <asp:Label ID="lblRut" runat="server" ></asp:Label>-<asp:Label ID="lblDv" runat="server" ></asp:Label></td>
        </tr>
        <tr>
            <td class="style7" >
                N° Operación</td>
            <td class="style6">
                :
            <asp:Label ID="lblNumeroOperacion" runat="server" ></asp:Label></td>
        </tr>
        
           <tr>
            <td colspan="2" align="center" class="style4">
                   &nbsp;
               
                </td>
        </tr>
        
         <tr>
            <td colspan="2" align="left" class="style11">
             ANTECEDENTES DE GARANTIA
            </td>
        </tr>
        
        <!-- -->
         <tr>
            <td class="style7" >
                Ubicación del Inmueble </td>
            <td class="style6">
                :
            <asp:Label ID="lblUbicacionInmueble" runat="server" ></asp:Label></td>
        </tr>
        <tr>
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
        </tr>
        
        
           <tr>
            <td colspan="2" align="center" class="style4">
                   &nbsp;
               
                </td>
        </tr>
        
          <tr>
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
        </tr>
        
          <tr>
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
        </tr>
        
        
        <tr>
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
        </tr>
        
           <tr>
            <td colspan="2" align="center" class="style4">
                   &nbsp;
               
                </td>
        </tr>
        
     <tr>
            <td class="style7" >
                Observaciones </td>
            <td class="style6">
                :
            <asp:Label ID="lblObservacion" runat="server" ></asp:Label></td>
        </tr>
       
         <tr>
            <td colspan="2" align="center" class="style4">
                   &nbsp;
               
                </td>
        </tr>
         <tr>
            <td colspan="2" align="center" class="style4">
                   &nbsp;
               
                </td>
        </tr>
        
           <tr>
            <td colspan="2" align="center">
        
        &nbsp;       
                </td>
        </tr>
        
        
         <tr>
            <td colspan="2" align="center">
        
        &nbsp;       
                </td>
        </tr>
        
           <tr>
            <td colspan="2" align="center">
        
        &nbsp;       
                </td>
        </tr>
        
         <tr>
            <td colspan="2" align="center">
        
        &nbsp;       
                </td>
        </tr>
        
             <tr>
            <td colspan="2" align="center">
                   <i><b>José Santander Robles<br/>
                    Abogado</b>  
               
                </i>  
               
                </td>
        </tr>
        
    </table>


</blockquote>
    
    
    
    </form>

</body>
</html>

    <script language="javascript" type="text/javascript">
        window.print();
    </script>
    