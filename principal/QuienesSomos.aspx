<%@ Page Title="" Language="C#" MasterPageFile="~/masters/Menu.Master" AutoEventWireup="true" CodeBehind="QuienesSomos.aspx.cs" Inherits="CobranzaALC.principal.QuienesSomos" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder2" Runat="Server">
    <script type="text/javascript" language="javascript">
        html = document.getElementById("quienes");
        html.setAttribute("id", "gral01");
    </script>
    <div id="centro">
        <%--<div class="mini_menu">            
            <ul>
                <li><asp:LinkButton id="btnHome" runat="server" onclick="Home_Click">Home</asp:LinkButton></li>
                <li id="but01"><a href="#">Quienes Somos</a></li> 
            </ul> 
        </div>--%>
        <div class="titulo_centro_bg">
            <div class="titulo_centro"></div>
            <div class="titulo_seccion">
                <h2 class="gris">A L C</h2>
                <h4 class="rojo">Quienes Somos</h4>
            </div>
            <div class="titulo_centro_tope_der"></div>
        </div>
        <div class="contenido_centro">
            ALC Asesoría Legal y Crediticía, tiene su origen en la inquietud de un equipo de profesionales.
            por satisfacer las necesidades comerciales de sus clientes, tanto en materia legal y crediticía,
            como en aquellas vinculaciones de estas dos áreas. Ha sido asi como el apoyo a la gestión crediticía, tanto
            en su otorgamiento como en su recuperación, con sus multiples servicios asociados, han ido marcando
            el rumbo y desarrollo de ALC.
            <br /><br />
            ALC está conformada por un equipo de trabajo compuesto de Abogados e Ingenieros especialistas en temas de
            cobranza, logísticos de cobranza, recaudación y el desarrollo de múltiples servicios asociados
            a los procesos de crédito, más un equipo de Ejecutivos de cuenta, Procuradores, Asistentes Administrativos
            y Secretarias , altamente capacitados para brindar un servicio personalizado y de excelencía, adaptándose
            a los requerimientos y necesidades de cada uno de nuestros clientes.         
        </div>
    </div>
</asp:Content>
