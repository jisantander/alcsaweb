<%@ Page Title="" Language="C#" MasterPageFile="~/masters/Menu.Master" AutoEventWireup="true" CodeBehind="ServiciosDetalle.aspx.cs" Inherits="CobranzaALC.principal.ServiciosDetalle" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder2" Runat="Server">
    
    <script type="text/javascript" language="javascript">
        html = document.getElementById("Servicios");
        html.setAttribute("id", "gral01");
    </script>
    <div id="centro">
        <%--<div class="mini_menu">            
            <ul>
                <li><asp:LinkButton id="btnHome" runat="server" onclick="Home_Click">Home</asp:LinkButton></li>
                <li id="Li1"><a href="javascript:history.go(-1)">Volver</a></li>
                <li id="but01"><a href="#">Nuestros Servicios</a></li> 
            </ul> 
        </div>--%>
        <div class="titulo_centro_bg">
            <div class="titulo_centro"></div>
            <div class="titulo_seccion">
                <h2 class="gris">A L C</h2>
                <h4 class="rojo"><asp:label runat="server" id="titulo" >Nuestros Servicios</asp:label></h4>
            </div>
            <div class="titulo_centro_tope_der"></div>
        </div>
        <div class="contenido_centro">
            <asp:panel runat="server" id="Panel1" visible="false">
               Consiste en la optención y recopilación de todo tipo de documentos
               ante organismos públicos o privados para la constitución de una
               garantía o la adquisición de una vivienda.
               <br /><br />
               Nuestra Empresa presta este servicio a clientes institucionales mediante
               procesos masivos y también a clientes individuales mediante su servicio ON-LINE
               <br /><br />
               ¿ Necesita Constituir una Garantía o adquirir una propieda ?  
               <br />
               <br />
              NO PIERDA TIEMPO
               <br />
               <br />  
               <a href="http://www.alcsa.cl/m1/" target=_blank><img src=  "../images/lista_pro.gif" />&nbsp;&nbsp;<b>CONTACTENOS AQUI</b></a><br />
            </asp:panel>
            
            <asp:panel runat="server" id="Panel2" visible="false">
            Consiste en la ubicación de la inscripción de dominio de un inmueble, con la
            finalidad de obtener la copia del documento que dio origen a su adquisición y
            los certificados de Dominio Vigente y de Gravamenes y Prohibiciones. Nuestra empresa
            presta este servicio a clientes institucionales mediante procesos masivos y también
            a clientes individuales mediante su servicio ON-LINE.
            <br /><br />
            ¿ Necesita una copia de su escritura ?<br />
            ¿ Perdio su escritura ?<br />
            ¿ Quiere saber quién es el actual dueño de la propiedad ?<br />
            ¿ Necesita saber si su propiedad está embargada o mantiene gravamenes ?<br />
            ¿ Necesita saber si su propiedad sigue a su nombre ?
            <br />
            <br />
              NO PIERDA TIEMPO
               <br />
               <br />  
               <a href="http://www.alcsa.cl/m1/" target=_blank><img src=  "../images/lista_pro.gif" />&nbsp;&nbsp;<b>CONTACTENOS AQUI</b></a><br />
            </asp:panel>
       
            <asp:panel runat="server" id="Panel3" visible="false">
            Proceso por el cual se obtiene la liberación de los gravamenes
            que afectan a un inmueble o a un vehiculo o maquinaría. Nuestra
            empresa presta este servicio a clientes institucionales mediante
            procesos masivos y también a clientes individuales mediante su
            servicio ON-LINE.
            <br />
            <br />
              NO PIERDA TIEMPO 
               <br />
               <br />  
               <a href="http://www.alcsa.cl/m1/" target=_blank><img src=  "../images/lista_pro.gif" />&nbsp;&nbsp;<b>CONTACTENOS AQUI</b></a><br />   
            </asp:panel>
            
            
            <asp:panel runat="server" id="Panel4" visible="false">
            Nuestra empresa ofrece servicios de arqueos físicos de
            títulos de crédito y documentación. Poniendo a disposición personal
            especializado y sistemas de información necesario para el control 
            de su resultado.
            <br />
            <br />
              NO PIERDA TIEMPO
               <br />
               <br />  
               <a href="http://www.alcsa.cl/m1/" target=_blank><img src=  "../images/lista_pro.gif" />&nbsp;&nbsp;<b>CONTACTENOS AQUI</b></a><br />    
            </asp:panel>
         
            <asp:panel runat="server" id="Panel5" visible="false">
            Servicio profesional que permite determinar si los títulos de un
            inmueble se encuentran ajustados a derecho, para la venta o
            adquisición del mismo o la constitución de una Garantía para la
            colocación de un crédito. Nuestra empresa presta este servicio a clientes institucionales mediante
            procesos masivos y también a clientes individuales mediante su
            servicio ON-LINE.
            <br />
            <br />
              NO PIERDA TIEMPO
               <br />
               <br />  
               <a href="http://www.alcsa.cl/m1/" target=_blank><img src=  "../images/lista_pro.gif" />&nbsp;&nbsp;<b>CONTACTENOS AQUI</b></a><br />
            
            </asp:panel>
            <asp:panel runat="server" id="Panel6" visible="false">
            Nuestra empresa pone a disposición sus profesionales para la 
            capacitación y auditoría de procesos de crédito y cobranzas,
            en los tópicos que involucran cada uno de ellos. 
             <br /><br />
            ¿ Necesita apoyo y capacitación para su personal ?<br />
           
            <br />
            <br />
              NO PIERDA TIEMPO  
               <br />
               <br />  
               <a href="http://www.alcsa.cl/m1/" target=_blank><img src=  "../images/lista_pro.gif" />&nbsp;&nbsp;<b>CONTACTENOS AQUI</b></a><br />
            
            </asp:panel>
            <asp:panel runat="server" id="Panel7" visible="false">
             Servicio especializado para la recuperación de sus créditos,
             mediante procesos pre-judiciales y judiciales apoyados mediante sistemas
             de información en linea y call center. Nuestra empresa presta este
             servicio a clientes institucionales mediante procesos masivos y
             también a los clientes individuales mediante su
            servicio ON-LINE.
            <br />
            <br />
              NO PIERDA TIEMPO   
               <br />
               <br />  
               <a href="http://www.alcsa.cl/m1/" target=_blank><img src=  "../images/lista_pro.gif" />&nbsp;&nbsp;<b>CONTACTENOS AQUI</b></a><br />
            </asp:panel>
             
        </div>
    </div>
</asp:Content>
