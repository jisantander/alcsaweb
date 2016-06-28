<%@ Page Title="" Language="C#" MasterPageFile="~/masters/Menu.Master" AutoEventWireup="true" CodeBehind="Servicios.aspx.cs" Inherits="CobranzaALC.principal.Servicios" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder2" Runat="Server">
<script type="text/javascript" language="javascript">
    html = document.getElementById("Servicios");
    html.setAttribute("id", "gral01");
    </script>
    <div id="centro">
       <%-- <div class="mini_menu">            
            <ul>
                <li><asp:LinkButton id="btnHome" runat="server" onclick="Home_Click">Home</asp:LinkButton></li>
                <li id="but01"><a href="#">Nuestros Servicios</a></li> 
            </ul> 
        </div>--%>
        <div class="titulo_centro_bg">
            <div class="titulo_centro"></div>
            <div class="titulo_seccion">
                <h2 class="gris">A L C</h2>
                <h4 class="rojo">Nuestros Servicios</h4>
            </div>
            <div class="titulo_centro_tope_der"></div>
        </div>
        <div class="contenido_centro">
             &nbsp;&nbsp;<a href="ServiciosDetalle.aspx?p=uno"><img src=  "../images/lista_pro.gif" />&nbsp;&nbsp;<b>GESTORÍA DE DOCUMENTOS</b></a><br />
             &nbsp;&nbsp;<a href="ServiciosDetalle.aspx?p=dos"><img src=  "../images/lista_pro.gif" />&nbsp;&nbsp;<b>RECONSTITUCIÓN DE TÍTULOS MASIVOS</b></a><br />
             &nbsp;&nbsp;<a href="ServiciosDetalle.aspx?p=tres"><img src=  "../images/lista_pro.gif" />&nbsp;&nbsp;<b>ALZAMIENTOS MASIVOS</b></a><br />
             &nbsp;&nbsp;<a href="ServiciosDetalle.aspx?p=cuatro"><img src=  "../images/lista_pro.gif" />&nbsp;&nbsp;<b>ARQUEO Y VERIFICACIONES</b></a><br />
             &nbsp;&nbsp;<a href="ServiciosDetalle.aspx?p=cinco"><img src=  "../images/lista_pro.gif" />&nbsp;&nbsp;<b>ESTUDIO DE TÍTULOS</b></a><br />
             &nbsp;&nbsp;<a href="ServiciosDetalle.aspx?p=seis"><img src=  "../images/lista_pro.gif" />&nbsp;&nbsp;<b>AUDITORIAS Y CAPACITACIÓN</b></a><br />
             &nbsp;&nbsp;<a href="ServiciosDetalle.aspx?p=siste"><img src=  "../images/lista_pro.gif" />&nbsp;&nbsp;<b>SOLUCIONES EN COBRANZA</b></a><br />
        </div>
    </div>
</asp:Content>
