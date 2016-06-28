<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="index.aspx.cs" Inherits="CobranzaALC.index" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>ALC Asesorìa Legal y Crediticía Ltda</title>
    <link href="/css/alc.css" rel="stylesheet" type="text/css" />

</head>

<body>

    <div id="templatemo_container">

        <%-- <div id="templatemo_header">
    	<div id="logosection"> 
    	<br/><br/>
    	<center><img width="180" height="80" src="images/logo.jpg" /></center>--%>
        <!--<div class="sitelogo"></div>-->

        <%-- </div>
        <div id="header">
        	<div class="title">
            	<br />
	        	<span class="bigtext">Asesoría Legal y Crediticia Ltda</span><br /><br /><br />
    	    	<h2 align="right">Estado Nº 359 Santiago - Chile | Tel.: 633 3115 - 633 3483&nbsp;</h2></div>

        </div>
	    </div>--%>
        <div align="right">
            <object classid="clsid:D27CDB6E-AE6D-11cf-96B8-444553540000" codebase="http://download.macromedia.com/pub/shockwave/cabs/flash/swflash.cab#version=6,0,29,0" width="930" height="195">
                <param name="movie" value="../images/asesoria.swf">
                <param name="quality" value="high">
                <embed src="../images/asesoria.swf" quality="high" pluginspage="http://www.macromedia.com/go/getflashplayer" type="application/x-shockwave-flash" width="930" height="195" />
            </object>
        </div>

        <div id="templatemo_menu">

            <div id="menu">

                <ul>


                    <li>
                        <asp:HyperLink ID="HyperLink9" NavigateUrl="~/index.aspx" runat="server">Home</asp:HyperLink>
                    </li>

                    <li>

                        <asp:HyperLink ID="HyperLink3" NavigateUrl="~/index.aspx?p=uno" runat="server">Quienes Somos</asp:HyperLink>

                    </li>
                    <li>
                        <asp:HyperLink ID="HyperLink5" NavigateUrl="~/index.aspx?p=tres" runat="server">Nuestros Servicios</asp:HyperLink>
                    </li>
                    <li>
                        <asp:HyperLink ID="HyperLink6" NavigateUrl="~/index.aspx?p=dos" runat="server">Clientes</asp:HyperLink>

                    </li>
                    <li>
                        <asp:HyperLink ID="HyperLink10" NavigateUrl="http://www.alcsa.cl/contacto.aspx" Target="_blank" runat="server">Contacto</asp:HyperLink>
                        <%--<a href="http://www.alcsa.cl/m1/" target="_blank">Contacto</a>--%></li>

                    <div id="marquesina" align="right">
                    </div>
                </ul>


            </div>

            <div id="search">
                <!--<input class="textfield" type="text" value="Search..."/> <input class="send_btn" type="submit" value="Buscar" />-->

            </div>
        </div>

        <!-- start of content -->

        <div id="templatemo_content">

            <!-- start of left column -->



            <div id="templatemo_left_column">

                <!-- <div id="leftcolumn_box01">
                <div class="leftcolumn_box01_top">
                    <h2 align="center">Acceso a Intranet</h2>
                </div>
                <div class="leftcolumn_box01_bottom">
                    <form method="get" action="#">
                      <div class="form_row"><label>Email</label><input class="inputfield" name="email_address" type="text" id="email_addremss"/></div>
                        <div class="form_row"><label>Password</label><input class="inputfield" name="password" type="password" id="password"/></div>
                        <input class="button" type="submit" name="Submit" value="Login" />
                    </form>
                </div>            
            </div>-->

                <div id="section2">
                    <div class="section2_top">
                        <h2>SERVICIOS</h2>
                    </div>
                    <div class="section2_bottom">
                        <ul>
                            <li>
                                <asp:HyperLink ID="HyperLink1" NavigateUrl="~/index.aspx?p=uno" runat="server">QUIENES SOMOS</asp:HyperLink>
                            </li>

                            <li>
                                <asp:HyperLink ID="HyperLink2" NavigateUrl="~/index.aspx?p=dos" runat="server">CLIENTES</asp:HyperLink>

                            </li>
                            <li>
                                <asp:HyperLink ID="HyperLink4" NavigateUrl="~/index.aspx?p=tres" runat="server">NUESTROS SERVICIOS</asp:HyperLink>
                            </li>

                            <li>
                                <asp:HyperLink ID="HyperLink11" NavigateUrl="~/index.aspx?p=cuatro" runat="server">EQUIPO DE TRABAJO</asp:HyperLink>
                            </li>

                            <li>
                                <asp:HyperLink ID="HyperLink8" NavigateUrl="~/index.aspx?p=cinco" runat="server">COBERTURA</asp:HyperLink>
                            </li>
                            <%--<li><a href="http://www.alcsa.cl/m1/" target="_blank">CONTACTO</a></li>--%>

                            <li>
                                <asp:HyperLink ID="HyperLink7" NavigateUrl="~/index.aspx?p=seis" runat="server">SOLICITUD DE DOCUMENTOS</asp:HyperLink>
                            </li>


                        </ul>
                        <br />
                        <div class="more_button"><a href="http://www.alcsa.cl/contacto.aspx" target="_blank"><font color="White">Contacto&nbsp;</font></a></div>
                    </div>

                </div>

            </div>

            <!-- end of left column -->

            <form id="form1" runat="server">

                <div id="templatemo_middle_column">

                    <!-- inicio texto -->
                    <asp:ScriptManager ID="ScriptManager1" runat="server">
                    </asp:ScriptManager>


                    <asp:Panel ID="panel7" runat="server" Visible="false">
                        <h1 align="center">
                            <br />
                            ¿ Necesita algún documento ? </h1>
                        <br />
                        <h1 align="center"><a href="index.aspx?p=seis">Solicitelo con nosotros aqui</a></h1>

                        <br />
                        <center>
                            <br />
                            <br />

                            <img src="images/logo.jpg" />
                            <br />
                            <br />
                            <br />
                            <br />
                            <br />
                            <br />

                        </center>



                    </asp:Panel>

                    <asp:Panel ID="panel1" runat="server" Visible="false">
                        <h1 align="center">Quienes Somos</h1>
                        <br />
                        <br />
                        <p>
                            ALC Asesoría Legal y Crediticía, tiene su origen en la inquietud de un equipo de profesionales.
            por satisfacer las necesidades comerciales de sus clientes, tanto en materia legal y crediticía,
            como en aquellas vinculaciones de estas dos áreas. Ha sido asi como el apoyo a la gestión crediticía, tanto
            en su otorgamiento como en su recuperación, con sus multiples servicios asociados, han ido marcando
            el rumbo y desarrollo de ALC.
            
            
                        </p>


                        <p>
                            ALC está conformada por un equipo de trabajo compuesto de Abogados e Ingenieros especialistas en temas de
            cobranza, logísticos de cobranza, recaudación y el desarrollo de múltiples servicios asociados
            a los procesos de crédito, más un equipo de Ejecutivos de cuenta, Procuradores, Asistentes Administrativos
            y Secretarias , altamente capacitados para brindar un servicio personalizado y de excelencía, adaptándose
            a los requerimientos y necesidades de cada uno de nuestros clientes          

                        </p>
                    </asp:Panel>

                    <asp:Panel ID="panel2" runat="server" Visible="false">
                        <h1 align="center">Clientes</h1>
                        <br />
                        <br />
                        <p>
                            &nbsp;&nbsp;<a href="http://www.bancoestado.cl" target="_blank"><img src="/images/templatemo_list_icon02.gif" />&nbsp;&nbsp;<b>BANCOESTADO</b></a><br />
                            <br />
                            &nbsp;&nbsp;<a href="http://www.capel.cl" target="_blank"><img src="/images/templatemo_list_icon02.gif" />&nbsp;&nbsp;<b>CAPEL</b></a><br />
                            <br />
                            &nbsp;&nbsp;<a href="http://www.vinafranciscodeaguirre.cl" target="_blank"><img src="/images/templatemo_list_icon02.gif" />&nbsp;&nbsp;<b>VINAFRANCISCODEAGUIRRE</b></a><br />
                            <br />
                            &nbsp;&nbsp;<a href="http://www.cavalieri.cl" target="_blank"><img src="/images/templatemo_list_icon02.gif" />&nbsp;&nbsp;<b>CAVALIERI</b></a><br />
                            <br />
                            &nbsp;&nbsp;<a href="http://www.factoringcreacion.cl" target="_blank"><img src="/images/templatemo_list_icon02.gif" />&nbsp;&nbsp;<b>FACTORINGCREACION</b></a><br />


                        </p>

                    </asp:Panel>

                    <asp:Panel ID="panel3" runat="server" Visible="false">
                        <h1 align="center">Nuestros Servicios</h1>
                        <br />
                        <center>

                            <cc1:Accordion ID="Accordion1" runat="server"
                                SelectedIndex="0"
                                Width="390px"
                                HeaderCssClass="accordionheader"
                                ContentCssClass="accordioncontent"
                                FadeTransitions="true"
                                FramesPerSecond="40"
                                ToolTip="Seleccione una de las opciones"
                                TransitionDuration="250"
                                AutoSize="None">
                                <Panes>

                                    <cc1:AccordionPane ID="Left" runat="server">
                                        <Header>
                                GESTORIA DE DOCUMENTOS
                                </Header>
                                        <Content>
                                            <table cellpadding="0" cellspacing="0" style="border: 0; width: 370px;">
                                                Consiste en la obtención y recopilación de todo tipo de documentos ante organismos públicos o privados para la constitución de una garantía o la adquisición de una vivienda. 

