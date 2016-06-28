<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="WebForm1.aspx.cs" Inherits="CobranzaALC.WebForm1" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxToolkit" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>ALC Asesorìa Legal y Crediticía Ltda</title>
    <link href="css/alc2.css" rel="stylesheet" type="text/css" />
    <link href="css/redmond/jquery-ui-1.10.3.custom.min.css" rel="stylesheet" />
    <link href="css/bootstrap.min.css" rel="stylesheet" />

    <style type="text/css">
        #divAcordeon .ui-accordion-content a { font-size: 13px; }
        #divAcordeon .ui-accordion-content ul { list-style-type: circle; }
        .boton-acceso-directo {
            border: solid 1px #6ab8e0;
            margin: 10px;
            background-color: #fff;
            cursor: pointer;
            width: 100px;
            padding: 2px 2px 0 2px;
        }
    </style>
    <script type="text/javascript" src="js/jquery-1.10.2.min.js"></script>
    <script type="text/javascript" src="js/jquery-ui-1.10.3.custom.min.js"></script>
    <script type="text/javascript">
        $(document).ready(function () {
            $('#divAcordeon').accordion({
                heightStyle: 'content'
            });

            $('#divLectorCodigoBarra').click(function () {
                var ventana = window.open('LectorCodigo.aspx', 'lectorcodigo', 'width=400,height=150,scrollbars=0,status=0,menubar=no,top=100,left=100');
                ventana.focus();
            });

            $('#divIngresoRequerimiento').click(function () {
                var ventana = window.open('Requerimientos/Mantenedor.aspx?popup=1', 'incidencia', 'width=900,height=500,scrollbars=1,status=1,menubar=0,top=50,left=50');
                ventana.focus();
            });
        });

        function CargarRutaDesdeCodigoBarra(ruta) {
            window.parent.frames[1].location = ruta;
        }
    </script>
