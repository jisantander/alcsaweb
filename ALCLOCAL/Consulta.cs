using System;
using System.Data;
using System.Configuration;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using ALCGLOBAL;
using System.Text;
using System.Data.SqlClient;



namespace ALCLOCAL
{

    public class Consulta
    {
        public static DataTable JuicioEtapa(string etapa)
        {
            SqlConnection sqlConnection = new SqlConnection(ConfigurationSettings.AppSettings["CONN"].ToString());
            SqlCommand sqlCommand = new SqlCommand("spALC_JUICIO_ETAPA", sqlConnection);
            sqlCommand.CommandType = CommandType.StoredProcedure;
            sqlCommand.Parameters.Add("@etapa", SqlDbType.VarChar).Value = etapa;
            SqlDataAdapter sqlDataAdapter = new SqlDataAdapter(sqlCommand);
            DataTable dataTable = new DataTable();
            sqlDataAdapter.Fill(dataTable);
            sqlConnection.Close();
            return dataTable;
        }
        //Jbaez:se incorpora juicio 08-04-2014
        public static DataTable ComboEstadosJuicios()
        {
            BaseDatos baseDatos = new BaseDatos();
            return baseDatos.getResultset("select 	distinct case tipo when 'A' then 'A' else 'N' end id_EstadoJuicio,case tipo when 'A' then 'Activo' else 'No Activo' end EstadoJuicio from cobranza");
        }
        public static DataTable Mutuo()
        {
            BaseDatos baseDatos = new BaseDatos();
            return baseDatos.getResultset("select mut.urldocumento,mut.id_mutuo,cob.nrooperacion,mut.id_bien_raiz,cob.rut_cli,br.rut_deudor,br.fojas_insc,br.n_insc,br.anio_insc from mutuo mut,bienraiz br,cobranza cob  where mut.id_bien_raiz = br.id_bien_raiz and mut.id_cobranza = cob.id_cobranza ");
        }
        public static DataTable FechaRemesa()
        {
            BaseDatos baseDatos = new BaseDatos();
            return baseDatos.getResultset("select convert(varchar(10),DATEADD(day, 45, getdate()),103)fentrega,convert(varchar(10),getdate(),103)factual");
        }
        public static DataTable ValidaNROopeRecon(string nrooperacion)
        {
            BaseDatos baseDatos = new BaseDatos();
            return baseDatos.getResultset("select ot from reconstituciones where nrooperacion = '" + nrooperacion + "'");
        }
        public static string Codigo_cuota_colegio()
        {
            BaseDatos baseDatos = new BaseDatos();
            DataTable resultset = baseDatos.getResultset("insert into alcsacl.indice values('a');Select @@Identity");
            string result;
            if (resultset.Rows.Count > 0 && resultset != null)
            {
                result = resultset.Rows[0][0].ToString().Replace("/", "").Replace("-", "").Trim();
            }
            else
            {
                result = "";
            }
            return result;
        }
        public static DataTable BienRaiz()
        {
            BaseDatos baseDatos = new BaseDatos();
            return baseDatos.getResultset("SELECT br.id_bien_raiz,br.rut_deudor,br.fojas_insc,br.n_insc,br.anio_insc,dom.calle + ' ' + convert(varchar,dom.numero) Domicilio FROM bienraiz br,domicilios dom WHERE br.id_domicilio = dom.id_domicilio");
        }
        public static DataTable BitacorasEstadosExcel()
        {
            BaseDatos baseDatos = new BaseDatos();
            return baseDatos.getResultset("select ot, codigoestado, observacion, usuario, fechaestado  from ReconstitucionesBitacoraEstados");
        }
        public static DataTable BitacorasJuiciosExcel()
        {
            BaseDatos baseDatos = new BaseDatos();
            return baseDatos.getResultset("select * from cobranza cob inner join juicios jui on cob.id_cobranza = jui.id_cobranza");
        }
        public static DataTable BuscaReconsReporte(string OT)
        {
            BaseDatos baseDatos = new BaseDatos();
            if (string.IsNullOrEmpty(OT))
            {
                OT = "0";
            }
            return baseDatos.getResultset("select * from ReconstitucionReportes where ot = " + Convert.ToDecimal(OT) + " ");
        }
        public static DataTable GastosReconsExcel()
        {
            BaseDatos baseDatos = new BaseDatos();
            return baseDatos.getResultset("select\t(select top 1 isnull(rec.rutcliente,'') + '-' + isnull(rec.dv,'')    from Reconstituciones rec where rgas.OT = rec.OT)Rut, (select top 1 isnull(rec.nombrecliente,'')  from Reconstituciones rec where rgas.OT = rec.OT)nombre,(select top 1 tg.descripcion from ReconstitucionesTipoGastos tg where tg.id = rgas.id_tipo_gasto)tipogasto,case rgas.id_forma_pago when 1 then 'EFECTIVO' when 2 then 'CHEQUE' else 'TRANSFERENCIA ELECTRONICA' end Formapago,rgas.nrodocumento, rgas.montogasto, rgas.observacion, rgas.usuario, convert(varchar(10), rgas.fproceso,103)fproceso,rgas.estadogasto from\tReconstitucionesGastos rgas ");
        }
        public static DataTable ListaAbonoParcial(string idcobranza)
        {
            if (string.IsNullOrEmpty(idcobranza))
            {
                idcobranza = "0";
            }
            BaseDatos baseDatos = new BaseDatos();
            return baseDatos.getResultset("select id_abonoParcial, id_cobranza, id_abono_comprobante,tipo, case tipo when 'E' then 'Excedente' else 'Normal' end tipodesc,montoparcial, montototal,estado,case estado  when 'C' then 'Cancelado' else 'Pendiente' end estadodesc,convert(varchar(10),fproceso,103) fproceso, username from alcsacl.abonoparcial where id_cobranza = " + Convert.ToInt64(idcobranza));
        }
        public static DataTable ListaTotalParcial(string idcobranza)
        {
            if (string.IsNullOrEmpty(idcobranza))
            {
                idcobranza = "0";
            }
            BaseDatos baseDatos = new BaseDatos();
            return baseDatos.getResultset("select sum(montoparcial) total  from alcsacl.abonoparcial where estado = 'P' and id_cobranza = " + Convert.ToInt64(idcobranza));
        }
        public static DataTable DatosAbonos(string id_comprobante, string id_cobranza)
        {
            if (string.IsNullOrEmpty(id_comprobante))
            {
                id_comprobante = "0";
            }
            if (string.IsNullOrEmpty(id_cobranza))
            {
                id_cobranza = "0";
            }
            BaseDatos baseDatos = new BaseDatos();
            return baseDatos.getResultset(string.Concat(new object[]
			{
				"select docuno,montoabono,fpago from abonos where id_abono = ",
				Convert.ToInt64(id_comprobante),
				"   and id_cobranza = ",
				Convert.ToInt64(id_cobranza)
			}));
        }
        public static DataTable DatosMCH(string id_comprobante, string id_cobranza)
        {
            if (string.IsNullOrEmpty(id_comprobante))
            {
                id_comprobante = "0";
            }
            BaseDatos baseDatos = new BaseDatos();
            return baseDatos.getResultset(string.Concat(new object[]
			{
				"select count(*) nroch,isnull(sum(montoabono),0)sumaabono from  abonosmch where id_abono_comprobante = ",
				Convert.ToInt64(id_comprobante),
				" and id_cobranza = ",
				Convert.ToInt64(id_cobranza)
			}));
        }
        public static bool ValidaIngreGastoRecon(string ot, string tipogasto)
        {
            if (string.IsNullOrEmpty(ot))
            {
                ot = "0";
            }
            if (string.IsNullOrEmpty(tipogasto))
            {
                tipogasto = "0";
            }
            BaseDatos baseDatos = new BaseDatos();
            DataTable resultset = baseDatos.getResultset(string.Concat(new object[]
			{
				"select id_gasto from reconstitucionesgastos where ot = ",
				Convert.ToDecimal(ot),
				" and id_tipo_gasto = ",
				Convert.ToDecimal(tipogasto)
			}));
            return resultset.Rows.Count > 0 && resultset != null;
        }
        public static DataTable Cobranza()
        {
            BaseDatos baseDatos = new BaseDatos();
            return baseDatos.getResultset("select id_cobranza,Nrooperacion,rut_cli,rut_deudor,tipo estado from cobranza");
        }
        public static DataTable RequerimientosALC()
        {
            BaseDatos baseDatos = new BaseDatos();
            return baseDatos.getResultset("select aw.urldocumento,aw.id,aw.requerimiento,convert(varchar,aw.fecha,103)fecha,est.descripcion estado,aw.observacion from sysaw aw inner join sysestados est on aw.id_estado = est.id_estado ");
        }
        public static DataTable MostrarDocumentosDigitalizados(string rut_deudor)
        {
            BaseDatos baseDatos = new BaseDatos();
            return baseDatos.getResultset("select doc.id_documento,doc.rut_deudor,doc.urldocumento,doc.folio,(select top 1 des.descripcion from descripcion des where  doc.id_descripcion = des.id_descripcion)descripcion,(select top 1 cli.rsocial from clientes cli where doc.rut_cli = cli.rut_cli) cliente  from docudigitalizados doc where rut_deudor = '" + rut_deudor.Replace(".", "") + "'");
        }
        public static DataTable MostrarDigitalizadosReconstitucion(string OT)
        {
            BaseDatos baseDatos = new BaseDatos();
            if (string.IsNullOrEmpty(OT))
            {
                OT = "0";
            }
            return baseDatos.getResultset("select id_digi, OT, urldocumento, observacion, usuario, convert(varchar(10),fproceso,103)fecha from ReconstitucionesDigitalizar where ot = " + Convert.ToDecimal(OT) + " ");
        }
        public static DataTable MostrarDocumentosDigitalizadosInfo(string rut_deudor, string folio)
        {
            StringBuilder stringBuilder = new StringBuilder();
            BaseDatos baseDatos = new BaseDatos();
            rut_deudor = rut_deudor.Replace("'", "");
            folio = folio.Replace("'", "");
            stringBuilder.Append(" select doc.id_documento,doc.rut_deudor,doc.urldocumento,doc.folio,(select top 1 des.descripcion from descripcion des where  doc.id_descripcion = des.id_descripcion)descripcion,(select top 1 cli.rsocial from clientes cli where doc.rut_cli = cli.rut_cli) cliente  from docudigitalizados doc ");
            stringBuilder.Append(" WHERE 1=1 ");
            if (!string.IsNullOrEmpty(rut_deudor))
            {
                stringBuilder.Append(" AND rtrim(ltrim(rut_deudor)) = '" + rut_deudor.Replace(".", "").Trim() + "'");
            }
            if (!string.IsNullOrEmpty(folio))
            {
                stringBuilder.Append(" AND rtrim(ltrim(folio)) = '" + folio.Trim() + "'");
            }
            return baseDatos.getResultset(stringBuilder.ToString());
        }
        public static DataTable MostrarAbono(string id_cobranza)
        {
            BaseDatos baseDatos = new BaseDatos();
            if (string.IsNullOrEmpty(id_cobranza))
            {
                id_cobranza = "0";
            }
            return baseDatos.getResultset("select abo.id_abono,(select top 1 cab.descripcion  from conceptoabono cab where abo.id_concepto = cab.id_concepto)concepto,(select top 1 tip.descripcion  from tipomoneda tip where abo.id_moneda = tip.id_moneda)moneda,abo.montoabono,convert(varchar(10),abo.fabono,103)fecha,isnull(case convert(varchar(10),abo.fpago,103) when '01/01/1900' then '' else convert(varchar(10),abo.fpago,103) end ,'') fechapago,abo.boleta from abonos abo where abo.id_cobranza = " + Convert.ToInt64(id_cobranza) + " order by abo.id_abono desc");
        }
        public static DataTable ProductoJuicio(string id_cobranza)
        {
            BaseDatos baseDatos = new BaseDatos();
            if (string.IsNullOrEmpty(id_cobranza))
            {
                id_cobranza = "0";
            }
            return baseDatos.getResultset("select * from cobranza where id_cobranza = " + Convert.ToInt64(id_cobranza));
        }
        //Jbaez: se aplica nuevos campos del deudor 10-03-2014
        public static DataTable BitacoraEstados(string ot)
        {
            BaseDatos baseDatos = new BaseDatos();
            if (string.IsNullOrEmpty(ot))
            {
                ot = "0";
            }
            return baseDatos.getResultset("exec SPALC_CONSULTA_BITACORA "+ Convert.ToDecimal(ot)) ;
               // ("select distinct rbe.fechaestado, rbe.ot,(select top 1 re.descripcion from ReconstitucionesEstados re where rbe.codigoestado = re.id)descriestado,rbe.observacion,rbe.usuario,convert(varchar(20),rbe.fechaestado,113)fproceso from ReconstitucionesBitacoraEstados rbe where rbe.ot = " + Convert.ToDecimal(ot) + " order by rbe.fechaestado desc");
        }
        //Jbaez: se aplica bienes del deudor 24-04-2014
        public static DataTable BienesMueblesDeudor(string RutDeudor)
        {
            BaseDatos baseDatos = new BaseDatos();
            if (string.IsNullOrEmpty(RutDeudor))
            {
                RutDeudor = null;
            }
            return baseDatos.getResultset("exec SPALC_BIENES_MUEBLES_DEUDOR '" + (RutDeudor) + "'");
        }
        //Jbaez: se aplica bienes del deudor 24-04-2014
        public static DataTable Buscar_BienesMueblesDeudor(string patente)
        {
            BaseDatos baseDatos = new BaseDatos();
            if (string.IsNullOrEmpty(patente))
            {
                patente = null;
            }
            return baseDatos.getResultset("exec SPALC_BUSCAR_BIENES_MUEBLES_DEUDOR '" + (patente) + "'");
        }
        //Jbaez: se aplica bienes del deudor 24-04-2014
        public static DataTable BienesRaicesDeudor(string RutDeudor)
        {
            BaseDatos baseDatos = new BaseDatos();
            if (string.IsNullOrEmpty(RutDeudor))
            {
                RutDeudor = null;
            }
            return baseDatos.getResultset("exec SPALC_BIENES_RAICES_DEUDOR '" + (RutDeudor) + "'");
        }
        //Jbaez: se aplica bienes del deudor 24-04-2014
        public static DataTable InformeBienesRaicesDeudor(string ID_BIEN_RAIZ,string RutDeudor)
        {
            BaseDatos baseDatos = new BaseDatos();
            return baseDatos.getResultset("exec SPALC_INFORME_DOC_BIENES_RAICES_DEUDOR '" + (ID_BIEN_RAIZ) + "','" + (RutDeudor) + "'");
        }

        public static DataTable Buscar_BienesRaicesDeudor(string ID_BIEN_RAIZ)
        {
            BaseDatos baseDatos = new BaseDatos();
            return baseDatos.getResultset("exec SPALC_BUSCAR_BIENES_RAICES_DEUDOR '" + (Convert.ToInt32(ID_BIEN_RAIZ)) + "'");
        }
        //Jbaez: se aplica bienes del deudor 24-04-2014
        public static String Eliminar_BienesRaicesDeudor(string parametro)
        {
            BaseDatos baseDatos = new BaseDatos();
            baseDatos.getResultset("exec SPALC_ELIMINA_BIENES_RAICES_DEUDOR '" + (parametro) + "'");
            return "0";
        }
        //Jbaez: se aplica bienes del deudor 24-04-2014
        public static String Eliminar_BienesMueblesDeudor(string parametro)
        {
            BaseDatos baseDatos = new BaseDatos();
            baseDatos.getResultset("exec SPALC_ELIMINA_BIENES_MUEBLES_DEUDOR '" + (parametro) + "'");
            return "0";
        }
        public static DataTable MostrarMCHLetras(string id_cobranza)
        {
            BaseDatos baseDatos = new BaseDatos();
            if (string.IsNullOrEmpty(id_cobranza))
            {
                id_cobranza = "0";
            }
            return baseDatos.getResultset("SELECT (select ppr.descripcion from productopre ppr where cob.id_producto = ppr.id_producto)tipodocumento ,cco.nrodocumento,cco.id_cuota_colegio, cco.nrocuota,isnull(case convert(varchar(10),cco.fechavencimiento,103) when '01/01/1900' then '' else convert(varchar(10),cco.fechavencimiento,103) end ,'') fvcto,cco.montocapital,cco.pagado,cco.MCH FROM  cuotacolegio cco inner join cobranza cob on cco.id_cobranza = cob.id_cobranza WHERE cob.id_cobranza = " + Convert.ToInt64(id_cobranza) + "  AND cco.MCH = 'S'");
        }
        public static DataTable MostrarGrillaCheques(string id_cobranza)
        {
            BaseDatos baseDatos = new BaseDatos();
            if (string.IsNullOrEmpty(id_cobranza))
            {
                id_cobranza = "0";
            }
            return baseDatos.getResultset("select  abo.id_abonoMCH,abo.id_abono_comprobante, convert(varchar(10),abo.fpago,103) fpago,(select top 1 ban.descripcion from bancos ban where abo.id_banco = ban.id_banco) banco , abo.nrocheque, abo.serie, abo.montoabono,(select top 1 deu.rsocial from deudores deu where deu.rut_deudor = abo.rut_deudor) deudor,abo.estado from abonosMCH abo where abo.id_cobranza = " + Convert.ToInt64(id_cobranza));
        }
        public static DataTable MostrarAbonosMCH(string id_cobranza)
        {
            BaseDatos baseDatos = new BaseDatos();
            if (string.IsNullOrEmpty(id_cobranza))
            {
                id_cobranza = "0";
            }
            return baseDatos.getResultset("SELECT abo.id_abono NroComprobante,isnull(convert(varchar(10),abo.fpago,103),'')fpago,(select top 1 ban.descripcion from bancos ban where ban.id_banco  = abo.id_banco)banco, abo.nrocheque,abo.serie,abo.montoabono,abo.rut_deudor rutgirador, (select top 1 deu.rsocial from deudores deu where abo.rut_deudor = deu.rut_deudor)girador FROM abonos abo WHERE abo.id_cobranza = " + Convert.ToInt64(id_cobranza) + " AND abo.MCH = 'S'");
        }
        public static DataTable MostrarCuota(string id_cobranza)
        {
            BaseDatos baseDatos = new BaseDatos();
            if (string.IsNullOrEmpty(id_cobranza))
            {
                id_cobranza = "0";
            }
            return baseDatos.getResultset("select  nrodocumento,nrocuota,isnull(case convert(varchar(10),fechavencimiento,103) when '01/01/1900' then '' else convert(varchar(10),fechavencimiento,103) end ,'') fechavencimiento,montocapital from  cuotacolegio where id_cobranza = " + Convert.ToInt64(id_cobranza));
        }
        public static DataTable MostrarSaldoCobranza(string id_cobranza)
        {
            BaseDatos baseDatos = new BaseDatos();
            if (string.IsNullOrEmpty(id_cobranza))
            {
                id_cobranza = "0";
            }
            return baseDatos.getResultset("select sum(montocapital) total from cuotacolegio  where id_cobranza = " + Convert.ToInt64(id_cobranza));
        }
        public static DataTable TraeHonorarios()
        {
            BaseDatos baseDatos = new BaseDatos();
            return baseDatos.getResultset("select Honorarios from parametros");
        }
        public static DataTable MostrarSaldoAbonos(string id_cobranza)
        {
            BaseDatos baseDatos = new BaseDatos();
            if (string.IsNullOrEmpty(id_cobranza))
            {
                id_cobranza = "0";
            }
            return baseDatos.getResultset("select sum(montoabono) total from abonos where id_cobranza = " + Convert.ToInt64(id_cobranza));
        }
        public static DataTable MostrarLiquidacion(string id_cobranza, string TipoCobranza)
        {
            BaseDatos baseDatos = new BaseDatos();
            StringBuilder stringBuilder = new StringBuilder();
            if (TipoCobranza == "J")
            {
                stringBuilder.Append(" select 'Doc. Juicio' Docu,nrodocumento nrodocu,monto from docujuicio where id_cobranza = " + Convert.ToInt64(id_cobranza) + " ");
                stringBuilder.Append(" union");
                stringBuilder.Append(" select 'Doc. Pagare' Docu,nropagare nrodocu,montodemanda monto from docupagare where id_cobranza = " + Convert.ToInt64(id_cobranza) + " ");
                stringBuilder.Append(" union");
                stringBuilder.Append(" select 'Doc. Mutuo' Docu,nrodocumento nrodocu,monto_div_adeudado_ps monto from mutuo where id_cobranza = " + Convert.ToInt64(id_cobranza) + " ");
            }
            else
            {
                stringBuilder.Append("  select (select top 1 tdo.descripcion from tipodocumento tdo where tdo.id_tipo_docu = cco.id_tipo_docu)Docu,cco.nrodocumento nrodocu,cco.montocapital monto from cuotacolegio cco where cco.id_cobranza = " + Convert.ToInt64(id_cobranza) + "  ");
            }
            return baseDatos.getResultset(stringBuilder.ToString());
        }
        public static DataTable Domicilios()
        {
            BaseDatos baseDatos = new BaseDatos();
            return baseDatos.getResultset("SELECT id_domicilio ID ,villapob VILLA,calle CALLE,block BLOCK,numero NUMERO,rut_deudor DEUDOR  FROM domicilios ");
        }
        public static DataTable Clientes()
        {
            BaseDatos baseDatos = new BaseDatos();
            return baseDatos.getResultset("select rut_cli RUT,rsocial RAZON_SOCIAL,telefono TELEFONO,email MAIL,domicilio DOMICILIO,numero NUMERO from clientes ORDER BY rsocial");
        }
        public static DataTable Exhortos()
        {
            BaseDatos baseDatos = new BaseDatos();
            return baseDatos.getResultset(" select id_exhorto,id_juicios,urldocumento,rol_exhorto,tipo from exhorto");
        }
        public static DataTable Juicios()
        {
            BaseDatos baseDatos = new BaseDatos();
            return baseDatos.getResultset(" select * from juicios");
        }
        public static DataTable Telefonos()
        {
            BaseDatos baseDatos = new BaseDatos();
            return baseDatos.getResultset("select rut_dueno RUT,vigencia VIGENCIA,telefono1 TELEFONO,celular1 CELULAR,fax FAX from telefonos");
        }
        public static DataTable Usuarios()
        {
            BaseDatos baseDatos = new BaseDatos();
            return baseDatos.getResultset("select rut_usu RUT,nombres NOMBRE,mail MAIL,direccion DIRECCION,numero NUMERO,telefono TELEFONO from usuarios");
        }
        public static DataTable Master(string SQL)
        {
            BaseDatos baseDatos = new BaseDatos();
            return baseDatos.getResultset(SQL.ToString());
        }
        public static DataTable Deudores()
        {
            BaseDatos baseDatos = new BaseDatos();
            return baseDatos.getResultset("select rut_deudor RUT,rsocial RAZON_SOCIAL,telefono1 TELEFONO,celular1 CELULAR,id_banco BANCO, email MAIL from deudores order by rsocial");
        }
        public static DataTable ComboProcedimiento()
        {
            BaseDatos baseDatos = new BaseDatos();
            return baseDatos.getResultset("SELECT id_procedimiento,descripcion FROM procedimiento ORDER BY descripcion");
        }
        public static DataTable ComboProcedimientoPRE()
        {
            BaseDatos baseDatos = new BaseDatos();
            return baseDatos.getResultset("SELECT id_procedimiento,descripcion FROM procedimientoPRE ORDER BY descripcion");
        }
        public static DataTable ComboProcedimientoPRENDAS()
        {
            BaseDatos baseDatos = new BaseDatos();
            return baseDatos.getResultset("select id_procedimiento,descripcion from procedimientoprendas ORDER BY descripcion");
        }
        public static DataTable ComboBancos()
        {
            BaseDatos baseDatos = new BaseDatos();
            return baseDatos.getResultset("select id_banco,descripcion from bancos");
        }
        public static DataTable ComboEstadosReconstitucion()
        {
            BaseDatos baseDatos = new BaseDatos();
            return baseDatos.getResultset("select id,descripcion from ReconstitucionesEstados");
        }
        public static DataTable ComboProductosReconstitucion()
        {
            BaseDatos baseDatos = new BaseDatos();
            return baseDatos.getResultset("select distinct prod as Producto from Reconstituciones");
        }

