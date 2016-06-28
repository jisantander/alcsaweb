<%@ Page Title="" Language="C#" MasterPageFile="~/masters/Menu.Master" AutoEventWireup="true" CodeBehind="contacto.aspx.cs" Inherits="CobranzaALC.principal.contacto" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder2" Runat="Server">
<script type="text/javascript" language="javascript">
    html = document.getElementById("contacto");
    html.setAttribute("id", "gral01");
    </script>
    <div id="centro">
     <%--   <div class="mini_menu">            
            <ul>
                <li><asp:LinkButton id="btnHome" runat="server" onclick="Home_Click">Home</asp:LinkButton></li>
                <li id="but01"><a href="#">Contacto</a></li> 
            </ul> 
        </div>--%>
        <div class="titulo_centro_bg">
            <div class="titulo_centro"></div>
            <div class="titulo_seccion">
                <h2 class="gris">A L C</h2>
                <h4 class="rojo">Contacto</h4>
            </div>
            <div class="titulo_centro_tope_der"></div>
        </div>
        <div class="contenido_centro">
                  
            <br />
            <br />
                Estamos pendientes de sus necesidades
               <br />
               <br />  
               <a href="http://www.alcsa.cl/m1/" target=_blank><img src=  "../images/lista_pro.gif" />&nbsp;&nbsp;<b>CONTACTENOS AQUI</b></a><br />
        </div>
    </div>
</asp:Content>