Nuestra Empresa presta este servicio a clientes institucionales mediante procesos masivos y también a clientes individuales mediante su servicio ON-LINE 

¿ Necesita Constituir una Garantía o adquirir una propiedad ? 
                                                <br />
                                                <br />
                                                NO PIERDA TIEMPO 
               <br />
                                                <br />
                                                <a href="http://www.alcsa.cl/contacto.aspx" target="_blank">
                                                    <img src="/images/templatemo_list_icon02.gif" />&nbsp;&nbsp;<b>CONTACTENOS AQUI</b></a><br />
                                            </table>
                                        </Content>
                                    </cc1:AccordionPane>

                                    <cc1:AccordionPane ID="Right" runat="server">
                                        <Header>
                                    RECONSTITUCIÓN DE TÍTULOS MASIVOS
                                </Header>
                                        <Content>
                                            <table cellpadding="0" cellspacing="0" style="border: 0; width: 370px;">
                                                Consiste en la ubicación de la inscripción de dominio de un inmueble, con la
            finalidad de obtener la copia del documento que dio origen a su adquisición y
            los certificados de Dominio Vigente y de Gravamenes y Prohibiciones. Nuestra empresa
            presta este servicio a clientes institucionales mediante procesos masivos y también
            a clientes individuales mediante su servicio ON-LINE.
            <br />
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
                                                <a href="http://www.alcsa.cl/contacto.aspx" target="_blank">
                                                    <img src="/images/templatemo_list_icon02.gif" />&nbsp;&nbsp;<b>CONTACTENOS AQUI</b></a><br />
                                            </table>
                                        </Content>
                                    </cc1:AccordionPane>

                                    <cc1:AccordionPane ID="AccordionPane1" runat="server">
                                        <Header>
                                ALZAMIENTOS MASIVOS
                                </Header>
                                        <Content>
                                            <table cellpadding="0" cellspacing="0" style="border: 0; width: 370px;">
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
                                                <a href="http://www.alcsa.cl/contacto.aspx" target="_blank">
                                                    <img src="/images/templatemo_list_icon02.gif" />&nbsp;&nbsp;<b>CONTACTENOS AQUI</b></a><br />
                                            </table>
                                        </Content>
                                    </cc1:AccordionPane>

                                    <cc1:AccordionPane ID="AccordionPane2" runat="server">
                                        <Header>
                                ARQUEO Y VERIFICACIONES
                                </Header>
                                        <Content>
                                            <table cellpadding="0" cellspacing="0" style="border: 0; width: 370px;">
                                                Nuestra empresa ofrece servicios de arqueos físicos de
            títulos de crédito y documentación. Poniendo a disposición personal
            especializado y sistemas de información necesario para el control 
            de su resultado.
            <br />
                                                <br />
                                                NO PIERDA TIEMPO 
               <br />
                                                <br />
                                                <a href="http://www.alcsa.cl/contacto.aspx" target="_blank">
                                                    <img src="/images/templatemo_list_icon02.gif" />&nbsp;&nbsp;<b>CONTACTENOS AQUI</b></a><br />
                                            </table>
                                        </Content>
                                    </cc1:AccordionPane>

                                    <cc1:AccordionPane ID="AccordionPane3" runat="server">
                                        <Header>
                                ESTUDIO DE TÍTULOS
                                </Header>
                                        <Content>
                                            <table cellpadding="0" cellspacing="0" style="border: 0; width: 370px;">
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
                                                <a href="http://www.alcsa.cl/contacto.aspx" target="_blank">
                                                    <img src="/images/templatemo_list_icon02.gif" />&nbsp;&nbsp;<b>CONTACTENOS AQUI</b></a><br />
                                            </table>
                                        </Content>
                                    </cc1:AccordionPane>

                                    <cc1:AccordionPane ID="AccordionPane4" runat="server">
                                        <Header>
                                AUDITORIAS Y CAPACITACIÓN
                                </Header>
                                        <Content>
                                            <table cellpadding="0" cellspacing="0" style="border: 0; width: 370px;">
                                                Nuestra empresa pone a disposición sus profesionales para la 
            capacitación y auditoría de procesos de crédito y cobranzas,
            en los tópicos que involucran cada uno de ellos. 
             <br />
                                                <br />
                                                ¿ Necesita apoyo y capacitación para su personal ?<br />

                                                <br />
                                                <br />
                                                NO PIERDA TIEMPO 
               <br />
                                                <br />
                                                <a href="http://www.alcsa.cl/contacto.aspx" target="_blank">
                                                    <img src="/images/templatemo_list_icon02.gif" />&nbsp;&nbsp;<b>CONTACTENOS AQUI</b></a><br />
                                            </table>
                                        </Content>
                                    </cc1:AccordionPane>

                                    <cc1:AccordionPane ID="AccordionPane5" runat="server">
                                        <Header>
                              SOLUCIONES EN COBRANZA
                                </Header>
                                        <Content>
                                            <table cellpadding="0" cellspacing="0" style="border: 0; width: 370px;">
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
                                                <a href="http://www.alcsa.cl/contacto.aspx" target="_blank">
                                                    <img src="/images/templatemo_list_icon02.gif" />&nbsp;&nbsp;<b>CONTACTENOS AQUI</b></a><br />
                                            </table>
                                        </Content>
                                    </cc1:AccordionPane>




                                </Panes>
                            </cc1:Accordion>


                        </center>


                    </asp:Panel>

                    <asp:Panel ID="panel4" runat="server" Visible="false">
                        <h1 align="center">Equipo de Trabajo</h1>
                        <br />
                        <br />
                        <center>

                            <img src="images/foto1.JPG" width="130" height="100" />&nbsp;&nbsp;
                            <img src="images/foto2.JPG" width="130" height="100" />&nbsp;&nbsp;
                            <img src="images/foto3.jpg" width="130" height="100" /><br />
                            <br />
                            <img src="images/foto4.JPG" width="130" height="100" />&nbsp;&nbsp;
                            <img src="images/foto5.JPG" width="130" height="100" />&nbsp;&nbsp;
                            <img src="images/foto6.jpg" width="130" height="100" />
                            <br />


                        </center>



                    </asp:Panel>

                    <asp:Panel ID="panel5" runat="server" Visible="false">
                        <h1 align="center">Cobertura</h1>
                        <br />
                        <br />
                        <center>

                            <img src="images/mapa.JPG" />

                        </center>



                    </asp:Panel>

                    <asp:Panel ID="panel6" runat="server" Visible="false">
                        <h1 align="center">Solicitud de Documentos</h1>
                        <br />

                        <h4 align="left">&nbsp;&nbsp;¿ NECESITA ALGUNO DE ESTOS DOCUMENTOS ? &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="http://www.alcsa.cl/contacto.aspx" target="_blank"><img src="/images/templatemo_list_icon02.gif" />&nbsp;<b>CONTACTENOS AQUI</b></a></h4>

                        <center>

                            <cc1:Accordion ID="Accordion2" runat="server"
                                SelectedIndex="0"
                                Width="460px"
                                HeaderCssClass="accordionheader"
                                ContentCssClass="accordioncontent"
                                FadeTransitions="true"
                                FramesPerSecond="40"
                                ToolTip="Seleccione una de las opciones"
                                TransitionDuration="250"
                                AutoSize="None">
                                <Panes>

                                    <cc1:AccordionPane ID="AccordionPane6" runat="server">
                                        <Header>
                                 CONSERVADOR DE BIENES RAICES
                                </Header>
                                        <Content>

                                            <div align="left">
                                                &nbsp;&nbsp;<img src="/images/templatemo_list_icon02.gif" />&nbsp;&nbsp;<b><a href="javascript:alert('Venta en línea en construcción');">Inscripción de la Hipoteca</a></b><br />
                                                &nbsp;&nbsp;<img src="/images/templatemo_list_icon02.gif" />&nbsp;&nbsp;<b>Copia de la inscripción de dominio</b><br />
                                                &nbsp;&nbsp;<img src="/images/templatemo_list_icon02.gif" />&nbsp;&nbsp;<b>Certificado de gravamenes y prohibiciones</b><br />
                                                &nbsp;&nbsp;<img src="/images/templatemo_list_icon02.gif" />&nbsp;&nbsp;<b>Copia de inscripción del extracto primitivo de la sociedad</b><br />
                                                &nbsp;&nbsp;<img src="/images/templatemo_list_icon02.gif" />&nbsp;&nbsp;<b>Certificado de Vigencia de la sociedad</b><br />
                                                &nbsp;&nbsp;<img src="/images/templatemo_list_icon02.gif" />&nbsp;&nbsp;<b>Copia de la inscripción de dominio de las aguas</b><br />
                                                &nbsp;&nbsp;<img src="/images/templatemo_list_icon02.gif" />&nbsp;&nbsp;<b>Certificado de vigencia de dominio de las aguas</b><br />
                                                &nbsp;&nbsp;<img src="/images/templatemo_list_icon02.gif" />&nbsp;&nbsp;<b>Certificado de gravamenes y prohibiciones de las aguas</b><br />
                                                &nbsp;&nbsp;<img src="/images/templatemo_list_icon02.gif" />&nbsp;&nbsp;<b>Copia de la inscripción del auto de posesión efectiva</b><br />
                                                &nbsp;&nbsp;<img src="/images/templatemo_list_icon02.gif" />&nbsp;&nbsp;<b>Copia de la inscripción especial de la herencia</b><br />
                                                &nbsp;&nbsp;<img src="/images/templatemo_list_icon02.gif" />&nbsp;&nbsp;<b>Copia de la inscripción del testamento</b><br />
                                                &nbsp;&nbsp;<img src="/images/templatemo_list_icon02.gif" />&nbsp;&nbsp;<b>Copia de la escritura del reglamento de Copropiedad Inmobiliaría</b>


                                            </div>

                                            <%--
            <br />
            <br />
              NO PIERDA TIEMPO 
               <br />
               <br />  
               <a href="http://www.alcsa.cl/m1/" target=_blank><img src=  "/images/templatemo_list_icon02.gif" />&nbsp;&nbsp;<b>CONTACTENOS AQUI</b></a><br />  --%>
                                        </Content>
                                    </cc1:AccordionPane>

                                    <cc1:AccordionPane ID="AccordionPane7" runat="server">
                                        <Header>
                                    MUNICIPALIDADES
                                </Header>
                                        <Content>


                                            <div align="left">
                                                &nbsp;&nbsp;<img src="/images/templatemo_list_icon02.gif" />&nbsp;&nbsp;<b>Certificado DOM que acredite que propiedad no se encuentra afecta a
                                                    <br />
                                                    &nbsp;&nbsp;&nbsp;&nbsp;
             &nbsp; expropiación</b><br />
                                                &nbsp;&nbsp;<img src="/images/templatemo_list_icon02.gif" />&nbsp;&nbsp;<b>Certificado de Deslindes otorgado por la Dirección de Obras Municipales</b><br />
                                                &nbsp;&nbsp;<img src="/images/templatemo_list_icon02.gif" />&nbsp;&nbsp;<b>Certificado de recepción final</b><br />
                                                &nbsp;&nbsp;<img src="/images/templatemo_list_icon02.gif" />&nbsp;&nbsp;<b>Plano de fucion de los inmuebles constancia de aprobación municipal y de su
                                                    <br />
                                                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;número de archivo en el CBR </b>
                                                <br />
                                                &nbsp;&nbsp;<img src="/images/templatemo_list_icon02.gif" />&nbsp;&nbsp;<b>Certificado de número</b><br />
                                                &nbsp;&nbsp;<img src="/images/templatemo_list_icon02.gif" />&nbsp;&nbsp;<b>Certificado que acredite que el inmueble se acoge a las normas de la ley de
                                                    <br />
                                                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Copropiedad Inmobiliaria</b><br />
                                                &nbsp;&nbsp;<img src="/images/templatemo_list_icon02.gif" />&nbsp;&nbsp;<b>Planos subdivisión con constancia de apropiación municipal</b><br />


                                            </div>


                                            <%--  <br />
            <br />
              NO PIERDA TIEMPO 
               <br />
               <br />  
               <a href="http://www.alcsa.cl/m1/" target=_blank><img src=  "/images/templatemo_list_icon02.gif" />&nbsp;&nbsp;<b>CONTACTENOS AQUI</b></a><br />   --%>
                                        </Content>
                                    </cc1:AccordionPane>

                                    <cc1:AccordionPane ID="AccordionPane8" runat="server">
                                        <Header>
                                    NOTARIA
                                </Header>
                                        <Content>


                                            <div align="left">
                                                &nbsp;&nbsp;<img src="/images/templatemo_list_icon02.gif" />&nbsp;&nbsp;<b>Pago de la notaria (escritura de hipoteca)</b><br />
                                                &nbsp;&nbsp;<img src="/images/templatemo_list_icon02.gif" />&nbsp;&nbsp;<b>Copia de escritura pública - Notaría</b><br />



                                            </div>


                                            <%--  <br />
            <br />
              NO PIERDA TIEMPO 
               <br />
               <br />  
               <a href="http://www.alcsa.cl/m1/" target=_blank><img src=  "/images/templatemo_list_icon02.gif" />&nbsp;&nbsp;<b>CONTACTENOS AQUI</b></a><br />   --%>
                                        </Content>
                                    </cc1:AccordionPane>

                                    <cc1:AccordionPane ID="AccordionPane9" runat="server">
                                        <Header>
                                    ARCHIVO JUDICIAL
                                </Header>
                                        <Content>


                                            <div align="left">
                                                &nbsp;&nbsp;<img src="/images/templatemo_list_icon02.gif" />&nbsp;&nbsp;<b>Copia de escritura pública - Archivos Judiciales</b><br />
                                                &nbsp;&nbsp;<img src="/images/templatemo_list_icon02.gif" />&nbsp;&nbsp;<b>Certificado de Matrimonio - Registro Civil</b><br />
                                                &nbsp;&nbsp;<img src="/images/templatemo_list_icon02.gif" />&nbsp;&nbsp;<b>Certificado que acredite que no tiene deudas por pago de contribuciones de
                                                    <br />
                                                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;bienes raices - Tesorería</b><br />
                                                &nbsp;&nbsp;<img src="/images/templatemo_list_icon02.gif" />&nbsp;&nbsp;<b>Certificado que indique que la propiedad no se encuentra afecta a
                                                    <br />
                                                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;expropiación  - SERVIU</b><br />
                                                &nbsp;&nbsp;<img src="/images/templatemo_list_icon02.gif" />&nbsp;&nbsp;<b>Certificado de deuda CORA - Ministerio de Agricultura</b><br />



                                            </div>


                                            <%--  <br />
            <br />
              NO PIERDA TIEMPO 
               <br />
               <br />  
               <a href="http://www.alcsa.cl/m1/" target=_blank><img src=  "/images/templatemo_list_icon02.gif" />&nbsp;&nbsp;<b>CONTACTENOS AQUI</b></a><br />   --%>
                                        </Content>
                                    </cc1:AccordionPane>

                                    <cc1:AccordionPane ID="AccordionPane10" runat="server">
                                        <Header>
                                    SERVIU
                                </Header>
                                        <Content>


                                            <div align="left">
                                                &nbsp;&nbsp;<img src="/images/templatemo_list_icon02.gif" />&nbsp;&nbsp;<b>Certificado de urbanización - SERVIU</b><br />

                                            </div>


                                            <%--  <br />
            <br />
              NO PIERDA TIEMPO 
               <br />
               <br />  
               <a href="http://www.alcsa.cl/m1/" target=_blank><img src=  "/images/templatemo_list_icon02.gif" />&nbsp;&nbsp;<b>CONTACTENOS AQUI</b></a><br />   --%>
                                        </Content>
                                    </cc1:AccordionPane>


                                    <cc1:AccordionPane ID="AccordionPane11" runat="server">
                                        <Header>
                                    SAG
                                </Header>
                                        <Content>


                                            <div align="left">
                                                &nbsp;&nbsp;<img src="/images/templatemo_list_icon02.gif" />&nbsp;&nbsp;<b>Certificado que acredite que la subdivisión cumpla con la normativa vígente</b><br />

                                            </div>


                                            <%--  <br />
            <br />
              NO PIERDA TIEMPO 
               <br />
               <br />  
               <a href="http://www.alcsa.cl/m1/" target=_blank><img src=  "/images/templatemo_list_icon02.gif" />&nbsp;&nbsp;<b>CONTACTENOS AQUI</b></a><br />   --%>
                                        </Content>
                                    </cc1:AccordionPane>

                                    <cc1:AccordionPane ID="AccordionPane12" runat="server">
                                        <Header>
                                    SII
                                </Header>
                                        <Content>


                                            <div align="left">
                                                &nbsp;&nbsp;<img src="/images/templatemo_list_icon02.gif" />&nbsp;&nbsp;<b>Certificado de exensión de contribuciones - SII </b>
                                                <br />
                                                &nbsp;&nbsp;<img src="/images/templatemo_list_icon02.gif" />&nbsp;&nbsp;<b>Certificado de asignación de roles en trámites - SII</b><br />
                                                &nbsp;&nbsp;<img src="/images/templatemo_list_icon02.gif" />&nbsp;&nbsp;<b>Autorización especial de primera enajenación - SII</b><br />

                                            </div>


                                            <%--  <br />
            <br />
              NO PIERDA TIEMPO 
               <br />
               <br />  
               <a href="http://www.alcsa.cl/m1/" target=_blank><img src=  "/images/templatemo_list_icon02.gif" />&nbsp;&nbsp;<b>CONTACTENOS AQUI</b></a><br />   --%>
                                        </Content>
                                    </cc1:AccordionPane>

                                    <cc1:AccordionPane ID="AccordionPane13" runat="server">
                                        <Header>
                                    INFORMACIÓN COMERCIAL
                                </Header>
                                        <Content>


                                            <div align="left">
                                                &nbsp;&nbsp;<img src="/images/templatemo_list_icon02.gif" />&nbsp;&nbsp;<b>Informe Comercial Digitalizado</b><br />
                                                &nbsp;&nbsp;<img src="/images/templatemo_list_icon02.gif" />&nbsp;&nbsp;<b>Verificación de Domicilio Particular</b><br />
                                                &nbsp;&nbsp;<img src="/images/templatemo_list_icon02.gif" />&nbsp;&nbsp;<b>Verificación de Domicilio Comercial</b><br />

                                            </div>


                                            <%--  <br />
            <br />
              NO PIERDA TIEMPO 
               <br />
               <br />  
               <a href="http://www.alcsa.cl/m1/" target=_blank><img src=  "/images/templatemo_list_icon02.gif" />&nbsp;&nbsp;<b>CONTACTENOS AQUI</b></a><br />   --%>
                                        </Content>
                                    </cc1:AccordionPane>

                                    <cc1:AccordionPane ID="AccordionPane14" runat="server">
                                        <Header>
                                    SOLUCION DE REPAROS
                                </Header>
                                        <Content>


                                            <div align="left">

                                                <%-- &nbsp;&nbsp;<img src=  "/images/templatemo_list_icon02.gif" />&nbsp;&nbsp;<b></b><br />--%>
                                            </div>


                                            <%--  <br />
            <br />
              NO PIERDA TIEMPO 
               <br />
               <br />  
               <a href="http://www.alcsa.cl/m1/" target=_blank><img src=  "/images/templatemo_list_icon02.gif" />&nbsp;&nbsp;<b>CONTACTENOS AQUI</b></a><br />   --%>
                                        </Content>
                                    </cc1:AccordionPane>

                                </Panes>
                            </cc1:Accordion>



                        </center>


                    </asp:Panel>





                    <!-- término texto -->
                </div>






            </form>






            <!-- start of right column -->

            <div id="templatemo_right_column">

                <div class="rightbig_button"><a href="http://alcsa.myftp.org/alccob/login.asp" target="_blank">Acceso a Intranet</a></div>



                <div class="rightbig_button2"><a href="http://www.asesorweb.cl/alcsa/capacliente/frmContacto.aspx" target="_blank">Solicite Asesoría Aquí</a></div>

                <div class="rightbig_button2"><a href="http://www.alcsa.cl/acceso.aspx" target="_blank">ALC NET</a></div>

                <div class="rightbig_button2"><a href="http://190.153.249.118/~alcsacl/" target="_blank">Seguimiento Asesorias</a></div>

                <center>
                    <img src="images/telefonista.jpg" alt="Nuestro Call Center esta disponible para usted" />
                </center>

            </div>



            <!-- end of content -->


            <div id="templatemo_footer">

                <b>A L C | Estado Nº 359 Piso 13, Santiago - Chile | E-Mail : <a href="mailto:contactoalc@alcsa.cl">contactoalc@alcsa.cl</a>
                    <br />
                    Teléfonos : 633 3115 - 633 3483 Fax : 638 1215 - 633 5338
                    <br />Todos los derechos reservados
            </div>
            </b>
    <div id="templatemo_footer_bottom"></div>

        </div>

    </div>
</body>
</html>