        public static DataTable CombotiposEstadosReconstitucion()
        {
            BaseDatos baseDatos = new BaseDatos();
            return baseDatos.getResultset("select id,descripcion from ReconstitucionesTipoGastos");
        }
        public static DataTable ComboResponsablesReconstitucion()
        {
            BaseDatos baseDatos = new BaseDatos();
            return baseDatos.getResultset("select username,UPPER(isnull(nombres,'') + ' ' + isnull(apaterno,'')) nombre from usuarios WHERE ID_SISTEMA = 1 ORDER BY NOMBRES");
        }
        public static DataTable ComboResponsableJuicios()
        {
            BaseDatos baseDatos = new BaseDatos();
            return baseDatos.getResultset("select id,nombrecompleto from JuiciosAsignador where estado = 'A' order by nombrecompleto");
        }
        public static DataTable ComboEstadosSinTerminar()
        {
            BaseDatos baseDatos = new BaseDatos();
            return baseDatos.getResultset("select * from ReconstitucionesEstados where id not in (100,900)");
        }
        public static DataTable ComboFechaRemesa()
        {
            BaseDatos baseDatos = new BaseDatos();
            return baseDatos.getResultset("select convert(varchar(10),fecha_remesa,103)fecharemesa from reconstituciones group by fecha_remesa order by fecha_remesa desc");
        }
        public static DataTable ComboRemesa(string fecha_remesa)
        {
            BaseDatos baseDatos = new BaseDatos();
            return baseDatos.getResultset("select  count(*) Total,convert(varchar(10),max(fechaentrega),103)FechaEntrega  from reconstituciones where convert(varchar(10),fecha_remesa,103) = '" + fecha_remesa.Trim() + "'");
        }
        public static DataTable ProcuradorXJuicio(string nrooperacion)
        {
            BaseDatos baseDatos = new BaseDatos();
            return baseDatos.getResultset("select jui.rol,jui.rut_procurador,jui.id_juicios from cobranza cob inner join juicios jui on cob.id_cobranza = jui.id_cobranza where cob.nrooperacion = '" + nrooperacion.Trim() + "'");
        }
        public static DataTable ComboEjecutivos()
        {
            BaseDatos baseDatos = new BaseDatos();
            return baseDatos.getResultset("select id_ejecutivo,isnull(nombres,'') + ' ' + isnull(apaterno,'') + ' ' + isnull(amaterno,'') nombre   from ejecutivos");
        }
        public static DataTable VALIDAREliminarChequeMCH(string id_abonoMCH)
        {
            BaseDatos baseDatos = new BaseDatos();
            StringBuilder stringBuilder = new StringBuilder();
            stringBuilder.Append("select * from abonosmch where estado = 'L' and  id_abonoMCH = " + Convert.ToInt64(id_abonoMCH) + " ");
            return baseDatos.getResultset(stringBuilder.ToString());
        }
        public static DataTable ComboBienMueble(string rut_deudor)
        {
            BaseDatos baseDatos = new BaseDatos();
            return baseDatos.getResultset("select id_bien_mueble,patente from bienmueble where ltrim(Rtrim(rut_deudor)) = '" + rut_deudor.Trim().Replace(".", "") + "'");
        }
        public static DataTable ComboSucursal()
        {
            BaseDatos baseDatos = new BaseDatos();
            return baseDatos.getResultset("select id_sucursal,nombresucursal from sucursales");
        }
        public static DataTable ComboTipoMoneda()
        {
            BaseDatos baseDatos = new BaseDatos();
            return baseDatos.getResultset("select id_moneda,descripcion from tipomoneda");
        }
        public static DataTable ComboComunaGeneral()
        {
            BaseDatos baseDatos = new BaseDatos();
            return baseDatos.getResultset("select id_comuna,descripcion from comunas order by descripcion");
        }
        public static DataTable ComboLocalidadNotaria()
        {
            BaseDatos baseDatos = new BaseDatos();
            return baseDatos.getResultset("select id_comuna_notaria,descripcion from comunanotaria");
        }
        public static DataTable ComboNotario(string idcomunanotaria)
        {
            if (string.IsNullOrEmpty(idcomunanotaria))
            {
                idcomunanotaria = "0";
            }
            if (idcomunanotaria == "Seleccione")
            {
                idcomunanotaria = "0";
            }
            BaseDatos baseDatos = new BaseDatos();
            return baseDatos.getResultset("select id_notaria,nombre from notaria where id_comuna_notaria = " + Convert.ToInt64(idcomunanotaria));
        }
        public static DataTable ComboMateria(string id_procedimiento)
        {
            DataTable result;
            if (id_procedimiento == "Seleccione")
            {
                result = null;
            }
            else
            {
                BaseDatos baseDatos = new BaseDatos();
                DataTable resultset = baseDatos.getResultset("SELECT convert(varchar,id_materia) + '|' + convert(varchar,id_producto) id_materia,descripcion FROM materia WHERE id_procedimiento = " + Convert.ToInt64(id_procedimiento) + " ORDER BY descripcion");
                result = resultset;
            }
            return result;
        }
        public static DataTable ComboMateriaPRE(string id_procedimiento)
        {
            DataTable result;
            if (id_procedimiento == "Seleccione")
            {
                result = null;
            }
            else
            {
                BaseDatos baseDatos = new BaseDatos();
                DataTable resultset = baseDatos.getResultset("SELECT convert(varchar,id_materia) + '|' + convert(varchar,id_producto) id_materia,descripcion FROM materiaPRE WHERE id_procedimiento = " + Convert.ToInt64(id_procedimiento) + " ORDER BY descripcion");
                result = resultset;
            }
            return result;
        }
        public static DataTable ComboMateriaPRENDAS(string id_procedimiento)
        {
            DataTable result;
            if (id_procedimiento == "Seleccione")
            {
                result = null;
            }
            else
            {
                BaseDatos baseDatos = new BaseDatos();
                DataTable resultset = baseDatos.getResultset("SELECT convert(varchar,id_materia) + '|' + convert(varchar,id_producto) id_materia,descripcion FROM materiaprendas WHERE id_procedimiento = " + Convert.ToInt64(id_procedimiento) + " ORDER BY descripcion");
                result = resultset;
            }
            return result;
        }
        public static DataTable ComboProducto(string id_producto)
        {
            DataTable result;
            if (id_producto == "Seleccione")
            {
                result = null;
            }
            else
            {
                BaseDatos baseDatos = new BaseDatos();
                DataTable resultset = baseDatos.getResultset("SELECT id_producto,descripcion FROM producto WHERE id_producto = " + Convert.ToInt64(id_producto) + " ORDER BY descripcion");
                result = resultset;
            }
            return result;
        }
        public static DataTable ComboProductoPRE(string id_producto)
        {
            DataTable result;
            if (id_producto == "Seleccione")
            {
                result = null;
            }
            else
            {
                BaseDatos baseDatos = new BaseDatos();
                DataTable resultset = baseDatos.getResultset("SELECT id_producto,descripcion FROM productoPRE WHERE id_producto = " + Convert.ToInt64(id_producto) + " ORDER BY descripcion");
                result = resultset;
            }
            return result;
        }
        public static DataTable ComboProductoPRENDAS(string id_producto)
        {
            DataTable result;
            if (id_producto == "Seleccione")
            {
                result = null;
            }
            else
            {
                BaseDatos baseDatos = new BaseDatos();
                DataTable resultset = baseDatos.getResultset("SELECT id_producto,descripcion FROM productoPRENDAS WHERE id_producto =" + Convert.ToInt64(id_producto) + " ORDER BY descripcion");
                result = resultset;
            }
            return result;
        }
        public static DataTable ComboProducto()
        {
            BaseDatos baseDatos = new BaseDatos();
            return baseDatos.getResultset("SELECT id_producto,descripcion FROM producto  ");
        }
        public static DataTable ComboProductoLimitado()
        {
            BaseDatos baseDatos = new BaseDatos();
            return baseDatos.getResultset("SELECT id_producto,descripcion FROM producto where id_producto in(1,2,3) order by id_producto desc");
        }
        public static DataTable ComboCliente()
        {
            BaseDatos baseDatos = new BaseDatos();
            return baseDatos.getResultset("SELECT rut_cli,rsocial FROM clientes ORDER BY rsocial");
        }
        public static DataTable ComboProductoNew()
        {
            BaseDatos baseDatos = new BaseDatos();
            return baseDatos.getResultset("select * from producto where id_producto in(1,2,3)");
        }
        public static DataTable ComboCliente(string rut_cli)
        {
            BaseDatos baseDatos = new BaseDatos();
            return baseDatos.getResultset("select * from dbo.ParametrosCliente where rut_cli = '" + rut_cli.ToString().Trim() + "'");
        }
        public static DataTable ComboDescripcion()
        {
            BaseDatos baseDatos = new BaseDatos();
            return baseDatos.getResultset("select id_descripcion,descripcion from descripcion order by descripcion");
        }
        public static DataTable ComboTipoDocumento()
        {
            BaseDatos baseDatos = new BaseDatos();
            return baseDatos.getResultset("select id_tipo_docu,descripcion from tipodocumento");
        }
        public static DataTable ComboCargo()
        {
            BaseDatos baseDatos = new BaseDatos();
            return baseDatos.getResultset("SELECT id_cargo,descripcion FROM cargo ORDER BY descripcion");
        }
        public static DataTable ComboSubProducto()
        {
            BaseDatos baseDatos = new BaseDatos();
            return baseDatos.getResultset("select id_subproducto,descripcion from subproducto order by descripcion ");
        }
        public static DataTable ComboProcurador()
        {
            BaseDatos baseDatos = new BaseDatos();
            return baseDatos.getResultset("SELECT rut_procurador rut,nombres + ' ' + apaterno + ' ' + amaterno nombres FROM procuradores ORDER BY nombres");
        }
        public static DataTable ComboAbogados()
        {
            BaseDatos baseDatos = new BaseDatos();
            return baseDatos.getResultset("SELECT rut_abogado rut,nombres + ' ' + apaterno + ' ' + amaterno nombres FROM abogados ORDER BY nombres");
        }
        public static DataTable Valida_Rol_Rit(string id_cobranza)
        {
            BaseDatos baseDatos = new BaseDatos();
            if (string.IsNullOrEmpty(id_cobranza)) id_cobranza = "0";
            return baseDatos.getResultset("select jui.rol from cobranza cob inner join juicios jui on cob.id_cobranza = jui.id_cobranza where cob.id_cobranza = " + Convert.ToInt64(id_cobranza));
        }
        public static DataTable ComboTipoTelefono()
        {
            BaseDatos baseDatos = new BaseDatos();
            return baseDatos.getResultset("SELECT  id_tipo_telefono,descripcion FROM tipotelefono ORDER BY descripcion");
        }
        public static DataTable ComboReceptor()
        {
            BaseDatos baseDatos = new BaseDatos();
            return baseDatos.getResultset("SELECT rut_receptor,isnull(nombres,'') + ' ' + isnull(apaterno,'') + ' ' + isnull(amaterno,'') nombres FROM receptor ORDER BY nombres");
        }
        public static DataTable GENtramite(string tipo)
        {
            BaseDatos baseDatos = new BaseDatos();
            return baseDatos.getResultset("select (convert(varchar,id_tramite) + '-' +  convert(varchar,indice)) id_tramite ,(convert(varchar,indice) + '-' +  descripcion) descripcion from tramiteGENERAL where tipo = '" + tipo + "'");
        }
        public static DataTable GENMostrartramiteProximaGestion(string indice, string tipo)
        {
            BaseDatos baseDatos = new BaseDatos();
            return baseDatos.getResultset(string.Concat(new object[]
			{
				"select   (convert(varchar,indice) + '-' +  descripcion) descripcion from tramiteGENERAL where tipo = '",
				tipo,
				"' and indice = ",
				Convert.ToInt64(indice)
			}));
        }
        public static DataTable GENMostrarTramiteTermino(string id_tramite)
        {
            BaseDatos baseDatos = new BaseDatos();
            return baseDatos.getResultset("select termino from tramiteGENERAL where  id_tramite = " + Convert.ToUInt64(id_tramite));
        }
        public static DataTable GENValidaTramite(string id_juicio, string id_tramite, string fsubtramite, string id_sub_tramite)
        {
            string str;
            if (string.IsNullOrEmpty(fsubtramite))
            {
                str = "";
            }
            else
            {
                str = fsubtramite;
            }
            if (id_sub_tramite == "Seleccione")
            {
                id_sub_tramite = "0";
            }
            if (string.IsNullOrEmpty(id_sub_tramite))
            {
                id_sub_tramite = "0";
            }
            BaseDatos baseDatos = new BaseDatos();
            StringBuilder stringBuilder = new StringBuilder();
            stringBuilder.Append(" SELECT id_actividad");
            stringBuilder.Append(" FROM actividadesjudiciales  ");
            stringBuilder.Append(" WHERE id_juicios  = " + Convert.ToInt64(id_juicio));
            stringBuilder.Append(" AND id_sub_tramite  = " + Convert.ToInt64(id_sub_tramite));
            stringBuilder.Append(" AND convert(datetime,fsubtramite,103) = '" + str + "'");
            stringBuilder.Append(" AND id_tramite  = " + Convert.ToInt64(id_tramite));
            return baseDatos.getResultset(stringBuilder.ToString());
        }
        public static DataTable ComboUsuarios()
        {
            BaseDatos baseDatos = new BaseDatos();
            return baseDatos.getResultset("SELECT rut_usu,isnull(nombres,'') + ' ' + isnull(apaterno,'') + ' ' + isnull(amaterno,'') nombres from usuarios ORDER BY nombres");
        }
        public static DataTable ComboProveedores()
        {
            BaseDatos baseDatos = new BaseDatos();
            return baseDatos.getResultset("select rut_proveedor,isnull(nombres,'') + ' ' + isnull(apaterno,'') + ' ' + isnull(amaterno,'') nombre from proveedor order by nombre");
        }
        public static DataTable ComboTipoGastoAdmin()
        {
            BaseDatos baseDatos = new BaseDatos();
            return baseDatos.getResultset("SELECT id_gasto_admin,descripcion FROM tipogastoadministrativo ORDER BY descripcion");
        }
        public static DataTable ComboetapaJui()
        {
            BaseDatos baseDatos = new BaseDatos();
            return baseDatos.getResultset("select distinct etapa from TramiteGENERAL where etapa is not null order by etapa");
        }
        public static DataTable ComboActividadesPrejudiciales()
        {
            BaseDatos baseDatos = new BaseDatos();
            return baseDatos.getResultset("select id_act_prejudicial,descripcion from ActividadesPrejudiciales order by descripcion");
        }
        public static DataTable ComboTipoExhorto()
        {
            BaseDatos baseDatos = new BaseDatos();
            return baseDatos.getResultset("select id_tipoexhorto,descripcion from tipoexhorto order by descripcion");
        }
        //Jbaez: se incluye los estado de los exhorto 07-01-2014
        public static DataTable ComboEstadoExhorto()
        {
            BaseDatos baseDatos = new BaseDatos();
            return baseDatos.getResultset("select distinct codigo, descripcion from estadojuicio");
        }

        public static DataTable ComboTramite()
        {
            BaseDatos baseDatos = new BaseDatos();
            return baseDatos.getResultset("select id_tramite,descripcion from tramite order by id_tramite");
        }
        public static DataTable ComboTramiteAll()
        {
            BaseDatos baseDatos = new BaseDatos();
            return baseDatos.getResultset("select id_tramite,descripcion + ' - ' + tipo descripcion from tramiteGENERAL order by descripcion");
        }
        public static DataTable ComboDescripcionTodosTramites()
        {
            BaseDatos baseDatos = new BaseDatos();
            return baseDatos.getResultset("select distinct id_tramite_exh,descripcion  from tramiteexhorto");
        }

        public static DataTable ComboGastoJudicial()
        {
            BaseDatos baseDatos = new BaseDatos();
            return baseDatos.getResultset("select id_tipo_gasto_judi,descripcion from tipogastojudicial");
        }
        public static DataTable ComboDocCuotacolegio(string id_cobranza)
        {
            BaseDatos baseDatos = new BaseDatos();
            return baseDatos.getResultset("select 1 indice,nrodocumento,isnull(case MCH when '' then 'S' else '' end,'')Liberado ,MCH,montocapital, isnull(case convert(varchar(10),fechavencimiento,103) when '01/01/1900' then '' else convert(varchar(10),fechavencimiento,103) end ,'') fechavcto,pagado,observacion  from cuotacolegio where id_cobranza = " + Convert.ToInt64(id_cobranza));
        }
        public static DataTable CompruebaParcialesAsociados(string id_abono_comprobante)
        {
            BaseDatos baseDatos = new BaseDatos();
            if (string.IsNullOrEmpty(id_abono_comprobante))
            {
                id_abono_comprobante = "0";
            }
            return baseDatos.getResultset("select * from alcsacl.abonoparcial where id_abono_comprobante = " + Convert.ToInt64(id_abono_comprobante));
        }
        public static DataTable ComboSubTramite()
        {
            BaseDatos baseDatos = new BaseDatos();
            return baseDatos.getResultset("select id_sub_tramite,descripcion from subtramite order by descripcion ");
        }
        public static DataTable ComboSubTramiteGENERAL(string tipo)
        {
            BaseDatos baseDatos = new BaseDatos();
            return baseDatos.getResultset("select (convert(varchar,id_sub_tramite) + '-' + termino)id_sub_tramite,descripcion,termino from subTramiteGENERAL where tipo = '" + tipo + "'");
        }
        public static DataTable ComboTramiteExhorto()
        {
            BaseDatos baseDatos = new BaseDatos();
            return baseDatos.getResultset("select id_tramite_exh,descripcion from TramiteExhorto order by secuenciaFlujoEstado ");
        }
        public static DataTable ValidaDocRendicion(string id_rendicion)
        {
            if (string.IsNullOrEmpty(id_rendicion))
            {
                id_rendicion = "0";
            }
            BaseDatos baseDatos = new BaseDatos();
            return baseDatos.getResultset("select id_doc_rendicion, id_rendicion, id_abono, id_cobranza, id_banco, nrocheque, serie, convert(varchar(10),fcheque,103)fcheque, nroctacte, fproceso, username,impreso  from Doc_Rendicion where id_rendicion = " + Convert.ToInt64(id_rendicion));
        }
        public static DataTable DetalleAbonoMCH(string id_abono)
        {
            if (string.IsNullOrEmpty(id_abono))
            {
                id_abono = "0";
            }
            BaseDatos baseDatos = new BaseDatos();
            return baseDatos.getResultset("select id_abonoMCH, id_cobranza, id_abono_comprobante, convert(varchar(10),fpago,103)fpago, id_banco, nrocheque, serie, montoabono, rut_deudor, estado, fproceso, username from abonosmch where id_abono_comprobante =  " + Convert.ToInt64(id_abono));
        }
        public static DataTable ComboActividadPrejudicial()
        {
            BaseDatos baseDatos = new BaseDatos();
            return baseDatos.getResultset("select id_act_prejudicial,descripcion from ActividadesPrejudiciales");
        }
        public static DataTable ComboProximadPrejudicial()
        {
            BaseDatos baseDatos = new BaseDatos();
            return baseDatos.getResultset("select id_proxactprejudi,descripcion from ProximaActividadPreJudicial");
        }
        public static DataTable ComboTramite(string indices)
        {
            BaseDatos baseDatos = new BaseDatos();
            long num = Convert.ToInt64(indices);
            StringBuilder stringBuilder = new StringBuilder();
            long num2 = 0L;
            if (num == 1L || num == 2L || num == 3L)
            {
                num2 = num + 1L;
            }
            if (num == 4L)
            {
                num2 = 5L;
            }
            if (num == 5L)
            {
                num -= 1L;
                num2 = 5L;
            }
            if (num == 6L)
            {
                num -= 2L;
                num2 = 5L;
            }
            if (num == 7L || num == 8L || num == 9L || num == 10L || num == 11L || num == 12L || num == 13L || num == 14L || num == 15L || num == 16L || num == 17L || num == 18L || num == 19L || num == 20L || num == 21L || num == 22L)
            {
                num -= 2L;
                num2 = num + 1L;
            }
            stringBuilder.Append(" SELECT tra.id_tramite,convert(varchar,tra.indice) + ' ' + tra.descripcion tramite,tra.indiceprox,(select top 1 convert(varchar,t.indice) + ' ' + t.descripcion from tramite t where t.indice = tra.indiceprox) subtramite   ");
            stringBuilder.Append(" FROM tramite tra  ");
            stringBuilder.Append(" WHERE tra.indice = " + num);
            stringBuilder.Append(" UNION  ");
            stringBuilder.Append(" SELECT tra.id_tramite,convert(varchar,tra.indice) + ' ' + tra.descripcion tramite,tra.indiceprox,(select top 1 convert(varchar,t.indice) + ' ' + t.descripcion from tramite t where t.indice = tra.indiceprox) subtramite  ");
            stringBuilder.Append(" FROM tramite tra  ");
            stringBuilder.Append(" WHERE tra.indice = " + num2);
            return baseDatos.getResultset(stringBuilder.ToString());
        }
        public static DataTable ComboTramiteDocuJuicio(string indices)
        {
            BaseDatos baseDatos = new BaseDatos();
            long num = Convert.ToInt64(indices);
            StringBuilder stringBuilder = new StringBuilder();
            long num2 = 0L;
            if (num == 1L || num == 2L || num == 3L)
            {
                num2 = num + 1L;
            }
            if (num == 4L)
            {
                num2 = 5L;
            }
            if (num == 5L)
            {
                num = 4L;
                num2 = 5L;
            }
            if (num == 6L)
            {
                num = 4L;
                num2 = 5L;
            }
            if (num == 7L)
            {
                num = 4L;
                num2 = 5L;
            }
            if (num == 8L)
            {
                num2 = 6L;
            }
            if (num == 9L)
            {
                num = 5L;
                num2 = 6L;
            }
            if (num == 10L)
            {
                num = 5L;
                num2 = 6L;
            }
            if (num == 11L)
            {
                num = 5L;
                num2 = 6L;
            }
            if (num == 12L)
            {
                num = 6L;
                num2 = 7L;
            }
            if (num == 13L)
            {
                num = 7L;
                num2 = 8L;
            }
            if (num == 14L)
            {
                num = 8L;
                num2 = 9L;
            }
            if (num == 15L)
            {
                num = 9L;
                num2 = 10L;
            }
            stringBuilder.Append(" SELECT tra.id_tramite,convert(varchar,tra.indice) + ' ' + tra.descripcion tramite,tra.indiceprox,(select top 1 convert(varchar,t.indice) + ' ' + t.descripcion from TramiteDocuJuicio t where t.indice = tra.indiceprox) subtramite   ");
            stringBuilder.Append(" FROM TramiteDocuJuicio tra  ");
            stringBuilder.Append(" WHERE tra.indice = " + num);
            stringBuilder.Append(" UNION  ");
            stringBuilder.Append(" SELECT tra.id_tramite,convert(varchar,tra.indice) + ' ' + tra.descripcion tramite,tra.indiceprox,(select top 1 convert(varchar,t.indice) + ' ' + t.descripcion from TramiteDocuJuicio t where t.indice = tra.indiceprox) subtramite  ");
            stringBuilder.Append(" FROM TramiteDocuJuicio tra  ");
            stringBuilder.Append(" WHERE tra.indice = " + num2);
            return baseDatos.getResultset(stringBuilder.ToString());
        }
        public static DataTable ComboJurisdiccion()
        {
            BaseDatos baseDatos = new BaseDatos();
            return baseDatos.getResultset(" select id_jurisdiccion,descripcion from Jurisdiccion ");
        }
        public static DataTable ComboTipoVehiculo()
        {
            BaseDatos baseDatos = new BaseDatos();
            return baseDatos.getResultset(" select id_tipo_veh,descripcion from tipovehiculo order by descripcion ");
        }
        public static DataTable ComboMarca()
        {
            BaseDatos baseDatos = new BaseDatos();
            return baseDatos.getResultset(" select id_marca,descripcion from marca order by descripcion ");
        }
        public static DataTable ComboConceptoAbono()
        {
            BaseDatos baseDatos = new BaseDatos();
            return baseDatos.getResultset(" select * from conceptoabono where estado = 'S' ");
        }
        public static DataTable ComboReconstitucion()
        {
            BaseDatos baseDatos = new BaseDatos();
            return baseDatos.getResultset(" select id,descripcion from ReconstitucionesEstados ");
        }
        public static DataTable ReconstitucionByRut(string ot)
        {
            BaseDatos baseDatos = new BaseDatos();
            return baseDatos.getResultset(" select OT,subproducto, prod, TipoDoc, nrooperacion, rutcliente, dv, nombrecliente, direccion, comuna, conservador, region, fojasdominio, numerodominio, aniodominio, fojashipoteca, numerohipoteca, aniohipoteca, fojasprohibicion, numeroprohibicion, anioprohibicion, convert(varchar(10),fechacontabilizacion,103)fechacontabilizacion, convert(varchar(10),fechaentrega,103)fechaentrega, convert(varchar(10),fechaescritura,103)fechaescritura, notaria, comunanotaria, reportorio, protocolo, codigoestado, estado, (select top 1 est.descripcion from ReconstitucionesEstados est where codigoestado = est.id)estadodescripcion ,convert(varchar(10),fechaestado,103)fechaestado, observacion, nrocarillas, factura, convert(varchar(10),fechafactura,103)fechafactura, montofactura, convert(varchar(10),fecha_remesa,103)fecha_remesa, remesa, centrocosto, (select top 1 isnull(usu.nombres,'') + ' ' + isnull(usu.apaterno,'') + ' ' + isnull(usu.amaterno,'') from usuarios usu where usu.username = user_responsable )respo, user_responsable ,case estado_ot when '1' then 'SIN ASIGNAR' when '2' then 'EN PROCESO' else 'TERMINADA' end estado_ot  from reconstituciones where ot = " + Convert.ToDecimal(ot) + " ");
        }
        public static DataTable ReconstitucionReporByOT(string ot)
        {
            BaseDatos baseDatos = new BaseDatos();
            return baseDatos.getResultset(" select *  from ReconstitucionReportes where ot = " + Convert.ToDecimal(ot) + " ");
        }
        public static DataTable ComboModelo(string id_marca)
        {
            BaseDatos baseDatos = new BaseDatos();
            return baseDatos.getResultset("select id_modelo,descripcion from modelo where id_marca = '" + id_marca + "'");
        }
        public static DataTable ComboColor()
        {
            BaseDatos baseDatos = new BaseDatos();
            return baseDatos.getResultset("select id_color,descripcion from color order by descripcion");
        }
        public static DataTable ComboTribunales(string id_jurisdiccion)
        {
            BaseDatos baseDatos = new BaseDatos();
            return baseDatos.getResultset("SELECT id_tribunal,descripcion FROM tribunal where id_jurisdiccion = " + Convert.ToInt64(id_jurisdiccion));
        }
        public static DataTable BuscarNombreTribunal(string NombreTribunal)
        {
            BaseDatos baseDatos = new BaseDatos();
            return baseDatos.getResultset("SELECT distinct id_tribunal FROM tribunal where descripcion = '" + NombreTribunal +"'");
        }    
        public static DataTable ComboTribunales()
        {
            BaseDatos baseDatos = new BaseDatos();
            return baseDatos.getResultset("SELECT id_tribunal,descripcion FROM tribunal");
        }
     
