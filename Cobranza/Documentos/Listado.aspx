<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Listado.aspx.cs" Inherits="CobranzaALC.Cobranza.Documentos.Listado" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link href="../../css/alc_estilo.css" rel="stylesheet" />
    <link href="../../css/alc2.css" rel="stylesheet" />
    <link href="../../css/start/jquery-ui-1.10.3.custom.min.css" rel="stylesheet" />

    <script type="text/javascript" src="../../js/jquery-1.10.2.min.js"></script>
    <script type="text/javascript" src="../../js/jquery-ui-1.10.3.custom.min.js"></script>
    <script type="text/javascript">
        $(document).ready(function () {
            var identificadores = '';

            OrdenarListaDeDocumentos();

            $('input[type="checkbox"]').each(function () {
                $('label[for=' + $(this).attr('id') + ']').css("display", "none");
            });

            $("#divMensaje").dialog({
                resizable: false,
                autoOpen: false,
                height: 200,
                width: 500,
                modal: true,
                buttons: {
                    Cerrar: function () {
                        $(this).dialog("close");
                    }
                }
            });

            $("#divTiposDocumentos").dialog({
                resizable: false,
                autoOpen: false,
                height: 350,
                width: 500,
                modal: true,
                buttons: {
                    Descargar: function () {
                        var ruta = 'Descargar.aspx?ruta=' + $('.listado-documentos').val() + '&ids=' + identificadores + '&for_dat=id_cob,id_jui,id_exh&nom_id_doc=id_jui&tipo_id_doc=TIJUI';
                        window.open(ruta, 'descarga_archivo', '');
                        $(this).dialog("close");
                    },
                    Cancelar: function () {
                        $(this).dialog("close");
                    }
                }
            });

            $('.generador-grupal').click(function () {
                identificadores = '';
                $('input:checkbox:checked').each(function (index, value) {
                    identificadores += $(this).next('label').text() + '-';
                });

                if (identificadores == '')
                    $("#divMensaje").dialog('open');
                else $("#divTiposDocumentos").dialog('open');
            });

            $('.boton-imprimir-cobranza').click(function () {
                identificadores = $(this).attr('alt');
                $("#divTiposDocumentos").dialog('open');
            });
        });

        function OrdenarListaDeDocumentos() {
            var $r = $('#lstTiposDocumentos option');
            $r.sort(function (a, b) {
                return (a.text < b.text) ? -1 : (a.text > b.text) ? 1 : 0;
                //or you can have a.text, b.text, etc
            });
            $($r).remove();
            $('#lstTiposDocumentos').append($($r));
        }
    </script>
