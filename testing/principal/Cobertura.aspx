<%@ Page Title="" Language="C#" MasterPageFile="~/masters/Menu.Master" AutoEventWireup="true" CodeBehind="Cobertura.aspx.cs" Inherits="CobranzaALC.principal.Cobertura" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder2" Runat="Server">
<script type="text/javascript" language="javascript">
    html = document.getElementById("cobertura");
    html.setAttribute("id", "gral01");
    </script>
    <div id="centro">
     <%--   <div class="mini_menu">            
            <ul>
                <li><asp:LinkButton id="btnHome" runat="server" onclick="Home_Click">Home</asp:LinkButton></li>
                <li id="but01"><a href="#">Cobertura</a></li> 
            </ul> 
        </div>--%>
        <div class="titulo_centro_bg">
            <div class="titulo_centro"></div>
            <div class="titulo_seccion">
                <h2 class="gris">A L C</h2>
                <h4 class="rojo">Cobertura</h4>
            </div>
            <div class="titulo_centro_tope_der"></div>
        </div>
        <div class="contenido_centro">
          <center>
             <img src="../images/mapa.jpg" xwidth="136" xheight="104" class="banner_margen"
                    border="0" />
          </center>   
        </div>
    </div>
</asp:Content>