        public static DataTable BuscarCliente(string Rut)
        {
            BaseDatos baseDatos = new BaseDatos();
            return baseDatos.getResultset("SELECT * FROM clientes WHERE  rtrim(ltrim(rut_cli)) = '" + Rut.Trim() + "'");
        }
        public static DataTable BuscarPatente(string patente)
        {
            BaseDatos baseDatos = new BaseDatos();
            return baseDatos.getResultset("select estado,id_tipo_vehi, id_marca, id_modelo, n_chassis, id_color, rut_deudor, n_motor, patente, anio_fabricacion, id_limitaciones from bienmueble where patente = '" + patente.Trim().ToUpper().Replace("-", "") + "'");
        }
        public static DataTable BuscarTelefono(string Rut)
        {
            BaseDatos baseDatos = new BaseDatos();
            return baseDatos.getResultset("SELECT rut_dueno,vigencia,telefono1,celular1,fax,id_tipo_telefono,status FROM telefonos WHERE  rtrim(ltrim(rut_dueno)) = '" + Rut.Trim() + "'");
        }
        public static DataTable TraeParametros()
        {
            BaseDatos baseDatos = new BaseDatos();
            return baseDatos.getResultset("select * from parametros");
        }
        public static DataTable TraeParametros(string rut_cli)
        {
            BaseDatos baseDatos = new BaseDatos();
            return baseDatos.getResultset("select * from ParametrosCliente where rut_cli = '" + rut_cli.Trim() + "'");
        }
        public static DataTable BuscarUsuario(string Rut)
        {
            BaseDatos baseDatos = new BaseDatos();
            return baseDatos.getResultset("SELECT * FROM usuarios WHERE rtrim(ltrim(rut_usu)) = '" + Rut.Trim() + "'");
        }
        public static DataTable BuscarUsuariobyUsername(string username)
        {
            BaseDatos baseDatos = new BaseDatos();
            return baseDatos.getResultset("SELECT * FROM usuarios WHERE rtrim(ltrim(username)) = '" + username.Trim() + "'");
        }
        //Jbaez: busca todos los datos de la direccion  12-06-2014
        public static DataTable BuscarDeudor(string Rut)
        {
            BaseDatos baseDatos = new BaseDatos();
            return baseDatos.getResultset("exec SPALC_BUSCA_DATOS_DEUDOR '" + (Rut) + "'");
        }
        /*public static DataTable BuscarDeudor(string Rut)
        {
            BaseDatos baseDatos = new BaseDatos();
            return baseDatos.getResultset("SELECT rut_deudor, rsocial, convert(varchar(10),fnacimiento,103) fnacimiento , id_profesion, ecivil, telefono1, celular1, telefono2, email, id_banco, ctacte,status,nombres,apaterno,amaterno,tipopersona FROM deudores WHERE status = 'A' AND rtrim(ltrim(rut_deudor)) = '" + Rut.Trim() + "'");
        }*/
        public static DataTable BuscarJuicio(string idCobranza)
        {
            BaseDatos baseDatos = new BaseDatos();
            return baseDatos.getResultset("SELECT id_juicios FROM juicios WHERE id_cobranza = " + Convert.ToUInt64(idCobranza));
        }
        public static object BuscarUsername(string Username)
        {
            BaseDatos baseDatos = new BaseDatos();
            return baseDatos.getRowValue("SELECT username FROM usuarios WHERE rtrim(ltrim(username)) = '" + Username.Trim() + "'");
        }
        public static DataTable Perfiles()
        {
            BaseDatos baseDatos = new BaseDatos();
            return baseDatos.getResultset("SELECT id_perfil,nombre FROM perfiles");
        }
        public static DataTable BuscaRegiones()
        {
            BaseDatos baseDatos = new BaseDatos();
            return baseDatos.getResultset("SELECT id_regiones,descripcion FROM regiones");
        }
        public static DataTable GrillaConservadores(string id_comuna_con)
        {
            if (string.IsNullOrEmpty(id_comuna_con))
            {
                id_comuna_con = "0";
            }
            BaseDatos baseDatos = new BaseDatos();
            return baseDatos.getResultset("select cargo,ID_conservador ID,RUT,NOMBRE,DIRECCION from Conservador where id_comuna_con = " + Convert.ToDecimal(id_comuna_con));
        }
        public static DataTable GrillaEstadosReconsti()
        {
            BaseDatos baseDatos = new BaseDatos();
            return baseDatos.getResultset("select id,descripcion from ReconstitucionesEstados");
        }
        public static DataTable GrillaTipoEstadosReconsti()
        {
            BaseDatos baseDatos = new BaseDatos();
            return baseDatos.getResultset("select * from ReconstitucionesTipoGastos");
        }
        public static DataTable GrillaSub_Tramite(string Tipo)
        {
            BaseDatos baseDatos = new BaseDatos();
            return baseDatos.getResultset("select * from SubTramiteGENERAL where tipo = '" + Tipo + "' ");
        }
        public static DataTable BuscaComunas(string idRegion)
        {
            BaseDatos baseDatos = new BaseDatos();
            return baseDatos.getResultset("SELECT id_comuna,descripcion FROM comunas WHERE id_region = " + Convert.ToInt16(idRegion) + " order by descripcion ");
        }
        public static DataTable ComboRemesaAll()
        {
            BaseDatos baseDatos = new BaseDatos();
            return baseDatos.getResultset("select distinct remesa from Reconstituciones order by remesa ");
        }
        public static DataTable BuscaComunasCBR(string idRegion)
        {
            BaseDatos baseDatos = new BaseDatos();
            return baseDatos.getResultset("SELECT id_comuna_con,descripcion FROM comunaconservador WHERE id_region = " + Convert.ToInt64(idRegion) + " order by descripcion ");
        }
        public static DataTable BuscaComunasNotaria(string idRegion)
        {
            BaseDatos baseDatos = new BaseDatos();
            return baseDatos.getResultset("select id_comuna_notaria,descripcion from comunanotaria where id_region =  " + Convert.ToInt64(idRegion) + " order by descripcion ");
        }
        public static DataTable BuscaConservadores(string idComuna)
        {
            BaseDatos baseDatos = new BaseDatos();
            return baseDatos.getResultset("SELECT id_conservador,nombre FROM conservador WHERE id_comuna_con = " + Convert.ToInt16(idComuna) + " order by nombre ");
        }
        public static DataTable BuscaNotarias(string idComunaNotaria)
        {
            BaseDatos baseDatos = new BaseDatos();
            return baseDatos.getResultset("select id_notaria,nombre from notaria where id_comuna_notaria = " + Convert.ToInt16(idComunaNotaria) + " order by nombre ");
        }
        public static object BuscaDomicilios(string numero, string rut_deudor)
        {
            BaseDatos baseDatos = new BaseDatos();
            return baseDatos.getRowValue(string.Concat(new object[]
			{
				"SELECT id_domicilio FROM domicilios WHERE numero = ",
				Convert.ToInt64(numero),
				" and rut_deudor = '",
				rut_deudor,
				"'"
			}));
        }
        public static DataTable BuscaDomicilios(string RutDeudor)
        {
            BaseDatos baseDatos = new BaseDatos();
            return baseDatos.getResultset("SELECT calle CALLE,numero NUMERO,villapob VILLA,block BLOCK, case estado when '1' then 'ACTIVO' when '2' then 'NO ACTIVO' end ESTADO  FROM domicilios WHERE rtrim(ltrim(rut_deudor)) = '" + RutDeudor.Trim() + "'");
        }
        public static DataTable BienRaizPorDomicilio(string RutDeudor)
        {
            BaseDatos baseDatos = new BaseDatos();
            StringBuilder stringBuilder = new StringBuilder();
            stringBuilder.Append(" SELECT br.id_bien_raiz,dom.calle + ' ' + convert(varchar,dom.numero) Domicilio ");
            stringBuilder.Append(" FROM bienraiz br,domicilios dom ");
            stringBuilder.Append(" WHERE ");
            stringBuilder.Append(" dom.id_domicilio = br.id_domicilio AND ");
            stringBuilder.Append(" br.rut_deudor = '" + RutDeudor.Replace(".", "").Trim() + "'");
            stringBuilder.Append(" AND br.id_bien_raiz NOT  IN (select mut.id_bien_raiz from mutuo mut where mut.id_bien_raiz = br.id_bien_raiz)");
            return baseDatos.getResultset(stringBuilder.ToString());
        }
        public static DataTable BienRaizPorDomicilioTodos(string id_bien_raiz)
        {
            DataTable result;
            if (id_bien_raiz == "Seleccione")
            {
                result = null;
            }
            else
            {
                BaseDatos baseDatos = new BaseDatos();
                StringBuilder stringBuilder = new StringBuilder();
                stringBuilder.Append(" SELECT convert(varchar(10),br.fescritura,103) fescritura ,br.fojas_insc,br.n_insc,br.anio_insc,ccon.descripcion,(select top 1 nota.nombre from notaria nota where br.id_notaria = nota.id_notaria)id_notaria,");
                stringBuilder.Append(" br.fojas1_hip,br.n1_hip,br.anio1_hip ");
                stringBuilder.Append(" FROM bienraiz br,domicilios dom,comunaconservador ccon  ");
                stringBuilder.Append(" WHERE ");
                stringBuilder.Append(" dom.id_domicilio = br.id_domicilio AND ");
                stringBuilder.Append(" br.id_comuna_cbr = ccon.id_comuna_con AND  ");
                stringBuilder.Append(" br.id_bien_raiz= " + Convert.ToInt64(id_bien_raiz));
                DataTable resultset = baseDatos.getResultset(stringBuilder.ToString());
                result = resultset;
            }
            return result;
        }
        public static DataTable ComboTelefonos(string RutDeudor)
        {
            BaseDatos baseDatos = new BaseDatos();
            StringBuilder stringBuilder = new StringBuilder();
            stringBuilder.Append(" select telefono1,celular1,case vigencia when 'V' then 'Activo' else 'Fuera de servicio' end status ");
            stringBuilder.Append("  from telefonos where rut_dueno  = '" + RutDeudor.Trim().Replace(".", "") + "' ");
            return baseDatos.getResultset(stringBuilder.ToString());
        }
        public static DataTable ComboDomicilios(string RutDeudor)
        {
            BaseDatos baseDatos = new BaseDatos();
            StringBuilder stringBuilder = new StringBuilder();
            stringBuilder.Append(" SELECT  ");
            stringBuilder.Append(" case isnull(convert(varchar,br.id_domicilio),'X') when 'X' then 'NO' else 'SI' end bienraiz,");
            stringBuilder.Append(" dom.id_domicilio, dom.calle + ' ' + convert(varchar,dom.numero) Domicilio,     ");
            stringBuilder.Append(" isnull(reg.descripcion,'') nomregion,");
            stringBuilder.Append(" isnull(com.descripcion,'') nomcomuna  FROM  ");
            stringBuilder.Append(" domicilios dom  LEFT  JOIN regiones reg ON dom.id_region = reg.id_regiones ");
            stringBuilder.Append(" LEFT JOIN bienraiz br ON br.id_domicilio = dom.id_domicilio");
            stringBuilder.Append(" LEFT  JOIN comunas com ON dom.id_comuna = com.id_comuna  WHERE  rtrim(ltrim(dom.rut_deudor)) = '" + RutDeudor.Trim().Replace(".", "") + "' ");
            return baseDatos.getResultset(stringBuilder.ToString());
        }

        //Jbaez: busca todos los datos de la direccion  12-06-2014
        public static DataTable Buscar_Domicilio_Completo(string RutDeudor, string ID_Domicilio)
        {
            BaseDatos baseDatos = new BaseDatos();
            return baseDatos.getResultset("exec SPALC_BUSCA_DOMICILIO_COMPLETO '" + (RutDeudor) + "','" + (ID_Domicilio) + "'");
        }

        //Jbaez: elimina  la direccion  12-06-2014
        public static DataTable Eliminar_Domicilio(string RutDeudor, string ID_Domicilio)
        {
            BaseDatos baseDatos = new BaseDatos();
            return baseDatos.getResultset("exec SPALC_ELIMINAR_DOMICILIO '" + (RutDeudor) + "','" + (ID_Domicilio) + "'");
        }

        public static DataTable ComboDomicilios(string RutDeudor, string id_domicilio)
        {
            BaseDatos baseDatos = new BaseDatos();
            StringBuilder stringBuilder = new StringBuilder();
            stringBuilder.Append(" SELECT  dom.id_domicilio, dom.calle + ' ' + convert(varchar,dom.numero) Domicilio,");
            stringBuilder.Append("         isnull(reg.descripcion,'') nomregion, ");
            stringBuilder.Append("         isnull(com.descripcion,'') nomcomuna");
            stringBuilder.Append("  FROM   domicilios dom");
            stringBuilder.Append("  LEFT  JOIN regiones reg ON dom.id_region = reg.id_regiones");
            stringBuilder.Append("  LEFT  JOIN comunas com ON dom.id_comuna = com.id_comuna");
            stringBuilder.Append("  WHERE  rtrim(ltrim(rut_deudor)) = '" + RutDeudor.Trim().Replace(".", "") + "'");
            stringBuilder.Append(" AND dom.id_domicilio = " + Convert.ToInt64(id_domicilio));
            return baseDatos.getResultset(stringBuilder.ToString());
        }
        public static DataTable Buscar_Domicilios(string RutDeudor, string id_domicilio)
        {
            BaseDatos baseDatos = new BaseDatos();
            StringBuilder stringBuilder = new StringBuilder();
            stringBuilder.Append(" SELECT  dom.id_domicilio,reg.id_regiones,com.id_comuna, dom.calle + ' ' + convert(varchar,dom.numero) Domicilio,");
            stringBuilder.Append("         isnull(reg.descripcion,'') nomregion, ");
            stringBuilder.Append("         isnull(com.descripcion,'') nomcomuna");
            stringBuilder.Append("  FROM   domicilios dom");
            stringBuilder.Append("  LEFT  JOIN regiones reg ON dom.id_region = reg.id_regiones");
            stringBuilder.Append("  LEFT  JOIN comunas com ON dom.id_comuna = com.id_comuna");
            stringBuilder.Append("  WHERE  rtrim(ltrim(rut_deudor)) = '" + RutDeudor.Trim().Replace(".", "") + "'");
            stringBuilder.Append(" AND dom.id_domicilio = " + Convert.ToInt64(id_domicilio));
            return baseDatos.getResultset(stringBuilder.ToString());
        }
        public static DataTable ComboDomiciliosGeneral(string RutDeudor)
        {
            BaseDatos baseDatos = new BaseDatos();
            StringBuilder stringBuilder = new StringBuilder();
            stringBuilder.Append(" SELECT  dom.id_domicilio, dom.calle + ' ' + convert(varchar,dom.numero) Domicilio");
            stringBuilder.Append("   FROM  domicilios dom");
            stringBuilder.Append("  WHERE  dom.rut_deudor = '" + RutDeudor.Trim().Replace(".", "") + "'");
            return baseDatos.getResultset(stringBuilder.ToString());
        }
        public static DataTable ComboDomiciliosGeneral(string RutDeudor, int add)
        {
            BaseDatos baseDatos = new BaseDatos();
            StringBuilder stringBuilder = new StringBuilder();
            stringBuilder.Append(" SELECT  dom.id_domicilio, dom.calle + ' ' + convert(varchar,dom.numero) + ' - ' + isnull((select top 1 com.descripcion from comunas com where dom.id_comuna = com.id_comuna),'') Domicilio");
            stringBuilder.Append("              FROM  domicilios dom");
            stringBuilder.Append("             WHERE  dom.rut_deudor = '" + RutDeudor.Trim().Replace(".", "") + "'");
            return baseDatos.getResultset(stringBuilder.ToString());
        }
        public static DataTable ComboExhorto(string idjuicio)
        {
            BaseDatos baseDatos = new BaseDatos();
            StringBuilder stringBuilder = new StringBuilder();
            if (string.IsNullOrEmpty(idjuicio))
            {
                idjuicio = "0";
            }
            stringBuilder.Append(" select ex.rol_exhorto,tri.descripcion tribunal,convert(varchar(10),ex.fechaingreso,103)fecha,tex.descripcion tipo,ex.urldocumento");
            stringBuilder.Append(" from exhorto ex inner join tipoexhorto tex on ex.id_tipoexhorto = tex.id_tipoexhorto");
            stringBuilder.Append("                inner join tribunal tri on ex.id_tribunal = tri.id_tribunal");
            stringBuilder.Append(" where ex.id_juicios = " + Convert.ToInt64(idjuicio));
            return baseDatos.getResultset(stringBuilder.ToString());
        }
        public static object BuscaBienRaizDuplicado(string domicilio, string rut_deudor)
        {
            BaseDatos baseDatos = new BaseDatos();
            return baseDatos.getRowValue(string.Concat(new object[]
			{
				"SELECT id_bien_raiz FROM bienraiz WHERE id_domicilio = ",
				Convert.ToInt64(domicilio),
				" and Rtrim(ltrim(rut_deudor)) = '",
				rut_deudor.Trim().Replace(".", ""),
				"'"
			}));
        }
        public static object BuscaNroOperacionCli(string noperacion, string RutCli)
        {
            BaseDatos baseDatos = new BaseDatos();
            return baseDatos.getRowValue(string.Concat(new string[]
			{
				"SELECT NroOperacion FROM cobranza WHERE NroOperacion = '",
				noperacion,
				"' and Rtrim(ltrim(rut_cli)) =  '",
				RutCli.Trim().Replace(".", ""),
				"'"
			}));
        }
        public static object Secuencia(string Tabla)
        {
            BaseDatos baseDatos = new BaseDatos();
            object result;
            if (Tabla == "clientes")
            {
                result = baseDatos.getRowValue("SELECT MAX(id_cliente) + 1 FROM clientes ");
            }
            else
            {
                result = null;
            }
            return result;
        }
    }

    public class ConsultasEspecificas
    {
        public static DataTable ConsultaCobranza(string RutDeudor, string NroOperacion)
        {
            BaseDatos baseDatos = new BaseDatos();
            StringBuilder stringBuilder = new StringBuilder();
            stringBuilder.Append(" SELECT cob.estado_ot,cob.id_cobranza,cob.Nrooperacion,cob.rut_cli,cob.rut_deudor,cob.tipo estado");
            stringBuilder.Append(" FROM cobranza cob  ");
            stringBuilder.Append(" WHERE cob.tipocobranza = 'J' AND");
            if (!string.IsNullOrEmpty(RutDeudor) && !string.IsNullOrEmpty(NroOperacion))
            {
                stringBuilder.Append(" Nrooperacion = '" + NroOperacion + "'");
                stringBuilder.Append(" AND rtrim(ltrim(rut_deudor)) = '" + RutDeudor.Replace(".", "").Trim() + "'");
            }
            else
            {
                if (!string.IsNullOrEmpty(RutDeudor))
                {
                    stringBuilder.Append(" rtrim(ltrim(rut_deudor)) = '" + RutDeudor.Replace(".", "").Trim() + "'");
                }
                else
                {
                    stringBuilder.Append(" Nrooperacion = '" + NroOperacion + "'");
                }
            }
            return baseDatos.getResultset(stringBuilder.ToString());
        }

        public static DataTable ConsultaCobranzaRESPONSABLE(string RutDeudor, string NroOperacion)
        {
            return ConsultaCobranzaRESPONSABLE(RutDeudor, NroOperacion, string.Empty, 0, 0);
        }

        public static DataTable ConsultaCobranzaRESPONSABLE(string RutDeudor, string NroOperacion, string estadoOt, int idJurisdiccion, int idTribunal)
        {
            BaseDatos baseDatos = new BaseDatos();
            StringBuilder stringBuilder = new StringBuilder();

            stringBuilder.AppendFormat("EXEC dbo.SPALC_ConsultaCobranzaResponsable '{0}', '{1}', '{2}', {3}, {4}",
                new object[] { NroOperacion, RutDeudor, estadoOt, idJurisdiccion, idTribunal });

            return baseDatos.getResultset(stringBuilder.ToString());
        }

        public static DataTable ConsultaDocuPrejudicial(string RutDeudor, string NroOperacion)
        {
            BaseDatos baseDatos = new BaseDatos();
            StringBuilder stringBuilder = new StringBuilder();
            stringBuilder.Append(" SELECT cob.id_cobranza,cob.Nrooperacion,cob.rut_cli,cob.rut_deudor,cob.tipo estado");
            stringBuilder.Append(" FROM cobranza cob  ");
            stringBuilder.Append(" WHERE cob.tipocobranza = 'P' AND");
            if (!string.IsNullOrEmpty(RutDeudor) && !string.IsNullOrEmpty(NroOperacion))
            {
                stringBuilder.Append(" Nrooperacion = '" + NroOperacion + "'");
                stringBuilder.Append(" AND rtrim(ltrim(rut_deudor)) = '" + RutDeudor.Replace(".", "").Trim() + "'");
            }
            else
            {
                if (!string.IsNullOrEmpty(RutDeudor))
                {
                    stringBuilder.Append(" rtrim(ltrim(rut_deudor)) = '" + RutDeudor.Replace(".", "").Trim() + "'");
                }
                else
                {
                    stringBuilder.Append(" Nrooperacion = '" + NroOperacion + "'");
                }
            }
            return baseDatos.getResultset(stringBuilder.ToString());
        }
       