</head>
<body>
    <form id="form1" runat="server">

        <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>

        <!-- Mantenedores -->
        <img src="images/logo.jpg" alt="-" />

        <div class="btn-group btn-group-justified" role="group" aria-label="...">
            <div id="divLectorCodigoBarra" class="btn-group" role="group">
                <button type="button" class="btn btn-default">
                    <img alt="*" src="images/iconos/barcodereader.png" style="border: 0; width: 25px; height: 25px;" />Leer Código de Barra</button>
            </div>
            <div id="divIngresoRequerimiento" class="btn-group" role="group">
                <button type="button" class="btn btn-default">
                    <img alt="*" src="images/iconos/icono-warning.png" style="border: 0; width: 25px; height: 25px;" />Reportar Incidencia</button>
            </div>
        </div>
        <br />

        <div id="divAcordeon">
            <!-- MANTENEDORES -->
            <% if (Session["Perfil"].ToString() == "1")
               { %>
            <h3>Mantenedores</h3>
            <div id="menu2">
                <ul>
                    <li><a href="Cobranza/mantenedores/MntClientes.aspx" target="derecha" title="Opción de Clientes">Clientes</a></li>
                    <li><a href="Cobranza/mantenedores/MntDeudores.aspx" target="derecha" title="Opción de Deudores">Deudores</a></li>
                    <li><a href="Cobranza/mantenedores/MntUsuarios.aspx" target="derecha" title="Opción de Usuarios">Usuarios</a></li>
                    <li><a href="Cobranza/mantenedores/MntDomicilios.aspx" target="derecha" title="Opción de Domicilios">Domicilios</a></li>
                    <li><a href="Cobranza/mantenedores/MntBienRaiz.aspx" target="derecha" title="Opción de Bien Raiz">Bien Raiz</a></li>
                    <li><a href="Cobranza/mantenedores/MntBienMueble.aspx" target="derecha" title="Opción de Bien Mueble">Bien Mueble</a></li>
                    <li><a href="Cobranza/mantenedores/MntParametrosClientes.aspx" target="derecha" title="Opción de parámetros">Parámetros por Cliente</a></li>
                    <li><a href="Cobranza/procesos/BuscaDocuPrejudicial.aspx" target="derecha" title="Opción de mantenedor Documentos prejudicial">Doc. Prejudiciales</a></li>
                    <li><a href="Cobranza/mantenedores/mntconservadores.aspx" target="derecha" title="Opción de mantenedor Proveedores">Proveedores</a></li>
                    <li><a href="Cobranza/mantenedores/MntEstadosReconstitucion.aspx" target="derecha" title="Opción de mantenedor estados reconstituciones">Estados Reconstituciones</a></li>
                    <li><a href="Cobranza/mantenedores/MntGastosEstadosReconstitucion.aspx" target="derecha" title="Opción de mantenedor tipos de gasto reconstituciones">Tipo Gastos Reconst.</a></li>
                    <li><a href="Cobranza/mantenedores/MntProcuradoresXJuicio.aspx" target="derecha" title="">Procurador por Juicio</a></li>
                    <li><a href="Cobranza/mantenedores/SubTramite/Listar.aspx" target="derecha" title="">Mantenedor SubTramite</a></li>

                    <% if (Session["Perfil"].ToString() == "1") { %>
                        <li><a href="Cobranza/CargasMasivas/IngresoArchivo.aspx" target="derecha" title="Cargas Masivas">Cargas Masivas</a></li>
                        <li><a href="Cobranza/mantenedores/Remesas/Listar.aspx" target="derecha" title="Mantenedor REMESAS">Mantenedor REMESAS</a></li>
                        <li><a href="Cobranza/mantenedores/Riesgo/Listar.aspx" target="derecha" title="Mantenedor de Riesgo">Mantenedor de Riesgo</a></li>
                        <li><a href="Cobranza/procesos/Buscacobranzaestado.aspx" target="derecha" title="Opción estado cobranza">Editar Estado Juicios</a></li>
                        <li><a href="Cobranza/Procesos/CallCenter/ListadoEntradasVicidial.aspx" target="derecha" title="Opción Campañas Vicidial">Campañas Vicidial</a></li>
                    <% }%>
                </ul>
            </div>
            <% }%>

            <% if (Session["Perfil"].ToString() == "1" || Session["Perfil"].ToString() == "2" || Session["Perfil"].ToString() == "9")
               { %>
            <!-- COBRANZA JUDICIAL -->
            <h3>Cobranza</h3>
            <div id="div100">
                <ul>
                    <% if (Session["Perfil"].ToString() == "1" || Session["Perfil"].ToString() == "2" || Session["Perfil"].ToString() == "9") { %>
                    <li><a href="Cobranza/procesos/Cobranza.aspx" target="derecha" title="Opción de Cobranza">Agregar Cobranza</a></li>
                    <% }%>
                    <% if (Session["Perfil"].ToString() == "1") { %>
                    <li><a href="Cobranza/procesos/JuicioBusca.aspx" target="derecha" title="Opción de Cobranza">Responsable Juicio</a></li>
                    <% }%>
                    <li><a href="Cobranza/procesos/BuscaCobranza.aspx" target="derecha" title="Opción de Juicio">Agregar Juicio</a></li>
                    <li><a href="Cobranza/procesos/BuscaJuicio.aspx" target="derecha" title="Opción de Actividad">Agregar Act. Judicial</a></li>
                    <li><a href="Cobranza/procesos/BuscaCobranzaExhortos.aspx" target="derecha" title="Opción de Exhorto">Agregar Exhortos</a></li>
                    <li><a href="Cobranza/procesos/BuscaExhorto.aspx" target="derecha" title="Opción de Actividad Exhorto">Agregar Act. Exhortos</a></li>
                    <li><a href="Cobranza/procesos/Tablero2.aspx" target="derecha"  title="Opción de Tablero">Tablero Judicial</a></li>
                    <%--<li><a href="Cobranza/procesos/frmControlTablero.aspx" target="derecha" title="Opción de Tablero">Tablero Judicial</a></li>--%>
                    <li><a href="Cobranza/procesos/ExportarExcelJuicio.aspx" target="derecha" title="Opción exportar">Exportar Excel Juicios</a></li>
                    <li><a href="Cobranza/mantenedores/FindExhorto.aspx" target="derecha" title="">Cambiar Rol-Exhorto</a></li>
                </ul>
            </div>
            <% }%>

            <!-- Cobranza PreJudicial -->
            <% if (Session["Perfil"].ToString() == "1" )
               { %>
            <h3>Cobranza PreJudicial</h3>
            <div id="Div2">
                <ul>
                    <li><a href="Cobranza/procesos/BuscaCobranzaPrejudicial.aspx" target="derecha" title="Opción de Cobranza Prejudicial">Agregar Prejudicial</a></li>
                </ul>
            </div>
            <% }%>

            <!-- GASTOS -->
            <% if (Session["Perfil"].ToString() == "1" || Session["Perfil"].ToString() == "2")
               { %>
            <h3>Gastos</h3>
            <div id="Div3">
                <ul>
                    <% if (Session["Perfil"].ToString() == "1")
                       { %>
                    <li><a href="Cobranza/Gastos/BuscaCobranzaGastos.aspx" target="derecha" title="Opción de Gastos">Agregar Gastos</a></li>
                    <% }%>
                    <li><a href="Cobranza/Gastos/Listar.aspx" target="derecha" title="Opción de Gastos">Listar Gastos</a></li>
                </ul>
            </div>
            <% }%>

            <!-- ABONOS -->
            <% if (Session["Perfil"].ToString() == "1")
               { %>
            <h3>Modulo de Caja</h3>
            <div id="Div4">
                <ul>
                    <li><a href="Cobranza/Abonos/buscaCobranzaAbonos.aspx" target="derecha" title="Opción de Abonos">Agregar Ingreso de Caja</a></li>
                    <li><a href="Cobranza/Abonos/detallecliente.aspx" target="derecha" title="Opción de Abonos">Agregar Rendición</a></li>
                    <!-- <li><a href="Cobranza/Abonos/MuestraRendicion.aspx" target="derecha" title="Consulta Rendición">Consulta Rendición</a></li> -->
                    <li><a href="Cobranza/Abonos/LiberarCheques.aspx" target="derecha" title="Liberar Cheques">Liberar Cheques</a></li>

                </ul>
            </div>
            <% }%>

            <!-- Calculo de Liquidación -->
            <% if (Session["Perfil"].ToString() == "1")
               { %>
            <h3>Calculo Liquidación</h3>
            <div id="Div5">
                <ul>
                    <li><a href="Cobranza/CalculoLiquidacion/BuscaCobranzaLiquidacion.aspx" target="derecha" title="Opción de calculo liquidacion">Generar Cálculo</a></li>
                </ul>
            </div>
            <% }%>

            <!-- CONSULTAS GENERALES-->
            <% if (Session["Perfil"].ToString() == "1" || Session["Perfil"].ToString() == "2" || Session["Perfil"].ToString() == "3" || Session["Perfil"].ToString() == "4" || Session["Perfil"].ToString() == "9")
               { %>
            <h3>Consultas Generales</h3>
            <div id="Div6">
                <ul>
                    <li><a href="Cobranza/consultaespecial/BuscaCobranzaConsulta.aspx" target="derecha" title="Opción de Juicio">Judicial</a></li>
                    <li><a href="Cobranza/consultaespecial/ConsultaJuicioEtapaDOS.aspx" target="derecha" title="Opción de Juicio">Juicios por Etapas</a></li>
                    <li><a href="Cobranza/consultaespecial/ConsultaExhorto.aspx" target="derecha" title="">Consulta Exhorto</a></li>
                    <li><a href="Cobranza/ConsultaEspecial/BuscaPrejudicial.aspx" target="derecha" title="Opción de Pre-Judicial">Pre-Judicial</a></li>
                    <li><a href="Cobranza/ConsultaEspecial/ConsultaAbonos.aspx" target="derecha" title="Opción de abonos">Consulta Ingreso de Caja</a></li>
                    <li><a href="javascript:alert('En construcción')" target="derecha" title="Opción de abonos">Consulta Rendiciones</a></li>
                    <li><a href="javascript:alert('En construcción')" target="derecha" title="Opción Reconstituciones">Reconstituciones</a></li>
                    <li><a href="javascript:alert('En construcción')" target="derecha" title="Opción Gestoría Hipotecaría">Gestoría Hipotecaría</a></li>
                    <li><a href="Cobranza/ConsultaEspecial/BuscaGeneral2.aspx" target="derecha" title="Opción Domicilios">Domicilios</a></li>
                    <li><a href="Cobranza/ConsultaEspecial/BuscaGeneral3.aspx" target="derecha" title="Opción Bienes Raices">Bienes Raices</a></li>
                    <li><a href="Cobranza/ConsultaEspecial/BuscaCobranza.aspx" target="derecha" title="Opción Bienes mueble">Bienes Mueble</a></li>
                    <li><a href="Cobranza/ConsultaEspecial/BuscaGeneral.aspx" target="derecha" title="Opción Teléfonos">Teléfonos </a></li>

                    <li><a href="Cobranza/ConsultaEspecial/ListarPorRiesgo.aspx" target="derecha" title="Opción Teléfonos">Juicios Por Riesgo </a></li>

                    <li><a href="Cobranza/Gestion/ControlJuiciosPorPlazos.aspx" target="derecha" title="Control Por Plazo">Control Por Plazo</a></li>
                </ul>
            </div>
            <% }%>

            <!-- Gestoría documentación -->
            <% if (Session["Perfil"].ToString() == "1" || Session["Perfil"].ToString() == "8" || Session["Perfil"].ToString() == "9")
               { %>
            <h3>Gestoría Documentación</h3>
            <div id="Div7">
                <ul>
                    <% if (Session["Perfil"].ToString() == "1")
                       { %>
                    <li><a href="Cobranza/prendas/buscaCobranzaPrenda.aspx" target="derecha" title="Opción Agregar Prenda ">Agre. Prenda</a></li>
                    <li><a href="javascript:alert('En construcción')" target="derecha" title="Opción Agregar Gestoría Hipotecaria ">Agre. Gestoría Hipotecaria</a></li>
                    <li><a href="Cobranza/Reconstitucion/ReporteReconmarca.aspx" target="derecha" title="Arma informe reconstitución ">Arma Informe </a></li>
                    <% }%>
                    <li><a href="Cobranza/Reconstitucion/SubMenu.aspx" target="derecha" title="Opción Agregar Agregar Reconstitución ">Reconstitución </a></li>
                </ul>
            </div>
            <% }%>

            <!-- ESCRITOS -->
            <h3>Generador de Documentos</h3>
            <div id="Div8">
                <ul>
                    <li><a href="Cobranza/Escritos/EscritoPrejudicial.aspx" target="derecha" title="Opción de Escrito Pre-Judicial">Pre-Judicial</a></li>
                    <li><a href="Cobranza/Documentos/Listado.aspx" target="derecha" title="Generador de Escritos">Generador de Escritos</a></li>
                    <li><a href="Cobranza/Demandas/Listado.aspx" target="derecha" title="Generador de Escritos">Generador de Demandas</a></li>
                </ul>

            </div>

            <!-- DIGITALIZAR -->
            <h3>Digitalización</h3>
            <div id="Div9">
                <ul>
                    <li><a href="Cobranza/Digitalizar/Digitalizar.aspx" target="derecha" title="Opción para digitalizar">Documentos</a></li>
                    <li><a href="Cobranza/Digitalizar/DigiConsulta.aspx" target="derecha" title="Opción para ver documentos">Mostrar Documentos</a></li>
                </ul>
            </div>

            <h3>Requerimientos</h3>
            <div id="Div10">
                <ul>
                    <li><a href="Requerimientos/Listado.aspx" target="derecha" title="Opción para digitalizar">Listado Requerimientos</a></li>
                </ul>
            </div>

            <% if (Session["Perfil"].ToString() == "1") { %>
            <h3>Metricas</h3>
            <div id="Div1">
                <ul>
                    <li><a href="Cobranza/Gestion/Metricas/Listado.aspx" target="derecha" title="">Mantenedor Plazos</a></li>
                    <li><a href="Cobranza/Gestion/Metricas/Avances/AvancePorEtapa.aspx" target="derecha" title="">Avance por Etapa</a></li>
                    <li><a href="Cobranza/Gestion/Metricas/Avances/AvancePorTramite.aspx" target="derecha" title="">Avance por Tramite</a></li>
                    <li><a href="Cobranza/Gestion/Metricas/Avances/Cumplimiento.aspx" target="derecha" title="">Cumplimiento</a></li>

                    <li><a href="Cobranza/Gestion/Metricas/EstadosActuales/Clientes/ListadoClientes.aspx" target="derecha" title="">Gestión Clientes</a></li>
                    <li><a href="Cobranza/Gestion/Metricas/EstadosActuales/Procuradores/ListadoProcuradores.aspx" target="derecha" title="">Gestión Procurador</a></li>

                    <li><a href="Cobranza/Metas/Listado.aspx" target="derecha" title="">Metas Procurador</a></li>
                </ul>
            </div>
        </div>
         <% }%>
        <br />
    </form>
</body>
</html>
