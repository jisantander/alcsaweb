<%@ Page Title="" Language="C#" MasterPageFile="~/masters/Menu.Master" AutoEventWireup="true" CodeBehind="SolicitudDocuemntos.aspx.cs" Inherits="CobranzaALC.principal.SolicitudDocuemntos" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder2" Runat="Server">

    <script type="text/javascript" language="javascript">
        html = document.getElementById("SolicitudDocumentos");
        html.setAttribute("id", "gral01");
    </script>
    <div id="centro">
   <%--     <div class="mini_menu">            
            <ul>
                <li><asp:LinkButton id="btnHome" runat="server" onclick="Home_Click">Home</asp:LinkButton></li>
                <li id="but01"><a href="#">Solicitud de Documentos</a></li> 
            </ul> 
        </div>--%>
        <div class="titulo_centro_bg">
            <div class="titulo_centro"></div>
            <div class="titulo_seccion">
                <h2 class="gris">A L C</h2>
                <h4 class="rojo">Solicitud de Documentos</h4>
            </div>
            <div class="titulo_centro_tope_der"></div>
        </div>
        <div class="contenido_centro">
             CONSERVADOR DE BIENES RAICES  ¿ Necesita algunos de estos documentos ?
             <br /><br />
             &nbsp;&nbsp;<img src=  "../images/lista_pro.gif" />&nbsp;&nbsp;<b>Inscripción de la Hipoteca</b><br />
             &nbsp;&nbsp;<img src=  "../images/lista_pro.gif" />&nbsp;&nbsp;<b>Copia de la inscripción de dominio</b><br />
             &nbsp;&nbsp;<img src=  "../images/lista_pro.gif" />&nbsp;&nbsp;<b>Certificado de gravamenes y prohibiciones</b><br />
             &nbsp;&nbsp;<img src=  "../images/lista_pro.gif" />&nbsp;&nbsp;<b>Copia de inscripción del extracto primitivo de la sociedad</b><br />
             &nbsp;&nbsp;<img src=  "../images/lista_pro.gif" />&nbsp;&nbsp;<b>Certificado de Vigencia de la sociedad</b><br />
             &nbsp;&nbsp;<img src=  "../images/lista_pro.gif" />&nbsp;&nbsp;<b>Copia de la inscripción de dominio de las aguas</b><br />
             &nbsp;&nbsp;<img src=  "../images/lista_pro.gif" />&nbsp;&nbsp;<b>Certificado de vigencia de dominio de las aguas</b><br />
             &nbsp;&nbsp;<img src=  "../images/lista_pro.gif" />&nbsp;&nbsp;<b>Certificado de gravamenes y prohibiciones de las aguas</b><br />
             &nbsp;&nbsp;<img src=  "../images/lista_pro.gif" />&nbsp;&nbsp;<b>Copia de la inscripción del auto de posesión efectiva</b><br />
             &nbsp;&nbsp;<img src=  "../images/lista_pro.gif" />&nbsp;&nbsp;<b>Copia de la inscripción especial de la herencia</b><br />
             &nbsp;&nbsp;<img src=  "../images/lista_pro.gif" />&nbsp;&nbsp;<b>Copia de la inscripción del testamento</b><br />
             &nbsp;&nbsp;<img src=  "../images/lista_pro.gif" />&nbsp;&nbsp;<b>Copia de la escritura del reglamento de Copropiedad Inmobiliaría</b><br />
             
             <br />
               <br />
              NO PIERDA TIEMPO
               <br />
               <br />  
               <a href="http://www.alcsa.cl/m1/" target=_blank><img src=  "../images/lista_pro.gif" />&nbsp;&nbsp;<b>CONTACTENOS AQUI</b></a><br />
                  
                  
                  
        </div>
    </div>
</asp:Content>