        //jbaez:se genera nuevo metodo en reemplazo del antiguo ConsultaCobranzaConsulta - 11-05-2014
        public static DataTable ConsultaGeneralBieneRaices(string strRutDeudor, string strNroOperacion, string strCliente,string strTribunal)
        {
            BaseDatos baseDatos = new BaseDatos();
            if (string.IsNullOrEmpty(strRutDeudor))
            {
                strRutDeudor = null;
            }
            return baseDatos.getResultset("exec SPALC_CONSUL_GENERA_BIENES_RAICES_DEUDOR '" + (strRutDeudor) + "'," + "'" + (strNroOperacion) + "'," + "'" + (strCliente) + "'," + "'" + (strTribunal) + "'");
        }

        //jbaez:se genera nuevo metodo en reemplazo del antiguo ConsultaCobranzaConsulta - 11-05-2014
        public static DataTable ConsultaGeneralBieneMuebles(string strRutDeudor, string strNroOperacion, string strCliente, string strTribunal)
        {
            BaseDatos baseDatos = new BaseDatos();
            if (string.IsNullOrEmpty(strRutDeudor))
            {
                strRutDeudor = null;
            }
            return baseDatos.getResultset("exec SPALC_CONSUL_GENERA_BIENES_MUEBLES_DEUDOR '" + (strRutDeudor) + "'," + "'" + (strNroOperacion) + "'," + "'" + (strCliente) + "'," + "'" + (strTribunal) + "'");
        }

        public static DataTable ConsultaCobranzaConsulta(string RutDeudor, string NroOperacion)
        {
            return ConsultaCobranzaConsulta(RutDeudor, NroOperacion, string.Empty);
        }

        public static DataTable ConsultaCobranzaConsulta(string RutDeudor, string NroOperacion, string rol)
        {
            StringBuilder stringBuilder = new StringBuilder();
            string strOperadorLogico = string.Empty;
            if (!string.IsNullOrEmpty(NroOperacion))
            {
                stringBuilder.AppendFormat(" cob.Nrooperacion = '{0}' ", NroOperacion);
                strOperadorLogico = "AND";
            }
            if (!string.IsNullOrEmpty(RutDeudor))
            {
                stringBuilder.AppendFormat(" {0} cob.rut_deudor = '{1}' ", strOperadorLogico, RutDeudor.Replace(".", string.Empty));
                strOperadorLogico = "AND";
            }
            if (!string.IsNullOrEmpty(rol))
                stringBuilder.AppendFormat(" {0} jui.rol = '{1}' ", strOperadorLogico, rol);

            if (stringBuilder.Length > 0) stringBuilder.Insert(0, " WHERE ");
            stringBuilder.Insert(0, " FROM cobranza cob inner join juicios jui on cob.id_cobranza = jui.id_cobranza ");
            stringBuilder.Insert(0, " SELECT TOP 1000 (select top 1 deu.rsocial from deudores deu  where cob.rut_deudor = deu.rut_deudor) nomdeudor,jui.id_juicios,cob.id_cobranza,cob.Nrooperacion,cob.rut_cli,cob.rut_deudor,cob.id_producto,cob.tipo estado");
            
            return new BaseDatos().getResultset(stringBuilder.ToString());
        }

        public static DataTable ConsulGeneraljuicio(string idcobranza)
        {
            BaseDatos baseDatos = new BaseDatos();
            StringBuilder stringBuilder = new StringBuilder();
            stringBuilder.Append(" SELECT");
            stringBuilder.Append(" \t\t(select top 1 pro.descripcion from Procedimiento pro where cob.id_procedimiento = pro.id_procedimiento) Procedimiento,");
            stringBuilder.Append(" \t\t(select top 1 mat.descripcion from materia mat where cob.id_materia = mat.id_materia) materia,");
            stringBuilder.Append(" \t\t cob.id_producto,jui.id_juicios,");
            stringBuilder.Append(" \t\t(select top 1 cli.rsocial from clientes cli where  cob.rut_cli = cli.rut_cli) cliente,");
            stringBuilder.Append(" \t\t(select top 1 isnull(abo.nombres,'') + ' ' + isnull(abo.apaterno,'') + ' ' + isnull(abo.amaterno,'') from abogados abo where  jui.rut_abogado = abo.rut_abogado) abogado,");
            stringBuilder.Append(" \t\t(select top 1 isnull(pro.nombres,'') + ' ' + isnull(pro.apaterno,'') + ' ' + isnull(pro.amaterno,'') from procuradores pro where jui.rut_procurador = pro.rut_procurador) procurador,");
            stringBuilder.Append(" \t\tcob.nrooperacion,");
            stringBuilder.Append(" \t\t(select top 1 pro.descripcion from producto pro where cob.id_producto = pro.id_producto) Producto,");
            stringBuilder.Append(" \t\tcob.rut_deudor,");
            stringBuilder.Append(" \t\t(select top 1 deu.rsocial from deudores deu  where cob.rut_deudor = deu.rut_deudor) nomdeudor, ");
            stringBuilder.Append(" \t\tcase cob.tipocobranza when 'J' then 'Judicial' else 'PreJudicial' end TipoCobranza,");
            stringBuilder.Append(" \t\tcase cob.tipo when 'A' then 'Activo' else 'No Activo' end EstadoCobranza,");
            stringBuilder.Append(" \t\t(select top 1 tri.descripcion from tribunal tri where jui.id_tribunal = tri.id_tribunal) tribunal,");
            stringBuilder.Append(" \t\tjui.rol");
            stringBuilder.Append("  FROM cobranza cob INNER JOIN juicios jui ON cob.id_cobranza = jui.id_cobranza");
            stringBuilder.Append("  WHERE cob.id_cobranza = " + Convert.ToDecimal(idcobranza.ToString()));
            return baseDatos.getResultset(stringBuilder.ToString());
        }
        public static DataTable ConsulGeneralActJudiciales(string idjuicio)
        {
            BaseDatos baseDatos = new BaseDatos();
            StringBuilder stringBuilder = new StringBuilder();
            stringBuilder.Append(" select (select top 1 tr.descripcion from tramiteGENERAL tr where tr.id_tramite = aj.id_tramite) Tramite,");
            stringBuilder.Append(" convert(varchar(10),aj.ftramite,103)Fecha");
            stringBuilder.Append(" from  ActividadesJudiciales aj");
            stringBuilder.Append(" where aj.id_juicios = " + Convert.ToDecimal(idjuicio.ToString()));
            return baseDatos.getResultset(stringBuilder.ToString());
        }
        public static DataTable ConsulGeneralActJudiciales(string idjuicio, string maximo)
        {
            BaseDatos baseDatos = new BaseDatos();
            StringBuilder stringBuilder = new StringBuilder();
            stringBuilder.Append(" select top 1");
            stringBuilder.Append(" (select top 1 tr.descripcion from tramiteGENERAL tr where tr.id_tramite = aj.id_tramite) tramite,");
            stringBuilder.Append(" aj.indice,aj.observacion");
            stringBuilder.Append(" from  ActividadesJudiciales aj");
            stringBuilder.Append(" where aj.id_juicios = " + Convert.ToDecimal(idjuicio.ToString()));
            stringBuilder.Append(" order by indice desc");
            return baseDatos.getResultset(stringBuilder.ToString());
        }
        public static DataTable ConsultaCobranzaPrejudicial(string RutDeudor, string NroOperacion)
        {
            BaseDatos baseDatos = new BaseDatos();
            StringBuilder stringBuilder = new StringBuilder();
            stringBuilder.Append(" SELECT cob.id_cobranza,cob.Nrooperacion,cob.rut_cli,cob.rut_deudor,cob.tipo estado");
            stringBuilder.Append(" FROM cobranza cob  ");
            stringBuilder.Append(" WHERE tipocobranza = 'P' AND  ");
            if (!string.IsNullOrEmpty(RutDeudor) && !string.IsNullOrEmpty(NroOperacion))
            {
                stringBuilder.Append(" Nrooperacion = '" + NroOperacion + "'");
                stringBuilder.Append(" AND rtrim(ltrim(rut_deudor)) = '" + RutDeudor.Replace(".", "").Trim() + "'");
            }
            else
            {
                if (!string.IsNullOrEmpty(RutDeudor))
                {
                    stringBuilder.Append(" rtrim(ltrim(rut_deudor)) = '" + RutDeudor.Replace(".", "").Trim() + "'");
                }
                else
                {
                    stringBuilder.Append(" Nrooperacion = '" + NroOperacion + "'");
                }
            }
            return baseDatos.getResultset(stringBuilder.ToString());
        }
        public static DataTable ConsultaTableroConsulta(string rut_cli, string rut_deudor, string id_tribunal, string cob_tipo, string id_producto, string tipocobranza, string rut_procurador, string nrooperacion, string idcobranza)
        {
            if (string.IsNullOrEmpty(rut_cli))
            {
                rut_cli = null;
            }
            if (string.IsNullOrEmpty(rut_deudor))
            {
                rut_deudor = null;
            }
            if (string.IsNullOrEmpty(rut_procurador))
            {
                rut_procurador = null;
            }
            if (id_tribunal == "Seleccione")
            {
                id_tribunal = null;
            }
            if (cob_tipo == "Seleccione")
            {
                cob_tipo = null;
            }
            if (id_producto == "Seleccione")
            {
                id_producto = null;
            }
            if (tipocobranza == "Seleccione")
            {
                tipocobranza = null;
            }
            if (string.IsNullOrEmpty(id_tribunal))
            {
                id_tribunal = null;
            }
            else
            {
                Convert.ToInt64(id_tribunal);
            }
            if (string.IsNullOrEmpty(id_producto))
            {
                id_producto = null;
            }
            else
            {
                Convert.ToInt64(id_producto);
            }
            if (string.IsNullOrEmpty(nrooperacion))
            {
                nrooperacion = null;
            }
            if (string.IsNullOrEmpty(idcobranza))
            {
                idcobranza = null;
            }
            else
            {
                Convert.ToInt64(idcobranza);
            }
            SqlConnection sqlConnection = new SqlConnection(ConfigurationSettings.AppSettings["CONN"].ToString());
            SqlCommand sqlCommand = new SqlCommand("spALC_Tablero_Consulta", sqlConnection);
            sqlCommand.CommandType = CommandType.StoredProcedure;
            sqlCommand.Parameters.Add("@rut_cli", SqlDbType.VarChar).Value = rut_cli;
            sqlCommand.Parameters.Add("@rut_deudor", SqlDbType.VarChar).Value = rut_deudor;
            sqlCommand.Parameters.Add("@id_tribunal", SqlDbType.Int).Value = id_tribunal;
            sqlCommand.Parameters.Add("@cob_tipo", SqlDbType.Char).Value = cob_tipo;
            sqlCommand.Parameters.Add("@id_producto", SqlDbType.Int).Value = id_producto;
            sqlCommand.Parameters.Add("@tipocobranza", SqlDbType.Char).Value = tipocobranza;
            sqlCommand.Parameters.Add("@rut_procurador", SqlDbType.VarChar).Value = rut_procurador;
            sqlCommand.Parameters.Add("@nrooperacion", SqlDbType.VarChar).Value = nrooperacion;
            sqlCommand.Parameters.Add("@id_cobranza ", SqlDbType.Int).Value = idcobranza;
            SqlDataAdapter sqlDataAdapter = new SqlDataAdapter(sqlCommand);
            DataTable dataTable = new DataTable();
            sqlDataAdapter.Fill(dataTable);
            sqlConnection.Close();
            return dataTable;
        }
             
        public static DataTable ConsultaReconstitucion(string rut_cli, string nrooperacion, string estado, string fremesa, string Responsable, string Conservador, string nombrecliente, string subproducto, string Producto)
        {
            #region 
            if (string.IsNullOrEmpty(rut_cli))
            {
                rut_cli = null;
            }
            if (string.IsNullOrEmpty(nrooperacion))
            {
                nrooperacion = null;
            }
            if (string.IsNullOrEmpty(estado))
            {
                estado = null;
            }
            if (string.IsNullOrEmpty(fremesa))
            {
                fremesa = null;
            }
            if (string.IsNullOrEmpty(subproducto))
            {
                subproducto = null;
            }
            if (string.IsNullOrEmpty(nombrecliente))
            {
                nombrecliente = null;
            }
            if (estado == "Seleccione")
            {
                estado = null;
            }
            if (Responsable == "Seleccione")
            {
                Responsable = null;
            }
            if (string.IsNullOrEmpty(Conservador))
            {
                Conservador = null;
            }
            if (Producto == "Seleccione")
            {
                Producto = null;
            }
#endregion
            SqlConnection sqlConnection = new SqlConnection(ConfigurationSettings.AppSettings["CONN"].ToString());
            SqlCommand sqlCommand = new SqlCommand("SP_sel_Reconstitucion", sqlConnection);
            sqlCommand.CommandType = CommandType.StoredProcedure;
            sqlCommand.Parameters.Clear();
            sqlCommand.Parameters.Add("@rutcliente", SqlDbType.VarChar).Value = rut_cli;
            sqlCommand.Parameters.Add("@nrooperacion", SqlDbType.VarChar).Value = nrooperacion;
            sqlCommand.Parameters.Add("@codigoestado", SqlDbType.VarChar).Value = estado;
            sqlCommand.Parameters.Add("@fecha_remesa", SqlDbType.VarChar).Value = fremesa;
            sqlCommand.Parameters.Add("@user_responsable", SqlDbType.VarChar).Value = Responsable;
            sqlCommand.Parameters.Add("@conservador", SqlDbType.VarChar).Value = Conservador;
            sqlCommand.Parameters.Add("@nombrecliente", SqlDbType.VarChar).Value = nombrecliente;
            sqlCommand.Parameters.Add("@subproducto", SqlDbType.VarChar).Value = subproducto;
            sqlCommand.Parameters.Add("@producto", SqlDbType.VarChar).Value = Producto;
            SqlDataAdapter sqlDataAdapter = new SqlDataAdapter(sqlCommand);
            DataTable dataTable = new DataTable();
            sqlDataAdapter.Fill(dataTable);
            sqlConnection.Close();
            return dataTable;
        }
        public static DataTable ConsultaReconstitucionMARCA(string rut_cli, string nrooperacion, string nombrecliente)
        {
            if (string.IsNullOrEmpty(rut_cli))
            {
                rut_cli = null;
            }
            if (string.IsNullOrEmpty(nrooperacion))
            {
                nrooperacion = null;
            }
            if (string.IsNullOrEmpty(nombrecliente))
            {
                nombrecliente = null;
            }
            SqlConnection sqlConnection = new SqlConnection(ConfigurationSettings.AppSettings["CONN"].ToString());
            SqlCommand sqlCommand = new SqlCommand("SP_sel_ReconstitucionMARCA", sqlConnection);
            sqlCommand.CommandType = CommandType.StoredProcedure;
            sqlCommand.Parameters.Add("@rutcliente", SqlDbType.VarChar).Value = rut_cli;
            sqlCommand.Parameters.Add("@nrooperacion", SqlDbType.VarChar).Value = nrooperacion;
            sqlCommand.Parameters.Add("@nombrecliente", SqlDbType.VarChar).Value = nombrecliente;
            SqlDataAdapter sqlDataAdapter = new SqlDataAdapter(sqlCommand);
            DataTable dataTable = new DataTable();
            sqlDataAdapter.Fill(dataTable);
            sqlConnection.Close();
            return dataTable;
        }
        public static DataTable ConsultaReconstitucionSinAsignar(string rut_cli, string nrooperacion, string fremesa)
        {
            if (string.IsNullOrEmpty(rut_cli))
            {
                rut_cli = null;
            }
            if (string.IsNullOrEmpty(nrooperacion))
            {
                nrooperacion = null;
            }
            if (string.IsNullOrEmpty(fremesa))
            {
                fremesa = null;
            }
            SqlConnection sqlConnection = new SqlConnection(ConfigurationSettings.AppSettings["CONN"].ToString());
            SqlCommand sqlCommand = new SqlCommand("SP_sel_Reconstitucion_SinAsignar", sqlConnection);
            sqlCommand.CommandType = CommandType.StoredProcedure;
            sqlCommand.Parameters.Add("@rutcliente", SqlDbType.VarChar).Value = rut_cli;
            sqlCommand.Parameters.Add("@nrooperacion", SqlDbType.VarChar).Value = nrooperacion;
            sqlCommand.Parameters.Add("@fecha_remesa", SqlDbType.VarChar).Value = fremesa;
            SqlDataAdapter sqlDataAdapter = new SqlDataAdapter(sqlCommand);
            DataTable dataTable = new DataTable();
            sqlDataAdapter.Fill(dataTable);
            sqlConnection.Close();
            return dataTable;
        }
        public static DataTable ConsultaReconstitucionGastos(string id_tipo_gasto, string rutcliente, string nrooperacion, string finicio, string ffin, string remesa, string nombrecliente)
        {
            if (string.IsNullOrEmpty(id_tipo_gasto))
            {
                id_tipo_gasto = null;
            }
            if (id_tipo_gasto == "Seleccione")
            {
                id_tipo_gasto = null;
            }
            if (string.IsNullOrEmpty(nombrecliente))
            {
                nombrecliente = null;
            }
            if (string.IsNullOrEmpty(remesa))
            {
                remesa = null;
            }
            if (string.IsNullOrEmpty(rutcliente))
            {
                rutcliente = null;
            }
            if (string.IsNullOrEmpty(nrooperacion))
            {
                nrooperacion = null;
            }
            if (string.IsNullOrEmpty(finicio))
            {
                finicio = null;
            }
            if (string.IsNullOrEmpty(ffin))
            {
                ffin = null;
            }
            SqlConnection sqlConnection = new SqlConnection(ConfigurationSettings.AppSettings["CONN"].ToString());
            SqlCommand sqlCommand = new SqlCommand("SP_sel_Reconstitucion_Gastos", sqlConnection);
            sqlCommand.CommandType = CommandType.StoredProcedure;
            sqlCommand.Parameters.Add("@id_tipo_gasto", SqlDbType.Decimal).Value = id_tipo_gasto;
            sqlCommand.Parameters.Add("@rut_cliente", SqlDbType.VarChar).Value = rutcliente;
            sqlCommand.Parameters.Add("@nrooperacion", SqlDbType.VarChar).Value = nrooperacion;
            sqlCommand.Parameters.Add("@FECHA_INICIO", SqlDbType.VarChar).Value = finicio;
            sqlCommand.Parameters.Add("@FECHA_FIN", SqlDbType.VarChar).Value = ffin;
            sqlCommand.Parameters.Add("@remesa", SqlDbType.Decimal).Value = remesa;
            sqlCommand.Parameters.Add("@nombrecliente", SqlDbType.VarChar).Value = nombrecliente;
            SqlDataAdapter sqlDataAdapter = new SqlDataAdapter(sqlCommand);
            DataTable dataTable = new DataTable();
            sqlDataAdapter.Fill(dataTable);
            sqlConnection.Close();
            return dataTable;
        }
        public static DataTable ConsultaReconstitucionEnProceso(string rut_cli, string nrooperacion, string fremesa)
        {
            if (string.IsNullOrEmpty(rut_cli))
            {
                rut_cli = null;
            }
            if (string.IsNullOrEmpty(nrooperacion))
            {
                nrooperacion = null;
            }
            if (string.IsNullOrEmpty(fremesa))
            {
                fremesa = null;
            }
            SqlConnection sqlConnection = new SqlConnection(ConfigurationSettings.AppSettings["CONN"].ToString());
            SqlCommand sqlCommand = new SqlCommand("SP_sel_Reconstitucion_EnProceso", sqlConnection);
            sqlCommand.CommandType = CommandType.StoredProcedure;
            sqlCommand.Parameters.Add("@rutcliente", SqlDbType.VarChar).Value = rut_cli;
            sqlCommand.Parameters.Add("@nrooperacion", SqlDbType.VarChar).Value = nrooperacion;
            sqlCommand.Parameters.Add("@fecha_remesa", SqlDbType.VarChar).Value = fremesa;
            SqlDataAdapter sqlDataAdapter = new SqlDataAdapter(sqlCommand);
            DataTable dataTable = new DataTable();
            sqlDataAdapter.Fill(dataTable);
            sqlConnection.Close();
            return dataTable;
        }
        public static DataTable ConsultaTablero(string rut_cli, string rut_deudor, string id_tribunal, string cob_tipo, string id_producto, string tipocobranza, string rut_procurador, string nrooperacion, string abogado)
        {
            if (string.IsNullOrEmpty(rut_cli))
            {
                rut_cli = null;
            }
            if (string.IsNullOrEmpty(rut_deudor))
            {
                rut_deudor = null;
            }
            if (string.IsNullOrEmpty(rut_procurador))
            {
                rut_procurador = null;
            }
            if (id_tribunal == "Seleccione")
            {
                id_tribunal = null;
            }
            if (cob_tipo == "Seleccione")
            {
                cob_tipo = null;
            }
            if (id_producto == "Seleccione")
            {
                id_producto = null;
            }
            if (tipocobranza == "Seleccione")
            {
                tipocobranza = null;
            }
            if (abogado == "Seleccione")
            {
                abogado = null;
            }
            if (string.IsNullOrEmpty(id_tribunal))
            {
                id_tribunal = null;
            }
            else
            {
                Convert.ToInt64(id_tribunal);
            }
            if (string.IsNullOrEmpty(id_producto))
            {
                id_producto = null;
            }
            else
            {
                Convert.ToInt64(id_producto);
            }
            if (string.IsNullOrEmpty(nrooperacion))
            {
                nrooperacion = null;
            }
            SqlConnection sqlConnection = new SqlConnection(ConfigurationSettings.AppSettings["CONN"].ToString());
            SqlCommand sqlCommand = new SqlCommand("spALC_Tablero", sqlConnection);
            sqlCommand.CommandType = CommandType.StoredProcedure;
            sqlCommand.Parameters.Add("@rut_cli", SqlDbType.VarChar).Value = rut_cli;
            sqlCommand.Parameters.Add("@rut_deudor", SqlDbType.VarChar).Value = rut_deudor;
            sqlCommand.Parameters.Add("@id_tribunal", SqlDbType.Int).Value = id_tribunal;
            sqlCommand.Parameters.Add("@cob_tipo", SqlDbType.Char).Value = cob_tipo;
            sqlCommand.Parameters.Add("@id_producto", SqlDbType.Int).Value = id_producto;
            sqlCommand.Parameters.Add("@tipocobranza", SqlDbType.Char).Value = tipocobranza;
            sqlCommand.Parameters.Add("@rut_procurador", SqlDbType.VarChar).Value = rut_procurador;
            sqlCommand.Parameters.Add("@nrooperacion", SqlDbType.VarChar).Value = nrooperacion;
            sqlCommand.Parameters.Add("@rut_abogado", SqlDbType.VarChar).Value = abogado;
            SqlDataAdapter sqlDataAdapter = new SqlDataAdapter(sqlCommand);
            DataTable dataTable = new DataTable();
            sqlDataAdapter.Fill(dataTable);
            sqlConnection.Close();
            return dataTable;
        }

        public static DataTable ConsultaTableroDOS(
            string rut_cli,
            string rut_deudor,
            string nrooperacion,
            string idProducto,
            string rut_abogado,
            string rut_procurador,
            string id_tribunal,
            string estado,
            string id_tramite,
            int id_remesa,
            bool conJuicio,
            int actividadEnGestion
        )
        {
            if (rut_cli == "Seleccione") rut_cli = null;
            if (rut_deudor == "Seleccione") rut_deudor = null;

            if (idProducto == "Seleccione") idProducto = null;
            if (id_tramite == "Seleccione") id_tramite = null;
            if (rut_abogado == "Seleccione") rut_abogado = null;
            if (rut_procurador == "Seleccione") rut_procurador = null;
            if (id_tribunal == "Seleccione") id_tribunal = null;
            if (estado == "Seleccione") estado = null;

            DataTable dataTable = new DataTable();

            using (SqlConnection sqlConnection = new SqlConnection(ConfigurationManager.AppSettings["CONN"].ToString()))
            {
                SqlCommand sqlCommand = new SqlCommand("spALC_TableroDOS", sqlConnection);
                sqlCommand.CommandType = CommandType.StoredProcedure;

                sqlCommand.Parameters.Add("@rut_cli", SqlDbType.VarChar).Value = rut_cli;
                sqlCommand.Parameters.Add("@rut_deudor", SqlDbType.VarChar).Value = rut_deudor;
                sqlCommand.Parameters.Add("@nrooperacion", SqlDbType.VarChar).Value = nrooperacion;
                sqlCommand.Parameters.Add("@idProducto", SqlDbType.Int).Value = idProducto;
                sqlCommand.Parameters.Add("@rut_abogado", SqlDbType.VarChar).Value = rut_abogado;
                sqlCommand.Parameters.Add("@rut_procurador", SqlDbType.VarChar).Value = rut_procurador;
                sqlCommand.Parameters.Add("@id_tribunal", SqlDbType.Int).Value = id_tribunal;
                sqlCommand.Parameters.Add("@estado", SqlDbType.VarChar).Value = estado;
                sqlCommand.Parameters.Add("@id_tramite", SqlDbType.Int).Value = id_tramite;
                sqlCommand.Parameters.Add("@id_remesa", SqlDbType.Int).Value = id_remesa;
                sqlCommand.Parameters.Add("@con_juicio", SqlDbType.Bit).Value = conJuicio;
                sqlCommand.Parameters.Add("@con_gestion", SqlDbType.Int).Value = actividadEnGestion;

                SqlDataAdapter sqlDataAdapter = new SqlDataAdapter(sqlCommand);

                sqlDataAdapter.Fill(dataTable);
                sqlConnection.Close();
            }

            return dataTable;
        }
        