</head>
<body>
    <form id="form1" runat="server">
        <table cellpadding="0" cellspacing="0" style="width: 700px;">
            <tr>
                <td class="barra-titulo" colspan="4">Documentos</td>
            </tr>
            <tr>
                <td style="width: 15%">Tipo Busqueda</td>
                <td style="width: 35%">
                    <asp:DropDownList ID="ddlTipo" runat="server" Width="95%" AutoPostBack="True" OnSelectedIndexChanged="ddlTipo_SelectedIndexChanged">
                        <asp:ListItem Selected="True" Value="J">Juicios</asp:ListItem>
                        <asp:ListItem Value="E">Exhortos</asp:ListItem>
                        <asp:ListItem Value="P">Pre-Judicial</asp:ListItem>
                    </asp:DropDownList>
                </td>
                <td style="width: 15%">&nbsp;</td>
                <td style="width: 35%">&nbsp;</td>
            </tr>
            <tr>
                <td style="width: 15%">Cliente</td>
                <td style="width: 35%">
                    <asp:DropDownList ID="ddlClientes" runat="server" DataTextField="rsocial" DataValueField="rut_cli" Width="95%">
                    </asp:DropDownList>
                </td>
                <td style="width: 15%">Deudor</td>
                <td style="width: 35%">
                    <asp:TextBox ID="txtRutDeudor" runat="server" Width="150px"></asp:TextBox>
                </td>
            </tr>
            <!--<asp:Panel ID="pnlFiltroConJuicio" runat="server">-->
            <tr>
                <td style="width: 15%">Tribunal</td>
                <td style="width: 35%">
                    <asp:DropDownList ID="ddlTribunales" runat="server" DataTextField="descripcion" DataValueField="id_tribunal" Width="95%">
                    </asp:DropDownList>
                </td>
                <td style="width: 15%">Rol Juicio</td>
                <td style="width: 35%">
                    <asp:TextBox ID="txtRolJuicio" runat="server" Width="150px"></asp:TextBox>
                </td>
            </tr>
            <!--<asp:Panel ID="pnlFiltroExhorto" runat="server" Visible="false">-->
            <tr>
                <td style="width: 15%">Rol Exhorto
                    
                </td>
                <td style="width: 35%">
                    <asp:TextBox ID="txtRolExhorto" runat="server" Width="150px"></asp:TextBox>
                </td>
                <td style="width: 15%">&nbsp;</td>
                <td style="width: 35%">&nbsp;</td>
            </tr>
            <!--</asp:Panel>-->
            <!--</asp:Panel>-->
            <tr>
                <td align="right" colspan="4">
                    <asp:Button ID="btnBuscar" runat="server" CssClass="boton" Text="Buscar" OnClick="btnBuscar_Click" Width="150px" />
                </td>
            </tr>
            <tr>
                <td class="barra-sub-titulo" colspan="4">
                    <a class="generador-grupal textos22" href="javascript:void(0);">Generar Archivos de Cobranzas Seleccionadas</a>
                </td>
            </tr>
            <tr>
                <td colspan="4" style="height: 100px;">
                    <asp:GridView ID="gvCobranzas" runat="server"
                        AllowPaging="True"
                        Width="100%"
                        CellPadding="4" ForeColor="#333333"
                        GridLines="None" PageSize="25" OnPageIndexChanging="gvCobranzas_PageIndexChanging" EmptyDataText="NO SE ENCONTRARON COBRANZAS" AutoGenerateColumns="False">
                        <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                        <AlternatingRowStyle BackColor="White" />
                        <Columns>
                            <asp:TemplateField>
                                <ItemTemplate>
                                    <asp:Image ID="imgImprimir" runat="server" Style="cursor: pointer;" ImageUrl="~/images/iconos/Buscar.png" AlternateText='<%# Eval("IdCobranza", "{0},") + Eval("IdJuicio", "{0},") + Eval("IdExhorto", "{0}") %>' CssClass="boton-imprimir-cobranza" />
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:BoundField HeaderText="Nro. Cobranza" DataField="NumeroOperacion" />
                            <asp:BoundField HeaderText="Cliente" DataField="Cliente" />
                            <asp:BoundField HeaderText="Deudor" DataField="Deudor" />
                            <asp:BoundField DataField="NombreTribunal" HeaderText="Tribunal" />
                            <asp:BoundField HeaderText="Rol Juicio" DataField="Rol" />
                            <asp:BoundField DataField="RolExhorto" HeaderText="Rol Exhorto" Visible="false" />
                            <asp:TemplateField>
                                <ItemTemplate>
                                    <asp:CheckBox ID="chkSeleccionar" runat="server" Text='<%# Eval("IdCobranza", "{0},") + Eval("IdJuicio", "{0},") + Eval("IdExhorto", "{0}") %>' />
                                </ItemTemplate>
                            </asp:TemplateField>
                        </Columns>
                        <EditRowStyle BackColor="#2461BF" />
                        <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                        <HeaderStyle CssClass="cabezabrilla" />
                        <PagerStyle BackColor="#2461BF" ForeColor="White" />
                        <RowStyle BackColor="#EFF3FB" />
                        <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                    </asp:GridView>
                </td>
            </tr>
            <tr>
                <td class="barra-sub-titulo" colspan="4">&nbsp;</td>
            </tr>
        </table>
        <div id="divTiposDocumentos" title="SELECCION DE DOCUMENTO">
            <table cellpadding="0" cellspacing="0" style="width: 100%;">
                <tr>
                    <td align="center">
                        <asp:ListBox ID="lstTiposDocumentos" runat="server" Height="200px" Width="97%" CssClass="listado-documentos">
                            <asp:ListItem Selected="True" Value="Formatos/CertifiqueDecreteRemate.aspx">Certifique Decrete Remate</asp:ListItem>
                            <asp:ListItem Value="Formatos/DecretoRemate.aspx">Decreto Remate</asp:ListItem>
                            <asp:ListItem Value="Formatos/NotificacionConformidadArticulo44.aspx">Notificación Conformidad Articulo 44</asp:ListItem>
                            <asp:ListItem Value="Formatos/DocumentosDos/AcompanaLiquidacionHipotecariaTasacionCostas.aspx">Acompaña Liquidacion Hipotecaria Tasacion Costas</asp:ListItem>
                            <asp:ListItem Value="Formatos/DocumentosDos/BasesRemateTipoJuicioEjecutivo.aspx">Bases Remate Tipo Juicio Ejecutivo</asp:ListItem>
                            <asp:ListItem Value="Formatos/DocumentosDos/BasesRemateTipoJuicioHipotecario.aspx">Bases Remate Tipo Juicio Hipotecario</asp:ListItem>
                            <asp:ListItem Value="Formatos/DocumentosDos/CumpleLoOrdenadoTipo.aspx">Cumple Lo Ordenado Tipo</asp:ListItem>
                            <asp:ListItem Value="Formatos/DocumentosDos/DesignacionMartilleroYRetiro.aspx">Designacion Martillero y Retiro</asp:ListItem>
                            <asp:ListItem Value="Formatos/DocumentosDos/DEV_EXH_PositivoSeCertifiqueHipotecario.aspx">DEV.EXH.Positivo Se Certifique Hipotecario</asp:ListItem>
                            <asp:ListItem Value="Formatos/DocumentosDos/DEV_EXH_PositivoSeCertifiqueYDecretoRemateHipotecario.aspx">DEV.EXH.Positivo Se Certifique y Decreto Remate Hipotecario</asp:ListItem>
                            <asp:ListItem Value="Formatos/DocumentosDos/DiaHoraSubasta.aspx">Dia y Hora Subasta</asp:ListItem>
                            <asp:ListItem Value="Formatos/DocumentosDos/RetiroVehiculoTipo.aspx">Retiro Vehiculo Tipo</asp:ListItem>
                            <asp:ListItem Value="Formatos/DocumentosDos/SeCertificaPagareNoExcepcionesTipo.aspx">Se Certifica Pagare No Excepciones Tipo</asp:ListItem>
                            <asp:ListItem Value="Formatos/DocumentosDos/SeGireCheque.aspx">Se Gire Cheque</asp:ListItem>
                            <asp:ListItem Value="Formatos/DocumentosDos/SenalaBienEmbargoPropiedadExhortoTipo.aspx">Señala Bien Embargo Propiedad Exhorto Tipo</asp:ListItem>
                            <asp:ListItem Value="Formatos/DocumentosDos/SenalaBienEmbargoPropiedadTipo.aspx">Señala Bien Embargo Propiedad Tipo</asp:ListItem>
                            <asp:ListItem Value="Formatos/DocumentosDos/SenalaNuevoDomicilioExhorto.aspx">Señala Nuevo Domicilio Exhorto</asp:ListItem>
                            <asp:ListItem Value="Formatos/DocumentosDos/SenalaNuevoDomicilioTipo.aspx">Señala Nuevo Domicilio Tipo</asp:ListItem>
                            <asp:ListItem Value="Formatos/DocumentosDos/SeResuelvaBases.aspx">Se Resuelva Bases</asp:ListItem>
                            <asp:ListItem Value="Formatos/DocumentosDos/SeTengaComoMinimoParaSubastaAvaluo.aspx">Se Tenga Como Minimo Para Subasta Avaluo</asp:ListItem>
                            <asp:ListItem Value="Formatos/DocumentosDos/SolicitaDesarchivo.aspx">Solicita Desarchivo</asp:ListItem>
                            <asp:ListItem Value="Formatos/DocumentosDos/SolicitaExhortoCedulaRemateTipo.aspx">Solicita Exhorto Cedula Remate Tipo</asp:ListItem>
                            <asp:ListItem Value="Formatos/DocumentosDos/SolicitaExhortoConFacultadesFuerzaPublicaTipo.aspx">Solicita Exhorto Con Facultades Fuerza Publica Tipo</asp:ListItem>
                            <asp:ListItem Value="Formatos/DocumentosDos/SolicitaExhortoNotifART52Tipo.aspx">Solicita Exhorto Notificacion ART.52 Tipo</asp:ListItem>
                            <asp:ListItem Value="Formatos/DocumentosDos/SolicitaExhortoNotificacionTipo.aspx">Solicita Exhorto Notificacion Tipo</asp:ListItem>
                            <asp:ListItem Value="Formatos/DocumentosDos/SolicitaOficiosQueIndicaTipo.aspx">Solicita Oficios Que Indica Tipo</asp:ListItem>

                            <asp:ListItem Value="Formatos/DocumentosTres/AcompanaOficioYNuevoDomicilio.aspx">Acompaña Oficio y Nuevo Domicilio</asp:ListItem>
                            <asp:ListItem Value="Formatos/DocumentosTres/ActualizaMinimoAvaluoFiscal.aspx">Actualiza Minimo Avaluo Fiscal</asp:ListItem>
                            <asp:ListItem Value="Formatos/DocumentosTres/CertificaExtravioCuaderno.aspx">Certifica Extravi oCuaderno</asp:ListItem>
                            <asp:ListItem Value="Formatos/DocumentosTres/DaCuentaDePagoDevolucionTituloDeudor.aspx">Da Cuenta de Pago Devolucion Titulo Deudor</asp:ListItem>
                            <asp:ListItem Value="Formatos/DocumentosTres/DaCuentaDePagoYRetiro.aspx">Da Cuenta de Pago y Retiro</asp:ListItem>
                            <asp:ListItem Value="Formatos/DocumentosTres/DaCuentaNormalizacion.aspx">Da Cuenta Normalizacion</asp:ListItem>
                            <asp:ListItem Value="Formatos/DocumentosTres/DevuelveExhortoNegativoNuevoDocNuevoEx.aspx">Devuelve Exhorto Negativo, Nuevo Doc, Nuevo Ex</asp:ListItem>
                            <asp:ListItem Value="Formatos/DocumentosTres/DevuelveExhortosYExEmbargo.aspx">Devuelve Exhortos y Ex Embargo</asp:ListItem>
                            <asp:ListItem Value="Formatos/DocumentosTres/EncargoBusquedaDeBienes.aspx">Encargo Busqueda de Bienes</asp:ListItem>
                            <asp:ListItem Value="Formatos/DocumentosTres/EncargoBusquedaDeDomicilio.aspx">Encargo Busqueda de Domicilio</asp:ListItem>
                            <asp:ListItem Value="Formatos/DocumentosTres/EncargoReceptor.aspx">Encargo Receptor</asp:ListItem>
                            <asp:ListItem Value="Formatos/DocumentosTres/EncargoTrabajoProcurador.aspx">Encargo Trabajo Procurador</asp:ListItem>
                            <asp:ListItem Value="Formatos/DocumentosTres/FuerzaPublicaEmbargo.aspx">Fuerza Publica Embargo</asp:ListItem>
                            <asp:ListItem Value="Formatos/DocumentosTres/FuerzaPublicaRetiro.aspx">Fuerza Publica Retiro</asp:ListItem>
                            <asp:ListItem Value="Formatos/DocumentosTres/RetiroDeDemanda.aspx">Retiro de Demanda</asp:ListItem>
                            <asp:ListItem Value="Formatos/DocumentosTres/RetiroDeDemandaYDevolucionDocumento.aspx">Retiro de Demanda y Devolucion Documento</asp:ListItem>

                            <asp:ListItem Value="Formatos/DocumentosCuatro/AutorizacionDevolucionDeDocumentos.aspx">Autorización Devolución De Documentos</asp:ListItem>
                            <asp:ListItem Value="Formatos/DocumentosCuatro/AutorizacionRetiroExhorto.aspx">Autorización Retiro Exhorto</asp:ListItem>
                            <asp:ListItem Value="Formatos/DocumentosCuatro/CertificadoNroExcArt472.aspx">Certificado Nro. Exc. Art. 472</asp:ListItem>
                            <asp:ListItem Value="Formatos/DocumentosCuatro/CumpleLoOrdenadoCalculo.aspx">Cumple Lo Ordenado Calculo</asp:ListItem>
                            <asp:ListItem Value="Formatos/DocumentosCuatro/DelegaPode.aspx">Delega Poder</asp:ListItem>
                            <asp:ListItem Value="Formatos/DocumentosCuatro/NotificacionPorArt52.aspx">Notificación Por Art. 52</asp:ListItem>
                            <asp:ListItem Value="Formatos/DocumentosCuatro/SeDaPorNotificadoDemandaCuge.aspx">Se Da Por Notificado Demanda Cuge</asp:ListItem>
                            <asp:ListItem Value="Formatos/DocumentosCuatro/SenalaBienEmbargoDevolucionDeImpuesto.aspx">Señala Bien Embargo Devolución De Impuesto</asp:ListItem>
                            <asp:ListItem Value="Formatos/DocumentosCuatro/SenalaBienEmbargoVehiculo.aspx">Señala Bien Embargo Vehículo</asp:ListItem>
                            <asp:ListItem Value="Formatos/DocumentosCuatro/SeTengaPorPreparadaViaEjecutada.aspx">Se Tenga Por Preparada Vía Ejecutada</asp:ListItem>
                            <asp:ListItem Value="Formatos/DocumentosCuatro/SolicitudQueIndica.aspx">Solicitud Que Indica</asp:ListItem>
                            <asp:ListItem Value="Formatos/DocumentosCuatro/AvisoSuspencionDeJuicio.aspx">Aviso Suspención de Juicio</asp:ListItem>
                            <asp:ListItem Value="Formatos/DocumentosCuatro/AvisoTerminoDeJuicio.aspx">Aviso Termino de Juicio</asp:ListItem>

                            <asp:ListItem Value="Formatos/DocumentosCinco/AcompanaDocumentos.aspx">Acompaña Documentos</asp:ListItem>
                            <asp:ListItem Value="Formatos/DocumentosCinco/AcompanaDocumentosConCitacion.aspx">Acompaña Documentos Con Citación</asp:ListItem>
                            <asp:ListItem Value="Formatos/DocumentosCinco/DevuelveExhortoYSeDictaSentenciaVoluntaria.aspx">Devuelve Exhorto y Se Dicta Sentencia Voluntaria</asp:ListItem>
                            <asp:ListItem Value="Formatos/DocumentosCinco/ExtractoVoluntaria.aspx">Extracto Voluntaria</asp:ListItem>
                            <asp:ListItem Value="Formatos/DocumentosCinco/SeCertifiqueEjecutoriaYCopiasAutorizadasVoluntarias.aspx">Se Certifique Ejecutoria y Copias Autorizadas Voluntarias</asp:ListItem>
                            <asp:ListItem Value="Formatos/DocumentosCinco/SeDaPorNotificadoVoluntarias.aspx">Se Da Por Notificado Voluntarias</asp:ListItem>
                            <asp:ListItem Value="Formatos/DocumentosCinco/SeDicteSentenciaDeExtravioVoluntaria.aspx">Se Dicte Sentencia De Extravio Voluntaria</asp:ListItem>
                            <asp:ListItem Value="Formatos/DocumentosCinco/SolicitaCopiasAutorizadasVoluntarias.aspx">Solicita Copias Autorizadas Voluntarias</asp:ListItem>
                            <asp:ListItem Value="Formatos/DocumentosCinco/DevuelveExhortoEmbargoPositivoNuevoExhortoRetiro.aspx">Devuelve Exhorto, Embargo Positivo y Nuevo Exhorto Retiro</asp:ListItem>

                            <asp:ListItem Value="Formatos/DocumentosSeis/AmpliacionEmbargoInmueble.aspx">Ampliacion Embargo Inmueble</asp:ListItem>
                            <asp:ListItem Value="Formatos/DocumentosSeis/AmpliacionEmbargoInmuebleExhorto.aspx">Ampliacion Embargo Inmueble Exhorto</asp:ListItem>
                            <asp:ListItem Value="Formatos/DocumentosSeis/CartaPlanNormalizacionBBVA.aspx">Carta Plan Normalizacion BBVA</asp:ListItem>

                            <asp:ListItem Value="Formatos/DocumentosSeis/TransaccionPutBbva.aspx">Transacción PUT BBVA</asp:ListItem>
                            <asp:ListItem Value="Formatos/DocumentosSeis/AcompanaDocumentosTanner.aspx">Acompaña Documentos Tanner</asp:ListItem>

                            <asp:ListItem Value="Formatos/DocumentosSiete/SenalaBienPropiedadDerecho.aspx">Señala Bien Propiedad Derecho</asp:ListItem>

                            <asp:ListItem Value="Formatos/DocumentosOcho/AcompañaDocumentosTannerFactorline.aspx">Acompaña Documentos Tanner Factorline</asp:ListItem>
                            <asp:ListItem Value="Formatos/DocumentosOcho/AcompanaDocumentosTannerAutofin.aspx">Acompaña Documento Tanner Autofin</asp:ListItem>
                            <asp:ListItem Value="Formatos/DocumentosOcho/CertificadosEjecutoriaAvenimiento.aspx">Certificado Ejecutoria Avenimiento</asp:ListItem>
                            <asp:ListItem Value="Formatos/DocumentosOcho/CursosProgresivo.aspx">Curso Progresivo</asp:ListItem>
                            <asp:ListItem Value="Formatos/DocumentosOcho/DevuelveExhortoDYSolicitaExhortoRA.aspx">Devuelve Exhorto Diligencia Y Solicita Exhorto Retiro Auto</asp:ListItem>
                            <asp:ListItem Value="Formatos/DocumentosOcho/EscritoPilotoRetiroDeTitulosBECO.aspx">Escrito Piloto Retiro De Titulos BECO</asp:ListItem>
                            <asp:ListItem Value="Formatos/DocumentosOcho/RatificaFirma.aspx">RatificaFirma</asp:ListItem>
                            <asp:ListItem Value="Formatos/DocumentosOcho/ReceptorAdHoc.aspx">ReceptorAdHoc</asp:ListItem>
                            <asp:ListItem Value="Formatos/DocumentosOcho/SolicitudAlzamientoInmuebleCorvalanPulgar.aspx">Solicitud Alzamiento Inmueble Corvalan Pulgar</asp:ListItem>
                            
                        </asp:ListBox>
                    </td>
                </tr>
            </table>

        </div>
        <div id="divMensaje">
            <p>Debe seleccionar al menos una cobranza</p>
        </div>
    </form>
</body>
</html>
