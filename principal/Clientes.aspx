<%@ Page Title="" Language="C#" MasterPageFile="~/masters/Menu.Master" AutoEventWireup="true" CodeBehind="Clientes.aspx.cs" Inherits="CobranzaALC.principal.Clientes" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder2" Runat="Server">

    <script type="text/javascript" language="javascript">
        html = document.getElementById("clientes");
        html.setAttribute("id", "gral01");
    </script>
    <div id="centro">
      <%--  <div class="mini_menu">            
            <ul>
                <li><asp:LinkButton id="btnHome" runat="server" onclick="Home_Click">Home</asp:LinkButton></li>
                <li id="but01"><a href="#">Clientes</a></li> 
            </ul> 
        </div>--%>
        <div class="titulo_centro_bg">
            <div class="titulo_centro"></div>
            <div class="titulo_seccion">
                <h2 class="gris">A L C</h2>
                <h4 class="rojo">Clientes</h4>
            </div>
            <div class="titulo_centro_tope_der"></div>
        </div>
        <div class="contenido_centro">
             &nbsp;&nbsp;<img src=  "../images/lista_pro.gif" />&nbsp;&nbsp;<b>WWW.BANCOESTADO.CL</b><br />
             &nbsp;&nbsp;<img src=  "../images/lista_pro.gif" />&nbsp;&nbsp;<b>WWW.CAPEL.CL</b><br />
             &nbsp;&nbsp;<img src=  "../images/lista_pro.gif" />&nbsp;&nbsp;<b>WWW.VINAFRANCISCODEAGUIRRE.CL</b><br />
             &nbsp;&nbsp;<img src=  "../images/lista_pro.gif" />&nbsp;&nbsp;<b>WWW.CAVALIERI.CL</b><br />
             &nbsp;&nbsp;<img src=  "../images/lista_pro.gif" />&nbsp;&nbsp;<b>WWW.FACTORINGCREACION.CL</b><br />
        </div>
    </div>
</asp:Content>