        public static DataTable Consulta_Juicios_DOS(string id_cobranza)
        {
            if (string.IsNullOrEmpty(id_cobranza))
            {
                id_cobranza = "0";
            }
            SqlConnection sqlConnection = new SqlConnection(ConfigurationSettings.AppSettings["CONN"].ToString());
            SqlCommand sqlCommand = new SqlCommand("spALC_ConsultaDOS", sqlConnection);
            sqlCommand.CommandType = CommandType.StoredProcedure;
            sqlCommand.Parameters.Add("@id_cobranza", SqlDbType.Int).Value = Convert.ToInt64(id_cobranza);
            SqlDataAdapter sqlDataAdapter = new SqlDataAdapter(sqlCommand);
            DataTable dataTable = new DataTable();
            sqlDataAdapter.Fill(dataTable);
            sqlConnection.Close();
            return dataTable;
        }
        public static DataTable ConsultaEspAbonos(string rut_cli, string tipocomprobante, string finicio, string ffin)
        {
            if (string.IsNullOrEmpty(tipocomprobante))
            {
                tipocomprobante = null;
            }
            if (string.IsNullOrEmpty(rut_cli))
            {
                rut_cli = null;
            }
            if (string.IsNullOrEmpty(finicio))
            {
                finicio = null;
            }
            else
            {
                finicio = finicio.Replace("-", "/");
            }
            if (string.IsNullOrEmpty(ffin))
            {
                ffin = null;
            }
            else
            {
                ffin = ffin.Replace("-", "/");
            }
            SqlConnection sqlConnection = new SqlConnection(ConfigurationSettings.AppSettings["CONN"].ToString());
            SqlCommand sqlCommand = new SqlCommand("SP_ConsultaAbonos", sqlConnection);
            sqlCommand.CommandType = CommandType.StoredProcedure;
            sqlCommand.Parameters.Add("@rut_cli", SqlDbType.VarChar).Value = rut_cli;
            sqlCommand.Parameters.Add("@TipoComprobante", SqlDbType.VarChar).Value = tipocomprobante;
            sqlCommand.Parameters.Add("@fechaini", SqlDbType.VarChar).Value = finicio;
            sqlCommand.Parameters.Add("@fechafin", SqlDbType.VarChar).Value = ffin;
            SqlDataAdapter sqlDataAdapter = new SqlDataAdapter(sqlCommand);
            DataTable dataTable = new DataTable();
            sqlDataAdapter.Fill(dataTable);
            sqlConnection.Close();
            return dataTable;
        }
        public static DataTable ConsultaProcesar(string id_cobranza, string tipointeres, string tipomoneda, string fechapago)
        {
            SqlConnection sqlConnection = new SqlConnection(ConfigurationSettings.AppSettings["CONN"].ToString());
            SqlCommand sqlCommand = new SqlCommand("SP_Procesar", sqlConnection);
            sqlCommand.CommandType = CommandType.StoredProcedure;
            sqlCommand.Parameters.Add("@id_cobranza", SqlDbType.Int).Value = Convert.ToInt64(id_cobranza);
            sqlCommand.Parameters.Add("@tipointeres", SqlDbType.Int).Value = null;
            sqlCommand.Parameters.Add("@tipomoneda", SqlDbType.Int).Value = null;
            sqlCommand.Parameters.Add("@fechapago", SqlDbType.VarChar).Value = null;
            SqlDataAdapter sqlDataAdapter = new SqlDataAdapter(sqlCommand);
            DataTable dataTable = new DataTable();
            sqlDataAdapter.Fill(dataTable);
            sqlConnection.Close();
            return dataTable;
        }
        public static DataTable ConsultaCalculoInteres(string TipoTasa, string TipoMoneda, string TotalCapital, string fVencimiento, string Fpago)
        {
            if (string.IsNullOrEmpty(fVencimiento))
            {
                fVencimiento = null;
            }
            if (string.IsNullOrEmpty(Fpago))
            {
                Fpago = null;
            }
            SqlConnection sqlConnection = new SqlConnection(ConfigurationSettings.AppSettings["CONN"].ToString());
            SqlCommand sqlCommand = new SqlCommand("SP_CALCULO_INTERES", sqlConnection);
            sqlCommand.CommandType = CommandType.StoredProcedure;
            sqlCommand.Parameters.Add("@TipoTasa", SqlDbType.Char).Value = TipoTasa;
            sqlCommand.Parameters.Add("@TipoMoneda", SqlDbType.Int).Value = Convert.ToInt64(TipoMoneda);
            sqlCommand.Parameters.Add("@TotalCapital", SqlDbType.Float).Value = Convert.ToDouble(TotalCapital);
            sqlCommand.Parameters.Add("@FVencimiento", SqlDbType.VarChar).Value = fVencimiento;
            sqlCommand.Parameters.Add("@FPago", SqlDbType.VarChar).Value = Fpago;
            SqlDataAdapter sqlDataAdapter = new SqlDataAdapter(sqlCommand);
            DataTable dataTable = new DataTable();
            sqlDataAdapter.Fill(dataTable);
            sqlConnection.Close();
            return dataTable;
        }
        public static DataTable TraeGastos(string id_cobranza)
        {
            if (string.IsNullOrEmpty(id_cobranza))
            {
                id_cobranza = "0";
            }
            SqlConnection sqlConnection = new SqlConnection(ConfigurationSettings.AppSettings["CONN"].ToString());
            SqlCommand sqlCommand = new SqlCommand("SP_Gastos", sqlConnection);
            sqlCommand.CommandType = CommandType.StoredProcedure;
            sqlCommand.Parameters.Add("@id_cobranza", SqlDbType.Int).Value = Convert.ToInt64(id_cobranza);
            SqlDataAdapter sqlDataAdapter = new SqlDataAdapter(sqlCommand);
            DataTable dataTable = new DataTable();
            sqlDataAdapter.Fill(dataTable);
            sqlConnection.Close();
            return dataTable;
        }
        public static DataTable ConsultaDocumentosPorTipo(string id_cobranza, string TipoTasa, string tipomoneda, string fechapago)
        {
            if (string.IsNullOrEmpty(fechapago))
            {
                fechapago = null;
            }
            SqlConnection sqlConnection = new SqlConnection(ConfigurationSettings.AppSettings["CONN"].ToString());
            SqlCommand sqlCommand = new SqlCommand("SP_ProcesarPagos", sqlConnection);
            sqlCommand.CommandType = CommandType.StoredProcedure;
            sqlCommand.Parameters.Add("@id_cobranza", SqlDbType.Int).Value = Convert.ToInt64(id_cobranza);
            sqlCommand.Parameters.Add("@TipoTasa", SqlDbType.Char).Value = TipoTasa;
            sqlCommand.Parameters.Add("@tipomoneda", SqlDbType.Int).Value = Convert.ToInt64(tipomoneda);
            sqlCommand.Parameters.Add("@fechapago", SqlDbType.VarChar).Value = fechapago;
            SqlDataAdapter sqlDataAdapter = new SqlDataAdapter(sqlCommand);
            DataTable dataTable = new DataTable();
            sqlDataAdapter.Fill(dataTable);
            sqlConnection.Close();
            return dataTable;
        }
        public static DataTable ConsultaDocumentosPorTipoJuicio(string id_cobranza, string TipoTasa, string tipomoneda, string fechapago)
        {
            if (string.IsNullOrEmpty(fechapago))
            {
                fechapago = null;
            }
            SqlConnection sqlConnection = new SqlConnection(ConfigurationSettings.AppSettings["CONN"].ToString());
            SqlCommand sqlCommand = new SqlCommand("SP_ProcesarPagosJuicio", sqlConnection);
            sqlCommand.CommandType = CommandType.StoredProcedure;
            sqlCommand.Parameters.Add("@id_cobranza", SqlDbType.Int).Value = Convert.ToInt64(id_cobranza);
            sqlCommand.Parameters.Add("@TipoTasa", SqlDbType.Char).Value = TipoTasa;
            sqlCommand.Parameters.Add("@tipomoneda", SqlDbType.Int).Value = Convert.ToInt64(tipomoneda);
            sqlCommand.Parameters.Add("@fechapago", SqlDbType.VarChar).Value = fechapago;
            SqlDataAdapter sqlDataAdapter = new SqlDataAdapter(sqlCommand);
            DataTable dataTable = new DataTable();
            sqlDataAdapter.Fill(dataTable);
            sqlConnection.Close();
            return dataTable;
        }
        public static DataTable ConsultaJuicio(string Rol, string RutDeudor, string NroOperacion)
        {
            BaseDatos baseDatos = new BaseDatos();
            StringBuilder stringBuilder = new StringBuilder();
            stringBuilder.Append(" SELECT cob.id_producto,cob.tipo,cob.id_cobranza,jui.id_juicios,jui.rol,cob.nrooperacion operacion,cob.rut_deudor,jui.rut_abogado,jui.rut_procurador,convert(varchar(10),jui.fingresocorte,103) fingcorte, TRI.descripcion AS NombreTribunal ");
            stringBuilder.Append(" FROM cobranza cob  INNER JOIN juicios jui  ON cob.id_cobranza = jui.id_cobranza INNER JOIN Tribunal TRI ON JUI.id_tribunal = TRI.id_tribunal ");
            stringBuilder.Append(" WHERE 1 = 1");
            if (!string.IsNullOrEmpty(Rol))
            {
                stringBuilder.Append(" AND rtrim(ltrim(jui.rol)) = '" + Rol.Trim() + "'");
            }
            if (!string.IsNullOrEmpty(RutDeudor))
            {
                stringBuilder.Append(" AND rtrim(ltrim(cob.rut_deudor)) = '" + RutDeudor.Replace(".", "").Trim() + "'");
            }
            if (!string.IsNullOrEmpty(NroOperacion))
            {
                stringBuilder.Append(" AND cob.nrooperacion = '" + NroOperacion + "'");
            }
            return baseDatos.getResultset(stringBuilder.ToString());
        }
        public static DataTable ConsultaGastoGeneral(string Rol, string RutDeudor, string NroOperacion)
        {
            BaseDatos baseDatos = new BaseDatos();
            StringBuilder stringBuilder = new StringBuilder();
            stringBuilder.Append(" SELECT cob.id_producto,cob.tipo,cob.id_cobranza,jui.id_juicios,jui.rol,cob.nrooperacion operacion,cob.rut_deudor,jui.rut_abogado,jui.rut_procurador,convert(varchar(10),jui.fingresocorte,103) fingcorte ");
            stringBuilder.Append(" FROM cobranza cob  LEFT JOIN juicios jui");
            stringBuilder.Append(" ON cob.id_cobranza = jui.id_cobranza");
            stringBuilder.Append(" WHERE 1 = 1 ");
            if (!string.IsNullOrEmpty(Rol))
            {
                stringBuilder.Append(" AND rtrim(ltrim(jui.rol)) = '" + Rol.Trim() + "'");
            }
            if (!string.IsNullOrEmpty(RutDeudor))
            {
                stringBuilder.Append(" AND rtrim(ltrim(cob.rut_deudor)) = '" + RutDeudor.Replace(".", "").Trim() + "'");
            }
            if (!string.IsNullOrEmpty(NroOperacion))
            {
                stringBuilder.Append(" AND cob.nrooperacion = '" + NroOperacion + "'");
            }
            return baseDatos.getResultset(stringBuilder.ToString());
        }
        public static DataTable ConsultaAbonoGeneral(string Rol, string RutDeudor, string NroOperacion)
        {
            BaseDatos baseDatos = new BaseDatos();
            StringBuilder stringBuilder = new StringBuilder();
            stringBuilder.Append(" SELECT cob.id_producto,cob.tipo,cob.id_cobranza,jui.id_juicios,jui.rol,cob.nrooperacion operacion,cob.rut_deudor,jui.rut_abogado,jui.rut_procurador,convert(varchar(10),jui.fingresocorte,103) fingcorte ");
            stringBuilder.Append(" FROM cobranza cob  LEFT JOIN juicios jui");
            stringBuilder.Append(" ON cob.id_cobranza = jui.id_cobranza");
            stringBuilder.Append(" WHERE 1 = 1 ");
            if (!string.IsNullOrEmpty(Rol))
            {
                stringBuilder.Append(" AND rtrim(ltrim(jui.rol)) = '" + Rol.Trim() + "'");
            }
            if (!string.IsNullOrEmpty(RutDeudor))
            {
                stringBuilder.Append(" AND rtrim(ltrim(cob.rut_deudor)) = '" + RutDeudor.Replace(".", "").Trim() + "'");
            }
            if (!string.IsNullOrEmpty(NroOperacion))
            {
                stringBuilder.Append(" AND cob.nrooperacion = '" + NroOperacion + "'");
            }
            return baseDatos.getResultset(stringBuilder.ToString());
        }
        public static DataTable ConsultaPrendaGeneral(string Rol, string RutDeudor, string NroOperacion)
        {
            BaseDatos baseDatos = new BaseDatos();
            StringBuilder stringBuilder = new StringBuilder();
            stringBuilder.Append(" SELECT cob.id_producto,cob.tipo,cob.id_cobranza,jui.id_juicios,jui.rol,cob.nrooperacion operacion,cob.rut_deudor,jui.rut_abogado,jui.rut_procurador,convert(varchar(10),jui.fingresocorte,103) fingcorte ");
            stringBuilder.Append(" FROM cobranza cob  LEFT JOIN juicios jui");
            stringBuilder.Append(" ON cob.id_cobranza = jui.id_cobranza");
            stringBuilder.Append(" WHERE 1 = 1");
            if (!string.IsNullOrEmpty(Rol))
            {
                stringBuilder.Append(" AND rtrim(ltrim(jui.rol)) = '" + Rol.Trim() + "'");
            }
            if (!string.IsNullOrEmpty(RutDeudor))
            {
                stringBuilder.Append(" AND rtrim(ltrim(cob.rut_deudor)) = '" + RutDeudor.Replace(".", "").Trim() + "'");
            }
            if (!string.IsNullOrEmpty(NroOperacion))
            {
                stringBuilder.Append(" AND cob.nrooperacion = '" + NroOperacion + "'");
            }
            return baseDatos.getResultset(stringBuilder.ToString());
        }
        public static DataTable ConsultaLiquidacionGeneral(string Rol, string RutDeudor, string NroOperacion)
        {
            BaseDatos baseDatos = new BaseDatos();
            StringBuilder stringBuilder = new StringBuilder();
            stringBuilder.Append(" SELECT cob.id_producto,cob.tipo,cob.id_cobranza,jui.id_juicios,jui.rol,cob.nrooperacion operacion,cob.rut_deudor,jui.rut_abogado,jui.rut_procurador,convert(varchar(10),jui.fingresocorte,103) fingcorte ");
            stringBuilder.Append(" FROM cobranza cob  LEFT JOIN juicios jui");
            stringBuilder.Append(" ON cob.id_cobranza = jui.id_cobranza");
            stringBuilder.Append(" WHERE 1 = 1");
            if (!string.IsNullOrEmpty(Rol))
            {
                stringBuilder.Append(" AND rtrim(ltrim(jui.rol)) = '" + Rol.Trim() + "'");
            }
            if (!string.IsNullOrEmpty(RutDeudor))
            {
                stringBuilder.Append(" AND rtrim(ltrim(cob.rut_deudor)) = '" + RutDeudor.Replace(".", "").Trim() + "'");
            }
            if (!string.IsNullOrEmpty(NroOperacion))
            {
                stringBuilder.Append(" AND cob.nrooperacion = '" + NroOperacion + "'");
            }
            return baseDatos.getResultset(stringBuilder.ToString());
        }
        public static DataTable ConsultaExhorto(string Rol, string RutDeudor, string NroOperacion)
        {
            BaseDatos baseDatos = new BaseDatos();
            StringBuilder stringBuilder = new StringBuilder();
            stringBuilder.Append(" SELECT exh.tipo tipoexh,exh.id_exhorto,cob.tipo,cob.id_cobranza,jui.id_juicios,exh.rol_exhorto rolexhorto,cob.nrooperacion operacion,cob.rut_deudor,convert(varchar(10),exh.fechaingreso,103) fingexh,  ");
            stringBuilder.Append(" (select top 1 tri.descripcion from tribunal tri where tri.id_tribunal = exh.id_tribunal ) tribunal ");
            stringBuilder.Append(" FROM cobranza cob ");
            stringBuilder.Append(" INNER JOIN juicios jui ON cob.id_cobranza = jui.id_cobranza ");
            stringBuilder.Append(" INNER JOIN exhorto exh ON jui.id_juicios = exh.id_juicios");
            stringBuilder.Append(" WHERE 1 = 1");
            if (!string.IsNullOrEmpty(Rol))
            {
                stringBuilder.Append(" AND rtrim(ltrim(exh.rol_exhorto)) = '" + Rol.Trim() + "'");
            }
            if (!string.IsNullOrEmpty(RutDeudor))
            {
                stringBuilder.Append(" AND rtrim(ltrim(cob.rut_deudor)) = '" + RutDeudor.Replace(".", "").Trim() + "'");
            }
            if (!string.IsNullOrEmpty(NroOperacion))
            {
                stringBuilder.Append(" AND cob.nrooperacion = '" + NroOperacion + "'");
            }
            return baseDatos.getResultset(stringBuilder.ToString());
        }
        public static DataTable MostrarDatosJuicio(string id_cobranza)
        {
            BaseDatos baseDatos = new BaseDatos();
            StringBuilder stringBuilder = new StringBuilder();
            if (string.IsNullOrEmpty(id_cobranza))
            {
                id_cobranza = "0";
            }
            stringBuilder.Append(" SELECT cob.tipo,cob.nrooperacion,cli.rsocial cliente,deu.rsocial deudor,cob.rut_deudor,cob.rut_cli, ");
            stringBuilder.Append("       (select top 1 pro.descripcion  from procedimiento pro where pro.id_procedimiento = cob.id_procedimiento) procedimiento, ");
            stringBuilder.Append("       (select top 1 mat.descripcion  from materia mat where mat.id_materia = cob.id_materia ) materia, ");
            stringBuilder.Append("       (select top 1 prod.descripcion from producto prod where prod.id_producto = cob.id_producto ) producto ");
            stringBuilder.Append("  FROM cobranza cob  ");
            stringBuilder.Append(" INNER JOIN deudores deu ");
            stringBuilder.Append("    ON cob.rut_deudor = deu.rut_deudor ");
            stringBuilder.Append(" INNER JOIN clientes cli ");
            stringBuilder.Append("   ON  cob.rut_cli = cli.rut_cli ");
            stringBuilder.Append(" WHERE cob.id_cobranza = " + Convert.ToInt64(id_cobranza));
            return baseDatos.getResultset(stringBuilder.ToString());
        }

        public static DataTable MostrarDatJuicios(string id_cobranza)
        {
            BaseDatos baseDatos = new BaseDatos();
            if (string.IsNullOrEmpty(id_cobranza)) id_cobranza = "0";
            return baseDatos.getResultset(string.Format("EXEC [dbo].[SPALC_JUICIOS_BUSCAR] {0}", id_cobranza));
        }

