<%@ Page Title="" Language="C#" MasterPageFile="~/masters/Menu.Master" AutoEventWireup="true" CodeBehind="Equipo.aspx.cs" Inherits="CobranzaALC.principal.Equipo" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder2" Runat="Server">

    <script type="text/javascript" language="javascript">
        html = document.getElementById("equipo");
        html.setAttribute("id", "gral01");
    </script>
    <div id="centro">
      <%--  <div class="mini_menu">            
            <ul>
                <li><asp:LinkButton id="btnHome" runat="server" onclick="Home_Click">Home</asp:LinkButton></li>
                <li id="but01"><a href="#">Equipo de Trabajo</a></li> 
            </ul> 
        </div>--%>
        <div class="titulo_centro_bg">
            <div class="titulo_centro"></div>
            <div class="titulo_seccion">
                <h2 class="gris">A L C</h2>
                <h4 class="rojo">Equipo de Trabajo</h4>
            </div>
            <div class="titulo_centro_tope_der"></div>
        </div>
        <br /><br /><br /><br />
        <center>
        <div id="barra_none">
                    <img class="banner_margen" src="../images/014.jpg" width="300" 
                        height="250" border="0"/>
                    <img src="../images/002.jpg" width="300" height="250" class="banner_margen"
                    border="0"/>
                    
                    <img src="../images/100_0742.jpg" width="300" height="250" class="banner_margen"
                    border="0"/>
                    
                    <img src="../images/100_0741.jpg" width="300" height="250" class="banner_margen"
                    border="0"/>
                </div>
              </center>  
    </div>
</asp:Content>