        public static DataTable MostrarDatosJuicioActividad(string id_juicio)
        {
            BaseDatos baseDatos = new BaseDatos();
            StringBuilder stringBuilder = new StringBuilder();
            if (string.IsNullOrEmpty(id_juicio))
            {
                id_juicio = "0";
            }
            stringBuilder.Append(" SELECT cob.nrooperacion,cob.rut_deudor,jui.rol,convert(varchar(10),jui.fingresocorte,103) fingcorte,jui.id_tribunal, ");
            stringBuilder.Append("        (select top 1 pro.descripcion from Procedimiento pro where cob.id_procedimiento = pro.id_procedimiento) Procedimiento,");
            stringBuilder.Append("        (select top 1 mat.descripcion from materia mat where cob.id_materia = mat.id_materia) materia,");
            stringBuilder.Append("        (select top 1 pro.descripcion from producto pro where cob.id_producto = pro.id_producto) Producto,");
            stringBuilder.Append("     (select top 1 cli.rsocial from clientes cli  where cli.rut_cli = cob.rut_cli) nomcliente, ");
            stringBuilder.Append("     (select top 1 deu.rsocial from deudores deu where deu.rut_deudor = cob.rut_deudor) nomdeudor, ");
            stringBuilder.Append("     (select top 1 tri.descripcion from tribunal tri where tri.id_tribunal = jui.id_tribunal) tribunal ");
            stringBuilder.Append(" FROM cobranza cob  ");
            stringBuilder.Append(" INNER JOIN juicios jui  ");
            stringBuilder.Append(" ON cob.id_cobranza = jui.id_cobranza ");
            stringBuilder.Append(" WHERE jui.id_juicios  = " + Convert.ToInt64(id_juicio));
            return baseDatos.getResultset(stringBuilder.ToString());
        }
        public static DataTable MostrarDesglose(string id_abono)
        {
            BaseDatos baseDatos = new BaseDatos();
            StringBuilder stringBuilder = new StringBuilder();
            if (string.IsNullOrEmpty(id_abono))
            {
                id_abono = "0";
            }
            stringBuilder.Append(" select * from dbo.Desglose");
            stringBuilder.Append(" WHERE id_abono = " + Convert.ToInt64(id_abono));
            return baseDatos.getResultset(stringBuilder.ToString());
        }
        public static DataTable MostrarRendicion(string id_rendicion)
        {
            BaseDatos baseDatos = new BaseDatos();
            StringBuilder stringBuilder = new StringBuilder();
            if (string.IsNullOrEmpty(id_rendicion))
            {
                id_rendicion = "0";
            }
            stringBuilder.Append(" select id_rendicion, id_abono, id_cobranza, monto, convert(varchar(10),fproceso,103)fproceso, username");
            stringBuilder.Append(" from Rendiciones WHERE id_rendicion = " + Convert.ToInt64(id_rendicion));
            return baseDatos.getResultset(stringBuilder.ToString());
        }
        public static DataTable MostrarYaRendidas(string id_abono, string id_cobranza)
        {
            BaseDatos baseDatos = new BaseDatos();
            StringBuilder stringBuilder = new StringBuilder();
            if (string.IsNullOrEmpty(id_abono))
            {
                id_abono = "0";
            }
            if (string.IsNullOrEmpty(id_cobranza))
            {
                id_cobranza = "0";
            }
            stringBuilder.Append(" select swInteres, swint_adic, swhonorarios, swdesc_honorarios, swdesc_interes, swOtros_desc, swmonto, swgasto");
            stringBuilder.Append("   from abonos");
            stringBuilder.Append(string.Concat(new object[]
			{
				"  where id_abono = ",
				Convert.ToInt64(id_abono),
				"  and id_cobranza = ",
				Convert.ToInt64(id_cobranza)
			}));
            return baseDatos.getResultset(stringBuilder.ToString());
        }
        public static DataTable DetalleResumenCliente(string rut_cli, string fechadesde, string fechahasta)
        {
            BaseDatos baseDatos = new BaseDatos();
            StringBuilder stringBuilder = new StringBuilder();
            stringBuilder.Append(" select  abo.id_abono,cob.id_cobranza,");
            stringBuilder.Append("         case abo.rendicion when 'S' then 'Si' else 'No' end rendicion, ");
            stringBuilder.Append("         cob.nrooperacion,");
            stringBuilder.Append("         cob.rut_cli,");
            stringBuilder.Append("         (select  top 1 cli.rsocial from clientes cli where cob.rut_cli = cli.rut_cli)nomcliente,");
            stringBuilder.Append("         cob.rut_deudor,");
            stringBuilder.Append("         (select  top 1 deu.rsocial from deudores deu where cob.rut_deudor = deu.rut_deudor)nomdeudor,");
            stringBuilder.Append("         abo.id_abono nrocomprobante,");
            stringBuilder.Append("         convert(varchar(10),abo.fabono,103)fechaabono,");
            stringBuilder.Append("         abo.montoabono,");
            stringBuilder.Append("         (select top 1 cab.descripcion    from conceptoabono cab where abo.id_concepto = cab.id_concepto) concepto,");
            stringBuilder.Append("         (select top 1 tm.descripcion from TipoMoneda tm where abo.id_moneda = tm.id_moneda)moneda");
            stringBuilder.Append("   from  abonos abo inner join cobranza cob on cob.id_cobranza = abo.id_cobranza");
            stringBuilder.Append(string.Concat(new string[]
			{
				"  where convert(datetime,convert(varchar(10),abo.fabono,103),103) between convert(datetime,convert(varchar(10),'",
				fechadesde,
				"',103),103) and  convert(datetime,convert(varchar(10),'",
				fechahasta,
				"',103),103) and"
			}));
            stringBuilder.Append("        cob.rut_cli = '" + rut_cli + "'");
            stringBuilder.Append(" order by abo.id_abono");
            return baseDatos.getResultset(stringBuilder.ToString());
        }
        public static DataTable DetalleResumenCliente(string NroOperacion)
        {
            BaseDatos baseDatos = new BaseDatos();
            StringBuilder stringBuilder = new StringBuilder();
            if (string.IsNullOrEmpty(NroOperacion))
            {
                NroOperacion = "0";
            }
            stringBuilder.Append(" select abo.rendicion,abo.id_abono,abo.id_abono,cob.id_cobranza,abo.mch,abo.nrocheque,abo.serie,");
            stringBuilder.Append("         case abo.rendicion when 'S' then 'Si' else 'No' end rendicion, ");
            stringBuilder.Append("         cob.nrooperacion,");
            stringBuilder.Append("         cob.rut_cli,");
            stringBuilder.Append("         (select  top 1 cli.rsocial from clientes cli where cob.rut_cli = cli.rut_cli)nomcliente,");
            stringBuilder.Append("         cob.rut_deudor,");
            stringBuilder.Append("         (select  top 1 deu.rsocial from deudores deu where cob.rut_deudor = deu.rut_deudor)nomdeudor,");
            stringBuilder.Append("         abo.id_abono nrocomprobante,");
            stringBuilder.Append("         convert(varchar(10),abo.fabono,103)fechaabono,");
            stringBuilder.Append("         abo.montoabono,");
            stringBuilder.Append("         (select top 1 cab.descripcion    from conceptoabono cab where abo.id_concepto = cab.id_concepto) concepto,");
            stringBuilder.Append("         (select top 1 tm.descripcion from TipoMoneda tm where abo.id_moneda = tm.id_moneda)moneda");
            stringBuilder.Append("   from  abonos abo inner join cobranza cob on cob.id_cobranza = abo.id_cobranza");
            stringBuilder.Append("  where abo.id_moneda = 5 AND");
            stringBuilder.Append("        cob.nrooperacion = '" + NroOperacion + "'");
            stringBuilder.Append(" order by abo.id_abono");
            return baseDatos.getResultset(stringBuilder.ToString());
        }
        public static DataTable DetalleAbonosCliente(string id_cobranza)
        {
            BaseDatos baseDatos = new BaseDatos();
            StringBuilder stringBuilder = new StringBuilder();
            stringBuilder.Append(" select id_abono,isnull(case convert(varchar(10),fabono,103) when '01/01/1900' then '' else convert(varchar(10),fabono,103) end ,'') fabono,montoabono, isnull(case convert(varchar(10),fpago,103) when '01/01/1900' then '' else convert(varchar(10),fpago,103) end ,'') fpago from abonos  ");
            stringBuilder.Append(" where id_cobranza = " + Convert.ToInt64(id_cobranza));
            return baseDatos.getResultset(stringBuilder.ToString());
        }
        public static DataTable DetalleAbonoschCliente(string id_cobranza)
        {
            BaseDatos baseDatos = new BaseDatos();
            StringBuilder stringBuilder = new StringBuilder();
            stringBuilder.Append(" select id_abono_comprobante,montoabono,isnull(case convert(varchar(10),fpago,103) when '01/01/1900' then '' else convert(varchar(10),fpago,103) end ,'') fpago from abonosmch abonos   ");
            stringBuilder.Append(" where id_cobranza = " + Convert.ToInt64(id_cobranza));
            return baseDatos.getResultset(stringBuilder.ToString());
        }
        public static DataTable ConMostrarDomicilios(string rut_deudor)
        {
            BaseDatos baseDatos = new BaseDatos();
            StringBuilder stringBuilder = new StringBuilder();
            stringBuilder.Append(" select case dom.estado when '1' then 'Vigente' else 'No Vigente' end vigencia,(select top 1 reg.descripcion from regiones reg where reg.id_regiones = dom.id_region)regnom,(select top 1 com.descripcion from comunas com where com.id_comuna = dom.id_comuna)comnom,dom.* from domicilios dom ");
            stringBuilder.Append(" where dom.rut_deudor = '" + rut_deudor + "'");
            return baseDatos.getResultset(stringBuilder.ToString());
        }
        public static DataTable ConMostrarBienRaiz(string rut_deudor)
        {
            BaseDatos baseDatos = new BaseDatos();
            StringBuilder stringBuilder = new StringBuilder();
            stringBuilder.Append(" select br.id_conservador, (select top 1 con.nombre from  conservador con where con.id_conservador = br.id_conservador)conservador,  br.fojas_insc,n_insc,anio_insc  ,br.rut_deudor,br.id_domicilio, (select isnull(dom.calle,'') + ' N° ' + isnull(convert(varchar,dom.numero),'') from domicilios dom where dom.id_domicilio =  br.id_domicilio ) domici,(select top 1 reg.descripcion from regiones reg where reg.id_regiones = domi.id_region)regnom,(select top 1 com.descripcion from comunas com where com.id_comuna = domi.id_comuna )comnom from bienraiz br inner join domicilios domi on domi.id_domicilio = br.id_domicilio  ");
            stringBuilder.Append(" where br.rut_deudor = '" + rut_deudor + "'");
            return baseDatos.getResultset(stringBuilder.ToString());
        }
        //Jbaez: se aplica bienes raices de consulta generales 23-05-2014
        public static DataTable ConMostrarBienRaiz_Consulta_Generales(string RutDeudor)
        {
            BaseDatos baseDatos = new BaseDatos();
            return baseDatos.getResultset("exec SPALC_BUSCAR_CONSERVADOR_BIENES_RAICES '" + (RutDeudor) + "'");
        }

        public static DataTable RendicionDesglose(string id_abono)
        {
            BaseDatos baseDatos = new BaseDatos();
            StringBuilder stringBuilder = new StringBuilder();
            stringBuilder.Append(" select isnull(sum(monto),0)monto,isnull(sum(intereses),0)Intereses,isnull(sum(int_adic),0)int_adic,isnull(sum(honorarios),0)honorarios,isnull(sum(desc_honorarios),0)desc_honorarios,isnull(sum(otros_desc),0)otros_desc,isnull(sum(desc_interes),0)desc_interes,isnull(sum(gastos),0)gastos from desglose    ");
            stringBuilder.Append(" where  id_abono = " + Convert.ToInt64(id_abono));
            return baseDatos.getResultset(stringBuilder.ToString());
        }
        public static DataTable RendicionGastos(string id_cobranza)
        {
            BaseDatos baseDatos = new BaseDatos();
            StringBuilder stringBuilder = new StringBuilder();
            stringBuilder.Append(" select isnull(sum(isnull(montogastoadmin,0)+isnull(montogastojudi,0)+isnull(montogastopre,0)),0)Gastos from gastos ");
            stringBuilder.Append(" where pagado = 'S' and id_cobranza = " + Convert.ToInt64(id_cobranza));
            return baseDatos.getResultset(stringBuilder.ToString());
        }
        public static DataTable DetalleAbonosParcialCliente(string id_cobranza)
        {
            BaseDatos baseDatos = new BaseDatos();
            StringBuilder stringBuilder = new StringBuilder();
            stringBuilder.Append(" select id_abono_comprobante,montoparcial,estado from alcsacl.AbonoParcial ");
            stringBuilder.Append(" where id_cobranza = " + Convert.ToInt64(id_cobranza));
            return baseDatos.getResultset(stringBuilder.ToString());
        }
        public static DataTable DetalleGastosCliente(string id_cobranza)
        {
            BaseDatos baseDatos = new BaseDatos();
            StringBuilder stringBuilder = new StringBuilder();
            stringBuilder.Append(" select montogastoadmin,montogastojudi,montogastopre,nom_responsable from gastos");
            stringBuilder.Append(" where id_cobranza = " + Convert.ToInt64(id_cobranza));
            return baseDatos.getResultset(stringBuilder.ToString());
        }
        public static DataTable EscritoPrejudicial(string rut_deudor)
        {
            BaseDatos baseDatos = new BaseDatos();
            StringBuilder stringBuilder = new StringBuilder();
            stringBuilder.Append(" select  deu.rsocial,dom.calle + ' ' + isnull(convert(varchar,dom.numero),'')  domicilio,");
            stringBuilder.Append("        convert(varchar,dom.id_domicilio) + '|' + (select top 1 com.descripcion from comunas com where  dom.id_comuna = com.id_comuna)comuna");
            stringBuilder.Append(" from deudores deu ");
            stringBuilder.Append(" inner join domicilios dom on deu.rut_deudor = dom.rut_deudor");
            stringBuilder.Append(" where ltrim(rtrim(deu.rut_deudor)) = '" + rut_deudor.Trim().Replace(".", "") + "'");
            return baseDatos.getResultset(stringBuilder.ToString());
        }
        public static DataTable ListaRendiciones(string id_rendicion)
        {
            BaseDatos baseDatos = new BaseDatos();
            StringBuilder stringBuilder = new StringBuilder();
            if (string.IsNullOrEmpty(id_rendicion))
            {
                id_rendicion = "0";
            }
            stringBuilder.Append(" select ren.id_rendicion,ren.monto,convert(varchar(10),ren.fproceso,103)fecha, cob.nrooperacion,cob.rut_cli,");
            stringBuilder.Append("        (select top 1 cli.rsocial from clientes cli where cli.rut_cli = cob.rut_cli) cliente ");
            stringBuilder.Append("   from cobranza cob  inner join rendiciones ren on cob.id_cobranza = ren.id_cobranza");
            stringBuilder.Append("  where ren.id_rendicion = " + Convert.ToInt64(id_rendicion));
            return baseDatos.getResultset(stringBuilder.ToString());
        }
        public static DataTable ListaDOCRendiciones(string id_rendicion)
        {
            BaseDatos baseDatos = new BaseDatos();
            StringBuilder stringBuilder = new StringBuilder();
            if (string.IsNullOrEmpty(id_rendicion))
            {
                id_rendicion = "0";
            }
            stringBuilder.Append(" select doc.id_doc_rendicion, doc.id_rendicion, doc.id_abono, doc.id_cobranza, (select top 1 ban.descripcion from bancos ban where doc.id_banco = ban.id_banco)banco, doc.nrocheque, doc.serie, convert(varchar(10),doc.fcheque,103)fcheque, doc.nroctacte, doc.fproceso, doc.username ");
            stringBuilder.Append("  from doc_rendicion doc");
            stringBuilder.Append("  where doc.id_rendicion =  " + Convert.ToInt64(id_rendicion));
            return baseDatos.getResultset(stringBuilder.ToString());
        }
        public static DataTable EscritoPrejudicialGrilla(string rut_deudor)
        {
            BaseDatos baseDatos = new BaseDatos();
            StringBuilder stringBuilder = new StringBuilder();
            stringBuilder.Append(" select cob.id_cobranza,cob.nrooperacion,");
            stringBuilder.Append(" \t(select top 1 cli.rsocial from clientes cli where cob.rut_cli = cli.rut_cli) cliente,");
            stringBuilder.Append(" \t(select top 1 ppre.descripcion   from productopre ppre where cob.id_producto = ppre.id_producto) producto,");
            stringBuilder.Append(" \tcob.id_producto,cob.tipo");
            stringBuilder.Append(" from cobranza cob ");
            stringBuilder.Append(" where cob.tipocobranza = 'P' and ltrim(rtrim(cob.rut_deudor)) = '" + rut_deudor.Trim().Replace(".", "") + "'");
            return baseDatos.getResultset(stringBuilder.ToString());
        }
        public static DataTable EscritoPrejudicialPrint(string id_cobranza)
        {
            BaseDatos baseDatos = new BaseDatos();
            StringBuilder stringBuilder = new StringBuilder();
            if (string.IsNullOrEmpty(id_cobranza))
            {
                id_cobranza = "0";
            }
            stringBuilder.Append(" select  isnull(case convert(varchar(10),fechavencimiento,103) when '01/01/1900' then '' else convert(varchar(10),fechavencimiento,103) end ,'') fvcto,(select top 1 tdo.descripcion from tipodocumento tdo where cco.id_tipo_docu = tdo.id_tipo_docu) tipodocu,");
            stringBuilder.Append(" cco.nrodocumento,");
            stringBuilder.Append(" cco.montocapital,");
            stringBuilder.Append(" isnull((select top 1 ban.descripcion from bancos ban where cco.id_banco = ban.id_banco),'') banco");
            stringBuilder.Append(" from  cuotacolegio cco");
            stringBuilder.Append(" where  cco.id_cobranza = " + Convert.ToInt64(id_cobranza));
            return baseDatos.getResultset(stringBuilder.ToString());
        }
        public static DataTable MostrarDatosActividadExhorto(string id_exhorto)
        {
            BaseDatos baseDatos = new BaseDatos();
            StringBuilder stringBuilder = new StringBuilder();
            if (string.IsNullOrEmpty(id_exhorto))
            {
                id_exhorto = "0";
            }
            stringBuilder.Append(" SELECT cob.nrooperacion,jui.id_tribunal,");
            stringBuilder.Append("         (select top 1 cli.rsocial from clientes cli  where cli.rut_cli = cob.rut_cli) nomcliente, ");
            stringBuilder.Append("          exh.rol_exhorto,");
            stringBuilder.Append("         (select top 1 tri.descripcion from tribunal tri where tri.id_tribunal = exh.id_tribunal) tribunalexh, ");
            stringBuilder.Append("         (select top 1 deu.rsocial from deudores deu where deu.rut_deudor = cob.rut_deudor) nomdeudor,");
            stringBuilder.Append("          cob.rut_deudor,");
            stringBuilder.Append("          jui.rol,");
            stringBuilder.Append("         (select top 1 tri.descripcion from tribunal tri where tri.id_tribunal = jui.id_tribunal) tribunal,    ");
            stringBuilder.Append("         (select rec.nombres + ' ' + rec.apaterno + ' ' + rec.amaterno  from receptor rec where rec.rut_receptor = exh.rut_receptor)receptor, ");
            stringBuilder.Append("         (select texh.descripcion from tipoexhorto texh where texh.id_tipoexhorto = exh.id_tipoexhorto) tipoexh");
            stringBuilder.Append("    FROM cobranza cob   ");
            stringBuilder.Append("   INNER JOIN juicios jui   ON cob.id_cobranza = jui.id_cobranza ");
            stringBuilder.Append("   INNER JOIN exhorto exh ON jui.id_juicios = exh.id_juicios");
            stringBuilder.Append("   WHERE exh.id_exhorto   = " + Convert.ToInt64(id_exhorto));
            return baseDatos.getResultset(stringBuilder.ToString());
        }
        public static DataTable MostrarDatosActividadCobranza(string id_cobranza)
        {
            BaseDatos baseDatos = new BaseDatos();
            StringBuilder stringBuilder = new StringBuilder();
            if (string.IsNullOrEmpty(id_cobranza))
            {
                id_cobranza = "0";
            }
            stringBuilder.Append(" select  cob.rut_deudor,cob.nrooperacion,");
            stringBuilder.Append(" (select top 1 rsocial from clientes cli where cob.rut_cli = cli.rut_cli) cliente,");
            stringBuilder.Append(" (select top 1 rsocial from deudores deu where cob.rut_deudor = deu.rut_deudor) deudor");
            stringBuilder.Append(" from cobranza cob");
            stringBuilder.Append(" WHERE cob.id_cobranza   = " + Convert.ToInt64(id_cobranza));
            return baseDatos.getResultset(stringBuilder.ToString());
        }
        public static DataTable VALIDADOCLIBERADOS(string id_cobranza, string id_abono)
        {
            BaseDatos baseDatos = new BaseDatos();
            StringBuilder stringBuilder = new StringBuilder();
            if (string.IsNullOrEmpty(id_cobranza))
            {
                id_cobranza = "0";
            }
            if (string.IsNullOrEmpty(id_abono))
            {
                id_abono = "0";
            }
            stringBuilder.Append(" select id_abono,id_moneda,MCH,estado,montoabono");
            stringBuilder.Append(" from abonos");
            stringBuilder.Append(string.Concat(new object[]
			{
				" WHERE id_cobranza   = ",
				Convert.ToInt64(id_cobranza),
				" and id_abono = ",
				Convert.ToInt64(id_abono)
			}));
            return baseDatos.getResultset(stringBuilder.ToString());
        }
        public static DataTable TOTALESABONOS(string id_cobranza, string id_abono_comprobante)
        {
            BaseDatos baseDatos = new BaseDatos();
            StringBuilder stringBuilder = new StringBuilder();
            if (string.IsNullOrEmpty(id_cobranza))
            {
                id_cobranza = "0";
            }
            if (string.IsNullOrEmpty(id_abono_comprobante))
            {
                id_abono_comprobante = "0";
            }
            stringBuilder.Append(" select sum(montoabono)Montomch");
            stringBuilder.Append(" from abonosmch");
            stringBuilder.Append(string.Concat(new object[]
			{
				" WHERE id_cobranza = ",
				Convert.ToInt64(id_cobranza),
				" and id_abono_comprobante = ",
				Convert.ToInt64(id_abono_comprobante)
			}));
            return baseDatos.getResultset(stringBuilder.ToString());
        }
        public static DataTable VALIDADOCLIBERADOSMCH(string id_cobranza)
        {
            BaseDatos baseDatos = new BaseDatos();
            StringBuilder stringBuilder = new StringBuilder();
            if (string.IsNullOrEmpty(id_cobranza))
            {
                id_cobranza = "0";
            }
            stringBuilder.Append(" select id_abonoMCH");
            stringBuilder.Append(" from abonosmch");
            stringBuilder.Append(" WHERE estado != 'L' and id_cobranza  = " + Convert.ToInt64(id_cobranza));
            return baseDatos.getResultset(stringBuilder.ToString());
        }
        public static DataTable MostrarDatosCobranzaPrejudicial(string id_cobranza)
        {
            BaseDatos baseDatos = new BaseDatos();
            StringBuilder stringBuilder = new StringBuilder();
            if (string.IsNullOrEmpty(id_cobranza))
            {
                id_cobranza = "0";
            }
            stringBuilder.Append(" SELECT \t cob.codigo,count(cco.saldodeuda)contador,cob.id_cobranza,");
            stringBuilder.Append("          cob.rut_cli,");
            stringBuilder.Append("          (select top 1 cli.rsocial   from clientes cli where cob.rut_cli = cli.rut_cli)cliente, ");
            stringBuilder.Append("  \t cob.rut_deudor,");
            stringBuilder.Append("          (select top 1 deu.rsocial from deudores deu where cob.rut_deudor = deu.rut_deudor)deudor,");
            stringBuilder.Append("          cob.nrooperacion,");
            stringBuilder.Append("          convert(varchar(10),cob.fproceso,103)fproceso,");
            stringBuilder.Append("          (select top 1 ppr.descripcion from productopre ppr where cob.id_producto = ppr.id_producto)producto,");
            stringBuilder.Append("          sum(cco.montocapital)montocapital,");
            stringBuilder.Append("          sum(cco.saldodeuda)saldodeuda");
            stringBuilder.Append(" FROM \t cobranza cob INNER JOIN cuotacolegio cco ON cob.id_cobranza = cco.id_cobranza");
            stringBuilder.Append(" GROUP BY cob.codigo,cob.id_cobranza,");
            stringBuilder.Append(" \t cob.rut_cli,");
            stringBuilder.Append("  \t cob.rut_deudor,");
            stringBuilder.Append("          cob.nrooperacion,");
            stringBuilder.Append("          cob.fproceso,");
            stringBuilder.Append("          cob.id_producto");
            stringBuilder.Append(" HAVING\tcob.id_cobranza = " + Convert.ToInt64(id_cobranza));
            return baseDatos.getResultset(stringBuilder.ToString());
        }
        public static DataTable MostrarDatosCobranzaLiquidacion(string id_cobranza)
        {
            BaseDatos baseDatos = new BaseDatos();
            StringBuilder stringBuilder = new StringBuilder();
            if (string.IsNullOrEmpty(id_cobranza))
            {
                id_cobranza = "0";
            }
            stringBuilder.Append(" SELECT cob.tipocobranza,");
            stringBuilder.Append("\t(select top 1 tri.descripcion from tribunal tri where jui.id_tribunal = tri.id_tribunal) tribunal,");
            stringBuilder.Append("      \tcase cob.tipocobranza when 'J' then 'Judicial' else 'PreJudicial' end TipoCobranzadet,");
            stringBuilder.Append("\tcob.id_producto,cob.tipo,cob.id_cobranza,jui.id_juicios,jui.rol,cob.nrooperacion operacion,");
            stringBuilder.Append("        cob.rut_deudor,  ");
            stringBuilder.Append("\t(select top 1 rsocial  from deudores deu where cob.rut_deudor = deu.rut_deudor)deudor,");
            stringBuilder.Append("        cob.rut_cli,");
            stringBuilder.Append("        (select top 1 rsocial  from clientes cli where cob.rut_cli = cli.rut_cli)cliente,");
            stringBuilder.Append("        jui.rut_abogado,jui.rut_procurador,convert(varchar(10),jui.fingresocorte,103) fingcorte");
            stringBuilder.Append(" FROM cobranza cob  ");
            stringBuilder.Append(" LEFT JOIN juicios jui ON cob.id_cobranza = jui.id_cobranza ");
            stringBuilder.Append(" WHERE cob.id_cobranza = " + Convert.ToInt64(id_cobranza));
            return baseDatos.getResultset(stringBuilder.ToString());
        }
        public static DataTable MostrarDatosCobranzaLiquidacionGastos(string id_cobranza)
        {
            BaseDatos baseDatos = new BaseDatos();
            StringBuilder stringBuilder = new StringBuilder();
            if (string.IsNullOrEmpty(id_cobranza))
            {
                id_cobranza = "0";
            }
            stringBuilder.Append("  select sum(montogastoadmin) admin,sum(montogastojudi)judi,sum(montogastopre)pre from gastos  ");
            stringBuilder.Append("  where id_cobranza =  " + Convert.ToInt64(id_cobranza));
            return baseDatos.getResultset(stringBuilder.ToString());
        }
        public static DataTable MostrarDatosCobranzaLiquidacionAbonos(string id_cobranza)
        {
            BaseDatos baseDatos = new BaseDatos();
            StringBuilder stringBuilder = new StringBuilder();
            if (string.IsNullOrEmpty(id_cobranza))
            {
                id_cobranza = "0";
            }
            stringBuilder.Append("  select sum(montoabono)abono from abonos  ");
            stringBuilder.Append("  where id_cobranza =  " + Convert.ToInt64(id_cobranza));
            return baseDatos.getResultset(stringBuilder.ToString());
        }
        public static DataTable MostrarDatosCobranzaPrejuducialAbonos(string id_cobranza)
        {
            BaseDatos baseDatos = new BaseDatos();
            StringBuilder stringBuilder = new StringBuilder();
            if (string.IsNullOrEmpty(id_cobranza))
            {
                id_cobranza = "0";
            }
            stringBuilder.Append("  select sum(montoabono)abono from abonos  ");
            stringBuilder.Append("  where id_cobranza =  " + Convert.ToInt64(id_cobranza));
            return baseDatos.getResultset(stringBuilder.ToString());
        }
        public static DataTable MostrarTelefonoDeudor(string rut_deudor)
        {
            BaseDatos baseDatos = new BaseDatos();
            StringBuilder stringBuilder = new StringBuilder();
            stringBuilder.Append("  select celular1,telefono1,telefono2 from deudores  ");
            stringBuilder.Append("  where rtrim(ltrim(rut_deudor)) =  '" + rut_deudor.Trim().Replace(".", "") + "'");
            return baseDatos.getResultset(stringBuilder.ToString());
        }
        public static DataTable MostrarDatosParametros()
        {
            BaseDatos baseDatos = new BaseDatos();
            StringBuilder stringBuilder = new StringBuilder();
            stringBuilder.Append("  select Honorarios,tasainteres,descintereses,deschonorarios,otrosdescuentos from parametros ");
            return baseDatos.getResultset(stringBuilder.ToString());
        }
        public static DataTable MostrarDatosCabezeraExhorto(string id_juicio)
        {
            BaseDatos baseDatos = new BaseDatos();
            StringBuilder stringBuilder = new StringBuilder();
            if (string.IsNullOrEmpty(id_juicio))
            {
                id_juicio = "0";
            }
            stringBuilder.Append(" SELECT \tcob.nrooperacion,cob.rut_deudor,jui.rol, ");
            stringBuilder.Append("         convert(varchar(10),jui.fingresocorte,103) fingcorte,jui.id_tribunal, ");
            stringBuilder.Append("         (select top 1 cli.rsocial from clientes cli  where cli.rut_cli = cob.rut_cli) nomcliente, ");
            stringBuilder.Append("         (select top 1 deu.rsocial from deudores deu where deu.rut_deudor = cob.rut_deudor) nomdeudor,  ");
            stringBuilder.Append("         (select top 1 tri.descripcion from tribunal tri where tri.id_tribunal = jui.id_tribunal) tribunal, ");
            stringBuilder.Append("         upper((select top 1 pro.descripcion  from  producto pro    where cob.id_producto = pro.id_producto)) producto  ");
            stringBuilder.Append(" FROM cobranza cob  ");
            stringBuilder.Append(" INNER JOIN juicios jui   ON cob.id_cobranza = jui.id_cobranza ");
            stringBuilder.Append(" WHERE jui.id_juicios  = " + Convert.ToInt64(id_juicio));
            return baseDatos.getResultset(stringBuilder.ToString());
        }
        public static DataTable MostrarDatosCabezeraGastos(string id_cobranza)
        {
            BaseDatos baseDatos = new BaseDatos();
            StringBuilder stringBuilder = new StringBuilder();
            if (string.IsNullOrEmpty(id_cobranza))
            {
                id_cobranza = "0";
            }
            stringBuilder.Append(" SELECT \tcob.nrooperacion,cob.rut_deudor,jui.rol, ");
            stringBuilder.Append("         convert(varchar(10),jui.fingresocorte,103) fingcorte,jui.id_tribunal, ");
            stringBuilder.Append("         (select top 1 cli.rsocial from clientes cli  where cli.rut_cli = cob.rut_cli) nomcliente, ");
            stringBuilder.Append("         (select top 1 deu.rsocial from deudores deu where deu.rut_deudor = cob.rut_deudor) nomdeudor,  ");
            stringBuilder.Append("         (select top 1 tri.descripcion from tribunal tri where tri.id_tribunal = jui.id_tribunal) tribunal, ");
            stringBuilder.Append("         upper((select top 1 pro.descripcion  from  producto pro    where cob.id_producto = pro.id_producto)) producto  ");
            stringBuilder.Append(" FROM cobranza cob  ");
            stringBuilder.Append(" LEFT JOIN juicios jui   ON cob.id_cobranza = jui.id_cobranza ");
            stringBuilder.Append(" WHERE cob.id_cobranza  = " + Convert.ToInt64(id_cobranza));
            return baseDatos.getResultset(stringBuilder.ToString());
        }
        public static DataTable MostrarDatosCabezeraAbonos(string id_cobranza)
        {
            BaseDatos baseDatos = new BaseDatos();
            StringBuilder stringBuilder = new StringBuilder();
            if (string.IsNullOrEmpty(id_cobranza))
            {
                id_cobranza = "0";
            }
            stringBuilder.Append(" SELECT \tcob.tipocobranza,cob.nrooperacion,cob.rut_deudor,jui.rol, ");
            stringBuilder.Append("         convert(varchar(10),jui.fingresocorte,103) fingcorte,jui.id_tribunal, ");
            stringBuilder.Append("         (select top 1 cli.rsocial from clientes cli  where cli.rut_cli = cob.rut_cli) nomcliente, ");
            stringBuilder.Append("         (select top 1 deu.rsocial from deudores deu where deu.rut_deudor = cob.rut_deudor) nomdeudor,  ");
            stringBuilder.Append("         (select top 1 tri.descripcion from tribunal tri where tri.id_tribunal = jui.id_tribunal) tribunal, ");
            stringBuilder.Append("         upper((select top 1 pro.descripcion  from  producto pro    where cob.id_producto = pro.id_producto)) producto  ");
            stringBuilder.Append(" FROM cobranza cob  ");
            stringBuilder.Append(" LEFT JOIN juicios jui   ON cob.id_cobranza = jui.id_cobranza ");
            stringBuilder.Append(" WHERE cob.id_cobranza  = " + Convert.ToInt64(id_cobranza));
            return baseDatos.getResultset(stringBuilder.ToString());
        }
        public static DataTable MostrarDatosCabezeraPrendas(string id_cobranza)
        {
            BaseDatos baseDatos = new BaseDatos();
            StringBuilder stringBuilder = new StringBuilder();
            if (string.IsNullOrEmpty(id_cobranza))
            {
                id_cobranza = "0";
            }
            stringBuilder.Append(" SELECT \tcob.nrooperacion,cob.rut_deudor,jui.rol, ");
            stringBuilder.Append("         convert(varchar(10),jui.fingresocorte,103) fingcorte,jui.id_tribunal, ");
            stringBuilder.Append("         (select top 1 cli.rsocial from clientes cli  where cli.rut_cli = cob.rut_cli) nomcliente, ");
            stringBuilder.Append("         (select top 1 deu.rsocial from deudores deu where deu.rut_deudor = cob.rut_deudor) nomdeudor,  ");
            stringBuilder.Append("         (select top 1 tri.descripcion from tribunal tri where tri.id_tribunal = jui.id_tribunal) tribunal, ");
            stringBuilder.Append("         upper((select top 1 pro.descripcion  from  producto pro    where cob.id_producto = pro.id_producto)) producto  ");
            stringBuilder.Append(" FROM cobranza cob  ");
            stringBuilder.Append(" LEFT JOIN juicios jui   ON cob.id_cobranza = jui.id_cobranza ");
            stringBuilder.Append(" WHERE cob.id_cobranza  = " + Convert.ToInt64(id_cobranza));
            return baseDatos.getResultset(stringBuilder.ToString());
        }
        public static DataTable MostrarDatosBienMueble(string id_bien_mueble)
        {
            BaseDatos baseDatos = new BaseDatos();
            StringBuilder stringBuilder = new StringBuilder();
            if (string.IsNullOrEmpty(id_bien_mueble))
            {
                id_bien_mueble = "0";
            }
            stringBuilder.Append(" select bm.id_bien_mueble,");
            stringBuilder.Append("       (select top 1 tv.descripcion  from tipovehiculo tv where bm.id_tipo_vehi = tv.id_tipo_veh)tipovehiculo,");
            stringBuilder.Append("       bm.anio_fabricacion,");
            stringBuilder.Append("       bm.patente,");
            stringBuilder.Append("       (select top 1 mc.descripcion from marca mc where bm.id_marca = mc.id_marca)marca,");
            stringBuilder.Append("       bm.n_chassis,");
            stringBuilder.Append("       case bm.estado when 'N' then 'Nuevo' else 'Usado' end estado  ");
            stringBuilder.Append("  from bienmueble bm where bm.id_bien_mueble = " + Convert.ToInt64(id_bien_mueble));
            return baseDatos.getResultset(stringBuilder.ToString());
        }
        public static DataTable MostrarComprobanteAbonos(string id_abono)
        {
            BaseDatos baseDatos = new BaseDatos();
            StringBuilder stringBuilder = new StringBuilder();
            if (string.IsNullOrEmpty(id_abono))
            {
                id_abono = "0";
            }
            stringBuilder.Append(" select abo.id_abono, (select top 1 cli.rsocial from clientes cli where cli.rut_cli = cob.rut_cli)cliente,");
            stringBuilder.Append(" (select top 1 deu.rsocial from deudores deu where deu.rut_deudor = cob.rut_deudor)deudor,");
            stringBuilder.Append(" cob.rut_deudor, ");
            stringBuilder.Append(" cob.nrooperacion,");
            stringBuilder.Append(" isnull(convert(varchar(10),abo.fabono,103),'') fechaabono,");
            stringBuilder.Append(" isnull(convert(varchar(10),abo.fpago,103),'') fechapago,");
            stringBuilder.Append(" abo.montoabono,");
            stringBuilder.Append(" (select top 1 con.descripcion from conceptoabono con where con.id_concepto = abo.id_concepto)concepto,");
            stringBuilder.Append(" abo.nrocheque,");
            stringBuilder.Append(" (select top 1 ban.descripcion from bancos ban  where ban.id_banco = abo.id_banco) banco,");
            stringBuilder.Append(" isnull(case convert(varchar(10),abo.fpago,103) when '01/01/1900' then '' else convert(varchar(10),abo.fpago,103) end ,'') fechapagoabono,");
            stringBuilder.Append(" abo.rut_deudor rutgirador, ");
            stringBuilder.Append(" (select top 1 deu.rsocial from deudores deu where deu.rut_deudor = abo.rut_deudor)nomgirador,");
            stringBuilder.Append(" case abo.tipocomprobante when 1 then 'Ingreso' else 'Egreso' end TipoCobranza,");
            stringBuilder.Append(" (select top 1 mon.descripcion    from tipomoneda mon  where mon.id_moneda = abo.id_moneda)moneda,");
            stringBuilder.Append(" abo.serie,");
            stringBuilder.Append(" abo.boleta,");
            stringBuilder.Append(" abo.docuno,");
            stringBuilder.Append(" abo.docdos ");
            stringBuilder.Append(" from abonos abo inner join cobranza cob on cob.id_cobranza = abo.id_cobranza");
            stringBuilder.Append(" where abo.id_abono = " + Convert.ToInt64(id_abono));
            return baseDatos.getResultset(stringBuilder.ToString());
        }
        public static DataTable MostrarAbonoParcialCabezera(string id_abonoparcial)
        {
            BaseDatos baseDatos = new BaseDatos();
            StringBuilder stringBuilder = new StringBuilder();
            if (string.IsNullOrEmpty(id_abonoparcial))
            {
                id_abonoparcial = "0";
            }
            stringBuilder.Append(" select cob.nrooperacion,");
            stringBuilder.Append(" abp.tipo,cob.rut_cli,");
            stringBuilder.Append(" (select top 1 cli.rsocial from clientes cli where cli.rut_cli = cob.rut_cli)cliente,");
            stringBuilder.Append(" cob.rut_deudor,");
            stringBuilder.Append(" (select top 1 deu.rsocial from deudores deu where deu.rut_deudor = cob.rut_deudor)deudor,");
            stringBuilder.Append(" abp.id_abonoparcial,abp.id_abono_comprobante,abp.montoparcial,convert(varchar(10),abp.fproceso,103)fabonoparcial");
            stringBuilder.Append("  from cobranza cob inner join  alcsacl.abonoparcial abp on cob.id_cobranza = abp.id_cobranza");
            stringBuilder.Append("  where abp.id_abonoparcial  = " + Convert.ToInt64(id_abonoparcial));
            return baseDatos.getResultset(stringBuilder.ToString());
        }
        public static DataTable MostrarMCH(string id_abono)
        {
            BaseDatos baseDatos = new BaseDatos();
            StringBuilder stringBuilder = new StringBuilder();
            if (string.IsNullOrEmpty(id_abono))
            {
                id_abono = "0";
            }
            stringBuilder.Append("select isnull(convert(varchar(10),fpago,103),'') Fecha_Pago,nrocheque Nro_Cheque,serie Serie,montoabono Monto_Abono,estado Liberado");
            stringBuilder.Append(" from abonosMCH ");
            stringBuilder.Append("where id_abono_comprobante =  " + Convert.ToInt64(id_abono));
            return baseDatos.getResultset(stringBuilder.ToString());
        }
        public static DataTable MostrarAbonoParcial(string idcobranza)
        {
            BaseDatos baseDatos = new BaseDatos();
            StringBuilder stringBuilder = new StringBuilder();
            if (string.IsNullOrEmpty(idcobranza))
            {
                idcobranza = "0";
            }
            stringBuilder.Append("select id_abonoparcial ID,montoparcial ABONO,convert(varchar(10),fproceso,103) FECHA ");
            stringBuilder.Append(" from alcsacl.abonoparcial ");
            stringBuilder.Append("where id_cobranza =  " + Convert.ToInt64(idcobranza));
            return baseDatos.getResultset(stringBuilder.ToString());
        }
        public static DataTable ValidaPagoParcial(string idcobranza)
        {
            BaseDatos baseDatos = new BaseDatos();
            StringBuilder stringBuilder = new StringBuilder();
            if (string.IsNullOrEmpty(idcobranza))
            {
                idcobranza = "0";
            }
            stringBuilder.Append(" select *  ");
            stringBuilder.Append(" from cuotacolegio ");
            stringBuilder.Append("where pagado is null and  id_cobranza =  " + Convert.ToInt64(idcobranza));
            return baseDatos.getResultset(stringBuilder.ToString());
        }
        public static DataTable ValidaPagoParcialMutuo(string idcobranza)
        {
            BaseDatos baseDatos = new BaseDatos();
            StringBuilder stringBuilder = new StringBuilder();
            if (string.IsNullOrEmpty(idcobranza))
            {
                idcobranza = "0";
            }
            stringBuilder.Append(" select *  ");
            stringBuilder.Append(" from mutuo ");
            stringBuilder.Append("where pagado is null and  id_cobranza =  " + Convert.ToInt64(idcobranza));
            return baseDatos.getResultset(stringBuilder.ToString());
        }
        public static DataTable ValidaPagoParcialPagare(string idcobranza)
        {
            BaseDatos baseDatos = new BaseDatos();
            StringBuilder stringBuilder = new StringBuilder();
            if (string.IsNullOrEmpty(idcobranza))
            {
                idcobranza = "0";
            }
            stringBuilder.Append(" select *  ");
            stringBuilder.Append(" from docupagare ");
            stringBuilder.Append("where pagado is null and  id_cobranza =  " + Convert.ToInt64(idcobranza));
            return baseDatos.getResultset(stringBuilder.ToString());
        }
        public static DataTable VERDepositoAbono(string idabono)
        {
            BaseDatos baseDatos = new BaseDatos();
            StringBuilder stringBuilder = new StringBuilder();
            if (string.IsNullOrEmpty(idabono))
            {
                idabono = "0";
            }
            stringBuilder.Append(" select convert(varchar(10),FechaDeposito,103)FechaDeposito,CuentaDeposito ,NrocomprobanteDeposito,convert(varchar(10),FechaLiberacion,103)FechaLiberacion,Estado  ");
            stringBuilder.Append(" from abonos ");
            stringBuilder.Append("where id_abono=  " + Convert.ToInt64(idabono));
            return baseDatos.getResultset(stringBuilder.ToString());
        }
        public static DataTable VERDepositoAbonoMCH(string idabono)
        {
            BaseDatos baseDatos = new BaseDatos();
            StringBuilder stringBuilder = new StringBuilder();
            if (string.IsNullOrEmpty(idabono))
            {
                idabono = "0";
            }
            stringBuilder.Append(" select convert(varchar(10),FechaDeposito,103)FechaDeposito,CuentaDeposito ,NrocomprobanteDeposito,convert(varchar(10),FechaLiberacion,103)FechaLiberacion,Estado  ");
            stringBuilder.Append(" from abonosMCH ");
            stringBuilder.Append("where id_abonomch=  " + Convert.ToInt64(idabono));
            return baseDatos.getResultset(stringBuilder.ToString());
        }
        public static DataTable ValidaPagoParcialDocujuicio(string idcobranza)
        {
            BaseDatos baseDatos = new BaseDatos();
            StringBuilder stringBuilder = new StringBuilder();
            if (string.IsNullOrEmpty(idcobranza))
            {
                idcobranza = "0";
            }
            stringBuilder.Append(" select *  ");
            stringBuilder.Append(" from docujuicio ");
            stringBuilder.Append("where pagado is null and  id_cobranza =  " + Convert.ToInt64(idcobranza));
            return baseDatos.getResultset(stringBuilder.ToString());
        }
        public static DataTable DOCRENDICIONESVALIDA(string id_rendicion)
        {
            BaseDatos baseDatos = new BaseDatos();
            StringBuilder stringBuilder = new StringBuilder();
            if (string.IsNullOrEmpty(id_rendicion))
            {
                id_rendicion = "0";
            }
            stringBuilder.Append(" select *  ");
            stringBuilder.Append(" from Doc_Rendicion ");
            stringBuilder.Append("where id_rendicion =  " + Convert.ToInt64(id_rendicion));
            return baseDatos.getResultset(stringBuilder.ToString());
        }
        public static DataTable MostrarJuicioActividades(string id_juicio)
        {
            BaseDatos baseDatos = new BaseDatos();
            StringBuilder stringBuilder = new StringBuilder();
            if (string.IsNullOrEmpty(id_juicio))
            {
                id_juicio = "0";
            }
            stringBuilder.Append(" SELECT  aju.id_prox_gestion-1 corr,tra.descripcion,convert(varchar(10),aju.ftramite,103) ftramite ,");
            stringBuilder.Append("         (select top 1 tra.descripcion  from tramite tra where aju.id_prox_gestion = tra.indice) proxgestion,");
            stringBuilder.Append("         convert(varchar(10),aju.fproxgestion,103) fproxgestion,isnull(sub.descripcion,'') SubTramite,");
            stringBuilder.Append("         convert(varchar(10),aju.fsubtramite,103) fsubtramite ");
            stringBuilder.Append("   FROM  actividadesjudiciales aju");
            stringBuilder.Append(" INNER JOIN tramite tra ON aju.id_tramite = tra.id_tramite");
            stringBuilder.Append(" LEFT JOIN subtramite sub ON aju.id_sub_tramite = sub.id_sub_tramite");
            stringBuilder.Append(" WHERE aju.id_juicios = " + Convert.ToInt64(id_juicio));
            return baseDatos.getResultset(stringBuilder.ToString());
        }
        public static DataTable GENMostrarJuicioActividades(string id_juicio, string tipo)
        {
            BaseDatos baseDatos = new BaseDatos();
            StringBuilder stringBuilder = new StringBuilder();
            if (string.IsNullOrEmpty(id_juicio))
            {
                id_juicio = "0";
            }
            if (tipo == "DOCUJUICIO")
            {
                stringBuilder.Append(" SELECT  aju.observacion,aju.id_prox_gestion-1 corr,tra.descripcion,convert(varchar(10),aju.ftramite,103) ftramite ,");
                stringBuilder.Append("         (select top 1 tra.descripcion  from tramiteGENERAL tra where aju.id_prox_gestion = tra.indice and tra.tipo = 'DOCUJUICIO') proxgestion,");
                stringBuilder.Append("         convert(varchar(10),aju.fproxgestion,103) fproxgestion,isnull(sub.descripcion,'') SubTramite,");
                stringBuilder.Append("         convert(varchar(10),aju.fsubtramite,103) fsubtramite ");
                stringBuilder.Append("   FROM  actividadesjudiciales aju");
                stringBuilder.Append(" INNER JOIN tramiteGENERAL tra ON aju.id_tramite = tra.id_tramite");
                stringBuilder.Append(" LEFT JOIN subTramiteGENERAL sub ON aju.id_sub_tramite = sub.id_sub_tramite");
                stringBuilder.Append(" WHERE aju.id_juicios = " + Convert.ToInt64(id_juicio));
            }
            if (tipo == "DOCUPAGARE")
            {
                stringBuilder.Append(" SELECT  aju.observacion,aju.id_prox_gestion-1 corr,tra.descripcion,convert(varchar(10),aju.ftramite,103) ftramite ,");
                stringBuilder.Append("         (select top 1 tra.descripcion  from tramiteGENERAL tra where aju.id_prox_gestion = tra.indice and tra.tipo = 'DOCUPAGARE') proxgestion,");
                stringBuilder.Append("         convert(varchar(10),aju.fproxgestion,103) fproxgestion,isnull(sub.descripcion,'') SubTramite,");
                stringBuilder.Append("         convert(varchar(10),aju.fsubtramite,103) fsubtramite ");
                stringBuilder.Append("   FROM  actividadesjudiciales aju");
                stringBuilder.Append(" INNER JOIN tramiteGENERAL tra ON aju.id_tramite = tra.id_tramite");
                stringBuilder.Append(" LEFT JOIN subTramiteGENERAL sub ON aju.id_sub_tramite = sub.id_sub_tramite");
                stringBuilder.Append(" WHERE aju.id_juicios = " + Convert.ToInt64(id_juicio));
            }
            if (tipo == "MUTUO" || tipo == "DOCUMUTUO"  )
            {
                stringBuilder.Append(" SELECT  aju.observacion,aju.id_prox_gestion-1 corr,tra.descripcion,convert(varchar(10),aju.ftramite,103) ftramite ,");
                stringBuilder.Append("         (select top 1 tra.descripcion  from tramiteGENERAL tra where aju.id_prox_gestion = tra.indice and tra.tipo = 'MUTUO') proxgestion,");
                stringBuilder.Append("         convert(varchar(10),aju.fproxgestion,103) fproxgestion,isnull(sub.descripcion,'') SubTramite,");
                stringBuilder.Append("         convert(varchar(10),aju.fsubtramite,103) fsubtramite ");
                stringBuilder.Append("   FROM  actividadesjudiciales aju");
                stringBuilder.Append(" INNER JOIN tramiteGENERAL tra ON aju.id_tramite = tra.id_tramite");
                stringBuilder.Append(" LEFT JOIN subTramiteGENERAL sub ON aju.id_sub_tramite = sub.id_sub_tramite");
                stringBuilder.Append(" WHERE aju.id_juicios = " + Convert.ToInt64(id_juicio));
            }
            if (tipo == "ESTANDARD1" || tipo == "DocuEstandardUNO")
            {
                stringBuilder.Append(" SELECT  aju.observacion,aju.id_prox_gestion-1 corr,tra.descripcion,convert(varchar(10),aju.ftramite,103) ftramite ,");
                stringBuilder.Append("         (select top 1 tra.descripcion  from tramiteGENERAL tra where aju.id_prox_gestion = tra.indice and tra.tipo = 'ESTANDARD1') proxgestion,");
                stringBuilder.Append("         convert(varchar(10),aju.fproxgestion,103) fproxgestion,isnull(sub.descripcion,'') SubTramite,");
                stringBuilder.Append("         convert(varchar(10),aju.fsubtramite,103) fsubtramite ");
                stringBuilder.Append("   FROM  actividadesjudiciales aju");
                stringBuilder.Append(" INNER JOIN tramiteGENERAL tra ON aju.id_tramite = tra.id_tramite");
                stringBuilder.Append(" LEFT JOIN subTramiteGENERAL sub ON aju.id_sub_tramite = sub.id_sub_tramite");
                stringBuilder.Append(" WHERE aju.id_juicios = " + Convert.ToInt64(id_juicio));
            }
            if (tipo == "ESTANDARD2" || tipo == "DocuEstandardDOS")
            {
                stringBuilder.Append(" SELECT  aju.observacion,aju.id_prox_gestion-1 corr,tra.descripcion,convert(varchar(10),aju.ftramite,103) ftramite ,");
                stringBuilder.Append("         (select top 1 tra.descripcion  from tramiteGENERAL tra where aju.id_prox_gestion = tra.indice and tra.tipo = 'ESTANDARD2') proxgestion,");
                stringBuilder.Append("         convert(varchar(10),aju.fproxgestion,103) fproxgestion,isnull(sub.descripcion,'') SubTramite,");
                stringBuilder.Append("         convert(varchar(10),aju.fsubtramite,103) fsubtramite ");
                stringBuilder.Append("   FROM  actividadesjudiciales aju");
                stringBuilder.Append(" INNER JOIN tramiteGENERAL tra ON aju.id_tramite = tra.id_tramite");
                stringBuilder.Append(" LEFT JOIN subTramiteGENERAL sub ON aju.id_sub_tramite = sub.id_sub_tramite");
                stringBuilder.Append(" WHERE aju.id_juicios = " + Convert.ToInt64(id_juicio));
            }
            if (tipo == "ESTANDARD3" || tipo == "DocuEstandardTRES")
            {
                stringBuilder.Append(" SELECT  aju.observacion,aju.id_prox_gestion-1 corr,tra.descripcion,convert(varchar(10),aju.ftramite,103) ftramite ,");
                stringBuilder.Append("         (select top 1 tra.descripcion  from tramiteGENERAL tra where aju.id_prox_gestion = tra.indice and tra.tipo = 'ESTANDARD3') proxgestion,");
                stringBuilder.Append("         convert(varchar(10),aju.fproxgestion,103) fproxgestion,isnull(sub.descripcion,'') SubTramite,");
                stringBuilder.Append("         convert(varchar(10),aju.fsubtramite,103) fsubtramite ");
                stringBuilder.Append("   FROM  actividadesjudiciales aju");
                stringBuilder.Append(" INNER JOIN tramiteGENERAL tra ON aju.id_tramite = tra.id_tramite");
                stringBuilder.Append(" LEFT JOIN subTramiteGENERAL sub ON aju.id_sub_tramite = sub.id_sub_tramite");
                stringBuilder.Append(" WHERE aju.id_juicios = " + Convert.ToInt64(id_juicio));
            }
            if (tipo == "ESTANDARD4" || tipo == "DocuEstandardCUATRO")
            {
                stringBuilder.Append(" SELECT  aju.observacion,aju.id_prox_gestion-1 corr,tra.descripcion,convert(varchar(10),aju.ftramite,103) ftramite ,");
                stringBuilder.Append("         (select top 1 tra.descripcion  from tramiteGENERAL tra where aju.id_prox_gestion = tra.indice and tra.tipo = 'ESTANDARD4') proxgestion,");
                stringBuilder.Append("         convert(varchar(10),aju.fproxgestion,103) fproxgestion,isnull(sub.descripcion,'') SubTramite,");
                stringBuilder.Append("         convert(varchar(10),aju.fsubtramite,103) fsubtramite ");
                stringBuilder.Append("   FROM  actividadesjudiciales aju");
                stringBuilder.Append(" INNER JOIN tramiteGENERAL tra ON aju.id_tramite = tra.id_tramite");
                stringBuilder.Append(" LEFT JOIN subTramiteGENERAL sub ON aju.id_sub_tramite = sub.id_sub_tramite");
                stringBuilder.Append(" WHERE aju.id_juicios = " + Convert.ToInt64(id_juicio));
            }
            if (tipo == ""||tipo == null)
            {
                stringBuilder.Append(" SELECT  aju.observacion,aju.id_prox_gestion-1 corr,tra.descripcion,convert(varchar(10),aju.ftramite,103) ftramite ,");
                stringBuilder.Append("         (select top 1 tra.descripcion  from tramiteGENERAL tra where aju.id_prox_gestion = tra.indice and tra.tipo = 'MUTUO') proxgestion,");
                stringBuilder.Append("         convert(varchar(10),aju.fproxgestion,103) fproxgestion,isnull(sub.descripcion,'') SubTramite,");
                stringBuilder.Append("         convert(varchar(10),aju.fsubtramite,103) fsubtramite ");
                stringBuilder.Append("   FROM  actividadesjudiciales aju");
                stringBuilder.Append(" INNER JOIN tramiteGENERAL tra ON aju.id_tramite = tra.id_tramite");
                stringBuilder.Append(" LEFT JOIN subTramiteGENERAL sub ON aju.id_sub_tramite = sub.id_sub_tramite");
                stringBuilder.Append(" WHERE aju.id_juicios = " + Convert.ToInt64(id_juicio));
            }
            return baseDatos.getResultset(stringBuilder.ToString());
        }
        public static DataTable MostrarCuotaColegio(string id_cobranza)
        {
            BaseDatos baseDatos = new BaseDatos();
            StringBuilder stringBuilder = new StringBuilder();
            if (string.IsNullOrEmpty(id_cobranza))
            {
                id_cobranza = "0";
            }
            stringBuilder.Append(" select  ");
            stringBuilder.Append(" (select top 1 td.descripcion from tipodocumento td where cco.id_tipo_docu = td.id_tipo_docu) tipodocu,");
            stringBuilder.Append(" cco.nrocuota,cco.montocapital,cco.abonos,cco.montointeres,cco.saldodeuda");
            stringBuilder.Append(" from cuotacolegio cco ");
            stringBuilder.Append(" where id_cobranza = " + Convert.ToInt64(id_cobranza));
            return baseDatos.getResultset(stringBuilder.ToString());
        }
        public static DataTable MostrarDocuJuicio(string id_cobranza)
        {
            BaseDatos baseDatos = new BaseDatos();
            StringBuilder stringBuilder = new StringBuilder();
            if (string.IsNullOrEmpty(id_cobranza))
            {
                id_cobranza = "0";
            }
            stringBuilder.Append(" select urldocumento,nrodocumento,monto, isnull(case convert(varchar(10),fvencimiento,103) when '01/01/1900' then '' else convert(varchar(10),fvencimiento,103) end ,'') fvcto,actaprotesto,direccionacta ");
            stringBuilder.Append("   from docujuicio");
            stringBuilder.Append("  where id_cobranza = " + Convert.ToInt64(id_cobranza));
            return baseDatos.getResultset(stringBuilder.ToString());
        }
        public static DataTable MostrarDocuJuicioCon(string id_cobranza)
        {
            BaseDatos baseDatos = new BaseDatos();
            StringBuilder stringBuilder = new StringBuilder();
            if (string.IsNullOrEmpty(id_cobranza))
            {
                id_cobranza = "0";
            }
            stringBuilder.Append(" select isnull(case convert(varchar(10),faceptacion,103) when '01/01/1900' then '' else convert(varchar(10),faceptacion,103) end,'')faceptacion,'' notario,nrodocumento,tituloconstadeuda,(select top 1 bco.descripcion  from bancos bco where bco.id_banco = id_banco)banco,ctacte,numserie,numcheque,monto,convert(varchar(10),fgiroemision,103)fgiroemision,actaprotesto,direccionacta,urldocumento");
            stringBuilder.Append("   from docujuicio");
            stringBuilder.Append("  where id_cobranza = " + Convert.ToInt64(id_cobranza));
            return baseDatos.getResultset(stringBuilder.ToString());
        }
        public static DataTable MostrarDocuJuicioEstandard_1(string id_cobranza)
        {
            BaseDatos baseDatos = new BaseDatos();
            StringBuilder stringBuilder = new StringBuilder();
            if (string.IsNullOrEmpty(id_cobranza))
            {
                id_cobranza = "0";
            }
            stringBuilder.Append(" select * ");
            stringBuilder.Append("   from DocuEstandard1");
            stringBuilder.Append("  where id_cobranza = " + Convert.ToInt64(id_cobranza));
            return baseDatos.getResultset(stringBuilder.ToString());
        }
        public static DataTable MostrarDocuJuicioEstandard_2(string id_cobranza)
        {
            BaseDatos baseDatos = new BaseDatos();
            StringBuilder stringBuilder = new StringBuilder();
            if (string.IsNullOrEmpty(id_cobranza))
            {
                id_cobranza = "0";
            }
            stringBuilder.Append(" select * ");
            stringBuilder.Append("   from DocuEstandard2");
            stringBuilder.Append("  where id_cobranza = " + Convert.ToInt64(id_cobranza));
            return baseDatos.getResultset(stringBuilder.ToString());
        }
        public static DataTable MostrarDocuJuicioEstandard_3(string id_cobranza)
        {
            BaseDatos baseDatos = new BaseDatos();
            StringBuilder stringBuilder = new StringBuilder();
            if (string.IsNullOrEmpty(id_cobranza))
            {
                id_cobranza = "0";
            }
            stringBuilder.Append(" select * ");
            stringBuilder.Append("   from DocuEstandard3");
            stringBuilder.Append("  where id_cobranza = " + Convert.ToInt64(id_cobranza));
            return baseDatos.getResultset(stringBuilder.ToString());
        }
        public static DataTable MostrarDocuJuicioEstandard_4(string id_cobranza)
        {
            BaseDatos baseDatos = new BaseDatos();
            StringBuilder stringBuilder = new StringBuilder();
            if (string.IsNullOrEmpty(id_cobranza))
            {
                id_cobranza = "0";
            }
            stringBuilder.Append(" select * ");
            stringBuilder.Append("   from DocuEstandard4");
            stringBuilder.Append("  where id_cobranza = " + Convert.ToInt64(id_cobranza));
            return baseDatos.getResultset(stringBuilder.ToString());
        }
        public static DataTable MostrarFonoDeudor(string rut_deudor)
        {
            BaseDatos baseDatos = new BaseDatos();
            StringBuilder stringBuilder = new StringBuilder();
            stringBuilder.Append("select rut_deudor, rsocial, nombres, apaterno, amaterno, fnacimiento, id_profesion, telefono1, celular1, telefono2, email, id_banco, ctacte, rut_usu_crea, fcreacion, case status when 'A' then 'Activo' else 'No activo' end status, rut_usu_modi, fmodificacion, ecivil, tipopersona ");
            stringBuilder.Append("   from deudores");
            stringBuilder.Append("  where rut_deudor = '" + rut_deudor + "' ");
            return baseDatos.getResultset(stringBuilder.ToString());
        }
        public static DataTable MostrarDocuPagare(string id_cobranza)
        {
            BaseDatos baseDatos = new BaseDatos();
            StringBuilder stringBuilder = new StringBuilder();
            if (string.IsNullOrEmpty(id_cobranza))
            {
                id_cobranza = "0";
            }
            stringBuilder.Append(" select urldocumento,observacion,nropagare,montodemanda,montotaldeuda,isnull(case convert(varchar(10),fmora,103) when '01/01/1900' then '' else convert(varchar(10),fmora,103) end ,'')fechamora ");
            stringBuilder.Append("   from docupagare ");
            stringBuilder.Append("  where id_cobranza  = " + Convert.ToInt64(id_cobranza));
            return baseDatos.getResultset(stringBuilder.ToString());
        }
        public static DataTable MostrarDocuPagareCON(string id_cobranza)
        {
            BaseDatos baseDatos = new BaseDatos();
            StringBuilder stringBuilder = new StringBuilder();
            if (string.IsNullOrEmpty(id_cobranza))
            {
                id_cobranza = "0";
            }
            stringBuilder.Append(" select montotaldeuda,isnull(case convert(varchar(10),fsuscripcion,103) when '01/01/1900' then '' else convert(varchar(10),fsuscripcion,103) end ,'')fsuscripcion,sumainisuscripcion,nrocuotas,tasainteres,urldocumento,observacion,nropagare,montodemanda,montotaldeuda,isnull(case convert(varchar(10),fmora,103) when '01/01/1900' then '' else convert(varchar(10),fmora,103) end ,'')fechamora ");
            stringBuilder.Append("   from docupagare ");
            stringBuilder.Append("  where id_cobranza  = " + Convert.ToInt64(id_cobranza));
            return baseDatos.getResultset(stringBuilder.ToString());
        }
        public static DataTable MostrarDoc_mutuo(string id_cobranza)
        {
            BaseDatos baseDatos = new BaseDatos();
            StringBuilder stringBuilder = new StringBuilder();
            if (string.IsNullOrEmpty(id_cobranza))
            {
                id_cobranza = "0";
            }
            stringBuilder.Append(" select nrodocumento,monto_cred_1_esc,monto_cred_2_esc,serie_let_cred,plazo_mutuo_mes,convert(varchar(10),fecha_1_venc,103)fecha_1_venc,taza_int_1_esc,taza_int_2_esc,n_1_div_impago,n_ult_div_impago,convert(varchar(10),fecha_liquidacion,103)fecha_liquidacion,monto_div_adeudado_uf,monto_div_adeudado_ps,convert(varchar(10),fecha_mora,103)fecha_mora,saldo_total_deuda_uf,total_adeudado,* ");
            stringBuilder.Append("   from mutuo ");
            stringBuilder.Append("  where id_cobranza  = " + Convert.ToInt64(id_cobranza));
            return baseDatos.getResultset(stringBuilder.ToString());
        }
        public static DataTable MostrarJuicioActividadesExhorto(string id_exhorto)
        {
            BaseDatos baseDatos = new BaseDatos();
            StringBuilder stringBuilder = new StringBuilder();
            if (string.IsNullOrEmpty(id_exhorto))
            {
                id_exhorto = "0";
            }
            stringBuilder.Append(" SELECT (select top 1 tex.descripcion from tramiteexhorto tex where aex.id_tramite_exh = tex.id_tramite_exh) tramite,");
            stringBuilder.Append(" convert(varchar(10),aex.fechatramite,103)fecha,");
            stringBuilder.Append(" aex.observacion\t");
            stringBuilder.Append(" FROM ActividadesExhorto aex");
            stringBuilder.Append(" WHERE aex.id_exhorto = " + Convert.ToInt64(id_exhorto));
            return baseDatos.getResultset(stringBuilder.ToString());
        }
        public static DataTable MostrarActividadesPrejudicial(string id_cobranza)
        {
            BaseDatos baseDatos = new BaseDatos();
            StringBuilder stringBuilder = new StringBuilder();
            if (string.IsNullOrEmpty(id_cobranza))
            {
                id_cobranza = "0";
            }
            stringBuilder.Append(" select pre.observacion,isnull(case convert(varchar(10),pre.factividad,103) when '01/01/1900' then '' else convert(varchar(10),pre.factividad,103) end ,'') factividad,isnull(case convert(varchar(10),pre.fproxima,103) when '01/01/1900' then '' else convert(varchar(10),pre.fproxima,103) end ,'') fproxima, ");
            stringBuilder.Append(" isnull((select top 1 ap.descripcion    from ActividadesPrejudiciales ap where pre.id_act_prejudicial = ap.id_act_prejudicial),'')actividad, ");
            stringBuilder.Append(" isnull((select top 1 prox.descripcion  from ProximaActividadPreJudicial prox where pre.id_proxactprejudi = prox.id_proxactprejudi),'')prox ");
            stringBuilder.Append(" from prejudicial pre ");
            stringBuilder.Append(" where pre.id_cobranza = " + Convert.ToInt64(id_cobranza));
            return baseDatos.getResultset(stringBuilder.ToString());
        }
        public static DataTable MostrarDetalleGastos(string id_juicio)
        {
            BaseDatos baseDatos = new BaseDatos();
            StringBuilder stringBuilder = new StringBuilder();
            if (string.IsNullOrEmpty(id_juicio))
            {
                id_juicio = "0";
            }
            stringBuilder.Append(" SELECT ");
            stringBuilder.Append("     gas.gasto,");
            stringBuilder.Append("     gas.desgasto,");
            stringBuilder.Append("     convert(varchar(10),gas.fechagasto,103) fechagasto,");
            stringBuilder.Append("     case gas.gasto when 'Administrativo' then gas.montogastoadmin when 'Judicial' then gas.montogastojudi when 'PreJudicial' then gas.montogastopre end montogasto, ");
            stringBuilder.Append(" nom_responsable,");
            stringBuilder.Append(" nroboleta,");
            stringBuilder.Append(" nomina,");
            stringBuilder.Append(" convert(varchar(10),gas.fnomina,103) fnomina,");
            stringBuilder.Append(" case estadogasto when 1 then 'Pagado' when 2 then 'Pendiente' when 3 then 'Rechazado' else '' end estagasto ,");
            stringBuilder.Append(" convert(varchar(10),fechaestadogasto,103)fechaestagasto ");
            stringBuilder.Append("FROM  gastos gas ");
            stringBuilder.Append("WHERE  gas.id_cobranza =  " + Convert.ToInt64(id_juicio));
            return baseDatos.getResultset(stringBuilder.ToString());
        }
        public static DataTable BuscarActividad(string id_juicio)
        {
            BaseDatos baseDatos = new BaseDatos();
            StringBuilder stringBuilder = new StringBuilder();
            if (string.IsNullOrEmpty(id_juicio))
            {
                id_juicio = "0";
            }
            stringBuilder.Append(" SELECT max(id_tramite) id_tramite,max(id_actividad) id_actividad ");
            stringBuilder.Append(" FROM actividadesjudiciales  ");
            stringBuilder.Append(" WHERE id_juicios  = " + Convert.ToInt64(id_juicio));
            return baseDatos.getResultset(stringBuilder.ToString());
        }
        public static DataTable GENBuscarActividad(string id_juicio)
        {
            BaseDatos baseDatos = new BaseDatos();
            StringBuilder stringBuilder = new StringBuilder();
            if (string.IsNullOrEmpty(id_juicio))
            {
                id_juicio = "0";
            }
            stringBuilder.Append(" SELECT id_tramite,indice ");
            stringBuilder.Append(" FROM actividadesjudiciales  ");
            stringBuilder.Append(" WHERE id_juicios  = " + Convert.ToInt64(id_juicio));
            return baseDatos.getResultset(stringBuilder.ToString());
        }
        public static DataTable GENBuscarActividad(string id_juicio, string max)
        {
            BaseDatos baseDatos = new BaseDatos();
            StringBuilder stringBuilder = new StringBuilder();
            if (string.IsNullOrEmpty(id_juicio))
            {
                id_juicio = "0";
            }
            stringBuilder.Append(" SELECT max(indice)indice,max(id_tramite)id_tramite ");
            stringBuilder.Append(" FROM actividadesjudiciales  ");
            stringBuilder.Append(" WHERE id_juicios  = " + Convert.ToInt64(id_juicio));
            return baseDatos.getResultset(stringBuilder.ToString());
        }
        public static DataTable BuscarActividadExhorto(string id_exhorto, string id_tramite_exh, string fexhorto)
        {
            BaseDatos baseDatos = new BaseDatos();
            StringBuilder stringBuilder = new StringBuilder();
            if (string.IsNullOrEmpty(id_exhorto))
            {
                id_exhorto = "0";
            }
            if (string.IsNullOrEmpty(id_tramite_exh))
            {
                id_tramite_exh = "0";
            }
            stringBuilder.Append(" SELECT id_actividad_exhorto ");
            stringBuilder.Append("  FROM ActividadesExhorto ");
            stringBuilder.Append(" WHERE id_exhorto = " + Convert.ToInt64(id_exhorto) + " AND ");
            stringBuilder.Append("       id_tramite_exh = " + Convert.ToInt64(id_tramite_exh) + " AND ");
            stringBuilder.Append("       convert(varchar(10),fechatramite,103) = '" + fexhorto.Replace("-", "/") + "'");
            return baseDatos.getResultset(stringBuilder.ToString());
        }
        public static DataTable BuscarExhortoDupli(string id_juicios, string id_tribunal, string rol_exhorto)
        {
            BaseDatos baseDatos = new BaseDatos();
            StringBuilder stringBuilder = new StringBuilder();
            if (string.IsNullOrEmpty(id_juicios))
            {
                id_juicios = "0";
            }
            if (string.IsNullOrEmpty(id_tribunal))
            {
                id_tribunal = "0";
            }
            stringBuilder.Append(" SELECT id_exhorto  ");
            stringBuilder.Append("  FROM exhorto ");
            stringBuilder.Append(" WHERE id_juicios = " + Convert.ToInt64(id_juicios) + " AND ");
            stringBuilder.Append("       id_tribunal = " + Convert.ToInt64(id_tribunal) + " AND ");
            stringBuilder.Append("       rtrim(ltrim(rol_exhorto)) = '" + rol_exhorto.Trim() + "'");
            return baseDatos.getResultset(stringBuilder.ToString());
        }
        public static DataTable BuscarCobranzaByIdCobranza(string id_Cobranza)
        {
            BaseDatos baseDatos = new BaseDatos();
            StringBuilder stringBuilder = new StringBuilder();
            if (string.IsNullOrEmpty(id_Cobranza))
            {
                id_Cobranza = "0";
            }
            stringBuilder.Append("  select cob.id_producto,");
            stringBuilder.Append("         (select top 1 ppre.descripcion from productopre ppre where cob.id_producto = ppre.id_producto)desproducto ,");
            stringBuilder.Append(" \t    cob.rut_deudor,");
            stringBuilder.Append("         (select top 1 deu.rsocial from deudores deu where cob.rut_deudor = deu.rut_deudor)deudor ,");
            stringBuilder.Append("         (select top 1 cli.rsocial from clientes cli where cob.rut_cli = cli.rut_cli)cliente ,");
            stringBuilder.Append("         cob.nrooperacion");
            stringBuilder.Append("  from \tcobranza cob where cob.id_cobranza = " + Convert.ToInt64(id_Cobranza));
            return baseDatos.getResultset(stringBuilder.ToString());
        }
        public static DataTable BuscarSubTramite(string id_Actividad)
        {
            BaseDatos baseDatos = new BaseDatos();
            StringBuilder stringBuilder = new StringBuilder();
            if (string.IsNullOrEmpty(id_Actividad))
            {
                id_Actividad = "0";
            }
            stringBuilder.Append(" SELECT id_sub_tramite,fsubtramite");
            stringBuilder.Append(" FROM actividadesjudiciales  ");
            stringBuilder.Append(" WHERE id_actividad  = " + Convert.ToInt64(id_Actividad));
            return baseDatos.getResultset(stringBuilder.ToString());
        }
        public static DataTable VerRendicion(string id_cobranza, string id_abono)
        {
            BaseDatos baseDatos = new BaseDatos();
            StringBuilder stringBuilder = new StringBuilder();
            if (string.IsNullOrEmpty(id_cobranza))
            {
                id_cobranza = "0";
            }
            if (string.IsNullOrEmpty(id_abono))
            {
                id_abono = "0";
            }
            stringBuilder.Append(" select id_rendicion, id_abono, id_cobranza, monto, convert(varchar(10),fproceso,103)fproceso, username");
            stringBuilder.Append(" FROM Rendiciones  ");
            stringBuilder.Append(string.Concat(new object[]
			{
				" WHERE id_cobranza  = ",
				Convert.ToInt64(id_cobranza),
				" and id_abono = ",
				Convert.ToInt64(id_abono.ToString())
			}));
            return baseDatos.getResultset(stringBuilder.ToString());
        }
        public static DataTable MuestraEdicionGasto(string OT)
        {
            BaseDatos baseDatos = new BaseDatos();
            StringBuilder stringBuilder = new StringBuilder();
            if (string.IsNullOrEmpty(OT))
            {
                OT = "0";
            }
            stringBuilder.Append(" select id_tipo_gasto,id_gasto, OT, (select top 1 rg.descripcion  from ReconstitucionesTipoGastos rg where rg.id =   id_tipo_gasto)tipogasto,case id_forma_pago when 1 then 'EFECTIVO' when 2 then 'CHEQUE' else 'TRANSFERENCIA ELECTRONICA' end formapago,nrodocumento, montogasto, observacion, usuario, convert(varchar(10),fproceso,103)proceso, UPPER(estadogasto)estadogasto ");
            stringBuilder.Append(" FROM ReconstitucionesGastos  ");
            stringBuilder.Append(" WHERE ot  = " + Convert.ToDecimal(OT));
            return baseDatos.getResultset(stringBuilder.ToString());
        }
        public static object BuscarSubTramiteRegistrado(string id_juicios, string id_sub_tramite, string fsubtramite, string id_tramite)
        {
            BaseDatos baseDatos = new BaseDatos();
            StringBuilder stringBuilder = new StringBuilder();
            string str;
            if (string.IsNullOrEmpty(fsubtramite))
            {
                str = "";
            }
            else
            {
                str = fsubtramite;
            }
            if (string.IsNullOrEmpty(id_juicios))
            {
                id_juicios = "0";
            }
            if (string.IsNullOrEmpty(id_sub_tramite))
            {
                id_sub_tramite = "0";
            }
            if (string.IsNullOrEmpty(id_tramite))
            {
                id_tramite = "0";
            }
            stringBuilder.Append(" SELECT id_actividad");
            stringBuilder.Append(" FROM actividadesjudiciales  ");
            stringBuilder.Append(" WHERE id_juicios  = " + Convert.ToInt64(id_juicios));
            stringBuilder.Append(" AND id_sub_tramite  = " + Convert.ToInt64(id_sub_tramite));
            stringBuilder.Append(" AND convert(datetime,fsubtramite,103) = '" + str + "'");
            stringBuilder.Append(" AND id_tramite  = " + Convert.ToInt64(id_tramite));
            return baseDatos.getRowValue(stringBuilder.ToString());
        }
    }


}//namespace
