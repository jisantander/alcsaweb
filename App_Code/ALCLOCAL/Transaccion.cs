using System;
using System.Data;
using System.Configuration;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Globalization;
using System.Text;
using ALCGLOBAL;

namespace ALCLOCAL
{
    public class Transaccion
    {
        public static void LimpiaReconstituciones()
        {
            BaseDatos baseDatos = new BaseDatos();
            baseDatos.SQLExecute("delete from reconstituciones");
        }
        public static void LimpiaTablas()
        {
            BaseDatos baseDatos = new BaseDatos();
            baseDatos.SQLExecute("delete from bienraiz");
            baseDatos.SQLExecute("delete from cobranza");
            baseDatos.SQLExecute("delete from mutuo");
        }
        public static void InsertaCliente(string Rut, string RSocial, string Domicilio, string Telefono, string Fax, string Email, string RutRepre, string Repre, string idComuna, string idRegion, string numero, string nombres, string apaterno, string amaterno, string tipopersona)
        {
            if (string.IsNullOrEmpty(numero))
            {
                numero = "0";
            }
            if (string.IsNullOrEmpty(idComuna))
            {
                idComuna = "0";
            }
            if (string.IsNullOrEmpty(RSocial))
            {
                RSocial = string.Concat(new string[]
				{
					nombres,
					" ",
					apaterno,
					" ",
					amaterno
				});
            }
            StringBuilder stringBuilder = new StringBuilder();
            stringBuilder.Append(" INSERT INTO clientes(");
            stringBuilder.Append(" rut_cli,");
            stringBuilder.Append(" rsocial,");
            stringBuilder.Append(" domicilio,");
            stringBuilder.Append(" telefono,");
            stringBuilder.Append(" fax,");
            stringBuilder.Append(" email,");
            stringBuilder.Append(" representante_rut,");
            stringBuilder.Append(" representante,");
            stringBuilder.Append(" id_region,");
            stringBuilder.Append(" id_comuna,");
            stringBuilder.Append(" numero,");
            stringBuilder.Append(" status,");
            stringBuilder.Append(" nombres,");
            stringBuilder.Append(" apaterno,");
            stringBuilder.Append(" amaterno,");
            stringBuilder.Append(" tipopersona");
            stringBuilder.Append(" ) VALUES(");
            stringBuilder.Append(" '" + Rut.Trim().ToUpper() + "',");
            stringBuilder.Append(" '" + RSocial.Trim().ToUpper() + "',");
            stringBuilder.Append(" '" + Domicilio.Trim().ToUpper() + "',");
            stringBuilder.Append(" '" + Telefono.Trim() + "',");
            stringBuilder.Append(" '" + Fax.Trim() + "',");
            stringBuilder.Append(" '" + Email.Trim() + "',");
            stringBuilder.Append(" '" + RutRepre.Trim() + "',");
            stringBuilder.Append(" '" + Repre.Trim().ToUpper() + "' ,");
            stringBuilder.Append(" " + Convert.ToInt16(idRegion) + ",");
            stringBuilder.Append(" " + Convert.ToInt16(idComuna) + ",");
            stringBuilder.Append(" " + Convert.ToInt64(numero) + ",");
            stringBuilder.Append(" 'A' ,");
            stringBuilder.Append(" '" + nombres.Trim().ToUpper() + "',");
            stringBuilder.Append(" '" + apaterno.Trim().ToUpper() + "',");
            stringBuilder.Append(" '" + amaterno.Trim().ToUpper() + "',");
            stringBuilder.Append(" '" + tipopersona.Trim().ToUpper() + "'");
            stringBuilder.Append(" )");
            BaseDatos baseDatos = new BaseDatos();
            baseDatos.SQLExecute(stringBuilder.ToString());
        }
        public static void InsertaRemesaManual(string subproducto, string prod, string nrooperacion, string rutcliente, string dv, string nombrecliente, string direccion, string comuna, string fechaestado, string fecha_remesa, string fechaentrega, decimal remesa, string usuariocarga,DateTime FechaContabilizacion)
        {
            StringBuilder stringBuilder = new StringBuilder();
            stringBuilder.Append(" insert into Reconstituciones(");
            stringBuilder.Append(" subproducto,");
            stringBuilder.Append(" prod,");
            stringBuilder.Append(" nrooperacion,");
            stringBuilder.Append(" rutcliente,");
            stringBuilder.Append(" dv,");
            stringBuilder.Append(" nombrecliente,");
            stringBuilder.Append(" direccion,");
            stringBuilder.Append(" comuna,");
            stringBuilder.Append(" codigoestado,");
            stringBuilder.Append(" fechaestado,");
            stringBuilder.Append(" fecha_remesa,");
            stringBuilder.Append(" fechaentrega,");
            stringBuilder.Append(" remesa,");
            stringBuilder.Append(" estado_ot,");
            stringBuilder.Append(" usuario_carga,");
            stringBuilder.Append(" fechacontabilizacion");

            stringBuilder.Append(" ) VALUES(");
            stringBuilder.Append(" '" + subproducto.Trim().ToUpper() + "',");
            stringBuilder.Append(" '" + prod.Trim().ToUpper() + "',");
            stringBuilder.Append(" '" + nrooperacion.Trim().ToUpper() + "',");
            stringBuilder.Append(" '" + rutcliente.Trim().ToUpper() + "',");
            stringBuilder.Append(" '" + dv.Trim().ToUpper() + "',");
            stringBuilder.Append(" '" + nombrecliente.Trim().ToUpper() + "',");
            stringBuilder.Append(" '" + direccion.Trim().ToUpper() + "',");
            stringBuilder.Append(" '" + comuna.Trim().ToUpper() + "',");
            stringBuilder.Append(" '100',");
            stringBuilder.Append(" convert(datetime,'" + fechaestado.Trim().ToUpper() + "' ,103)" +",");
            stringBuilder.Append(" convert(datetime,'" + fecha_remesa.Trim().ToUpper() + "' ,103)" + ",");
            stringBuilder.Append(" convert(datetime,'" + fechaentrega.Trim().ToUpper() + "' ,103)" + ",");
            stringBuilder.Append(" " + remesa + ",");
            stringBuilder.Append(" '1',");
            stringBuilder.Append(" '" + usuariocarga.Trim() + "',");
            stringBuilder.Append(" convert(datetime,'" + FechaContabilizacion.ToString("dd/MM/yyyy").Trim() + "' ,103)");
            stringBuilder.Append(" )");
            BaseDatos baseDatos = new BaseDatos();
            baseDatos.SQLExecute(stringBuilder.ToString());
        }
        public static void InsertaReconstitucion(string subproducto, string prod, string TipoDoc, string nrooperacion, string rutcliente, string dv, string nombrecliente, string direccion, string comuna, string conservador, string region, string fojasdominio, string numerodominio, string aniodominio, string fojashipoteca, string numerohipoteca, string aniohipoteca, string fojasprohibicion, string numeroprohibicion, string anioprohibicion, string fechacontabilizacion, string fechaentrega, string fechaescritura, string notaria, string comunanotaria, string reportorio, string protocolo, string codigoestado, string estado, string fechaestado, string observacion, string nrocarillas, string factura, string fechafactura, string montofactura, string fecha_producto, string producto, string centrocosto)
        {
            if (string.IsNullOrEmpty(montofactura))
            {
                montofactura = "0";
            }
            StringBuilder stringBuilder = new StringBuilder();
            stringBuilder.Append(" INSERT INTO [dbo].[Reconstituciones]");
            stringBuilder.Append(" ([subproducto]");
            stringBuilder.Append(" ,[prod]");
            stringBuilder.Append(" ,[TipoDoc]");
            stringBuilder.Append(" ,[nrooperacion]");
            stringBuilder.Append(" ,[rutcliente]");
            stringBuilder.Append(" ,[dv]");
            stringBuilder.Append(" ,[nombrecliente]");
            stringBuilder.Append(" ,[direccion]");
            stringBuilder.Append(" ,[comuna]");
            stringBuilder.Append(" ,[conservador]");
            stringBuilder.Append(" ,[region]");
            stringBuilder.Append(" ,[fojasdominio]");
            stringBuilder.Append(" ,[numerodominio]");
            stringBuilder.Append(" ,[aniodominio]");
            stringBuilder.Append(" ,[fojashipoteca]");
            stringBuilder.Append(" ,[numerohipoteca]");
            stringBuilder.Append(" ,[aniohipoteca]");
            stringBuilder.Append(" ,[fojasprohibicion]");
            stringBuilder.Append(" ,[numeroprohibicion]");
            stringBuilder.Append(" ,[anioprohibicion]");
            stringBuilder.Append(" ,[fechacontabilizacion]");
            stringBuilder.Append(" ,[fechaentrega]");
            stringBuilder.Append(" ,[fechaescritura]");
            stringBuilder.Append(" ,[notaria]");
            stringBuilder.Append(" ,[comunanotaria]");
            stringBuilder.Append(" ,[reportorio]");
            stringBuilder.Append(" ,[protocolo]");
            stringBuilder.Append(" ,[codigoestado]");
            stringBuilder.Append(" ,[estado]");
            stringBuilder.Append(" ,[fechaestado]");
            stringBuilder.Append(" ,[observacion]");
            stringBuilder.Append(" ,[nrocarillas]");
            stringBuilder.Append(" ,[factura]");
            stringBuilder.Append(" ,[fechafactura]");
            stringBuilder.Append(" ,[montofactura]");
            stringBuilder.Append(" ,[fecha_producto]");
            stringBuilder.Append(" ,[producto]");
            stringBuilder.Append(" ,[centrocosto])");
            stringBuilder.Append("  VALUES(");
            stringBuilder.Append(" '" + subproducto.Trim() + "',");
            stringBuilder.Append(" '" + prod.Trim() + "',");
            stringBuilder.Append(" '" + TipoDoc.Trim() + "',");
            stringBuilder.Append(" '" + nrooperacion.Trim() + "',");
            stringBuilder.Append(" '" + rutcliente.Trim() + "',");
            stringBuilder.Append(" '" + dv.Trim() + "',");
            stringBuilder.Append(" '" + nombrecliente.Trim() + "',");
            stringBuilder.Append(" '" + direccion.Trim() + "',");
            stringBuilder.Append(" '" + comuna.Trim() + "',");
            stringBuilder.Append(" '" + conservador.Trim() + "',");
            stringBuilder.Append(" '" + region.Trim() + "',");
            stringBuilder.Append(" '" + fojasdominio.Trim() + "',");
            stringBuilder.Append(" '" + numerodominio.Trim() + "',");
            stringBuilder.Append(" '" + aniodominio.Trim() + "',");
            stringBuilder.Append(" '" + fojashipoteca.Trim() + "',");
            stringBuilder.Append(" '" + numerohipoteca.Trim() + "',");
            stringBuilder.Append(" '" + aniohipoteca.Trim() + "',");
            stringBuilder.Append(" '" + fojasprohibicion.Trim() + "',");
            stringBuilder.Append(" '" + numeroprohibicion.Trim() + "',");
            stringBuilder.Append(" '" + anioprohibicion.Trim() + "',");
            if (string.IsNullOrEmpty(fechacontabilizacion))
            {
                stringBuilder.Append(" null,");
            }
            else
            {
                stringBuilder.Append(" convert(datetime,'" + fechacontabilizacion.Trim() + "' ,103),");
            }
            if (string.IsNullOrEmpty(fechaentrega))
            {
                stringBuilder.Append(" null,");
            }
            else
            {
                stringBuilder.Append(" convert(datetime,'" + fechaentrega.Trim() + "',103) ,");
            }
            if (string.IsNullOrEmpty(fechaescritura))
            {
                stringBuilder.Append(" null,");
            }
            else
            {
                stringBuilder.Append(" convert(datetime,'" + fechaescritura.Trim() + "',103) ,");
            }
            stringBuilder.Append(" '" + notaria.Trim() + "',");
            stringBuilder.Append(" '" + comunanotaria.Trim() + "',");
            stringBuilder.Append(" '" + reportorio.Trim() + "',");
            stringBuilder.Append(" '" + protocolo.Trim() + "',");
            stringBuilder.Append(" '" + codigoestado.Trim() + "',");
            stringBuilder.Append(" '" + estado.Trim() + "',");
            if (string.IsNullOrEmpty(fechaestado))
            {
                stringBuilder.Append(" null,");
            }
            else
            {
                stringBuilder.Append(" convert(datetime,'" + fechaestado.Trim() + "',103) ,");
            }
            stringBuilder.Append(" '" + observacion.Trim() + "',");
            stringBuilder.Append(" '" + nrocarillas.Trim() + "',");
            stringBuilder.Append(" '" + factura.Trim() + "',");
            if (string.IsNullOrEmpty(fechafactura))
            {
                stringBuilder.Append(" null,");
            }
            else
            {
                stringBuilder.Append(" convert(datetime,'" + fechafactura.Trim() + "',103) ,");
            }
            stringBuilder.Append(" " + Convert.ToDecimal(montofactura) + ",");
            if (string.IsNullOrEmpty(fecha_producto))
            {
                stringBuilder.Append(" null,");
            }
            else
            {
                stringBuilder.Append(" convert(datetime,'" + fecha_producto.Trim() + "',103) ,");
            }
            stringBuilder.Append(" '" + producto.Trim() + "',");
            stringBuilder.Append(" '" + centrocosto.Trim() + "'");
            stringBuilder.Append(" )");
            BaseDatos baseDatos = new BaseDatos();
            baseDatos.SQLExecute(stringBuilder.ToString());
        }
        public static void InsertaReconstitucion(string subproducto, string prod, string nrooperacion, string rutcliente, string dv, string nombrecliente, string direccion, string comuna, string conservador, string region, string fechacontabilizacion, string codigoestado, string fechaestado, string fecha_remesa, string remesa, string fecha_entrega, string usuario_carga, string centroCosto)
        {
            StringBuilder stringBuilder = new StringBuilder();
            stringBuilder.Append(" INSERT INTO [dbo].[Reconstituciones] (");
            stringBuilder.Append("  [subproducto]");
            stringBuilder.Append(" ,[prod]");
            stringBuilder.Append(" ,[nrooperacion]");
            stringBuilder.Append(" ,[rutcliente]");
            stringBuilder.Append(" ,[dv]");
            stringBuilder.Append(" ,[nombrecliente]");
            stringBuilder.Append(" ,[direccion]");
            stringBuilder.Append(" ,[comuna]");
            stringBuilder.Append(" ,[conservador]");
            stringBuilder.Append(" ,[region]");
            stringBuilder.Append(" ,[fechacontabilizacion]");
            stringBuilder.Append(" ,[codigoestado]");
            stringBuilder.Append(" ,[fechaestado]");
            stringBuilder.Append(" ,[fecha_remesa]");
            stringBuilder.Append(" ,[remesa]");
            stringBuilder.Append(" ,[fechaentrega]");
            stringBuilder.Append(" ,[estado_ot]");
            stringBuilder.Append(" ,[usuario_carga]");
            stringBuilder.Append(" ,[centro_costo]");

            stringBuilder.Append(" )");
            stringBuilder.Append("  VALUES(");
            stringBuilder.Append(" '" + subproducto.Trim() + "',");
            stringBuilder.Append(" '" + prod.Trim() + "',");
            stringBuilder.Append(" '" + nrooperacion.Trim() + "',");
            stringBuilder.Append(" '" + rutcliente.Trim() + "',");
            stringBuilder.Append(" '" + dv.Trim() + "',");
            stringBuilder.Append(" '" + nombrecliente.Trim() + "',");
            stringBuilder.Append(" '" + direccion.Trim() + "',");
            stringBuilder.Append(" '" + comuna.Trim() + "',");
            stringBuilder.Append(" '" + conservador.Trim() + "',");
            stringBuilder.Append(" '" + region.Trim() + "',");
            if (string.IsNullOrEmpty(fechacontabilizacion))
                stringBuilder.Append(" null,");
            else stringBuilder.Append(" convert(datetime,'" + fechacontabilizacion.Trim() + "' ,103),");

            stringBuilder.Append(" '" + codigoestado.Trim() + "',");
            if (string.IsNullOrEmpty(fechaestado))
                stringBuilder.Append(" null,");
            else stringBuilder.Append(" convert(datetime,'" + fechaestado.Trim() + "',103) ,");

            if (string.IsNullOrEmpty(fecha_remesa))
                stringBuilder.Append(" null,");
            else stringBuilder.Append(" convert(datetime,'" + fecha_remesa.Trim() + "',103) ,");

            stringBuilder.Append(" " + Convert.ToDouble(remesa) + ",");
            stringBuilder.Append(" convert(datetime,'" + fecha_entrega.Trim() + "',103) ,");
            stringBuilder.Append(" '1',");
            stringBuilder.Append(" '" + usuario_carga.ToString() + "',");
            stringBuilder.AppendFormat("'{0}'", centroCosto);

            stringBuilder.Append(" )");
            BaseDatos baseDatos = new BaseDatos();
            baseDatos.SQLExecute(stringBuilder.ToString());
        }
        public static void ActualizarCliente(string rut_cli, string RSocial, string Domicilio, string Telefono, string Fax, string Email, string RutRepre, string Repre, string Numero, string idRegion, string idComuna, string nombres, string apaterno, string amaterno, string tipopersona)
        {
            if (string.IsNullOrEmpty(Numero))
            {
                Numero = "0";
            }
            if (string.IsNullOrEmpty(idComuna))
            {
                idComuna = "0";
            }
            if (tipopersona == "N")
            {
                RSocial = string.Concat(new string[]
				{
					nombres,
					" ",
					apaterno,
					" ",
					amaterno
				});
            }
            StringBuilder stringBuilder = new StringBuilder();
            stringBuilder.Append(" UPDATE Clientes SET ");
            stringBuilder.Append(" rsocial = '" + RSocial.Trim().ToUpper() + "' ,");
            stringBuilder.Append(" nombres = '" + nombres.Trim().ToUpper() + "' ,");
            stringBuilder.Append(" apaterno = '" + apaterno.Trim().ToUpper() + "' ,");
            stringBuilder.Append(" amaterno = '" + amaterno.Trim().ToUpper() + "' ,");
            stringBuilder.Append(" tipopersona = '" + tipopersona.Trim().ToUpper() + "' ,");
            stringBuilder.Append(" domicilio = '" + Domicilio.Trim().ToUpper() + "' ,");
            stringBuilder.Append(" telefono = '" + Telefono.Trim() + "' ,");
            stringBuilder.Append(" fax = '" + Fax.Trim() + "' ,");
            stringBuilder.Append(" email = '" + Email.Trim() + "' ,");
            stringBuilder.Append(" representante_rut = '" + RutRepre.Trim() + "' ,");
            stringBuilder.Append(" representante = '" + Repre.Trim().ToUpper() + "' ,");
            stringBuilder.Append(" numero = " + Convert.ToInt64(Numero) + " ,");
            stringBuilder.Append(" id_region = " + Convert.ToInt32(idRegion) + " ,");
            stringBuilder.Append(" id_comuna = " + Convert.ToInt32(idComuna) + " ");
            stringBuilder.Append(" WHERE");
            stringBuilder.Append(" ltrim(rtrim(rut_cli)) = '" + rut_cli.Trim() + "' ");
            BaseDatos baseDatos = new BaseDatos();
            baseDatos.SQLExecute(stringBuilder.ToString());
        }
        public static void ActualizarRendicionAbonos(string id_abono, string id_cobranza, string swmonto, string swInteres, string swGastos, string swint_adic, string swhonorarios, string swdesc_honorarios, string swdesc_interes, string swOtros_desc, long contador)
        {
            if (string.IsNullOrEmpty(id_abono))
            {
                id_abono = "0";
            }
            if (string.IsNullOrEmpty(id_cobranza))
            {
                id_cobranza = "0";
            }
            StringBuilder stringBuilder = new StringBuilder();
            stringBuilder.Append(" update\tabonos");
            stringBuilder.Append("    set\t");
            if (swmonto == null)
            {
                stringBuilder.Append("     swmonto = null,");
            }
            else
            {
                stringBuilder.Append("        swmonto = 'S',");
            }
            if (swInteres == null)
            {
                stringBuilder.Append(" \t   swInteres = null,");
            }
            else
            {
                stringBuilder.Append(" \t   swInteres = 'S',");
            }
            if (swGastos == null)
            {
                stringBuilder.Append(" \t   swgasto = null,");
            }
            else
            {
                stringBuilder.Append(" \t   swgasto = 'S',");
            }
            if (swint_adic == null)
            {
                stringBuilder.Append(" \t   swint_adic = null,");
            }
            else
            {
                stringBuilder.Append(" \t   swint_adic = 'S',");
            }
            if (swhonorarios == null)
            {
                stringBuilder.Append(" \t   swhonorarios = null,");
            }
            else
            {
                stringBuilder.Append(" \t   swhonorarios = 'S',");
            }
            if (swdesc_honorarios == null)
            {
                stringBuilder.Append(" \t   swdesc_honorarios = null,");
            }
            else
            {
                stringBuilder.Append(" \t   swdesc_honorarios = 'S',");
            }
            if (swdesc_interes == null)
            {
                stringBuilder.Append(" \t   swdesc_interes = null,");
            }
            else
            {
                stringBuilder.Append(" \t   swdesc_interes = 'S',");
            }
            if (swOtros_desc == null)
            {
                stringBuilder.Append(" \t   swOtros_desc = null,");
            }
            else
            {
                stringBuilder.Append(" \t   swOtros_desc = 'S',");
            }
            if (contador != 8L)
            {
                stringBuilder.Append(" \t   rendicion = null");
            }
            else
            {
                stringBuilder.Append(" \t   rendicion = 'S'");
            }
            stringBuilder.Append(" where  id_abono = " + Convert.ToInt64(id_abono) + "  and");
            stringBuilder.Append("        id_cobranza = " + Convert.ToInt64(id_cobranza));
            BaseDatos baseDatos = new BaseDatos();
            baseDatos.SQLExecute(stringBuilder.ToString());
        }
        public static void ActualizarParametros(double txttasacorriente, double txttasaconvencional, double txttasaadicional, double txtHonorarios, string txtDescInteres, string txtDeschonorarios, string txtOtrosDesc)
        {
            if (string.IsNullOrEmpty(txtDescInteres))
            {
                txtDescInteres = "0";
            }
            if (string.IsNullOrEmpty(txtDeschonorarios))
            {
                txtDeschonorarios = "0";
            }
            if (string.IsNullOrEmpty(txtOtrosDesc))
            {
                txtOtrosDesc = "0";
            }
            StringBuilder stringBuilder = new StringBuilder();
            stringBuilder.Append(" UPDATE parametros SET ");
            stringBuilder.Append(" TasaInteres = " + txttasacorriente + " ,");
            stringBuilder.Append(" TasaMaxConvencional = " + txttasaconvencional + " ,");
            stringBuilder.Append(" TasaAdicional = " + txttasaadicional + " ,");
            stringBuilder.Append(" Honorarios = " + txtHonorarios + " ,");
            stringBuilder.Append(" DescIntereses = " + Convert.ToInt64(txtDescInteres) + " ,");
            stringBuilder.Append(" DescHonorarios = " + Convert.ToInt64(txtDeschonorarios) + " ,");
            stringBuilder.Append(" OtrosDescuentos = " + Convert.ToInt64(txtOtrosDesc));
            BaseDatos baseDatos = new BaseDatos();
            baseDatos.SQLExecute(stringBuilder.ToString());
        }
        public static void UpdParametros(string usuario, string rut_cli, string txttasacorriente, string txttasaconvencional, string txttasaadicional, string txtHonorarios, string txtDescInteres, string txtDeschonorarios, string txtOtrosDesc)
        {
            if (string.IsNullOrEmpty(txttasacorriente))
            {
                txttasacorriente = "0";
            }
            if (string.IsNullOrEmpty(txttasaconvencional))
            {
                txttasaconvencional = "0";
            }
            if (string.IsNullOrEmpty(txttasaadicional))
            {
                txttasaadicional = "0";
            }
            if (string.IsNullOrEmpty(txtHonorarios))
            {
                txtHonorarios = "0";
            }
            if (string.IsNullOrEmpty(txtDescInteres))
            {
                txtDescInteres = "0";
            }
            if (string.IsNullOrEmpty(txtDeschonorarios))
            {
                txtDeschonorarios = "0";
            }
            if (string.IsNullOrEmpty(txtOtrosDesc))
            {
                txtOtrosDesc = "0";
            }
            StringBuilder stringBuilder = new StringBuilder();
            stringBuilder.Append(" UPDATE ParametrosCliente SET ");
            stringBuilder.Append(" TasaInteres = " + Convert.ToDouble(txttasacorriente) + " ,");
            stringBuilder.Append(" TasaMaxConvencional = " + Convert.ToDouble(txttasaconvencional) + " ,");
            stringBuilder.Append(" TasaAdicional = " + Convert.ToDouble(txttasaadicional) + " ,");
            stringBuilder.Append(" Honorarios = " + Convert.ToDouble(txtHonorarios) + " ,");
            stringBuilder.Append(" DescIntereses = " + Convert.ToInt64(txtDescInteres) + " ,");
            stringBuilder.Append(" DescHonorarios = " + Convert.ToInt64(txtDeschonorarios) + " ,");
            stringBuilder.Append(" OtrosDescuentos = " + Convert.ToInt64(txtOtrosDesc) + ",");
            stringBuilder.Append(" usuario = '" + usuario.Trim() + "',");
            stringBuilder.Append(" fproceso = getdate() ");
            stringBuilder.Append(" WHERE rut_cli = '" + rut_cli.Trim() + "'");
            BaseDatos baseDatos = new BaseDatos();
            baseDatos.SQLExecute(stringBuilder.ToString());
        }
        public static void InsParametros(string usuario, string rut_cli, string txttasacorriente, string txttasaconvencional, string txttasaadicional, string txtHonorarios, string txtDescInteres, string txtDeschonorarios, string txtOtrosDesc)
        {
            if (string.IsNullOrEmpty(txttasacorriente))
            {
                txttasacorriente = "0";
            }
            if (string.IsNullOrEmpty(txttasaconvencional))
            {
                txttasaconvencional = "0";
            }
            if (string.IsNullOrEmpty(txttasaadicional))
            {
                txttasaadicional = "0";
            }
            if (string.IsNullOrEmpty(txtHonorarios))
            {
                txtHonorarios = "0";
            }
            if (string.IsNullOrEmpty(txtDescInteres))
            {
                txtDescInteres = "0";
            }
            if (string.IsNullOrEmpty(txtDeschonorarios))
            {
                txtDeschonorarios = "0";
            }
            if (string.IsNullOrEmpty(txtOtrosDesc))
            {
                txtOtrosDesc = "0";
            }
            StringBuilder stringBuilder = new StringBuilder();
            stringBuilder.Append(" INSERT INTO ParametrosCliente(rut_cli, Honorarios, TasaInteres, DescIntereses, DescHonorarios, OtrosDescuentos, TasaAdicional, TasaMaxConvencional,usuario,fproceso) ");
            stringBuilder.Append(" VALUES (");
            stringBuilder.Append("'" + rut_cli.Trim() + "',");
            stringBuilder.Append(Convert.ToDouble(txtHonorarios) + " ,");
            stringBuilder.Append(Convert.ToDouble(txttasacorriente) + " ,");
            stringBuilder.Append(Convert.ToInt64(txtDescInteres) + " ,");
            stringBuilder.Append(Convert.ToInt64(txtDeschonorarios) + " ,");
            stringBuilder.Append(Convert.ToInt64(txtOtrosDesc) + ",");
            stringBuilder.Append(Convert.ToDouble(txttasaadicional) + " ,");
            stringBuilder.Append(Convert.ToDouble(txttasaconvencional) + " ,");
            stringBuilder.Append("'" + usuario.Trim() + "',");
            stringBuilder.Append(" getdate() ");
            stringBuilder.Append(" )");
            BaseDatos baseDatos = new BaseDatos();
            baseDatos.SQLExecute(stringBuilder.ToString());
        }
        public static void EliminarCliente(string rut_cli)
        {
            StringBuilder stringBuilder = new StringBuilder();
            stringBuilder.Append(" UPDATE Clientes SET status = 'N' WHERE ltrim(rtrim(rut_cli)) = '" + rut_cli.Trim() + "' ");
            BaseDatos baseDatos = new BaseDatos();
            baseDatos.SQLExecute(stringBuilder.ToString());
        }
        public static void UPDImpreso(string id_rendicion)
        {
            if (string.IsNullOrEmpty(id_rendicion))
            {
                id_rendicion = "0";
            }
            StringBuilder stringBuilder = new StringBuilder();
            stringBuilder.Append(" UPDATE doc_rendicion SET impreso = 'S' WHERE id_rendicion = " + Convert.ToInt64(id_rendicion) + " ");
            BaseDatos baseDatos = new BaseDatos();
            baseDatos.SQLExecute(stringBuilder.ToString());
        }
        public static DataTable InsRendicion(string id_abono, string id_cobranza, string monto, string username)
        {
            if (string.IsNullOrEmpty(id_abono))
            {
                id_abono = "0";
            }
            if (string.IsNullOrEmpty(id_cobranza))
            {
                id_cobranza = "0";
            }
            if (string.IsNullOrEmpty(monto))
            {
                monto = "0";
            }
            StringBuilder stringBuilder = new StringBuilder();
            stringBuilder.Append(" INSERT INTO Rendiciones(id_abono, id_cobranza, monto, fproceso, username) ");
            stringBuilder.Append(" VALUES (");
            stringBuilder.Append(Convert.ToInt64(id_abono) + " ,");
            stringBuilder.Append(Convert.ToInt64(id_cobranza) + " ,");
            stringBuilder.Append(Convert.ToDouble(monto) + " ,");
            stringBuilder.Append(" getdate(), ");
            stringBuilder.Append("'" + username.Trim() + "'");
            stringBuilder.Append(" );Select @@Identity");
            BaseDatos baseDatos = new BaseDatos();
            return baseDatos.getResultset(stringBuilder.ToString());
        }
        public static void EliminarTelefono(string rut_cli)
        {
            StringBuilder stringBuilder = new StringBuilder();
            stringBuilder.Append(" UPDATE telefonos SET status = 'N' WHERE ltrim(rtrim(rut_dueno)) = '" + rut_cli.Trim().Replace(".", "") + "' ");
            BaseDatos baseDatos = new BaseDatos();
            baseDatos.SQLExecute(stringBuilder.ToString());
        }
        public static void EditarGastoReconst(string estadogasto, string observacion, string idgasto, string NroDocumento, string id_tipo_gasto, string id_forma_pago)
        {
            StringBuilder stringBuilder = new StringBuilder();
            stringBuilder.Append(string.Concat(new object[]
			{
				" update ReconstitucionesGastos set estadogasto = '",
				estadogasto.ToString(),
				"',observacion = '",
				observacion,
				"',nrodocumento = '",
				NroDocumento,
				"',id_tipo_gasto = ",
				Convert.ToDecimal(id_tipo_gasto),
				",id_forma_pago = ",
				Convert.ToDecimal(id_forma_pago),
				"  where id_gasto = ",
				Convert.ToInt64(idgasto)
			}));
            BaseDatos baseDatos = new BaseDatos();
            baseDatos.SQLExecute(stringBuilder.ToString());
        }
        public static void InsertaBitacoraGastosRecons(string estadogasto, string observacion, string usuario, string id_gasto, string nrodocumento, string idtipogasto)
        {
            StringBuilder stringBuilder = new StringBuilder();
            stringBuilder.Append(string.Concat(new object[]
			{
				"insert into ReconstitucionesBitacoraGastos (estadogasto, observacion, usuario,id_gasto, fproceso,nrodocumento,id_tipo_gasto) values ('",
				estadogasto.ToUpper(),
				"','",
				observacion,
				"','",
				usuario,
				"',",
				Convert.ToDecimal(id_gasto),
				",getdate(), '",
				nrodocumento,
				"', ",
				idtipogasto,
				")"
			}));
            BaseDatos baseDatos = new BaseDatos();
            baseDatos.SQLExecute(stringBuilder.ToString());
        }
        public static void EliminarGastoReconst(string id_gasto)
        {
            if (string.IsNullOrEmpty(id_gasto))
            {
                id_gasto = "0";
            }
            StringBuilder stringBuilder = new StringBuilder();
            stringBuilder.Append(" delete ReconstitucionesGastos where id_gasto = " + Convert.ToDecimal(id_gasto) + " ");
            BaseDatos baseDatos = new BaseDatos();
            baseDatos.SQLExecute(stringBuilder.ToString());
        }
        public static void EliminarConservador(string id_conservador)
        {
            if (string.IsNullOrEmpty(id_conservador))
            {
                id_conservador = "0";
            }
            StringBuilder stringBuilder = new StringBuilder();
            stringBuilder.Append(" delete Conservador where id_conservador = " + Convert.ToDecimal(id_conservador));
            BaseDatos baseDatos = new BaseDatos();
            baseDatos.SQLExecute(stringBuilder.ToString());
        }
        public static void ActualizarTelefono(string Rut, string vigencia, string telefono1, string celular1, string fax, string id_tipo_telefono)
        {
            if (string.IsNullOrEmpty(id_tipo_telefono))
            {
                id_tipo_telefono = "0";
            }
            StringBuilder stringBuilder = new StringBuilder();
            stringBuilder.Append(" UPDATE telefonos SET ");
            stringBuilder.Append(" vigencia = '" + vigencia.Trim().ToUpper() + "' ,");
            stringBuilder.Append(" telefono1 = '" + telefono1.Trim() + "' ,");
            stringBuilder.Append(" celular1 = '" + celular1.Trim() + "' ,");
            stringBuilder.Append(" fax = '" + fax.Trim() + "' ,");
            stringBuilder.Append(" id_tipo_telefono = " + Convert.ToInt64(id_tipo_telefono) + " ");
            stringBuilder.Append(" WHERE");
            stringBuilder.Append(" ltrim(rtrim(rut_dueno)) = '" + Rut.Trim() + "' ");
            BaseDatos baseDatos = new BaseDatos();
            baseDatos.SQLExecute(stringBuilder.ToString());
        }
        public static void InsertaTelefono(string Rut, string vigencia, string telefono1, string celular1, string fax, string id_tipo_telefono)
        {
            if (string.IsNullOrEmpty(id_tipo_telefono))
            {
                id_tipo_telefono = "0";
            }
            StringBuilder stringBuilder = new StringBuilder();
            stringBuilder.Append(" INSERT INTO telefonos(");
            stringBuilder.Append(" rut_dueno,");
            stringBuilder.Append(" vigencia,");
            stringBuilder.Append(" telefono1,");
            stringBuilder.Append(" celular1,");
            stringBuilder.Append(" fax,");
            stringBuilder.Append(" id_tipo_telefono,");
            stringBuilder.Append(" status");
            stringBuilder.Append(" ) VALUES(");
            stringBuilder.Append(" '" + Rut.Trim().ToUpper().Replace(".", "") + "',");
            stringBuilder.Append(" '" + vigencia.Trim().ToUpper() + "',");
            stringBuilder.Append(" '" + telefono1.Trim() + "',");
            stringBuilder.Append(" '" + celular1.Trim() + "',");
            stringBuilder.Append(" '" + fax.Trim() + "',");
            stringBuilder.Append(" " + Convert.ToInt64(id_tipo_telefono) + ",");
            stringBuilder.Append(" 'A' ");
            stringBuilder.Append(" )");
            BaseDatos baseDatos = new BaseDatos();
            baseDatos.SQLExecute(stringBuilder.ToString());
        }
        public static void UpdateReconstitucion(string OT, string subproducto, string prod, string TipoDoc, string nrooperacion, string rutcliente, string dv, string nombrecliente, string direccion, string comuna, string conservador, string region, string fojasdominio, string numerodominio, string aniodominio, string fojashipoteca, string numerohipoteca, string aniohipoteca, string fojasprohibicion, string numeroprohibicion, string anioprohibicion, string fechacontabilizacion, string fechaentrega, string fechaescritura, string notaria, string comunanotaria, string reportorio, string protocolo, string codigoestado, string estado, string fechaestado, string observacion, string nrocarillas, string factura, string fechafactura, string montofactura, string fecha_remesa, string remesa, string centrocosto, string user_responsable)
        {
            if (string.IsNullOrEmpty(OT))
            {
                OT = "0";
            }
            if (string.IsNullOrEmpty(montofactura))
            {
                montofactura = "0";
            }
            if (string.IsNullOrEmpty(remesa))
            {
                remesa = "0";
            }
            StringBuilder stringBuilder = new StringBuilder();
            stringBuilder.Append(" UPDATE reconstituciones SET ");
            stringBuilder.Append(" subproducto = '" + subproducto.Trim().ToUpper() + "' ,");
            stringBuilder.Append(" prod = '" + prod.Trim() + "' ,");
            stringBuilder.Append(" TipoDoc = '" + TipoDoc.Trim().ToUpper() + "' ,");
            stringBuilder.Append(" nrooperacion = '" + nrooperacion.Trim().ToUpper() + "' ,");
            stringBuilder.Append(" rutcliente = '" + rutcliente.Trim().ToUpper() + "' ,");
            stringBuilder.Append(" dv = '" + dv.Trim().ToUpper() + "' ,");
            stringBuilder.Append(" nombrecliente = '" + nombrecliente.Trim().ToUpper() + "' ,");
            stringBuilder.Append(" direccion = '" + direccion.Trim().ToUpper() + "' ,");
            stringBuilder.Append(" comuna = '" + comuna.Trim().ToUpper() + "' ,");
            stringBuilder.Append(" conservador = '" + conservador.Trim().ToUpper() + "' ,");
            stringBuilder.Append(" region = '" + region.Trim().ToUpper() + "' ,");
            stringBuilder.Append(" fojasdominio = '" + fojasdominio.Trim().ToUpper() + "' ,");
            stringBuilder.Append(" numerodominio = '" + numerodominio.Trim().ToUpper() + "' ,");
            stringBuilder.Append(" aniodominio = '" + aniodominio.Trim().ToUpper() + "' ,");
            stringBuilder.Append(" fojashipoteca = '" + fojashipoteca.Trim().ToUpper() + "' ,");
            stringBuilder.Append(" numerohipoteca = '" + numerohipoteca.Trim().ToUpper() + "' ,");
            stringBuilder.Append(" aniohipoteca = '" + aniohipoteca.Trim().ToUpper() + "' ,");
            stringBuilder.Append(" fojasprohibicion = '" + fojasprohibicion.Trim().ToUpper() + "' ,");
            stringBuilder.Append(" numeroprohibicion = '" + numeroprohibicion.Trim().ToUpper() + "' ,");
            stringBuilder.Append(" anioprohibicion = '" + anioprohibicion.Trim().ToUpper() + "' ,");
            stringBuilder.Append(" fechacontabilizacion = '" + fechacontabilizacion.Trim() + "' ,");
            stringBuilder.Append(" fechaentrega = '" + fechaentrega.Trim() + "' ,");
            stringBuilder.Append(" fechaescritura = '" + fechaentrega.Trim() + "' ,");
            stringBuilder.Append(" notaria = '" + notaria.Trim().ToUpper() + "' ,");
            stringBuilder.Append(" comunanotaria = '" + comunanotaria.Trim().ToUpper() + "' ,");
            stringBuilder.Append(" reportorio = '" + reportorio.Trim().ToUpper() + "' ,");
            stringBuilder.Append(" protocolo = '" + protocolo.Trim().ToUpper() + "' ,");
            stringBuilder.Append(" codigoestado = '" + codigoestado.Trim() + "' ,");
            stringBuilder.Append(" estado = '" + estado.Trim().ToUpper() + "' ,");
            stringBuilder.Append(" fechaestado = '" + fechaestado.Trim() + "' ,");
            stringBuilder.Append(" observacion = '" + observacion.Trim().ToUpper() + "' ,");
            stringBuilder.Append(" nrocarillas = '" + nrocarillas.Trim().ToUpper() + "' ,");
            stringBuilder.Append(" factura = '" + factura.Trim().ToUpper() + "' ,");
            stringBuilder.Append(" fechafactura = '" + fechafactura.Trim() + "' ,");
            stringBuilder.Append(" montofactura = " + Convert.ToDecimal(montofactura) + " ,");
            stringBuilder.Append(" fecha_remesa = '" + fecha_remesa.Trim() + "' ,");
            stringBuilder.Append(" remesa = '" + Convert.ToDecimal(remesa) + "' ,");
            stringBuilder.Append(" centrocosto = '" + centrocosto.Trim().ToUpper() + "' ,");
            stringBuilder.Append(" user_responsable = '" + user_responsable.Trim().ToUpper() + "' ");
            stringBuilder.Append(" WHERE");
            stringBuilder.Append(" OT = " + Convert.ToDecimal(OT) + " ");
            BaseDatos baseDatos = new BaseDatos();
            baseDatos.SQLExecute(stringBuilder.ToString());
        }
        public static void UpdateReconstitucionResponsable(string OT, string TipoDoc, string fojasdominio, string numerodominio, string aniodominio, string fojashipoteca, string numerohipoteca, string aniohipoteca, string fojasprohibicion, string numeroprohibicion, string anioprohibicion, string fechaescritura, string notaria, string comunanotaria, string reportorio, string protocolo, string codigoestado, string fechaestado, string observacion, string nrocarillas, string factura, string fechafactura, string montofactura, string centrocosto, string conservador, string region, string direccion, string comuna, string fechacontabilizacion)
        {
            if (string.IsNullOrEmpty(OT))
            {
                OT = "0";
            }
            if (string.IsNullOrEmpty(montofactura))
            {
                montofactura = "0";
            }
            StringBuilder stringBuilder = new StringBuilder();
            stringBuilder.Append(" UPDATE reconstituciones SET ");
            stringBuilder.Append(" conservador = '" + conservador.Trim().ToUpper() + "' ,");
            stringBuilder.Append(" region = '" + region.Trim().ToUpper() + "' ,");
            stringBuilder.Append(" direccion = '" + direccion.Trim().ToUpper() + "' ,");
            stringBuilder.Append(" comuna = '" + comuna.Trim().ToUpper() + "' ,");
            stringBuilder.Append(" TipoDoc = '" + TipoDoc.Trim().ToUpper() + "' ,");
            stringBuilder.Append(" fojasdominio = '" + fojasdominio.Trim().ToUpper() + "' ,");
            stringBuilder.Append(" numerodominio = '" + numerodominio.Trim().ToUpper() + "' ,");
            stringBuilder.Append(" aniodominio = '" + aniodominio.Trim().ToUpper() + "' ,");
            stringBuilder.Append(" fojashipoteca = '" + fojashipoteca.Trim().ToUpper() + "' ,");
            stringBuilder.Append(" numerohipoteca = '" + numerohipoteca.Trim().ToUpper() + "' ,");
            stringBuilder.Append(" aniohipoteca = '" + aniohipoteca.Trim().ToUpper() + "' ,");
            stringBuilder.Append(" fojasprohibicion = '" + fojasprohibicion.Trim().ToUpper() + "' ,");
            stringBuilder.Append(" numeroprohibicion = '" + numeroprohibicion.Trim().ToUpper() + "' ,");
            stringBuilder.Append(" anioprohibicion = '" + anioprohibicion.Trim().ToUpper() + "' ,");
            if (string.IsNullOrEmpty(fechaescritura))
            {
                stringBuilder.Append(" fechaescritura = null,");
            }
            else
            {
                stringBuilder.Append(" fechaescritura = convert(datetime,'" + fechaescritura.Trim() + "' ,103),");
            }
            if (string.IsNullOrEmpty(fechacontabilizacion))
            {
                stringBuilder.Append(" fechacontabilizacion = null,");
            }
            else
            {
                stringBuilder.Append(" fechacontabilizacion = convert(datetime,'" + fechacontabilizacion.Trim() + "' ,103),");
            }
            stringBuilder.Append(" notaria = '" + notaria.Trim().ToUpper() + "' ,");
            stringBuilder.Append(" comunanotaria = '" + comunanotaria.Trim().ToUpper() + "' ,");
            stringBuilder.Append(" reportorio = '" + reportorio.Trim().ToUpper() + "' ,");
            stringBuilder.Append(" protocolo = '" + protocolo.Trim().ToUpper() + "' ,");
            stringBuilder.Append(" codigoestado = '" + codigoestado.Trim() + "' ,");
            stringBuilder.Append(" fechaestado = '" + fechaestado.Trim() + "' ,");
            stringBuilder.Append(" observacion = '" + observacion.Trim().ToUpper() + "' ,");
            stringBuilder.Append(" nrocarillas = '" + nrocarillas.Trim().ToUpper() + "' ,");
            stringBuilder.Append(" factura = '" + factura.Trim().ToUpper() + "' ,");
            if (string.IsNullOrEmpty(fechafactura))
            {
                stringBuilder.Append(" fechafactura = null,");
            }
            else
            {
                stringBuilder.Append(" fechafactura = convert(datetime,'" + fechafactura.Trim() + "' ,103),");
            }
            stringBuilder.Append(" montofactura = " + Convert.ToDecimal(montofactura) + " ,");
            stringBuilder.Append(" centrocosto = '" + centrocosto.Trim().ToUpper() + "' ,");
            stringBuilder.Append(" fproceso = getdate() ");
            stringBuilder.Append(" WHERE");
            stringBuilder.Append(" OT = " + Convert.ToDecimal(OT) + " ");
            BaseDatos baseDatos = new BaseDatos();
            baseDatos.SQLExecute(stringBuilder.ToString());
        }
        public static void InsertaAbonoParcial(string idcobranza, string tipo, string MontoParcial, string usuario)
        {
            if (string.IsNullOrEmpty(idcobranza))
            {
                idcobranza = "0";
            }
            if (string.IsNullOrEmpty(MontoParcial))
            {
                MontoParcial = "0";
            }
            StringBuilder stringBuilder = new StringBuilder();
            stringBuilder.Append(" INSERT INTO alcsacl.abonoparcial(");
            stringBuilder.Append(" id_cobranza,");
            stringBuilder.Append(" tipo,");
            stringBuilder.Append(" montoparcial,");
            stringBuilder.Append(" fproceso,");
            stringBuilder.Append(" estado,");
            stringBuilder.Append(" username");
            stringBuilder.Append(" ) VALUES(");
            stringBuilder.Append(" " + Convert.ToInt64(idcobranza) + ",");
            stringBuilder.Append(" '" + tipo.Trim().ToUpper() + "',");
            stringBuilder.Append(" " + Convert.ToDecimal(MontoParcial) + ",");
            stringBuilder.Append(" getdate(),");
            stringBuilder.Append(" 'P',");
            stringBuilder.Append(" '" + usuario.Trim() + "'");
            stringBuilder.Append(" )");
            BaseDatos baseDatos = new BaseDatos();
            baseDatos.SQLExecute(stringBuilder.ToString());
        }
        public static void InsertaUsuario(string username, string password, string mail, string perfil, string rut_usu, string idRegion, string idComuna, string direccion, string numero, string telefono, string celular, string cargo, string nombres, string apaterno, string amaterno, string rut_cli)
        {
            if (string.IsNullOrEmpty(numero))
            {
                numero = "0";
            }
            if (string.IsNullOrEmpty(cargo))
            {
                cargo = "0";
            }
            if (string.IsNullOrEmpty(idComuna))
            {
                idComuna = "0";
            }
            StringBuilder stringBuilder = new StringBuilder();
            stringBuilder.Append(" INSERT INTO usuarios(");
            stringBuilder.Append(" rut_usu,");
            stringBuilder.Append(" nombres,");
            stringBuilder.Append(" apaterno,");
            stringBuilder.Append(" amaterno,");
            stringBuilder.Append(" username,");
            stringBuilder.Append(" password,");
            stringBuilder.Append(" mail,");
            stringBuilder.Append(" id_perfil,");
            stringBuilder.Append(" status,");
            stringBuilder.Append(" id_region,");
            stringBuilder.Append(" id_comuna,");
            stringBuilder.Append(" direccion,");
            stringBuilder.Append(" numero,");
            stringBuilder.Append(" telefono,");
            stringBuilder.Append(" celular,");
            stringBuilder.Append(" id_cargo,");
            stringBuilder.Append(" rut_cli");
            stringBuilder.Append(" ) Values(");
            stringBuilder.Append(" '" + rut_usu.Trim().ToUpper() + "',");
            stringBuilder.Append(" '" + nombres.Trim().ToUpper() + "',");
            stringBuilder.Append(" '" + apaterno.Trim().ToUpper() + "',");
            stringBuilder.Append(" '" + amaterno.Trim().ToUpper() + "',");
            stringBuilder.Append(" '" + username.Trim() + "',");
            stringBuilder.Append(" '" + password.Trim() + "',");
            stringBuilder.Append(" '" + mail.Trim().ToUpper() + "',");
            stringBuilder.Append("   " + Convert.ToInt16(perfil) + ",");
            stringBuilder.Append(" 'A' ,");
            stringBuilder.Append(" " + Convert.ToInt16(idRegion) + ",");
            stringBuilder.Append(" " + Convert.ToInt16(idComuna) + ",");
            stringBuilder.Append(" '" + direccion.Trim().ToUpper() + "',");
            stringBuilder.Append(" " + Convert.ToInt64(numero) + ",");
            stringBuilder.Append(" '" + telefono.Trim() + "',");
            stringBuilder.Append(" '" + celular.Trim() + "',");
            stringBuilder.Append(" " + Convert.ToInt16(cargo) + ",");
            stringBuilder.Append(" '" + rut_cli.Trim() + "'");
            stringBuilder.Append(" )");
            BaseDatos baseDatos = new BaseDatos();
            baseDatos.SQLExecute(stringBuilder.ToString());
        }
        public static void InsertaInformeGeneralRecon(string OT, string Titulo, string FechaEscritura, string Notario, string RepertorioNotaria, string Conservador, string CertHipGravamenesUF, string CertHipGravamenesPESOS, string CertDominioUF, string CertDominioPESOS, string EndosoUF, string EndosoPESOS, string CertDicomUF, string CertDicomPESOS, string AlzamientoEmbargoUF, string AlzamientoEmbargoPESOS, string AlzamientoMedidaPrecautoriaUF, string AlzamientoMedidaPrecautoriaPESOS, string AlzamientosHipotecasUF, string AlzamientosHipotecasPESOS, string AlzamientoProhibicionesUF, string AlzamientoProhibicionesPESOS, string ReconstitucionEscrituraUF, string ReconstitucionEscrituraPESOS, string ConformidadAlzamientoUF, string ConformidadAlzamientoPESOS, string EscrituraAdjudicacionUF, string EscrituraAdjudicacionPESOS, string TotalUF, string TotalPESOS, string CertGravaProhibiciones, string copiaInsDominioVig, string CertGravaProhib2, string CopiaEscrituraAlzamiento, string CopiaEscrmutuohipo, string FotocopiaEscAlzamiento, string Observacion, string usuario)
        {
            StringBuilder stringBuilder = new StringBuilder();
            stringBuilder.Append(" INSERT INTO ReconstitucionReportes(OT, Titulo, FechaEscritura, Notario, RepertorioNotaria, Conservador, CertHipGravamenesUF, CertHipGravamenesPESOS, CertDominioUF, CertDominioPESOS, EndosoUF, EndosoPESOS, CertDicomUF, CertDicomPESOS, AlzamientoEmbargoUF, AlzamientoEmbargoPESOS, AlzamientoMedidaPrecautoriaUF, AlzamientoMedidaPrecautoriaPESOS, AlzamientosHipotecasUF, AlzamientosHipotecasPESOS, AlzamientoProhibicionesUF, AlzamientoProhibicionesPESOS, ReconstitucionEscrituraUF, ReconstitucionEscrituraPESOS, ConformidadAlzamientoUF, ConformidadAlzamientoPESOS, EscrituraAdjudicacionUF, EscrituraAdjudicacionPESOS, TotalUF, TotalPESOS, CertGravaProhibiciones, copiaInsDominioVig, CertGravaProhib2, CopiaEscrituraAlzamiento, CopiaEscrmutuohipo, FotocopiaEscAlzamiento, Observacion,usuario,fproceso");
            stringBuilder.Append(" ) Values(");
            stringBuilder.Append(" '" + OT.Trim().ToUpper() + "',");
            stringBuilder.Append(" '" + Titulo.Trim().ToUpper() + "',");
            stringBuilder.Append(" '" + FechaEscritura.Trim().ToUpper() + "',");
            stringBuilder.Append(" '" + Notario.Trim().ToUpper() + "',");
            stringBuilder.Append(" '" + RepertorioNotaria.Trim().ToUpper() + "',");
            stringBuilder.Append(" '" + Conservador.Trim().ToUpper() + "',");
            stringBuilder.Append(" '" + CertHipGravamenesUF.Trim().ToUpper() + "',");
            stringBuilder.Append(" '" + CertHipGravamenesPESOS.Trim().ToUpper() + "',");
            stringBuilder.Append(" '" + CertDominioUF.Trim().ToUpper() + "',");
            stringBuilder.Append(" '" + CertDominioPESOS.Trim().ToUpper() + "',");
            stringBuilder.Append(" '" + EndosoUF.Trim().ToUpper() + "',");
            stringBuilder.Append(" '" + EndosoPESOS.Trim().ToUpper() + "',");
            stringBuilder.Append(" '" + CertDicomUF.Trim().ToUpper() + "',");
            stringBuilder.Append(" '" + CertDicomPESOS.Trim().ToUpper() + "',");
            stringBuilder.Append(" '" + AlzamientoEmbargoUF.Trim().ToUpper() + "',");
            stringBuilder.Append(" '" + AlzamientoEmbargoPESOS.Trim().ToUpper() + "',");
            stringBuilder.Append(" '" + AlzamientoMedidaPrecautoriaUF.Trim().ToUpper() + "',");
            stringBuilder.Append(" '" + AlzamientoMedidaPrecautoriaPESOS.Trim().ToUpper() + "',");
            stringBuilder.Append(" '" + AlzamientosHipotecasUF.Trim().ToUpper() + "',");
            stringBuilder.Append(" '" + AlzamientosHipotecasPESOS.Trim().ToUpper() + "',");
            stringBuilder.Append(" '" + AlzamientoProhibicionesUF.Trim().ToUpper() + "',");
            stringBuilder.Append(" '" + AlzamientoProhibicionesPESOS.Trim().ToUpper() + "',");
            stringBuilder.Append(" '" + ReconstitucionEscrituraUF.Trim().ToUpper() + "',");
            stringBuilder.Append(" '" + ReconstitucionEscrituraPESOS.Trim().ToUpper() + "',");
            stringBuilder.Append(" '" + ConformidadAlzamientoUF.Trim().ToUpper() + "',");
            stringBuilder.Append(" '" + ConformidadAlzamientoPESOS.Trim().ToUpper() + "',");
            stringBuilder.Append(" '" + EscrituraAdjudicacionUF.Trim().ToUpper() + "',");
            stringBuilder.Append(" '" + EscrituraAdjudicacionPESOS.Trim().ToUpper() + "',");
            stringBuilder.Append(" '" + TotalUF.Trim().ToUpper() + "',");
            stringBuilder.Append(" '" + TotalPESOS.Trim().ToUpper() + "',");
            stringBuilder.Append(" '" + CertGravaProhibiciones.Trim().ToUpper() + "',");
            stringBuilder.Append(" '" + copiaInsDominioVig.Trim().ToUpper() + "',");
            stringBuilder.Append(" '" + CertGravaProhib2.Trim().ToUpper() + "',");
            stringBuilder.Append(" '" + CopiaEscrituraAlzamiento.Trim().ToUpper() + "',");
            stringBuilder.Append(" '" + CopiaEscrmutuohipo.Trim().ToUpper() + "',");
            stringBuilder.Append(" '" + FotocopiaEscAlzamiento.Trim().ToUpper() + "',");
            stringBuilder.Append(" '" + Observacion.Trim().ToUpper() + "',");
            stringBuilder.Append(" '" + usuario.Trim().ToUpper() + "',");
            stringBuilder.Append(" getdate()");
            stringBuilder.Append(" )");
            BaseDatos baseDatos = new BaseDatos();
            baseDatos.SQLExecute(stringBuilder.ToString());
        }
        public static void UpdateInformeGeneralRecon(string OT, string Titulo, string FechaEscritura, string Notario, string RepertorioNotaria, string Conservador, string CertHipGravamenesUF, string CertHipGravamenesPESOS, string CertDominioUF, string CertDominioPESOS, string EndosoUF, string EndosoPESOS, string CertDicomUF, string CertDicomPESOS, string AlzamientoEmbargoUF, string AlzamientoEmbargoPESOS, string AlzamientoMedidaPrecautoriaUF, string AlzamientoMedidaPrecautoriaPESOS, string AlzamientosHipotecasUF, string AlzamientosHipotecasPESOS, string AlzamientoProhibicionesUF, string AlzamientoProhibicionesPESOS, string ReconstitucionEscrituraUF, string ReconstitucionEscrituraPESOS, string ConformidadAlzamientoUF, string ConformidadAlzamientoPESOS, string EscrituraAdjudicacionUF, string EscrituraAdjudicacionPESOS, string TotalUF, string TotalPESOS, string CertGravaProhibiciones, string copiaInsDominioVig, string CertGravaProhib2, string CopiaEscrituraAlzamiento, string CopiaEscrmutuohipo, string FotocopiaEscAlzamiento, string Observacion, string usuario)
        {
            if (string.IsNullOrEmpty(OT))
            {
                OT = "0";
            }
            StringBuilder stringBuilder = new StringBuilder();
            stringBuilder.Append(" UPDATE ReconstitucionReportes SET ");
            stringBuilder.Append(" Titulo = '" + Titulo.Trim().ToUpper() + "',");
            stringBuilder.Append(" FechaEscritura = '" + FechaEscritura.Trim().ToUpper() + "',");
            stringBuilder.Append(" Notario = '" + Notario.Trim().ToUpper() + "',");
            stringBuilder.Append(" RepertorioNotaria = '" + RepertorioNotaria.Trim().ToUpper() + "',");
            stringBuilder.Append(" Conservador = '" + Conservador.Trim().ToUpper() + "',");
            stringBuilder.Append(" CertHipGravamenesUF =  '" + CertHipGravamenesUF.Trim().ToUpper() + "',");
            stringBuilder.Append(" CertHipGravamenesPESOS ='" + CertHipGravamenesPESOS.Trim().ToUpper() + "',");
            stringBuilder.Append(" CertDominioUF = '" + CertDominioUF.Trim().ToUpper() + "',");
            stringBuilder.Append(" CertDominioPESOS = '" + CertDominioPESOS.Trim().ToUpper() + "',");
            stringBuilder.Append(" EndosoUF = '" + EndosoUF.Trim().ToUpper() + "',");
            stringBuilder.Append(" EndosoPESOS = '" + EndosoPESOS.Trim().ToUpper() + "',");
            stringBuilder.Append(" CertDicomUF = '" + CertDicomUF.Trim().ToUpper() + "',");
            stringBuilder.Append(" CertDicomPESOS = '" + CertDicomPESOS.Trim().ToUpper() + "',");
            stringBuilder.Append(" AlzamientoEmbargoUF = '" + AlzamientoEmbargoUF.Trim().ToUpper() + "',");
            stringBuilder.Append(" AlzamientoEmbargoPESOS ='" + AlzamientoEmbargoPESOS.Trim().ToUpper() + "',");
            stringBuilder.Append(" AlzamientoMedidaPrecautoriaUF = '" + AlzamientoMedidaPrecautoriaUF.Trim().ToUpper() + "',");
            stringBuilder.Append(" AlzamientoMedidaPrecautoriaPESOS = '" + AlzamientoMedidaPrecautoriaPESOS.Trim().ToUpper() + "',");
            stringBuilder.Append(" AlzamientosHipotecasUF = '" + AlzamientosHipotecasUF.Trim().ToUpper() + "',");
            stringBuilder.Append(" AlzamientosHipotecasPESOS = '" + AlzamientosHipotecasPESOS.Trim().ToUpper() + "',");
            stringBuilder.Append(" AlzamientoProhibicionesUF = '" + AlzamientoProhibicionesUF.Trim().ToUpper() + "',");
            stringBuilder.Append(" AlzamientoProhibicionesPESOS = '" + AlzamientoProhibicionesPESOS.Trim().ToUpper() + "',");
            stringBuilder.Append(" ReconstitucionEscrituraUF = '" + ReconstitucionEscrituraUF.Trim().ToUpper() + "',");
            stringBuilder.Append(" ReconstitucionEscrituraPESOS = '" + ReconstitucionEscrituraPESOS.Trim().ToUpper() + "',");
            stringBuilder.Append(" ConformidadAlzamientoUF = '" + ConformidadAlzamientoUF.Trim().ToUpper() + "',");
            stringBuilder.Append(" ConformidadAlzamientoPESOS = '" + ConformidadAlzamientoPESOS.Trim().ToUpper() + "',");
            stringBuilder.Append(" EscrituraAdjudicacionUF = '" + EscrituraAdjudicacionUF.Trim().ToUpper() + "',");
            stringBuilder.Append(" EscrituraAdjudicacionPESOS = '" + EscrituraAdjudicacionPESOS.Trim().ToUpper() + "',");
            stringBuilder.Append(" TotalUF = '" + TotalUF.Trim().ToUpper() + "',");
            stringBuilder.Append(" TotalPESOS = '" + TotalPESOS.Trim().ToUpper() + "',");
            stringBuilder.Append(" CertGravaProhibiciones = '" + CertGravaProhibiciones.Trim().ToUpper() + "',");
            stringBuilder.Append(" copiaInsDominioVig = '" + copiaInsDominioVig.Trim().ToUpper() + "',");
            stringBuilder.Append(" CertGravaProhib2 = '" + CertGravaProhib2.Trim().ToUpper() + "',");
            stringBuilder.Append(" CopiaEscrituraAlzamiento = '" + CopiaEscrituraAlzamiento.Trim().ToUpper() + "',");
            stringBuilder.Append(" CopiaEscrmutuohipo = '" + CopiaEscrmutuohipo.Trim().ToUpper() + "',");
            stringBuilder.Append(" FotocopiaEscAlzamiento = '" + FotocopiaEscAlzamiento.Trim().ToUpper() + "',");
            stringBuilder.Append(" Observacion = '" + Observacion.Trim().ToUpper() + "',");
            stringBuilder.Append(" usuario = '" + usuario.Trim().ToUpper() + "',");
            stringBuilder.Append(" fproceso = getdate()");
            stringBuilder.Append(" WHERE OT = " + Convert.ToDecimal(OT) + " ");
            BaseDatos baseDatos = new BaseDatos();
            baseDatos.SQLExecute(stringBuilder.ToString());
        }
        public static void InsertaGastoReconstituciones(string OT, string id_tipo_gasto, string id_forma_pago, string nrodocumento, string montogasto, string observacion, string usuario, string estadogasto)
        {
            if (string.IsNullOrEmpty(OT))
            {
                OT = "0";
            }
            if (string.IsNullOrEmpty(id_tipo_gasto))
            {
                id_tipo_gasto = "0";
            }
            if (string.IsNullOrEmpty(id_forma_pago))
            {
                id_forma_pago = "0";
            }
            if (string.IsNullOrEmpty(montogasto))
            {
                montogasto = "0";
            }
            StringBuilder stringBuilder = new StringBuilder();
            stringBuilder.Append(" insert into reconstitucionesgastos (estadogasto,OT, id_tipo_gasto, id_forma_pago, nrodocumento, montogasto, observacion, usuario, fproceso)");
            stringBuilder.Append(" Values(");
            stringBuilder.Append(" '" + estadogasto.Trim() + "',");
            stringBuilder.Append("   " + Convert.ToDecimal(OT) + ",");
            stringBuilder.Append("   " + Convert.ToDecimal(id_tipo_gasto) + ",");
            stringBuilder.Append("   " + Convert.ToDecimal(id_forma_pago) + ",");
            stringBuilder.Append(" '" + nrodocumento.Trim().ToUpper() + "',");
            stringBuilder.Append("   " + Convert.ToDecimal(montogasto) + ",");
            stringBuilder.Append(" '" + observacion.Trim().ToUpper() + "',");
            stringBuilder.Append(" '" + usuario.Trim().ToUpper() + "',");
            stringBuilder.Append(" getdate()");
            stringBuilder.Append(" )");
            BaseDatos baseDatos = new BaseDatos();
            baseDatos.SQLExecute(stringBuilder.ToString());
        }
        public static void ActualizarUsuario(string rut_usu, string username, string password, string mail, string perfil, string idRegion, string idComuna, string direccion, string numero, string telefono, string celular, string cargo, string nombres, string apaterno, string amaterno, string rut_cli)
        {
            if (string.IsNullOrEmpty(perfil))
            {
                perfil = "0";
            }
            if (string.IsNullOrEmpty(numero))
            {
                numero = "0";
            }
            if (string.IsNullOrEmpty(cargo))
            {
                cargo = "0";
            }
            if (string.IsNullOrEmpty(idComuna))
            {
                idComuna = "0";
            }
            StringBuilder stringBuilder = new StringBuilder();
            stringBuilder.Append(" UPDATE Usuarios SET ");
            stringBuilder.Append(" username = '" + username.Trim() + "' ,");
            stringBuilder.Append(" password = '" + password.Trim() + "' ,");
            stringBuilder.Append(" nombres = '" + nombres.Trim().ToUpper() + "' ,");
            stringBuilder.Append(" apaterno = '" + apaterno.Trim().ToUpper() + "' ,");
            stringBuilder.Append(" amaterno = '" + amaterno.Trim().ToUpper() + "' ,");
            stringBuilder.Append(" mail = '" + mail.Trim() + "' ,");
            stringBuilder.Append(" id_perfil = " + Convert.ToInt16(perfil) + " ,");
            stringBuilder.Append(" id_region = " + Convert.ToInt16(idRegion) + " ,");
            stringBuilder.Append(" id_comuna = " + Convert.ToInt16(idComuna) + " ,");
            stringBuilder.Append(" direccion = '" + direccion.Trim().ToUpper() + "' ,");
            stringBuilder.Append(" numero = " + Convert.ToInt64(numero) + " ,");
            stringBuilder.Append(" telefono = '" + telefono.Trim() + "' ,");
            stringBuilder.Append(" celular = '" + celular.Trim() + "' ,");
            stringBuilder.Append(" rut_cli = '" + rut_cli.Trim() + "' ,");
            stringBuilder.Append(" id_cargo = " + Convert.ToInt16(cargo) + " ");
            stringBuilder.Append(" WHERE");
            stringBuilder.Append(" rtrim(ltrim(rut_usu)) = '" + rut_usu + "' ");
            BaseDatos baseDatos = new BaseDatos();
            baseDatos.SQLExecute(stringBuilder.ToString());
        }
        public static void EliminarUsuario(string Id_Usuario)
        {
            StringBuilder stringBuilder = new StringBuilder();
            stringBuilder.Append(" UPDATE Usuarios SET status = 'N' WHERE rtrim(ltrim(rut_usu)) = '" + Id_Usuario.Trim() + "' ");
            BaseDatos baseDatos = new BaseDatos();
            baseDatos.SQLExecute(stringBuilder.ToString());
        }
        public static void InsertaDeudor(string rut_deudor, string rsocial, string fnacimiento, string profesion, string telefono1, string celular1, string telefono2, string email, string id_banco, string ctacte, string rut_usu_crea, string ecivil, string nombres, string apaterno, string amaterno, string tipopersona)
        {
            if (string.IsNullOrEmpty(rsocial))
            {
                rsocial = string.Concat(new string[]
				{
					nombres,
					" ",
					apaterno,
					" ",
					amaterno
				});
            }
            if (string.IsNullOrEmpty(fnacimiento))
            {
                fnacimiento = "01/01/1900";
            }
            if (string.IsNullOrEmpty(id_banco))
            {
                id_banco = "0";
            }
            StringBuilder stringBuilder = new StringBuilder();
            stringBuilder.Append(" INSERT INTO deudores(");
            stringBuilder.Append(" rut_deudor,");
            stringBuilder.Append(" rsocial,");
            stringBuilder.Append(" fnacimiento,");
            stringBuilder.Append(" id_profesion,");
            stringBuilder.Append(" telefono1,");
            stringBuilder.Append(" celular1,");
            stringBuilder.Append(" telefono2,");
            stringBuilder.Append(" email,");
            stringBuilder.Append(" id_banco,");
            stringBuilder.Append(" ctacte,");
            stringBuilder.Append(" rut_usu_crea,");
            stringBuilder.Append(" fcreacion,");
            stringBuilder.Append(" ecivil,");
            stringBuilder.Append(" nombres,");
            stringBuilder.Append(" apaterno,");
            stringBuilder.Append(" amaterno,");
            stringBuilder.Append(" tipopersona");
            stringBuilder.Append(" ) VALUES(");
            stringBuilder.Append(" '" + rut_deudor.Trim().ToUpper() + "',");
            stringBuilder.Append(" '" + rsocial.Trim().ToUpper() + "',");
            stringBuilder.Append(" '" + fnacimiento + "',");
            stringBuilder.Append(" " + Convert.ToInt16(profesion) + ",");
            stringBuilder.Append(" '" + telefono1.Trim().ToString() + "',");
            stringBuilder.Append(" '" + celular1.Trim().ToString() + "',");
            stringBuilder.Append(" '" + telefono2.Trim().ToString() + "',");
            stringBuilder.Append(" '" + email.Trim().ToString() + "',");
            stringBuilder.Append(" " + Convert.ToInt16(id_banco) + ",");
            stringBuilder.Append(" '" + ctacte.Trim().ToUpper().ToString() + "',");
            stringBuilder.Append(" '" + rut_usu_crea.Trim().ToUpper().ToString() + "',");
            stringBuilder.Append(" getdate(),");
            stringBuilder.Append(" " + Convert.ToInt16(ecivil) + ",");
            stringBuilder.Append(" '" + nombres.Trim().ToUpper() + "',");
            stringBuilder.Append(" '" + apaterno.Trim().ToUpper() + "',");
            stringBuilder.Append(" '" + amaterno.Trim().ToUpper() + "',");
            stringBuilder.Append(" '" + tipopersona.Trim().ToUpper() + "'");
            stringBuilder.Append(" )");
            BaseDatos baseDatos = new BaseDatos();
            baseDatos.SQLExecute(stringBuilder.ToString());
        }
        public static void ActualizarDeudor(string rut_deudor, string rsocial, string fnacimiento, string profesion, string telefono1, string celular1, string telefono2, string email, string id_banco, string ctacte, string rut_usu_modi, string ecivil, string nombres, string apaterno, string amaterno, string tipopersona)
        {
            if (tipopersona == "N")
            {
                rsocial = string.Concat(new string[]
				{
					nombres,
					" ",
					apaterno,
					" ",
					amaterno
				});
            }
            string str;
            if (string.IsNullOrEmpty(fnacimiento))
            {
                str = "01/01/1900";
            }
            else
            {
                str = string.Concat(new string[]
				{
					fnacimiento.Substring(0, 2).ToString(),
					"-",
					fnacimiento.Substring(3, 2).ToString(),
					"-",
					fnacimiento.Substring(6, 4).ToString()
				});
            }
            if (string.IsNullOrEmpty(id_banco))
            {
                id_banco = "0";
            }
            StringBuilder stringBuilder = new StringBuilder();
            stringBuilder.Append(" UPDATE deudores SET ");
            stringBuilder.Append(" rsocial = '" + rsocial.Trim().ToUpper() + "' ,");
            stringBuilder.Append(" nombres = '" + nombres.Trim().ToUpper() + "' ,");
            stringBuilder.Append(" apaterno = '" + apaterno.Trim().ToUpper() + "' ,");
            stringBuilder.Append(" amaterno = '" + amaterno.Trim().ToUpper() + "' ,");
            stringBuilder.Append(" tipopersona = '" + tipopersona.Trim().ToUpper() + "' ,");
            stringBuilder.Append(" fnacimiento = '" + str + "' ,");
            stringBuilder.Append(" id_profesion = " + Convert.ToInt16(profesion) + " ,");
            stringBuilder.Append(" telefono1 = '" + telefono1.Trim().ToString() + "' ,");
            stringBuilder.Append(" celular1 = '" + celular1.Trim().ToString() + "' ,");
            stringBuilder.Append(" telefono2 = '" + telefono2.Trim().ToString() + "' ,");
            stringBuilder.Append(" email = '" + email.Trim().ToString() + "' ,");
            stringBuilder.Append(" id_banco = " + Convert.ToInt16(id_banco) + " ,");
            stringBuilder.Append(" ctacte = '" + ctacte.Trim().ToString() + "' ,");
            stringBuilder.Append(" rut_usu_modi = '" + rut_usu_modi.Trim().ToString() + "' ,");
            stringBuilder.Append(" fmodificacion = getdate(),  ");
            stringBuilder.Append(" ecivil = " + Convert.ToInt16(ecivil) + " ");
            stringBuilder.Append(" WHERE");
            stringBuilder.Append(" rtrim(ltrim(rut_deudor)) = '" + rut_deudor.Trim() + "' ");
            BaseDatos baseDatos = new BaseDatos();
            baseDatos.SQLExecute(stringBuilder.ToString());
        }
        public static void EliminarDeudor(string rut_deudor)
        {
            StringBuilder stringBuilder = new StringBuilder();
            stringBuilder.Append(" UPDATE deudores SET status = 'N' WHERE rtrim(ltrim(rut_deudor)) = '" + rut_deudor.Trim() + "' ");
            BaseDatos baseDatos = new BaseDatos();
            baseDatos.SQLExecute(stringBuilder.ToString());
        }
        public static void EliminarDocuDigitalizado(string id_documento)
        {
            StringBuilder stringBuilder = new StringBuilder();
            stringBuilder.Append("DELETE docudigitalizados WHERE id_documento = " + Convert.ToInt64(id_documento));
            BaseDatos baseDatos = new BaseDatos();
            baseDatos.SQLExecute(stringBuilder.ToString());
        }
        public static void ActualizaPagoCuotaColegio(string id_cuota_colegio, string MCH)
        {
            if (string.IsNullOrEmpty(MCH))
            {
                MCH = null;
            }
            StringBuilder stringBuilder = new StringBuilder();
            stringBuilder.Append(string.Concat(new object[]
			{
				"UPDATE cuotacolegio SET pagado = 'S', MCH = '",
				MCH,
				"' WHERE id_cuota_colegio = ",
				Convert.ToInt64(id_cuota_colegio)
			}));
            BaseDatos baseDatos = new BaseDatos();
            baseDatos.SQLExecute(stringBuilder.ToString());
        }
        public static void ActualizaPagoMutuo(string id_cuota_colegio, string MCH)
        {
            if (string.IsNullOrEmpty(MCH))
            {
                MCH = null;
            }
            StringBuilder stringBuilder = new StringBuilder();
            stringBuilder.Append(string.Concat(new object[]
			{
				"UPDATE mutuo SET pagado = 'S', MCH = '",
				MCH,
				"' WHERE id_mutuo = ",
				Convert.ToInt64(id_cuota_colegio)
			}));
            BaseDatos baseDatos = new BaseDatos();
            baseDatos.SQLExecute(stringBuilder.ToString());
        }
        public static void ActualizaPagoDocuPagare(string id_cuota_colegio, string MCH)
        {
            if (string.IsNullOrEmpty(MCH))
            {
                MCH = null;
            }
            StringBuilder stringBuilder = new StringBuilder();
            stringBuilder.Append(string.Concat(new object[]
			{
				"UPDATE docupagare SET pagado = 'S', MCH = '",
				MCH,
				"' WHERE id_docu_pagare = ",
				Convert.ToInt64(id_cuota_colegio)
			}));
            BaseDatos baseDatos = new BaseDatos();
            baseDatos.SQLExecute(stringBuilder.ToString());
        }
        public static void ActualizaPagoDocuJuicio(string id_cuota_colegio, string MCH)
        {
            if (string.IsNullOrEmpty(MCH))
            {
                MCH = null;
            }
            StringBuilder stringBuilder = new StringBuilder();
            stringBuilder.Append(string.Concat(new object[]
			{
				"UPDATE docujuicio SET pagado = 'S', MCH = '",
				MCH,
				"' WHERE id_docu_judi = ",
				Convert.ToInt64(id_cuota_colegio)
			}));
            BaseDatos baseDatos = new BaseDatos();
            baseDatos.SQLExecute(stringBuilder.ToString());
        }
        public static void LiberarMCHLetra(string id_cuota_colegio)
        {
            StringBuilder stringBuilder = new StringBuilder();
            stringBuilder.Append(" UPDATE cuotacolegio SET MCH = ' ' WHERE id_cuota_colegio = " + Convert.ToInt64(id_cuota_colegio));
            BaseDatos baseDatos = new BaseDatos();
            baseDatos.SQLExecute(stringBuilder.ToString());
        }
        public static void EliminarChequeMCH(string id_abonoMCH)
        {
            StringBuilder stringBuilder = new StringBuilder();
            stringBuilder.Append("delete from abonosMCH where id_abonoMCH = " + Convert.ToInt64(id_abonoMCH) + " ");
            BaseDatos baseDatos = new BaseDatos();
            baseDatos.SQLExecute(stringBuilder.ToString());
        }
        public static void CambiaEstadoChequeMCH(string id_abonoMCH, string estado)
        {
            StringBuilder stringBuilder = new StringBuilder();
            stringBuilder.Append(string.Concat(new object[]
			{
				"update  abonosMCH set estado = '",
				estado.ToString(),
				"' where id_abonoMCH = ",
				Convert.ToInt64(id_abonoMCH),
				" "
			}));
            BaseDatos baseDatos = new BaseDatos();
            baseDatos.SQLExecute(stringBuilder.ToString());
        }
        public static void ActualizaPagoDocuJuicio(string id_docu_judi)
        {
            StringBuilder stringBuilder = new StringBuilder();
            stringBuilder.Append("UPDATE docujuicio SET pagado = 'S' WHERE id_docu_judi = " + Convert.ToInt64(id_docu_judi));
            BaseDatos baseDatos = new BaseDatos();
            baseDatos.SQLExecute(stringBuilder.ToString());
        }
        public static void ActualizaPagoDocuPagare(string id_docu_pagare)
        {
            StringBuilder stringBuilder = new StringBuilder();
            stringBuilder.Append("UPDATE docupagare SET pagado = 'S' WHERE id_docu_pagare = " + Convert.ToInt64(id_docu_pagare));
            BaseDatos baseDatos = new BaseDatos();
            baseDatos.SQLExecute(stringBuilder.ToString());
        }
        public static void ActualizaPagoDocuMutuo(string id_mutuo)
        {
            StringBuilder stringBuilder = new StringBuilder();
            stringBuilder.Append("UPDATE mutuo SET pagado = 'S' WHERE id_mutuo = " + Convert.ToInt64(id_mutuo));
            BaseDatos baseDatos = new BaseDatos();
            baseDatos.SQLExecute(stringBuilder.ToString());
        }
        public static void InsertaDomicilio(string villapob, string calle, string block, string numero, string id_region, string id_comuna, string rut_deudor, string estado, string fuente, string nrodpto)
        {
            nrodpto = nrodpto.Replace("'", "");
            if (string.IsNullOrEmpty(numero))
            {
                numero = "0";
            }
            if (string.IsNullOrEmpty(id_region))
            {
                id_region = "0";
            }
            if (string.IsNullOrEmpty(id_comuna))
            {
                id_comuna = "0";
            }
            StringBuilder stringBuilder = new StringBuilder();
            stringBuilder.Append(" INSERT INTO domicilios(");
            stringBuilder.Append(" villapob,");
            stringBuilder.Append(" calle,");
            stringBuilder.Append(" block,");
            stringBuilder.Append(" numero,");
            stringBuilder.Append(" id_region,");
            stringBuilder.Append(" id_comuna,");
            stringBuilder.Append(" rut_deudor,");
            stringBuilder.Append(" estado,");
            stringBuilder.Append(" fuente,");
            stringBuilder.Append(" festado,");
            stringBuilder.Append(" nrodpto");
            stringBuilder.Append(" ) VALUES(");
            stringBuilder.Append(" '" + villapob.Trim().ToUpper() + "',");
            stringBuilder.Append(" '" + calle.Trim().ToUpper() + "',");
            stringBuilder.Append(" '" + block.Trim().ToUpper() + "',");
            stringBuilder.Append(" " + Convert.ToInt64(numero) + ",");
            stringBuilder.Append(" " + Convert.ToInt16(id_region) + ",");
            stringBuilder.Append(" " + Convert.ToInt16(id_comuna) + ",");
            stringBuilder.Append(" '" + rut_deudor.Trim().ToUpper() + "',");
            stringBuilder.Append(" '" + estado.Trim().ToUpper() + "',");
            stringBuilder.Append(" '" + fuente.Trim().ToUpper() + "',");
            stringBuilder.Append(" getdate(),");
            stringBuilder.Append(" '" + nrodpto.Trim().ToUpper() + "'");
            stringBuilder.Append(" )");
            BaseDatos baseDatos = new BaseDatos();
            baseDatos.SQLExecute(stringBuilder.ToString());
        }
        public static void InsertaConservador(string nombre, string id_comuna_con, string Direccion, string rut, string usuario, string cargo)
        {
            if (string.IsNullOrEmpty(id_comuna_con))
            {
                id_comuna_con = "0";
            }
            StringBuilder stringBuilder = new StringBuilder();
            stringBuilder.Append(" INSERT INTO Conservador(");
            stringBuilder.Append(" nombre,");
            stringBuilder.Append(" id_comuna_con,");
            stringBuilder.Append(" direccion,");
            stringBuilder.Append(" rut,");
            stringBuilder.Append(" usuario,");
            stringBuilder.Append(" fproceso,");
            stringBuilder.Append(" cargo");
            stringBuilder.Append(")values(");
            stringBuilder.Append(" '" + nombre.Trim().ToUpper() + "',");
            stringBuilder.Append(" " + Convert.ToDecimal(id_comuna_con) + ",");
            stringBuilder.Append(" '" + Direccion.Trim().ToUpper() + "',");
            stringBuilder.Append(" '" + rut.Trim().ToUpper() + "',");
            stringBuilder.Append(" '" + usuario.Trim().ToUpper() + "',");
            stringBuilder.Append(" getdate(),");
            stringBuilder.Append(" '" + cargo.Trim().ToUpper() + "'");
            stringBuilder.Append(" )");
            BaseDatos baseDatos = new BaseDatos();
            baseDatos.SQLExecute(stringBuilder.ToString());
        }
        public static void InsertaBienRaiz(string rut_deudor, string fojas_insc, string n_insc, string anio_insc, string fojas1_hip, string n1_hip, string anio1_hip, string fojas2_hip, string n2_hip, string anio2_hip, string fojas1_proh, string n1_proh, string anio1_proh, string fojas2_proh, string n2_proh, string anio2_proh, string id_region_cbr, string id_comuna_cbr, string id_conservador, string id_region_notaria, string id_comuna_notaria, string id_notaria, string rol_avaluo, string fescritura, string estado, string fuente, string id_limitaciones, string domicilio, string Vueltatipofojainsc, string Vueltatipofojahip1, string Vueltatipofojahip2, string Vueltatipofojaproh1, string Vueltatipofojaproh2)
        {
            string str;
            if (string.IsNullOrEmpty(fescritura))
            {
                str = "01/01/1900";
            }
            else
            {
                str = string.Concat(new string[]
				{
					fescritura.Substring(0, 2).ToString(),
					"-",
					fescritura.Substring(3, 2).ToString(),
					"-",
					fescritura.Substring(6, 4).ToString()
				});
            }
            if (string.IsNullOrEmpty(fojas_insc))
            {
                fojas_insc = "0";
            }
            if (string.IsNullOrEmpty(n_insc))
            {
                n_insc = "0";
            }
            if (string.IsNullOrEmpty(anio_insc))
            {
                anio_insc = "0";
            }
            if (string.IsNullOrEmpty(fojas1_hip))
            {
                fojas1_hip = "0";
            }
            if (string.IsNullOrEmpty(n1_hip))
            {
                n1_hip = "0";
            }
            if (string.IsNullOrEmpty(anio1_hip))
            {
                anio1_hip = "0";
            }
            if (string.IsNullOrEmpty(fojas2_hip))
            {
                fojas2_hip = "0";
            }
            if (string.IsNullOrEmpty(n2_hip))
            {
                n2_hip = "0";
            }
            if (string.IsNullOrEmpty(anio2_hip))
            {
                anio2_hip = "0";
            }
            if (string.IsNullOrEmpty(fojas1_proh))
            {
                fojas1_proh = "0";
            }
            if (string.IsNullOrEmpty(n1_proh))
            {
                n1_proh = "0";
            }
            if (string.IsNullOrEmpty(anio1_proh))
            {
                anio1_proh = "0";
            }
            if (string.IsNullOrEmpty(fojas2_proh))
            {
                fojas2_proh = "0";
            }
            if (string.IsNullOrEmpty(n2_proh))
            {
                n2_proh = "0";
            }
            if (string.IsNullOrEmpty(anio2_proh))
            {
                anio2_proh = "0";
            }
            if (string.IsNullOrEmpty(id_region_cbr))
            {
                id_region_cbr = "0";
            }
            if (string.IsNullOrEmpty(id_comuna_cbr))
            {
                id_comuna_cbr = "0";
            }
            if (string.IsNullOrEmpty(id_conservador))
            {
                id_conservador = "0";
            }
            if (string.IsNullOrEmpty(id_region_notaria))
            {
                id_region_notaria = "0";
            }
            if (string.IsNullOrEmpty(id_comuna_notaria))
            {
                id_comuna_notaria = "0";
            }
            if (string.IsNullOrEmpty(id_notaria))
            {
                id_notaria = "0";
            }
            if (string.IsNullOrEmpty(id_limitaciones))
            {
                id_limitaciones = "0";
            }
            if (string.IsNullOrEmpty(domicilio))
            {
                domicilio = "0";
            }
            StringBuilder stringBuilder = new StringBuilder();
            stringBuilder.Append(" INSERT INTO bienraiz(");
            stringBuilder.Append(" rut_deudor,");
            stringBuilder.Append(" fojas_insc,");
            stringBuilder.Append(" n_insc,");
            stringBuilder.Append(" anio_insc,");
            stringBuilder.Append(" fojas1_hip,");
            stringBuilder.Append(" n1_hip,");
            stringBuilder.Append(" anio1_hip,");
            stringBuilder.Append(" fojas2_hip,");
            stringBuilder.Append(" n2_hip,");
            stringBuilder.Append(" anio2_hip,");
            stringBuilder.Append(" fojas1_proh,");
            stringBuilder.Append(" n1_proh,");
            stringBuilder.Append(" anio1_proh,");
            stringBuilder.Append(" fojas2_proh,");
            stringBuilder.Append(" n2_proh,");
            stringBuilder.Append(" anio2_proh,");
            stringBuilder.Append(" id_region_cbr,");
            stringBuilder.Append(" id_comuna_cbr,");
            stringBuilder.Append(" id_conservador,");
            stringBuilder.Append(" id_region_notaria,");
            stringBuilder.Append(" id_comuna_notaria,");
            stringBuilder.Append(" id_notaria,");
            stringBuilder.Append(" rol_avaluo,");
            stringBuilder.Append(" fescritura,");
            stringBuilder.Append(" estado,");
            stringBuilder.Append(" fuente,");
            stringBuilder.Append(" id_limitaciones,");
            stringBuilder.Append(" id_domicilio,Vueltatipofojainsc,Vueltatipofojahip1,Vueltatipofojahip2,Vueltatipofojaproh1,Vueltatipofojaproh2");
            stringBuilder.Append(" ) VALUES(");
            stringBuilder.Append(" '" + rut_deudor.Trim().ToUpper() + "',");
            stringBuilder.Append(" " + Convert.ToInt64(fojas_insc) + ",");
            stringBuilder.Append(" " + Convert.ToInt64(n_insc) + ",");
            stringBuilder.Append(" " + Convert.ToInt64(anio_insc) + ",");
            stringBuilder.Append(" " + Convert.ToInt64(fojas1_hip) + ",");
            stringBuilder.Append(" " + Convert.ToInt64(n1_hip) + ",");
            stringBuilder.Append(" " + Convert.ToInt64(anio1_hip) + ",");
            stringBuilder.Append(" " + Convert.ToInt64(fojas2_hip) + ",");
            stringBuilder.Append(" " + Convert.ToInt64(n2_hip) + ",");
            stringBuilder.Append(" " + Convert.ToInt64(anio2_hip) + ",");
            stringBuilder.Append(" " + Convert.ToInt64(fojas1_proh) + ",");
            stringBuilder.Append(" " + Convert.ToInt64(n1_proh) + ",");
            stringBuilder.Append(" " + Convert.ToInt64(anio1_proh) + ",");
            stringBuilder.Append(" " + Convert.ToInt64(fojas2_proh) + ",");
            stringBuilder.Append(" " + Convert.ToInt64(n2_proh) + ",");
            stringBuilder.Append(" " + Convert.ToInt64(anio2_proh) + ",");
            stringBuilder.Append(" " + Convert.ToInt64(id_region_cbr) + ",");
            stringBuilder.Append(" " + Convert.ToInt64(id_comuna_cbr) + ",");
            stringBuilder.Append(" " + Convert.ToInt64(id_conservador) + ",");
            stringBuilder.Append(" " + Convert.ToInt64(id_region_notaria) + ",");
            stringBuilder.Append(" " + Convert.ToInt64(id_comuna_notaria) + ",");
            stringBuilder.Append(" " + Convert.ToInt64(id_notaria) + ",");
            stringBuilder.Append(" '" + rol_avaluo.Trim().ToUpper() + "',");
            stringBuilder.Append(" '" + str + "',");
            stringBuilder.Append(" '" + estado.Trim().ToUpper() + "',");
            stringBuilder.Append(" '" + fuente.Trim().ToUpper() + "',");
            stringBuilder.Append(" " + Convert.ToInt64(id_limitaciones) + ",");
            stringBuilder.Append(" " + Convert.ToInt64(domicilio) + ",");
            stringBuilder.Append(" '" + Vueltatipofojainsc.Trim() + "',");
            stringBuilder.Append(" '" + Vueltatipofojahip1.Trim() + "',");
            stringBuilder.Append(" '" + Vueltatipofojahip2.Trim() + "',");
            stringBuilder.Append(" '" + Vueltatipofojaproh1.Trim() + "',");
            stringBuilder.Append(" '" + Vueltatipofojaproh2.Trim() + "'");
            stringBuilder.Append(" )");
            BaseDatos baseDatos = new BaseDatos();
            baseDatos.SQLExecute(stringBuilder.ToString());
        }
        public static void ActualizaBienMueble(string patente, string id_tipo_vehi, string id_marca, string id_modelo, string n_chassis, string id_color, string n_motor, string anio_fabricacion, string id_limitaciones, string estado)
        {
            if (string.IsNullOrEmpty(id_tipo_vehi))
            {
                id_tipo_vehi = "0";
            }
            if (string.IsNullOrEmpty(id_marca))
            {
                id_marca = "0";
            }
            if (string.IsNullOrEmpty(id_modelo))
            {
                id_modelo = "0";
            }
            if (string.IsNullOrEmpty(id_color))
            {
                id_color = "0";
            }
            if (string.IsNullOrEmpty(anio_fabricacion))
            {
                anio_fabricacion = "0";
            }
            if (string.IsNullOrEmpty(id_limitaciones))
            {
                id_limitaciones = "0";
            }
            if (id_color == "Seleccione")
            {
                id_color = "0";
            }
            StringBuilder stringBuilder = new StringBuilder();
            stringBuilder.Append(" UPDATE bienmueble SET ");
            stringBuilder.Append(" id_tipo_vehi = " + Convert.ToInt64(id_tipo_vehi) + " ,");
            stringBuilder.Append(" id_marca = " + Convert.ToInt64(id_marca) + " ,");
            stringBuilder.Append(" id_modelo = " + Convert.ToInt64(id_modelo) + " ,");
            stringBuilder.Append(" n_chassis = '" + n_chassis + "' ,");
            stringBuilder.Append(" id_color = " + Convert.ToInt64(id_color) + " ,");
            stringBuilder.Append(" n_motor = '" + n_motor + "' ,");
            stringBuilder.Append(" anio_fabricacion = " + Convert.ToInt64(anio_fabricacion) + " ,");
            stringBuilder.Append(" id_limitaciones = " + Convert.ToInt64(id_limitaciones) + " ,");
            stringBuilder.Append(" estado = '" + estado.Trim().ToUpper() + "' ");
            stringBuilder.Append(" WHERE ");
            stringBuilder.Append(" rtrim(ltrim(patente)) = '" + patente.Trim() + "' ");
            BaseDatos baseDatos = new BaseDatos();
            baseDatos.SQLExecute(stringBuilder.ToString());
        }
        
        //Jbaez: inserta Marca del Auto 24-03-2014
        public static void InsertaMarcaAuto(string descripcion)
        {
            if (string.IsNullOrEmpty(descripcion))
            {
                return;
            }
       
            StringBuilder stringBuilder = new StringBuilder();
            stringBuilder.Append(" INSERT INTO Marca(");
            stringBuilder.Append(" descripcion");
           
            stringBuilder.Append(" ) VALUES(");
            stringBuilder.Append(" '" + descripcion.Trim().ToUpper() + "'");
            stringBuilder.Append(" )");
            BaseDatos baseDatos = new BaseDatos();
            baseDatos.SQLExecute(stringBuilder.ToString());
        }
        public static DataTable Consulta_ModeloAuto(string Marca)
        {
           
            StringBuilder stringBuilder = new StringBuilder();
            stringBuilder.Append(" select top(1)id_marca from marca where  upper(descripcion)= '" + Marca.Trim().ToUpper() +"'" );
            BaseDatos baseDatos = new BaseDatos();
           
            return baseDatos.getResultset(stringBuilder.ToString());
        }
        public static DataTable Consulta_ModeloAuto(string Marca,string Modelo)
        {

            StringBuilder stringBuilder = new StringBuilder();
            stringBuilder.Append(" select top(1)id_marca from modelo where  upper(descripcion)= '" + Modelo.Trim().ToUpper() + "' and id_marca='" + Marca.Trim().ToUpper() + "'");
            BaseDatos baseDatos = new BaseDatos();

            return baseDatos.getResultset(stringBuilder.ToString());
        }
        //Jbaez: inserta Marca del Auto 24-03-2014
        public static void InsertaModeloAuto(Int32 Marca,string Modelo)
        {
           
            StringBuilder stringBuilder = new StringBuilder();
            stringBuilder.Append(" INSERT INTO Modelo(");
            stringBuilder.Append(" id_marca,descripcion");

            stringBuilder.Append(" ) VALUES(");
            stringBuilder.Append(" " + Marca + ",");
            stringBuilder.Append(" '" + Modelo.Trim().ToUpper() + "'");
            stringBuilder.Append(" )");
            BaseDatos baseDatos = new BaseDatos();
            baseDatos.SQLExecute(stringBuilder.ToString());
        }

        public static void InsertaBienMueble(string id_tipo_vehi, string id_marca, string id_modelo, string n_chassis, string id_color, string rut_deudor, string n_motor, string patente, string anio_fabricacion, string id_limitaciones, string estado)
        {
            if (string.IsNullOrEmpty(id_tipo_vehi))
            {
                id_tipo_vehi = "0";
            }
            if (string.IsNullOrEmpty(id_marca))
            {
                id_marca = "0";
            }
            if (string.IsNullOrEmpty(id_modelo))
            {
                id_modelo = "0";
            }
            if (string.IsNullOrEmpty(id_color))
            {
                id_color = "0";
            }
            if (string.IsNullOrEmpty(anio_fabricacion))
            {
                anio_fabricacion = "0";
            }
            if (string.IsNullOrEmpty(id_limitaciones))
            {
                id_limitaciones = "0";
            }
            if (id_color == "Seleccione")
            {
                id_color = "0";
            }
            StringBuilder stringBuilder = new StringBuilder();
            stringBuilder.Append(" INSERT INTO bienmueble(");
            stringBuilder.Append(" id_tipo_vehi,");
            stringBuilder.Append(" id_marca,");
            stringBuilder.Append(" id_modelo,");
            stringBuilder.Append(" n_chassis,");
            stringBuilder.Append(" id_color,");
            stringBuilder.Append(" rut_deudor,");
            stringBuilder.Append(" n_motor,");
            stringBuilder.Append(" patente,");
            stringBuilder.Append(" anio_fabricacion,");
            stringBuilder.Append(" id_limitaciones,");
            stringBuilder.Append(" estado");
            stringBuilder.Append(" ) VALUES(");
            stringBuilder.Append(" " + Convert.ToInt64(id_tipo_vehi) + ",");
            stringBuilder.Append(" " + Convert.ToInt64(id_marca) + ",");
            stringBuilder.Append(" " + Convert.ToInt64(id_modelo) + ",");
            stringBuilder.Append(" '" + n_chassis.Trim().ToUpper() + "',");
            stringBuilder.Append(" " + Convert.ToInt64(id_color) + ",");
            stringBuilder.Append(" '" + rut_deudor.Trim().ToUpper() + "',");
            stringBuilder.Append(" '" + n_motor.Trim().ToUpper() + "',");
            stringBuilder.Append(" '" + patente.Trim().ToUpper().Replace("-", "") + "',");
            stringBuilder.Append(" " + Convert.ToInt64(anio_fabricacion) + ",");
            stringBuilder.Append(" " + Convert.ToInt64(id_limitaciones) + ",");
            stringBuilder.Append(" '" + estado.Trim().ToUpper() + "'");
            stringBuilder.Append(" )");
            BaseDatos baseDatos = new BaseDatos();
            baseDatos.SQLExecute(stringBuilder.ToString());
        }

        public static int InsertaCobranza(CobranzaALC.Dto.CobranzaDTO adto, string usuario)
        {
            return InsertaCobranza(adto.NroOperacion, adto.Rut_Cli, adto.Rut_Deudor, adto.Id_Procedimiento.ToString(), adto.Id_Materia.ToString(), adto.Id_Producto.ToString(), adto.Tipo_Cobranza, usuario, adto.Codigo, adto.id_remesa);  
        }

        public static int InsertaCobranza(string noperacion, string rut_cli, string rut_deudor, string id_procedimiento, string id_materia, string id_producto, string tipo_cobranza, string USUARIO, string codigo, int id_remesa)
        {
            if (string.IsNullOrEmpty(noperacion)) noperacion = "0";
            if (string.IsNullOrEmpty(id_procedimiento))id_procedimiento = "0";
            if (string.IsNullOrEmpty(id_materia)) id_materia = "0";
            if (string.IsNullOrEmpty(id_producto))id_producto = "0";
            
            StringBuilder stringBuilder = new StringBuilder();
            stringBuilder.Append(" INSERT INTO cobranza(");
            stringBuilder.Append(" nrooperacion,");
            stringBuilder.Append(" rut_cli,");
            stringBuilder.Append(" rut_deudor,");
            stringBuilder.Append(" id_procedimiento,");
            stringBuilder.Append(" id_materia,");
            stringBuilder.Append(" id_producto,");
            stringBuilder.Append(" tipo,");
            stringBuilder.Append(" tipocobranza,");
            stringBuilder.Append(" fproceso,");
            stringBuilder.Append(" usuario,");
            stringBuilder.Append(" codigo,");
            stringBuilder.Append(" id_remesa");
            stringBuilder.Append(" ) VALUES(");
            stringBuilder.Append(" '" + noperacion + "',");
            stringBuilder.Append(" '" + rut_cli.Trim().ToUpper() + "',");
            stringBuilder.Append(" '" + rut_deudor.Trim().ToUpper().Replace(".", "") + "',");
            stringBuilder.Append(" " + Convert.ToInt64(id_procedimiento) + ",");
            stringBuilder.Append(" " + Convert.ToInt64(id_materia) + ",");
            stringBuilder.Append(" " + Convert.ToInt64(id_producto) + ",");
            stringBuilder.Append(" 'A',");
            stringBuilder.Append(" '" + tipo_cobranza.Trim().ToUpper() + "',getdate(),");
            stringBuilder.Append(" '" + USUARIO.Trim() + "',");
            stringBuilder.Append(" '" + codigo.Trim() + "',");
            stringBuilder.AppendFormat(" {0}", id_remesa > 0 ? id_remesa.ToString() : "NULL");
            stringBuilder.Append(" );Select @@Identity");

            object objRetorno = new BaseDatos().getRowValue(stringBuilder.ToString());
            return objRetorno != null ? Convert.ToInt32(objRetorno) : 0;
        }

        public static DataTable InsertaDocuDigitalizado(string rut_deudor, string folio, string rut_cli, string id_descripcion)
        {
            if (string.IsNullOrEmpty(rut_deudor))
            {
                rut_deudor = "";
            }
            StringBuilder stringBuilder = new StringBuilder();
            stringBuilder.Append(" INSERT INTO docudigitalizados(");
            stringBuilder.Append(" rut_deudor,");
            stringBuilder.Append(" fproceso,");
            stringBuilder.Append(" folio, ");
            stringBuilder.Append(" rut_cli, ");
            stringBuilder.Append(" id_descripcion ");
            stringBuilder.Append(" ) VALUES(");
            stringBuilder.Append(" '" + rut_deudor.Trim().ToUpper().Replace(".", "") + "',");
            stringBuilder.Append("getdate(),");
            stringBuilder.Append(" '" + folio.Trim() + "',");
            stringBuilder.Append(" '" + rut_cli.Trim() + "',");
            stringBuilder.Append(" " + Convert.ToInt64(id_descripcion));
            stringBuilder.Append(" );Select @@Identity");
            BaseDatos baseDatos = new BaseDatos();
            return baseDatos.getResultset(stringBuilder.ToString());
        }

        public static DataTable DigitalizaReconstitucion(string OT, string observacion, string usuario)
        {
            if (string.IsNullOrEmpty(OT))
            {
                OT = "0";
            }
            StringBuilder stringBuilder = new StringBuilder();
            stringBuilder.Append(" INSERT INTO ReconstitucionesDigitalizar(");
            stringBuilder.Append(" OT,");
            stringBuilder.Append(" observacion,");
            stringBuilder.Append(" usuario, ");
            stringBuilder.Append(" fproceso ");
            stringBuilder.Append(" ) VALUES(");
            stringBuilder.Append(" " + Convert.ToDecimal(OT) + ",");
            stringBuilder.Append(" '" + observacion.Trim().ToUpper() + "',");
            stringBuilder.Append(" '" + usuario.Trim() + "',");
            stringBuilder.Append(" getdate()");
            stringBuilder.Append(" );Select @@Identity");
            BaseDatos baseDatos = new BaseDatos();
            return baseDatos.getResultset(stringBuilder.ToString());
        }

        public static int InsertaMutuo(string idBienRaiz, string idCobranza, string moneda, string txtSubProducto, string txtMontoCred1esc, string txtMontoCred2esc, string txtSerieLetraCred, string txtPlazoMutuoMeses, string txtFecha1Vcto, string txtTasaInt1Esc, string txtTasaInt2Esc, string txtNumero1Divimpago, string txtNumeroUltDivImpago, string txtFechaLiquidacion, string txtMontoDivAdeudadoUF, string txtMontoDivAdeudadoPESO, string txtFechaMora, string txtSaldoTotalDeudaUF, string txtTotalAdeudado, string txtNroDocum, string fecha_prescripcion)
        {
            string str;
            if (string.IsNullOrEmpty(txtFecha1Vcto))
            {
                str = "01/01/1900";
            }
            else
            {
                str = string.Concat(new string[]
				{
					txtFecha1Vcto.Substring(0, 2).ToString(),
					"-",
					txtFecha1Vcto.Substring(3, 2).ToString(),
					"-",
					txtFecha1Vcto.Substring(6, 4).ToString()
				});
            }
            string str2;
            if (string.IsNullOrEmpty(txtFechaLiquidacion))
            {
                str2 = "01/01/1900";
            }
            else
            {
                str2 = string.Concat(new string[]
				{
					txtFechaLiquidacion.Substring(0, 2).ToString(),
					"-",
					txtFechaLiquidacion.Substring(3, 2).ToString(),
					"-",
					txtFechaLiquidacion.Substring(6, 4).ToString()
				});
            }
            string str3;
            if (string.IsNullOrEmpty(txtFechaMora))
            {
                str3 = "01/01/1900";
            }
            else
            {
                str3 = string.Concat(new string[]
				{
					txtFechaMora.Substring(0, 2).ToString(),
					"-",
					txtFechaMora.Substring(3, 2).ToString(),
					"-",
					txtFechaMora.Substring(6, 4).ToString()
				});
            }
            if (string.IsNullOrEmpty(idBienRaiz))
            {
                idBienRaiz = "0";
            }
            if (string.IsNullOrEmpty(idCobranza))
            {
                idCobranza = "0";
            }
            if (string.IsNullOrEmpty(txtMontoCred2esc))
            {
                txtMontoCred2esc = "0";
            }
            if (string.IsNullOrEmpty(txtTasaInt2Esc))
            {
                txtTasaInt2Esc = "0";
            }
            if (string.IsNullOrEmpty(txtSubProducto))
            {
                txtSubProducto = "0";
            }
            StringBuilder stringBuilder = new StringBuilder();
            stringBuilder.Append(" INSERT INTO mutuo(");
            stringBuilder.Append(" id_cobranza,");
            stringBuilder.Append(" id_bien_raiz,");
            stringBuilder.Append(" id_moneda,");
            stringBuilder.Append(" subproducto,");
            stringBuilder.Append(" monto_cred_1_esc,");
            stringBuilder.Append(" monto_cred_2_esc,");
            stringBuilder.Append(" serie_let_cred,");
            stringBuilder.Append(" plazo_mutuo_mes,");
            stringBuilder.Append(" fecha_1_venc,");
            stringBuilder.Append(" taza_int_1_esc,");
            stringBuilder.Append(" taza_int_2_esc,");
            stringBuilder.Append(" n_1_div_impago,");
            stringBuilder.Append(" n_ult_div_impago,");
            stringBuilder.Append(" fecha_liquidacion,");
            stringBuilder.Append(" monto_div_adeudado_uf,");
            stringBuilder.Append(" monto_div_adeudado_ps,");
            stringBuilder.Append(" saldo_total_deuda_uf,");
            stringBuilder.Append(" total_adeudado,");
            stringBuilder.Append(" fecha_mora,");
            stringBuilder.Append(" nrodocumento,");
            stringBuilder.Append(" fecha_prescripcion,fproceso");
            stringBuilder.Append(" ) VALUES(");
            stringBuilder.Append(" " + Convert.ToInt64(idCobranza) + ",");
            stringBuilder.Append(" " + Convert.ToInt64(idBienRaiz) + ",");
            stringBuilder.Append(" " + Convert.ToInt64(moneda) + ",");
            stringBuilder.Append(" " + Convert.ToInt64(txtSubProducto) + ",");
            stringBuilder.Append(" " + Convert.ToInt64(txtMontoCred1esc) + ",");
            stringBuilder.Append(" " + Convert.ToInt64(txtMontoCred2esc) + ",");
            stringBuilder.Append(" '" + txtSerieLetraCred.ToUpper() + "',");
            stringBuilder.Append(" " + Convert.ToInt64(txtPlazoMutuoMeses) + ",");
            stringBuilder.Append(" '" + str + "',");
            stringBuilder.Append(" " + Convert.ToDecimal(txtTasaInt1Esc) + ",");
            stringBuilder.Append(" " + Convert.ToDecimal(txtTasaInt2Esc) + ",");
            stringBuilder.Append(" " + Convert.ToInt64(txtNumero1Divimpago) + ",");
            stringBuilder.Append(" " + Convert.ToInt64(txtNumeroUltDivImpago) + ",");
            stringBuilder.Append(" '" + str2 + "',");
            stringBuilder.Append(" " + Convert.ToDecimal(txtMontoDivAdeudadoUF) + ",");
            stringBuilder.Append(" " + Convert.ToInt64(txtMontoDivAdeudadoPESO) + ",");
            stringBuilder.Append(" " + Convert.ToDecimal(txtSaldoTotalDeudaUF) + ",");
            stringBuilder.Append(" " + Convert.ToInt64(txtTotalAdeudado) + ",");
            stringBuilder.Append(" '" + str3 + "',");
            stringBuilder.Append(" '" + txtNroDocum.ToString().Trim().ToUpper() + "',");
            stringBuilder.Append(" '" + fecha_prescripcion + "',getdate()");
            stringBuilder.Append(" );Select @@Identity");
            BaseDatos baseDatos = new BaseDatos();
            return Convert.ToInt32(baseDatos.getRowValue(stringBuilder.ToString()));
        }

        public static DataTable InsertaDocuJuicio(string id_cobranza, string id_domicilio, string representante1, string representante2, string rut_deudor_endosante, string id_domicilio_endosante, string faceptacion, string id_notario, string id_comuna_notario, string fautorizacionnotarial, string nrodocumento, string tituloconstadeuda, string fdeuda, string id_banco, string ctacte, string numserie, string numcheque, string monto, string fgiroemision, string fvencimiento, string fprescripcion, string actaprotesto, string direccionacta, string observacion)
        {
            if (actaprotesto.Length > 0)
            {
                int num = (int)Convert.ToInt16(actaprotesto.Length);
                if (num > 490)
                {
                    actaprotesto = actaprotesto.Substring(0, 490);
                }
            }
            if (observacion.Length > 0)
            {
                int num2 = (int)Convert.ToInt16(observacion.Length);
                if (num2 > 490)
                {
                    observacion = observacion.Substring(0, 490);
                }
            }
            if (string.IsNullOrEmpty(id_cobranza))
            {
                id_cobranza = "0";
            }
            if (string.IsNullOrEmpty(id_domicilio))
            {
                id_domicilio = "0";
            }
            if (string.IsNullOrEmpty(id_domicilio_endosante))
            {
                id_domicilio_endosante = "0";
            }
            if (string.IsNullOrEmpty(id_notario))
            {
                id_notario = "0";
            }
            if (string.IsNullOrEmpty(id_comuna_notario))
            {
                id_comuna_notario = "0";
            }
            if (string.IsNullOrEmpty(id_banco))
            {
                id_banco = "0";
            }
            if (string.IsNullOrEmpty(monto))
            {
                monto = "0";
            }
            if (string.IsNullOrEmpty(faceptacion))
            {
                faceptacion = "01/01/1900";
            }
            if (string.IsNullOrEmpty(fautorizacionnotarial))
            {
                fautorizacionnotarial = "01/01/1900";
            }
            if (string.IsNullOrEmpty(fdeuda))
            {
                fdeuda = "01/01/1900";
            }
            if (string.IsNullOrEmpty(fgiroemision))
            {
                fgiroemision = "01/01/1900";
            }
            if (string.IsNullOrEmpty(fvencimiento))
            {
                fvencimiento = "01/01/1900";
            }
            if (string.IsNullOrEmpty(fprescripcion))
            {
                fprescripcion = "01/01/1900";
            }
            if (id_domicilio == "Seleccione")
            {
                id_domicilio = "0";
            }
            if (id_comuna_notario == "Seleccione")
            {
                id_comuna_notario = "0";
            }
            if (id_banco == "Seleccione")
            {
                id_banco = "0";
            }
            actaprotesto = actaprotesto.Replace("'", "");
            direccionacta = direccionacta.Replace("'", "");
            observacion = observacion.Replace("'", "");
            StringBuilder stringBuilder = new StringBuilder();
            stringBuilder.Append(" INSERT INTO docujuicio(");
            stringBuilder.Append(" id_cobranza, id_domicilio, representante1, representante2, rut_deudor_endosante, id_domicilio_endosante, faceptacion, id_notario, id_comuna_notario, fautorizacionnotarial, nrodocumento, tituloconstadeuda, fdeuda, id_banco, ctacte, numserie, numcheque, monto, fgiroemision, fvencimiento, fprescripcion, actaprotesto, direccionacta, observacion, fproceso");
            stringBuilder.Append(" ) VALUES(");
            stringBuilder.Append(" " + Convert.ToInt64(id_cobranza) + ",");
            stringBuilder.Append(" " + Convert.ToInt64(id_domicilio) + ",");
            stringBuilder.Append(" '" + representante1.Trim().ToUpper().Replace(".", "") + "',");
            stringBuilder.Append(" '" + representante2.Trim().ToUpper().Replace(".", "") + "',");
            stringBuilder.Append(" '" + rut_deudor_endosante.Trim().ToUpper().Replace(".", "") + "',");
            stringBuilder.Append(" " + Convert.ToInt64(id_domicilio_endosante) + ",");
            stringBuilder.Append(" '" + faceptacion + "',");
            stringBuilder.Append(" " + Convert.ToInt64(id_notario) + ",");
            stringBuilder.Append(" " + Convert.ToInt64(id_comuna_notario) + ",");
            stringBuilder.Append(" '" + fautorizacionnotarial + "',");
            stringBuilder.Append(" '" + nrodocumento.Trim().ToUpper() + "',");
            stringBuilder.Append(" '" + tituloconstadeuda.Trim() + "',");
            stringBuilder.Append(" '" + fdeuda + "',");
            stringBuilder.Append(" " + Convert.ToInt64(id_banco) + ",");
            stringBuilder.Append(" '" + ctacte.Trim() + "',");
            stringBuilder.Append(" '" + numserie.Trim().ToUpper() + "',");
            stringBuilder.Append(" '" + numcheque.Trim().ToUpper() + "',");
            stringBuilder.Append(" " + Convert.ToDecimal(monto) + ",");
            stringBuilder.Append(" '" + fgiroemision + "',");
            stringBuilder.Append(" '" + fvencimiento + "',");
            stringBuilder.Append(" '" + fprescripcion + "',");
            stringBuilder.Append(" '" + actaprotesto.Trim() + "',");
            stringBuilder.Append(" '" + direccionacta.Trim() + "',");
            stringBuilder.Append(" '" + observacion.Trim() + "',");
            stringBuilder.Append(" getdate()");
            stringBuilder.Append(" );Select @@Identity");
            BaseDatos baseDatos = new BaseDatos();
            return baseDatos.getResultset(stringBuilder.ToString());
        }
        public static DataTable InsertaDocuESTANDARD_1(string id_cobranza, string rut_demandado2, string id_domicilio_demandado, string id_domicilio_demandado2, string rut_repres_legal, string nom_repres_legal, string Dire_repres_legal, string profesion_repres_legal, string cuantia, string relacion_hechos, string petitorio, string doc_fundantes, string observacion)
        {
            if (string.IsNullOrEmpty(id_cobranza))
            {
                id_cobranza = "0";
            }
            if (string.IsNullOrEmpty(id_domicilio_demandado))
            {
                id_domicilio_demandado = "0";
            }
            if (string.IsNullOrEmpty(id_domicilio_demandado2))
            {
                id_domicilio_demandado2 = "0";
            }
            relacion_hechos = relacion_hechos.Replace("'", "");
            petitorio = petitorio.Replace("'", "");
            doc_fundantes = doc_fundantes.Replace("'", "");
            observacion = observacion.Replace("'", "");
            StringBuilder stringBuilder = new StringBuilder();
            stringBuilder.Append(" INSERT INTO DocuEstandard1(");
            stringBuilder.Append(" id_cobranza, rut_demandado2, id_domicilio_demandado, id_domicilio_demandado2, rut_repres_legal, nom_repres_legal, Dire_repres_legal, profesion_repres_legal, cuantia, relacion_hechos, petitorio, doc_fundantes, observacion, fproceso");
            stringBuilder.Append(" ) VALUES(");
            stringBuilder.Append(" " + Convert.ToInt64(id_cobranza) + ",");
            stringBuilder.Append(" '" + rut_demandado2.Trim().ToUpper().Replace(".", "") + "',");
            stringBuilder.Append(" " + Convert.ToInt64(id_domicilio_demandado) + ",");
            stringBuilder.Append(" " + Convert.ToInt64(id_domicilio_demandado2) + ",");
            stringBuilder.Append(" '" + rut_repres_legal.Trim().ToUpper().Replace(".", "") + "',");
            stringBuilder.Append(" '" + nom_repres_legal + "',");
            stringBuilder.Append(" '" + Dire_repres_legal + "',");
            stringBuilder.Append(" '" + profesion_repres_legal + "',");
            stringBuilder.Append(" " + Convert.ToDecimal(cuantia) + ",");
            stringBuilder.Append(" '" + relacion_hechos + "',");
            stringBuilder.Append(" '" + petitorio + "',");
            stringBuilder.Append(" '" + doc_fundantes + "',");
            stringBuilder.Append(" '" + observacion + "',");
            stringBuilder.Append(" getdate()");
            stringBuilder.Append(" );Select @@Identity");
            BaseDatos baseDatos = new BaseDatos();
            return baseDatos.getResultset(stringBuilder.ToString());
        }
        public static DataTable InsertaDocuESTANDARD_2(string id_cobranza, string txtCaratulaJuicio, string txtJuzgado, string txtRol, string txtTipoJuicio, string txtMateria, string txtDemandante, string txtDomicilioDemandante, string txtRutDemandante, string txtRepresentante, string txtAbogado, string txtDomicilioabogado, string txtRutAbogado, string txtDemandado, string txtRutDemandado, string txtRepresentante2, string txtActividad, string txtActividad2, string txtDomicilio, string txtmontoDemandado, string txtTituloFunda, string txtNroTitulo, string txtTipoNotificacion, string txtFechasubasta, string txtMinimosubasta, string txtDocumentosfundantes, string txtObservacion)
        {
            if (string.IsNullOrEmpty(id_cobranza))
            {
                id_cobranza = "0";
            }
            if (string.IsNullOrEmpty(txtmontoDemandado))
            {
                txtmontoDemandado = "0";
            }
            txtDocumentosfundantes = txtDocumentosfundantes.Replace("'", "");
            txtObservacion = txtObservacion.Replace("'", "");
            StringBuilder stringBuilder = new StringBuilder();
            stringBuilder.Append(" INSERT INTO DocuEstandard2(");
            stringBuilder.Append(" id_cobranza, txtCaratulaJuicio, txtJuzgado, txtRol, txtTipoJuicio, txtMateria, txtDemandante, txtDomicilioDemandante, txtRutDemandante, txtRepresentante, txtAbogado, txtDomicilioabogado, txtRutAbogado, txtDemandado, txtRutDemandado, txtRepresentante2, txtActividad, txtActividad2, txtDomicilio, txtmontoDemandado, txtTituloFunda, txtNroTitulo, txtTipoNotificacion, txtFechasubasta, txtMinimosubasta, txtDocumentosfundantes, txtObservacion, fproceso");
            stringBuilder.Append(" ) VALUES(");
            stringBuilder.Append(" " + Convert.ToInt64(id_cobranza) + ",");
            stringBuilder.Append(" '" + txtCaratulaJuicio + "',");
            stringBuilder.Append(" '" + txtJuzgado + "',");
            stringBuilder.Append(" '" + txtRol + "',");
            stringBuilder.Append(" '" + txtTipoJuicio + "',");
            stringBuilder.Append(" '" + txtMateria + "',");
            stringBuilder.Append(" '" + txtDemandante + "',");
            stringBuilder.Append(" '" + txtDomicilioDemandante + "',");
            stringBuilder.Append(" '" + txtRutDemandante + "',");
            stringBuilder.Append(" '" + txtRepresentante + "',");
            stringBuilder.Append(" '" + txtAbogado + "',");
            stringBuilder.Append(" '" + txtDomicilioabogado + "',");
            stringBuilder.Append(" '" + txtRutAbogado + "',");
            stringBuilder.Append(" '" + txtDemandado + "',");
            stringBuilder.Append(" '" + txtRutDemandado + "',");
            stringBuilder.Append(" '" + txtRepresentante2 + "',");
            stringBuilder.Append(" '" + txtActividad + "',");
            stringBuilder.Append(" '" + txtActividad2 + "',");
            stringBuilder.Append(" '" + txtDomicilio + "',");
            stringBuilder.Append(" " + Convert.ToDecimal(txtmontoDemandado) + ",");
            stringBuilder.Append(" '" + txtTituloFunda + "',");
            stringBuilder.Append(" '" + txtNroTitulo + "',");
            stringBuilder.Append(" '" + txtTipoNotificacion + "',");
            stringBuilder.Append(" '" + txtFechasubasta + "',");
            stringBuilder.Append(" '" + txtMinimosubasta + "',");
            stringBuilder.Append(" '" + txtDocumentosfundantes + "',");
            stringBuilder.Append(" '" + txtObservacion + "',");
            stringBuilder.Append(" getdate()");
            stringBuilder.Append(" );Select @@Identity");
            BaseDatos baseDatos = new BaseDatos();
            return baseDatos.getResultset(stringBuilder.ToString());
        }
        public static DataTable InsertaDocuESTANDARD_3(string id_cobranza, string rut_demandado2, string id_domicilio_demandado, string id_domicilio_demandado2, string rut_repres_legal, string nom_repres_legal, string Dire_repres_legal, string profesion_repres_legal, string cuantia, string relacion_hechos, string petitorio, string doc_fundantes, string observacion, string txtFechaTerminoRelacionLaboral, string txtMontoRemuneracion, string txtFechaInicioRelacionLaboral, string txtCargo)
        {
            if (string.IsNullOrEmpty(id_cobranza))
            {
                id_cobranza = "0";
            }
            if (string.IsNullOrEmpty(id_domicilio_demandado))
            {
                id_domicilio_demandado = "0";
            }
            if (string.IsNullOrEmpty(id_domicilio_demandado2))
            {
                id_domicilio_demandado2 = "0";
            }
            if (string.IsNullOrEmpty(txtMontoRemuneracion))
            {
                txtMontoRemuneracion = "0";
            }
            relacion_hechos = relacion_hechos.Replace("'", "");
            petitorio = petitorio.Replace("'", "");
            doc_fundantes = doc_fundantes.Replace("'", "");
            observacion = observacion.Replace("'", "");
            StringBuilder stringBuilder = new StringBuilder();
            stringBuilder.Append(" INSERT INTO DocuEstandard3(");
            stringBuilder.Append(" id_cobranza, rut_demandado2, id_domicilio_demandado, id_domicilio_demandado2, rut_repres_legal, nom_repres_legal, Dire_repres_legal, profesion_repres_legal, cuantia,txtFechaTerminoRelacionLaboral,txtMontoRemuneracion,txtFechaInicioRelacionLaboral,txtCargo, relacion_hechos, petitorio, doc_fundantes, observacion, fproceso");
            stringBuilder.Append(" ) VALUES(");
            stringBuilder.Append(" " + Convert.ToInt64(id_cobranza) + ",");
            stringBuilder.Append(" '" + rut_demandado2.Trim().ToUpper().Replace(".", "") + "',");
            stringBuilder.Append(" " + Convert.ToInt64(id_domicilio_demandado) + ",");
            stringBuilder.Append(" " + Convert.ToInt64(id_domicilio_demandado2) + ",");
            stringBuilder.Append(" '" + rut_repres_legal.Trim().ToUpper().Replace(".", "") + "',");
            stringBuilder.Append(" '" + nom_repres_legal + "',");
            stringBuilder.Append(" '" + Dire_repres_legal + "',");
            stringBuilder.Append(" '" + profesion_repres_legal + "',");
            stringBuilder.Append(" " + Convert.ToDecimal(cuantia) + ",");
            stringBuilder.Append(" '" + txtFechaTerminoRelacionLaboral + "',");
            stringBuilder.Append(" " + Convert.ToDecimal(txtMontoRemuneracion) + ",");
            stringBuilder.Append(" '" + txtFechaInicioRelacionLaboral + "',");
            stringBuilder.Append(" '" + txtCargo + "',");
            stringBuilder.Append(" '" + relacion_hechos + "',");
            stringBuilder.Append(" '" + petitorio + "',");
            stringBuilder.Append(" '" + doc_fundantes + "',");
            stringBuilder.Append(" '" + observacion + "',");
            stringBuilder.Append(" getdate()");
            stringBuilder.Append(" );Select @@Identity");
            BaseDatos baseDatos = new BaseDatos();
            return baseDatos.getResultset(stringBuilder.ToString());
        }
        public static DataTable InsertaDocuESTANDARD_4(string id_cobranza, string rut_demandado2, string id_domicilio_demandado, string id_domicilio_demandado2, string rut_repres_legal, string nom_repres_legal, string Dire_repres_legal, string profesion_repres_legal, string cuantia, string relacion_hechos, string petitorio, string doc_fundantes, string observacion, string txtDelito, string txtFechaComisionDelito, string txtsituacionautor)
        {
            if (string.IsNullOrEmpty(id_cobranza))
            {
                id_cobranza = "0";
            }
            if (string.IsNullOrEmpty(id_domicilio_demandado))
            {
                id_domicilio_demandado = "0";
            }
            if (string.IsNullOrEmpty(id_domicilio_demandado2))
            {
                id_domicilio_demandado2 = "0";
            }
            relacion_hechos = relacion_hechos.Replace("'", "");
            petitorio = petitorio.Replace("'", "");
            doc_fundantes = doc_fundantes.Replace("'", "");
            observacion = observacion.Replace("'", "");
            StringBuilder stringBuilder = new StringBuilder();
            stringBuilder.Append(" INSERT INTO DocuEstandard4(");
            stringBuilder.Append(" id_cobranza, rut_demandado2, id_domicilio_demandado, id_domicilio_demandado2, rut_repres_legal, nom_repres_legal, Dire_repres_legal, profesion_repres_legal, cuantia, relacion_hechos, petitorio, doc_fundantes, observacion, fproceso,delito,fecha_comision_delito,situacion_autor");
            stringBuilder.Append(" ) VALUES(");
            stringBuilder.Append(" " + Convert.ToInt64(id_cobranza) + ",");
            stringBuilder.Append(" '" + rut_demandado2.Trim().ToUpper().Replace(".", "") + "',");
            stringBuilder.Append(" " + Convert.ToInt64(id_domicilio_demandado) + ",");
            stringBuilder.Append(" " + Convert.ToInt64(id_domicilio_demandado2) + ",");
            stringBuilder.Append(" '" + rut_repres_legal.Trim().ToUpper().Replace(".", "") + "',");
            stringBuilder.Append(" '" + nom_repres_legal + "',");
            stringBuilder.Append(" '" + Dire_repres_legal + "',");
            stringBuilder.Append(" '" + profesion_repres_legal + "',");
            stringBuilder.Append(" " + Convert.ToDecimal(cuantia) + ",");
            stringBuilder.Append(" '" + relacion_hechos + "',");
            stringBuilder.Append(" '" + petitorio + "',");
            stringBuilder.Append(" '" + doc_fundantes + "',");
            stringBuilder.Append(" '" + observacion + "',");
            stringBuilder.Append(" getdate(),");
            stringBuilder.Append(" '" + txtDelito + "',");
            stringBuilder.Append(" '" + txtFechaComisionDelito + "',");
            stringBuilder.Append(" '" + txtsituacionautor + "'");
            stringBuilder.Append(" );Select @@Identity");
            BaseDatos baseDatos = new BaseDatos();
            return baseDatos.getResultset(stringBuilder.ToString());
        }
        public static DataTable InsertaDocuPagare(string id_cobranza, string nropagare, string id_domicilio, string rut_representante1, string id_domi_repre1, string rut_representante2, string id_domi_repre2, string montodemanda, string montotaldeuda, string fsuscripcion, string sumainisuscripcion, string id_moneda, string nrocuotas, string tasainteres, string vcto1cuota, string vctosiguientescuotas, string monto1cuotas, string montoultimacuota, string fmora, string fprescripcion, string fliquidacion, string id_comuna_exhorto, string fautorizacionfirma, string id_notaria, string id_comuna_notaria, string observacion)
        {
            if (observacion.Length > 0)
            {
                int num = (int)Convert.ToInt16(observacion.Length);
                if (num > 490)
                {
                    observacion = observacion.Substring(0, 490);
                }
            }
            if (string.IsNullOrEmpty(id_cobranza))
            {
                id_cobranza = "0";
            }
            if (string.IsNullOrEmpty(id_domicilio))
            {
                id_domicilio = "0";
            }
            if (string.IsNullOrEmpty(id_domi_repre1))
            {
                id_domi_repre1 = "0";
            }
            if (string.IsNullOrEmpty(id_domi_repre2))
            {
                id_domi_repre2 = "0";
            }
            if (string.IsNullOrEmpty(montodemanda))
            {
                montodemanda = "0";
            }
            if (string.IsNullOrEmpty(montotaldeuda))
            {
                montotaldeuda = "0";
            }
            if (string.IsNullOrEmpty(sumainisuscripcion))
            {
                sumainisuscripcion = "0";
            }
            if (string.IsNullOrEmpty(id_moneda))
            {
                id_moneda = "0";
            }
            if (string.IsNullOrEmpty(nrocuotas))
            {
                nrocuotas = "0";
            }
            if (string.IsNullOrEmpty(tasainteres))
            {
                tasainteres = "0";
            }
            if (string.IsNullOrEmpty(vctosiguientescuotas))
            {
                vctosiguientescuotas = "0";
            }
            if (string.IsNullOrEmpty(monto1cuotas))
            {
                monto1cuotas = "0";
            }
            if (string.IsNullOrEmpty(montoultimacuota))
            {
                montoultimacuota = "0";
            }
            if (string.IsNullOrEmpty(id_comuna_exhorto))
            {
                id_comuna_exhorto = "0";
            }
            if (string.IsNullOrEmpty(id_notaria))
            {
                id_notaria = "0";
            }
            if (string.IsNullOrEmpty(id_comuna_notaria))
            {
                id_notaria = "0";
            }
            if (string.IsNullOrEmpty(fsuscripcion))
            {
                fsuscripcion = "01/01/1900";
            }
            if (string.IsNullOrEmpty(vcto1cuota))
            {
                vcto1cuota = "01/01/1900";
            }
            if (string.IsNullOrEmpty(fmora))
            {
                fmora = "01/01/1900";
            }
            if (string.IsNullOrEmpty(fprescripcion))
            {
                fprescripcion = "01/01/1900";
            }
            if (string.IsNullOrEmpty(fliquidacion))
            {
                fliquidacion = "01/01/1900";
            }
            if (string.IsNullOrEmpty(fautorizacionfirma))
            {
                fautorizacionfirma = "01/01/1900";
            }
            if (id_moneda == "Seleccione")
            {
                id_moneda = "0";
            }
            if (id_domicilio == "Seleccione")
            {
                id_domicilio = "0";
            }
            if (id_comuna_exhorto == "Seleccione")
            {
                id_comuna_exhorto = "0";
            }
            if (id_notaria == "Seleccione")
            {
                id_notaria = "0";
            }
            if (id_comuna_notaria == "Seleccione")
            {
                id_comuna_notaria = "0";
            }
            observacion = observacion.Replace("'", "");
            StringBuilder stringBuilder = new StringBuilder();
            stringBuilder.Append(" INSERT INTO docupagare(");
            stringBuilder.Append(" id_cobranza, nropagare, id_domicilio, rut_representante1, id_domi_repre1, rut_representante2, id_domi_repre2, montodemanda, montotaldeuda, fsuscripcion, sumainisuscripcion, id_moneda, nrocuotas, tasainteres, vcto1cuota, vctosiguientescuotas, monto1cuotas, montoultimacuota, fmora, fprescripcion, fliquidacion, id_comuna_exhorto, fautorizacionfirma, id_notaria,id_comuna_notaria, observacion, fproceso");
            stringBuilder.Append(" ) VALUES(");
            stringBuilder.Append(" " + Convert.ToInt64(id_cobranza) + ",");
            stringBuilder.Append(" '" + nropagare.Trim().ToUpper() + "',");
            stringBuilder.Append(" " + Convert.ToInt64(id_domicilio) + ",");
            stringBuilder.Append(" '" + rut_representante1.Trim().ToUpper().Replace(".", "") + "',");
            stringBuilder.Append(" " + Convert.ToInt64(id_domi_repre1) + ",");
            stringBuilder.Append(" '" + rut_representante2.Trim().ToUpper().Replace(".", "") + "',");
            stringBuilder.Append(" " + Convert.ToInt64(id_domi_repre2) + ",");
            stringBuilder.Append(" " + Convert.ToDecimal(montodemanda) + ",");
            stringBuilder.Append(" " + Convert.ToDecimal(montotaldeuda) + ",");
            stringBuilder.Append(" '" + fsuscripcion + "',");
            stringBuilder.Append(" " + Convert.ToDecimal(sumainisuscripcion) + ",");
            stringBuilder.Append(" " + Convert.ToInt64(id_moneda) + ",");
            stringBuilder.Append(" " + Convert.ToInt64(nrocuotas) + ",");
            stringBuilder.Append(" " + Convert.ToDecimal(tasainteres) + ",");
            stringBuilder.Append(" '" + vcto1cuota + "',");
            stringBuilder.Append(" " + Convert.ToInt64(vctosiguientescuotas) + ",");
            stringBuilder.Append(" " + Convert.ToDecimal(monto1cuotas) + ",");
            stringBuilder.Append(" " + Convert.ToDecimal(montoultimacuota) + ",");
            stringBuilder.Append(" '" + fmora + "',");
            stringBuilder.Append(" '" + fprescripcion + "',");
            stringBuilder.Append(" '" + fliquidacion + "',");
            stringBuilder.Append(" " + Convert.ToInt64(id_comuna_exhorto) + ",");
            stringBuilder.Append(" '" + fautorizacionfirma + "',");
            stringBuilder.Append(" " + Convert.ToInt64(id_notaria) + ",");
            stringBuilder.Append(" " + Convert.ToInt64(id_comuna_notaria) + ",");
            stringBuilder.Append(" '" + observacion.Trim() + "',");
            stringBuilder.Append(" getdate()");
            stringBuilder.Append(" );Select @@Identity");
            BaseDatos baseDatos = new BaseDatos();
            return baseDatos.getResultset(stringBuilder.ToString());
        }
        public static DataTable InsertaCuotaColegio(string id_cobranza, string representante1, string representante2, string urldocumento, string nrodocumento, string id_tipo_docu, string codigo, string id_banco, string serie, string nrocuota, string fechamora, string fechaingresocobranza, string fechavencimiento, string fprescripcion, string mesmora, string aniomora, string montocapital, string abonos, string montointeres, string saldodeuda, string observacion)
        {
            if (observacion.Length > 0)
            {
                int num = (int)Convert.ToInt16(observacion.Length);
                if (num > 490)
                {
                    observacion = observacion.Substring(0, 490);
                }
            }
            if (string.IsNullOrEmpty(fechamora))
            {
                fechamora = "01/01/1900";
            }
            if (string.IsNullOrEmpty(fechaingresocobranza))
            {
                fechaingresocobranza = "01/01/1900";
            }
            if (string.IsNullOrEmpty(fechavencimiento))
            {
                fechavencimiento = "01/01/1900";
            }
            if (string.IsNullOrEmpty(fprescripcion))
            {
                fprescripcion = "01/01/1900";
            }
            if (id_tipo_docu == "Seleccione")
            {
                id_tipo_docu = "0";
            }
            if (id_banco == "Seleccione")
            {
                id_banco = "0";
            }
            if (string.IsNullOrEmpty(id_cobranza))
            {
                id_cobranza = "0";
            }
            if (string.IsNullOrEmpty(id_tipo_docu))
            {
                id_tipo_docu = "0";
            }
            if (string.IsNullOrEmpty(id_banco))
            {
                id_banco = "0";
            }
            if (string.IsNullOrEmpty(nrocuota))
            {
                nrocuota = "0";
            }
            if (string.IsNullOrEmpty(mesmora))
            {
                mesmora = "0";
            }
            if (string.IsNullOrEmpty(aniomora))
            {
                aniomora = "0";
            }
            if (string.IsNullOrEmpty(montocapital))
            {
                montocapital = "0";
            }
            if (string.IsNullOrEmpty(abonos))
            {
                abonos = "0";
            }
            if (string.IsNullOrEmpty(montointeres))
            {
                montointeres = "0";
            }
            if (string.IsNullOrEmpty(saldodeuda))
            {
                saldodeuda = "0";
            }
            StringBuilder stringBuilder = new StringBuilder();
            observacion = observacion.Replace("'", "");
            stringBuilder.Append(" INSERT INTO cuotacolegio(");
            stringBuilder.Append(" id_cobranza, representante1, representante2, urldocumento, nrodocumento, id_tipo_docu, codigo, id_banco, serie, nrocuota, fechamora, fechaingresocobranza, fechavencimiento, fprescripcion, mesmora, aniomora, montocapital, abonos, montointeres, saldodeuda, fproceso, observacion");
            stringBuilder.Append(" ) VALUES(");
            stringBuilder.Append(" " + Convert.ToInt64(id_cobranza) + ",");
            stringBuilder.Append(" '" + representante1.Trim().ToUpper().Replace(".", "") + "',");
            stringBuilder.Append(" '" + representante2.Trim().ToUpper().Replace(".", "") + "',");
            stringBuilder.Append(" '" + urldocumento.Trim().ToUpper() + "',");
            stringBuilder.Append(" '" + nrodocumento.Trim().ToUpper() + "',");
            stringBuilder.Append(" " + Convert.ToInt64(id_tipo_docu) + ",");
            stringBuilder.Append(" '" + codigo.Trim().ToUpper() + "',");
            stringBuilder.Append(" " + Convert.ToInt64(id_banco) + ",");
            stringBuilder.Append(" '" + serie.Trim().ToUpper() + "',");
            stringBuilder.Append(" " + Convert.ToInt64(nrocuota) + ",");
            stringBuilder.Append(" '" + fechamora + "',");
            stringBuilder.Append(" '" + fechaingresocobranza + "',");
            stringBuilder.Append(" '" + fechavencimiento + "',");
            stringBuilder.Append(" '" + fprescripcion + "',");
            stringBuilder.Append(" " + Convert.ToInt64(mesmora) + ",");
            stringBuilder.Append(" " + Convert.ToInt64(aniomora) + ",");
            stringBuilder.Append(" " + Convert.ToInt64(montocapital) + ",");
            stringBuilder.Append(" " + Convert.ToInt64(abonos) + ",");
            stringBuilder.Append(" " + Convert.ToInt64(montointeres) + ",");
            stringBuilder.Append(" " + Convert.ToInt64(saldodeuda) + ",");
            stringBuilder.Append(" getdate(),");
            stringBuilder.Append(" '" + observacion.Trim() + "'");
            stringBuilder.Append(" );Select @@Identity");
            BaseDatos baseDatos = new BaseDatos();
            return baseDatos.getResultset(stringBuilder.ToString());
        }
        public static DataTable InsertaJuicio(
            string idcobranza, 
            string idtribunal,
            string rutabogado,
            string rutprocurador,
            string rol,
            DateTime fingresocorte,
            string id_jurisdiccion,
            int idRiesgo,
            DateTime fechaRiesgo
        )
        {
            if (string.IsNullOrEmpty(idcobranza))
                idcobranza = "0";

            if (string.IsNullOrEmpty(idtribunal))
                idtribunal = "0";

            if (fingresocorte.Year < 1900) fingresocorte = new DateTime(1900, 1, 1);
            if (fechaRiesgo.Year < 1900) fechaRiesgo = new DateTime(1900, 1, 1);

            StringBuilder stringBuilder = new StringBuilder();
            stringBuilder.Append("INSERT INTO juicios(id_cobranza, id_jurisdiccion, id_tribunal, rut_abogado, rut_procurador, rol, fingresocorte, fproceso, id_riesgo, fecha_motivo_riesgo) VALUES(");
            stringBuilder.AppendFormat("{0},", Convert.ToInt64(idcobranza));
            stringBuilder.AppendFormat("{0},", Convert.ToInt64(id_jurisdiccion));
            stringBuilder.AppendFormat("{0},", Convert.ToInt64(idtribunal));

            stringBuilder.AppendFormat("'{0}',", rutabogado.Trim().ToUpper().Replace(".", string.Empty));
            stringBuilder.AppendFormat("'{0}',", rutprocurador.Trim().ToUpper().Replace(".", string.Empty));
            stringBuilder.AppendFormat("'{0}',", rol.Trim().ToUpper());

            stringBuilder.AppendFormat("'{0:yyyyMMdd}',", fingresocorte);
            stringBuilder.Append("getdate(),");

            stringBuilder.AppendFormat("{0},", idRiesgo > 0 ? idRiesgo.ToString() : "NULL");

            stringBuilder.AppendFormat("'{0:yyyyMMdd}' );Select @@Identity", fechaRiesgo);

            BaseDatos baseDatos = new BaseDatos();
            return baseDatos.getResultset(stringBuilder.ToString());
        }

        public static int InsertaExhorto(
            string id_juicios,
            string id_tribunal,
            string rut_procurador,
            string id_tipoexhorto,
            string id_receptor,
            string fechaingreso,
            string rol_exhorto,
            string id_jurisdiccion,
            int idComunaDestino)
        {

            DateTime datFecha = new DateTime();
            if (!DateTime.TryParseExact(fechaingreso, "ddMMyyyy", CultureInfo.InvariantCulture, DateTimeStyles.None, out datFecha))
                datFecha = new DateTime(1900, 1, 1);

            string strConsulta = string.Format("EXEC dbo.SPALC_ExhortosInsertar {0}, {1}, '{2}', {3}, '{4}', '{5:yyyyMMdd}', '{6}', {7}, {8}",
                new Object[]{
                    id_juicios, 
                    id_tribunal, 
                    rut_procurador, 
                    id_tipoexhorto,
                    id_receptor,
                    datFecha,
                    rol_exhorto,
                    id_jurisdiccion,
                    idComunaDestino
                });

            BaseDatos baseDatos = new BaseDatos();
            return Convert.ToInt32(baseDatos.getRowValue(strConsulta));
        }

        public static void InsertaActividad(string id_juicios, string id_tramite, string id_sub_tramite, string ftramite, string fsubtramite, string fproxgestion, string id_prox_gestion, string observacion)
        {
            string str;
            if (string.IsNullOrEmpty(ftramite))
            {
                str = "01/01/1900";
            }
            else
            {
                str = string.Concat(new string[]
				{
					ftramite.Substring(0, 2).ToString(),
					"-",
					ftramite.Substring(3, 2).ToString(),
					"-",
					ftramite.Substring(6, 4).ToString()
				});
            }
            string str2;
            if (string.IsNullOrEmpty(fsubtramite))
            {
                str2 = "01/01/1900";
            }
            else
            {
                str2 = string.Concat(new string[]
				{
					fsubtramite.Substring(0, 2).ToString(),
					"-",
					fsubtramite.Substring(3, 2).ToString(),
					"-",
					fsubtramite.Substring(6, 4).ToString()
				});
            }
            string str3;
            if (string.IsNullOrEmpty(fproxgestion))
            {
                str3 = "01/01/1900";
            }
            else
            {
                str3 = string.Concat(new string[]
				{
					fproxgestion.Substring(0, 2).ToString(),
					"-",
					fproxgestion.Substring(3, 2).ToString(),
					"-",
					fproxgestion.Substring(6, 4).ToString()
				});
            }
            if (string.IsNullOrEmpty(id_juicios))
            {
                id_juicios = "0";
            }
            if (string.IsNullOrEmpty(id_tramite))
            {
                id_tramite = "0";
            }
            if (string.IsNullOrEmpty(id_sub_tramite) || id_sub_tramite == "Seleccione")
            {
                id_sub_tramite = "0";
            }
            if (string.IsNullOrEmpty(id_prox_gestion))
            {
                id_prox_gestion = "0";
            }
            StringBuilder stringBuilder = new StringBuilder();
            stringBuilder.Append(" INSERT INTO actividadesjudiciales(");
            stringBuilder.Append(" id_juicios,");
            stringBuilder.Append(" id_tramite,");
            stringBuilder.Append(" id_sub_tramite,");
            stringBuilder.Append(" ftramite,");
            stringBuilder.Append(" fsubtramite,");
            stringBuilder.Append(" fproxgestion,");
            stringBuilder.Append(" id_prox_gestion,");
            stringBuilder.Append(" observacion,");
            stringBuilder.Append(" fproceso");
            stringBuilder.Append(" ) VALUES(");
            stringBuilder.Append(" " + Convert.ToInt64(id_juicios) + ",");
            stringBuilder.Append(" " + Convert.ToInt64(id_tramite) + ",");
            stringBuilder.Append(" " + Convert.ToInt64(id_sub_tramite) + ",");
            stringBuilder.Append(" '" + str + "',");
            stringBuilder.Append(" '" + str2 + "',");
            stringBuilder.Append(" '" + str3 + "',");
            stringBuilder.Append(" " + Convert.ToInt64(id_prox_gestion) + ",");
            stringBuilder.Append(" '" + observacion.Trim().ToUpper() + "',");
            stringBuilder.Append(" getdate()");
            stringBuilder.Append(" )");
            BaseDatos baseDatos = new BaseDatos();
            baseDatos.SQLExecute(stringBuilder.ToString());
        }
        public static void GENInsertaActividad(string id_juicios, string id_tramite, string id_sub_tramite, string ftramite, string fsubtramite, string fproxgestion, string id_prox_gestion, string observacion, string indice)
        {
            if (observacion.Length > 0)
            {
                int num = (int)Convert.ToInt16(observacion.Length);
                if (num > 295)
                {
                    observacion = observacion.Substring(0, 295);
                }
                observacion = observacion.Replace("'", "");
            }
            string str;
            if (string.IsNullOrEmpty(ftramite))
            {
                str = "01/01/1900";
            }
            else
            {
                str = string.Concat(new string[]
				{
					ftramite.Substring(0, 2).ToString(),
					"-",
					ftramite.Substring(3, 2).ToString(),
					"-",
					ftramite.Substring(6, 4).ToString()
				});
            }
            string str2;
            if (string.IsNullOrEmpty(fsubtramite))
            {
                str2 = "01/01/1900";
            }
            else
            {
                str2 = string.Concat(new string[]
				{
					fsubtramite.Substring(0, 2).ToString(),
					"-",
					fsubtramite.Substring(3, 2).ToString(),
					"-",
					fsubtramite.Substring(6, 4).ToString()
				});
            }
            string str3;
            if (string.IsNullOrEmpty(fproxgestion))
            {
                str3 = "01/01/1900";
            }
            else
            {
                str3 = string.Concat(new string[]
				{
					fproxgestion.Substring(0, 2).ToString(),
					"-",
					fproxgestion.Substring(3, 2).ToString(),
					"-",
					fproxgestion.Substring(6, 4).ToString()
				});
            }
            if (string.IsNullOrEmpty(indice))
            {
                indice = "0";
            }
            if (string.IsNullOrEmpty(id_juicios))
            {
                id_juicios = "0";
            }
            if (string.IsNullOrEmpty(id_tramite))
            {
                id_tramite = "0";
            }
            if (string.IsNullOrEmpty(id_sub_tramite) || id_sub_tramite == "Seleccione")
            {
                id_sub_tramite = "0";
            }
            if (string.IsNullOrEmpty(id_prox_gestion))
            {
                id_prox_gestion = "0";
            }
            StringBuilder stringBuilder = new StringBuilder();
            stringBuilder.Append(" INSERT INTO actividadesjudiciales(");
            stringBuilder.Append(" id_juicios,");
            stringBuilder.Append(" id_tramite,");
            stringBuilder.Append(" id_sub_tramite,");
            stringBuilder.Append(" ftramite,");
            stringBuilder.Append(" fsubtramite,");
            stringBuilder.Append(" fproxgestion,");
            stringBuilder.Append(" id_prox_gestion,");
            stringBuilder.Append(" observacion,");
            stringBuilder.Append(" fproceso,");
            stringBuilder.Append(" indice");
            stringBuilder.Append(" ) VALUES(");
            stringBuilder.Append(" " + Convert.ToInt64(id_juicios) + ",");
            stringBuilder.Append(" " + Convert.ToInt64(id_tramite) + ",");
            stringBuilder.Append(" " + Convert.ToInt64(id_sub_tramite) + ",");
            stringBuilder.Append(" '" + str + "',");
            stringBuilder.Append(" '" + str2 + "',");
            stringBuilder.Append(" '" + str3 + "',");
            stringBuilder.Append(" " + Convert.ToInt64(id_prox_gestion) + ",");
            stringBuilder.Append(" '" + observacion.Trim().ToUpper() + "',");
            stringBuilder.Append(" getdate(),");
            stringBuilder.Append(" " + Convert.ToInt64(indice));
            stringBuilder.Append(" )");
            BaseDatos baseDatos = new BaseDatos();
            baseDatos.SQLExecute(stringBuilder.ToString());
        }
        public static void InsertaActividadExhorto(string id_exhorto, string id_tramite_exh, string ftramite, string observacion)
        {
            string str;
            if (string.IsNullOrEmpty(ftramite))
            {
                str = "01/01/1900";
            }
            else
            {
                str = string.Concat(new string[]
				{
					ftramite.Substring(0, 2).ToString(),
					"-",
					ftramite.Substring(3, 2).ToString(),
					"-",
					ftramite.Substring(6, 4).ToString()
				});
            }
            if (string.IsNullOrEmpty(id_exhorto))
            {
                id_exhorto = "0";
            }
            if (string.IsNullOrEmpty(id_tramite_exh))
            {
                id_tramite_exh = "0";
            }
            StringBuilder stringBuilder = new StringBuilder();
            stringBuilder.Append(" INSERT INTO ActividadesExhorto(");
            stringBuilder.Append(" id_exhorto,");
            stringBuilder.Append(" id_tramite_exh,");
            stringBuilder.Append(" fechatramite,");
            stringBuilder.Append(" observacion,");
            stringBuilder.Append(" fproceso");
            stringBuilder.Append(" ) VALUES(");
            stringBuilder.Append(" " + Convert.ToInt64(id_exhorto) + ",");
            stringBuilder.Append(" " + Convert.ToInt64(id_tramite_exh) + ",");
            stringBuilder.Append(" '" + str + "',");
            stringBuilder.Append(" '" + observacion.Trim() + "',");
            stringBuilder.Append(" getdate()");
            stringBuilder.Append(" )");
            BaseDatos baseDatos = new BaseDatos();
            baseDatos.SQLExecute(stringBuilder.ToString());
        }
        public static void InsertaActividadPrejudicial(string id_cobranza, string id_act_prejudicial, string factividad, string id_proxactprejudi, string fproxima, string observacion)
        {
            if (string.IsNullOrEmpty(factividad))
            {
                factividad = "01/01/1900";
            }
            if (string.IsNullOrEmpty(fproxima))
            {
                fproxima = "01/01/1900";
            }
            if (string.IsNullOrEmpty(id_cobranza))
            {
                id_cobranza = "0";
            }
            if (string.IsNullOrEmpty(id_act_prejudicial))
            {
                id_act_prejudicial = "0";
            }
            if (string.IsNullOrEmpty(id_proxactprejudi))
            {
                id_proxactprejudi = "0";
            }
            if (id_proxactprejudi == "Seleccione")
            {
                id_proxactprejudi = "0";
            }
            if (id_act_prejudicial == "Seleccione")
            {
                id_act_prejudicial = "0";
            }
            StringBuilder stringBuilder = new StringBuilder();
            stringBuilder.Append(" INSERT INTO Prejudicial( id_cobranza, id_act_prejudicial, factividad, id_proxactprejudi, fproxima, observacion, fproceso ");
            stringBuilder.Append(" ) VALUES(");
            stringBuilder.Append(" " + Convert.ToInt64(id_cobranza) + ",");
            stringBuilder.Append(" " + Convert.ToInt64(id_act_prejudicial) + ",");
            stringBuilder.Append(" '" + factividad + "',");
            stringBuilder.Append(" " + Convert.ToInt64(id_proxactprejudi) + ",");
            stringBuilder.Append(" '" + fproxima + "',");
            stringBuilder.Append(" '" + observacion + "',");
            stringBuilder.Append(" getdate()");
            stringBuilder.Append(" )");
            BaseDatos baseDatos = new BaseDatos();
            baseDatos.SQLExecute(stringBuilder.ToString());
        }
        public static void InsertaGasto(string id_juicios, string id_gasto_admin, string id_act_prejudicial, string montogastoadmin, string montogastojudi, string fechagasto, string montogastopre, string tipogastujudi, string id_gasto_judicial, string desadmin, string desjudi, string despre, string boleta, string estadogasto, string fechaestadogasto, string nomproveedor, string rutproveedor, string nomina, string fechanomina, string username)
        {
            string str = "";
            string str2 = "";
            if (string.IsNullOrEmpty(fechagasto))
            {
                fechagasto = "01/01/1900";
            }
            if (string.IsNullOrEmpty(id_juicios))
            {
                id_juicios = "0";
            }
            if (string.IsNullOrEmpty(estadogasto))
            {
                estadogasto = "0";
            }
            if (string.IsNullOrEmpty(fechaestadogasto))
            {
                fechaestadogasto = "01/01/1900";
            }
            if (string.IsNullOrEmpty(fechanomina))
            {
                fechanomina = "01/01/1900";
            }
            if (id_gasto_admin == "Seleccione")
            {
                id_gasto_admin = "0";
            }
            if (id_gasto_judicial == "Seleccione")
            {
                id_gasto_judicial = "0";
            }
            if (id_act_prejudicial == "Seleccione")
            {
                id_act_prejudicial = "0";
            }
            string str3 = "";
            string str4 = "";
            string str5 = "P";
            if (!(rutproveedor == "Seleccione"))
            {
                str3 = rutproveedor;
                str4 = nomproveedor;
            }
            if (string.IsNullOrEmpty(montogastoadmin))
            {
                montogastoadmin = "0";
            }
            if (string.IsNullOrEmpty(montogastojudi))
            {
                montogastojudi = "0";
            }
            if (string.IsNullOrEmpty(montogastopre))
            {
                montogastopre = "0";
            }
            if (id_gasto_admin != "0")
            {
                str = "Administrativo";
            }
            if (id_gasto_judicial != "0")
            {
                str = "Judicial";
            }
            if (id_act_prejudicial != "0")
            {
                str = "PreJudicial";
            }
            if (desadmin != "Seleccione")
            {
                str2 = desadmin;
            }
            if (desjudi != "Seleccione")
            {
                str2 = desjudi;
            }
            if (despre != "Seleccione")
            {
                str2 = despre;
            }
            StringBuilder stringBuilder = new StringBuilder();
            stringBuilder.Append(" INSERT INTO gastos(");
            stringBuilder.Append(" id_cobranza,");
            stringBuilder.Append(" id_gasto_admin,");
            stringBuilder.Append(" id_act_prejudicial,");
            stringBuilder.Append(" montogastoadmin,");
            stringBuilder.Append(" montogastojudi,");
            stringBuilder.Append(" montogastopre,");
            stringBuilder.Append(" fechagasto,");
            stringBuilder.Append(" tipogastujudi,");
            stringBuilder.Append(" id_gasto_judicial,");
            stringBuilder.Append(" fproceso,");
            stringBuilder.Append(" gasto,");
            stringBuilder.Append(" desgasto,");
            stringBuilder.Append(" nroboleta,");
            stringBuilder.Append(" rut_responsable,");
            stringBuilder.Append(" nom_responsable,");
            stringBuilder.Append(" tipo_responsable,");
            stringBuilder.Append(" estadogasto,");
            stringBuilder.Append(" fechaestadogasto,");
            stringBuilder.Append(" nomina,");
            stringBuilder.Append(" fnomina,username");
            stringBuilder.Append(" ) VALUES(");
            stringBuilder.Append(" " + Convert.ToInt64(id_juicios) + ",");
            stringBuilder.Append(" " + Convert.ToInt64(id_gasto_admin) + ",");
            stringBuilder.Append(" " + Convert.ToInt64(id_act_prejudicial) + ",");
            stringBuilder.Append(" " + Convert.ToDecimal(montogastoadmin) + ",");
            stringBuilder.Append(" " + Convert.ToDecimal(montogastojudi) + ",");
            stringBuilder.Append(" " + Convert.ToDecimal(montogastopre) + ",");
            stringBuilder.Append(" '" + fechagasto + "',");
            stringBuilder.Append(" '" + tipogastujudi.Trim().ToUpper() + "',");
            stringBuilder.Append(" " + Convert.ToInt64(id_gasto_judicial) + ",");
            stringBuilder.Append(" getdate(),");
            stringBuilder.Append(" '" + str + "',");
            stringBuilder.Append(" '" + str2 + "',");
            stringBuilder.Append(" '" + boleta + "',");
            stringBuilder.Append(" '" + str3 + "',");
            stringBuilder.Append(" '" + str4 + "',");
            stringBuilder.Append(" '" + str5 + "',");
            stringBuilder.Append(" " + Convert.ToInt64(estadogasto) + ",");
            stringBuilder.Append(" '" + fechaestadogasto + "',");
            stringBuilder.Append(" '" + nomina + "',");
            stringBuilder.Append(" '" + fechanomina + "',");
            stringBuilder.Append(" '" + username + "'");
            stringBuilder.Append(" )");
            BaseDatos baseDatos = new BaseDatos();
            baseDatos.SQLExecute(stringBuilder.ToString());
        }
        public static void InsertaDocRendicion(string id_rendicion, string id_abono, string id_cobranza, string id_banco, string nrocheque, string serie, string fcheque, string nroctacte, string username)
        {
            if (string.IsNullOrEmpty(id_rendicion))
            {
                id_rendicion = "0";
            }
            if (string.IsNullOrEmpty(id_abono))
            {
                id_abono = "0";
            }
            if (string.IsNullOrEmpty(id_cobranza))
            {
                id_cobranza = "0";
            }
            if (string.IsNullOrEmpty(id_banco))
            {
                id_banco = "0";
            }
            StringBuilder stringBuilder = new StringBuilder();
            stringBuilder.Append(" INSERT INTO Doc_Rendicion(");
            stringBuilder.Append(" id_rendicion, id_abono, id_cobranza, id_banco, nrocheque, serie, fcheque, nroctacte, fproceso, username");
            stringBuilder.Append(" ) VALUES(");
            stringBuilder.Append(" " + Convert.ToInt64(id_rendicion) + ",");
            stringBuilder.Append(" " + Convert.ToInt64(id_abono) + ",");
            stringBuilder.Append(" " + Convert.ToInt64(id_cobranza) + ",");
            stringBuilder.Append(" " + Convert.ToInt64(id_banco) + ",");
            stringBuilder.Append(" '" + nrocheque.Trim() + "',");
            stringBuilder.Append(" '" + serie.Trim() + "',");
            stringBuilder.Append(" '" + fcheque.Trim() + "',");
            stringBuilder.Append(" '" + nroctacte.Trim() + "',");
            stringBuilder.Append(" getdate(),");
            stringBuilder.Append(" '" + username.Trim().ToLower() + "'");
            stringBuilder.Append(" )");
            BaseDatos baseDatos = new BaseDatos();
            baseDatos.SQLExecute(stringBuilder.ToString());
        }
        public static void UpdateDocRendicion(string id_rendicion, string id_abono, string id_cobranza, string id_banco, string nrocheque, string serie, string fcheque, string nroctacte, string username)
        {
            if (string.IsNullOrEmpty(id_rendicion))
            {
                id_rendicion = "0";
            }
            if (string.IsNullOrEmpty(id_abono))
            {
                id_abono = "0";
            }
            if (string.IsNullOrEmpty(id_cobranza))
            {
                id_cobranza = "0";
            }
            if (string.IsNullOrEmpty(id_banco))
            {
                id_banco = "0";
            }
            StringBuilder stringBuilder = new StringBuilder();
            stringBuilder.Append(" UPDATE Doc_Rendicion SET");
            stringBuilder.Append(" id_abono = " + Convert.ToInt64(id_abono) + ",");
            stringBuilder.Append(" id_cobranza = " + Convert.ToInt64(id_cobranza) + ",");
            stringBuilder.Append(" id_banco = " + Convert.ToInt64(id_banco) + ",");
            stringBuilder.Append(" nrocheque = '" + nrocheque + "',");
            stringBuilder.Append(" serie = '" + serie + "',");
            stringBuilder.Append(" fcheque = '" + fcheque + "',");
            stringBuilder.Append(" nroctacte = '" + nroctacte + "',");
            stringBuilder.Append(" fproceso = getdate(),");
            stringBuilder.Append(" username = '" + username + "'");
            stringBuilder.Append(" WHERE id_rendicion = " + Convert.ToInt64(id_rendicion));
            BaseDatos baseDatos = new BaseDatos();
            baseDatos.SQLExecute(stringBuilder.ToString());
        }
        public static DataTable InsertaAbono(string id_cobranza, string fabono, string montoabono, string id_concepto, string id_moneda, string id_banco, string fpago, string nrocheque, string observacion, string rut_deudor, string boleta, string serie, string docuno, string docdos, string username, string TipoComprobante, string MCH, string id_cuota_colegio)
        {
            rut_deudor = rut_deudor.Replace(".", "");
            if (string.IsNullOrEmpty(id_cobranza))
            {
                id_cobranza = "0";
            }
            if (string.IsNullOrEmpty(fabono))
            {
                fabono = "01/01/1900";
            }
            if (string.IsNullOrEmpty(montoabono))
            {
                montoabono = "0";
            }
            if (string.IsNullOrEmpty(id_concepto))
            {
                id_concepto = "0";
            }
            if (string.IsNullOrEmpty(fpago))
            {
                fpago = "01/01/1900";
            }
            if (id_concepto == "Seleccione")
            {
                id_concepto = "0";
            }
            if (id_moneda == "Seleccione")
            {
                id_moneda = "0";
            }
            if (id_banco == "Seleccione")
            {
                id_banco = "0";
            }
            if (observacion.Length > 0)
            {
                int num = (int)Convert.ToInt16(observacion.Length);
                if (num > 490)
                {
                    observacion = observacion.Substring(0, 490);
                }
            }
            StringBuilder stringBuilder = new StringBuilder();
            stringBuilder.Append(" INSERT INTO Abonos(");
            stringBuilder.Append(" estado,");
            stringBuilder.Append(" id_cobranza,");
            stringBuilder.Append(" fabono,");
            stringBuilder.Append(" montoabono,");
            stringBuilder.Append(" id_concepto,");
            stringBuilder.Append(" fproceso,");
            stringBuilder.Append(" id_moneda,");
            stringBuilder.Append(" id_banco,");
            stringBuilder.Append(" fpago,");
            stringBuilder.Append(" nrocheque,");
            stringBuilder.Append(" observacion,");
            stringBuilder.Append(" rut_deudor,");
            stringBuilder.Append(" boleta,");
            stringBuilder.Append(" serie,");
            stringBuilder.Append(" docuno,");
            stringBuilder.Append(" docdos,");
            stringBuilder.Append(" username,");
            stringBuilder.Append(" TipoComprobante,");
            stringBuilder.Append(" MCH,");
            stringBuilder.Append(" id_cuota_colegio");
            stringBuilder.Append(" ) VALUES(");
            stringBuilder.Append(" 'N',");
            stringBuilder.Append(" " + Convert.ToInt64(id_cobranza) + ",");
            stringBuilder.Append(" '" + fabono + "',");
            stringBuilder.Append(" " + Convert.ToDecimal(montoabono) + ",");
            stringBuilder.Append(" " + Convert.ToInt64(id_concepto) + ",");
            stringBuilder.Append(" getdate(),");
            stringBuilder.Append(" " + Convert.ToInt64(id_moneda) + ",");
            stringBuilder.Append(" " + Convert.ToInt64(id_banco) + ",");
            stringBuilder.Append(" '" + fpago + "',");
            stringBuilder.Append(" '" + nrocheque.Trim() + "',");
            stringBuilder.Append(" '" + observacion.Trim().Replace("'", "") + "',");
            stringBuilder.Append(" '" + rut_deudor.Trim() + "',");
            stringBuilder.Append(" '" + boleta.Trim() + "',");
            stringBuilder.Append(" '" + serie.Trim() + "',");
            stringBuilder.Append(" " + Convert.ToInt64(docuno) + ",");
            stringBuilder.Append(" " + Convert.ToInt64(docdos) + ",");
            stringBuilder.Append(" '" + username.Trim().ToLower() + "',");
            stringBuilder.Append(" " + Convert.ToInt64(TipoComprobante) + ",");
            stringBuilder.Append(" '" + MCH.ToString() + "',");
            stringBuilder.Append(" " + Convert.ToInt64(id_cuota_colegio));
            stringBuilder.Append(" );Select @@Identity");
            BaseDatos baseDatos = new BaseDatos();
            return baseDatos.getResultset(stringBuilder.ToString());
        }
        public static void InsertaAbonoMCH(string id_cobranza, string id_abono_comprobante, string fpago, string nrocheque, string serie, string montoabono, string username)
        {
            if (string.IsNullOrEmpty(id_cobranza))
            {
                id_cobranza = "0";
            }
            if (string.IsNullOrEmpty(montoabono))
            {
                montoabono = "0";
            }
            if (string.IsNullOrEmpty(fpago))
            {
                fpago = "01/01/1900";
            }
            StringBuilder stringBuilder = new StringBuilder();
            stringBuilder.Append(" INSERT INTO abonosMCH(");
            stringBuilder.Append(" id_cobranza,");
            stringBuilder.Append(" id_abono_comprobante,");
            stringBuilder.Append(" fpago,");
            stringBuilder.Append(" nrocheque,");
            stringBuilder.Append(" serie,");
            stringBuilder.Append(" montoabono,");
            stringBuilder.Append(" estado,");
            stringBuilder.Append(" fproceso,");
            stringBuilder.Append(" username");
            stringBuilder.Append(" ) VALUES(");
            stringBuilder.Append(" " + Convert.ToInt64(id_cobranza) + ",");
            stringBuilder.Append(" " + Convert.ToInt64(id_abono_comprobante) + ",");
            stringBuilder.Append(" '" + fpago + "',");
            stringBuilder.Append(" '" + nrocheque.Trim() + "',");
            stringBuilder.Append(" '" + serie.Trim() + "',");
            stringBuilder.Append(" " + Convert.ToInt64(montoabono) + ",");
            stringBuilder.Append(" 'N',");
            stringBuilder.Append(" getdate(),");
            stringBuilder.Append(" '" + username.Trim() + "'");
            stringBuilder.Append(" )");
            BaseDatos baseDatos = new BaseDatos();
            baseDatos.SQLExecute(stringBuilder.ToString());
        }
        public static void InsertaPrendas(string id_cobranza, string rut_aval, string id_ejecutivo, string id_sucursal, string id_bien_mueble, string rut_proveedor, string rut_vendedor, string monto, string observaciones, string fecha, string username)
        {
            rut_aval = rut_aval.Replace(".", "");
            rut_proveedor = rut_proveedor.Replace(".", "");
            rut_vendedor = rut_vendedor.Replace(".", "");
            if (string.IsNullOrEmpty(id_cobranza))
            {
                id_cobranza = "0";
            }
            if (string.IsNullOrEmpty(id_ejecutivo))
            {
                id_ejecutivo = "0";
            }
            if (string.IsNullOrEmpty(id_sucursal))
            {
                id_sucursal = "0";
            }
            if (string.IsNullOrEmpty(id_bien_mueble))
            {
                id_bien_mueble = "0";
            }
            if (string.IsNullOrEmpty(monto))
            {
                monto = "0";
            }
            if (string.IsNullOrEmpty(fecha))
            {
                fecha = "01/01/1900";
            }
            if (observaciones.Length > 0)
            {
                int num = (int)Convert.ToInt16(observaciones.Length);
                if (num > 290)
                {
                    observaciones = observaciones.Substring(0, 290);
                }
            }
            StringBuilder stringBuilder = new StringBuilder();
            stringBuilder.Append(" INSERT INTO prendas(id_cobranza, rut_aval, id_ejecutivo, id_sucursal, id_bien_mueble, rut_proveedor, rut_vendedor, monto, observaciones, fecha, fproceso, username");
            stringBuilder.Append(" ) VALUES(");
            stringBuilder.Append(" " + Convert.ToInt64(id_cobranza) + ",");
            stringBuilder.Append(" '" + rut_aval.Trim() + "',");
            stringBuilder.Append(" " + Convert.ToInt64(id_ejecutivo) + ",");
            stringBuilder.Append(" " + Convert.ToInt64(id_sucursal) + ",");
            stringBuilder.Append(" " + Convert.ToInt64(id_bien_mueble) + ",");
            stringBuilder.Append(" '" + rut_proveedor.Trim() + "',");
            stringBuilder.Append(" '" + rut_vendedor.Trim() + "',");
            stringBuilder.Append(" " + Convert.ToDecimal(monto) + ",");
            stringBuilder.Append(" '" + observaciones.Trim().Replace("'", "") + "',");
            stringBuilder.Append(" '" + fecha + "',");
            stringBuilder.Append(" getdate(),");
            stringBuilder.Append(" '" + username.Trim().ToLower() + "'");
            stringBuilder.Append(" )");
            BaseDatos baseDatos = new BaseDatos();
            baseDatos.SQLExecute(stringBuilder.ToString());
        }
        public static void InsertaDesglose(string id_abono, string id_cobranza, string tipo_doc, string nro_doc, double monto, string fvto, double dias, double intereses, double int_adic, double honorarios, double desc_honorarios, double desc_interes, double Otros_desc, long iddocu, string gastos)
        {
            if (string.IsNullOrEmpty(id_cobranza))
            {
                id_cobranza = "0";
            }
            if (string.IsNullOrEmpty(id_abono))
            {
                id_abono = "0";
            }
            StringBuilder stringBuilder = new StringBuilder();
            stringBuilder.Append(" insert into Desglose (id_abono, id_cobranza, tipo_doc, nro_doc, monto, fvto, dias, intereses, int_adic, honorarios, desc_honorarios, desc_interes, Otros_desc,id_docu,gastos");
            stringBuilder.Append(" ) VALUES (");
            stringBuilder.Append(" " + Convert.ToInt64(id_abono) + ",");
            stringBuilder.Append(" " + Convert.ToInt64(id_cobranza) + ",");
            stringBuilder.Append(" '" + tipo_doc.Trim() + "',");
            stringBuilder.Append(" '" + nro_doc.Trim() + "',");
            stringBuilder.Append(" " + monto + ",");
            stringBuilder.Append(" '" + fvto.Trim() + "',");
            stringBuilder.Append(" " + dias + ",");
            stringBuilder.Append(" " + intereses + ",");
            stringBuilder.Append(" " + int_adic + ",");
            stringBuilder.Append(" " + honorarios + ",");
            stringBuilder.Append(" " + desc_honorarios + ",");
            stringBuilder.Append(" " + desc_interes + ",");
            stringBuilder.Append(" " + Otros_desc + ",");
            stringBuilder.Append(" " + iddocu + ",");
            stringBuilder.Append(" " + Convert.ToDouble(gastos));
            stringBuilder.Append(" )");
            BaseDatos baseDatos = new BaseDatos();
            baseDatos.SQLExecute(stringBuilder.ToString());
        }
        public static void UpdateGastos(string idCobranza)
        {
            if (string.IsNullOrEmpty(idCobranza))
            {
                idCobranza = "0";
            }
            StringBuilder stringBuilder = new StringBuilder();
            stringBuilder.Append("UPDATE gastos SET pagado = 'S' WHERE id_cobranza = " + Convert.ToInt64(idCobranza));
            BaseDatos baseDatos = new BaseDatos();
            baseDatos.SQLExecute(stringBuilder.ToString());
        }
        public static void UpdateProcuradorXJuicio(string idjuicios, string rut_procurador)
        {
            if (string.IsNullOrEmpty(idjuicios))
            {
                idjuicios = "0";
            }
            StringBuilder stringBuilder = new StringBuilder();
            stringBuilder.Append(string.Concat(new object[]
			{
				"update juicios set rut_procurador = '",
				rut_procurador.Trim(),
				"' where id_juicios = ",
				Convert.ToInt64(idjuicios)
			}));
            BaseDatos baseDatos = new BaseDatos();
            baseDatos.SQLExecute(stringBuilder.ToString());
        }
        public static void UpdateCobranza(string idCobranza)
        {
            if (string.IsNullOrEmpty(idCobranza))
            {
                idCobranza = "0";
            }
            StringBuilder stringBuilder = new StringBuilder();
            stringBuilder.Append("UPDATE cobranza SET tipo = 'N' WHERE id_cobranza = " + Convert.ToInt64(idCobranza));
            BaseDatos baseDatos = new BaseDatos();
            baseDatos.SQLExecute(stringBuilder.ToString());
        }
        public static void UpdateAbonoParcialEstado(string idCobranza, string idAbono)
        {
            if (string.IsNullOrEmpty(idCobranza))
            {
                idCobranza = "0";
            }
            if (string.IsNullOrEmpty(idAbono))
            {
                idAbono = "0";
            }
            StringBuilder stringBuilder = new StringBuilder();
            stringBuilder.Append(string.Concat(new object[]
			{
				"update alcsacl.abonoparcial set id_abono_comprobante = ",
				Convert.ToInt64(idAbono),
				", estado = 'C' where estado = 'P' and id_cobranza = ",
				Convert.ToInt64(idCobranza)
			}));
            BaseDatos baseDatos = new BaseDatos();
            baseDatos.SQLExecute(stringBuilder.ToString());
        }
        public static void UpdateDocumentoMutuo(string idmutuo, string documento)
        {
            if (string.IsNullOrEmpty(idmutuo))
            {
                idmutuo = "0";
            }
            StringBuilder stringBuilder = new StringBuilder();
            stringBuilder.Append(string.Concat(new object[]
			{
				"UPDATE mutuo SET urldocumento = '",
				documento,
				"' WHERE id_mutuo = ",
				Convert.ToInt64(idmutuo)
			}));
            BaseDatos baseDatos = new BaseDatos();
            baseDatos.SQLExecute(stringBuilder.ToString());
        }
        public static void UpdateDocumentoCuotaColegio(string idcolegio, string documento)
        {
            if (string.IsNullOrEmpty(idcolegio))
            {
                idcolegio = "0";
            }
            StringBuilder stringBuilder = new StringBuilder();
            stringBuilder.Append(string.Concat(new object[]
			{
				"UPDATE cuotacolegio SET urldocumento = '",
				documento,
				"' WHERE id_cuota_colegio = ",
				Convert.ToInt64(idcolegio)
			}));
            BaseDatos baseDatos = new BaseDatos();
            baseDatos.SQLExecute(stringBuilder.ToString());
        }
        public static void UpdateDocumentoDigitalizado(string idDocumento, string documento)
        {
            if (string.IsNullOrEmpty(idDocumento))
            {
                idDocumento = "0";
            }
            StringBuilder stringBuilder = new StringBuilder();
            stringBuilder.Append(string.Concat(new object[]
			{
				"UPDATE docudigitalizados SET urldocumento = '",
				documento,
				"' WHERE id_documento = ",
				Convert.ToInt64(idDocumento)
			}));
            BaseDatos baseDatos = new BaseDatos();
            baseDatos.SQLExecute(stringBuilder.ToString());
        }
        public static void UpdateDigitalizadoReconstitucion(string idDocumento, string documento)
        {
            if (string.IsNullOrEmpty(idDocumento))
            {
                idDocumento = "0";
            }
            StringBuilder stringBuilder = new StringBuilder();
            stringBuilder.Append(string.Concat(new object[]
			{
				"UPDATE ReconstitucionesDigitalizar SET urldocumento = '",
				documento,
				"' WHERE id_digi = ",
				Convert.ToDecimal(idDocumento)
			}));
            BaseDatos baseDatos = new BaseDatos();
            baseDatos.SQLExecute(stringBuilder.ToString());
        }
        public static void UpdateDocuJuicio(string iddocujudi, string documento)
        {
            if (string.IsNullOrEmpty(iddocujudi))
            {
                iddocujudi = "0";
            }
            StringBuilder stringBuilder = new StringBuilder();
            stringBuilder.Append(string.Concat(new object[]
			{
				"UPDATE docujuicio SET urldocumento = '",
				documento,
				"' WHERE id_docu_judi = ",
				Convert.ToInt64(iddocujudi)
			}));
            BaseDatos baseDatos = new BaseDatos();
            baseDatos.SQLExecute(stringBuilder.ToString());
        }
        public static void UpdateDocuEstandard1(string iddocujudi, string documento)
        {
            if (string.IsNullOrEmpty(iddocujudi))
            {
                iddocujudi = "0";
            }
            StringBuilder stringBuilder = new StringBuilder();
            stringBuilder.Append(string.Concat(new object[]
			{
				"UPDATE DocuEstandard1 SET urldocumento = '",
				documento,
				"' WHERE id_docu_estan1 = ",
				Convert.ToInt64(iddocujudi)
			}));
            BaseDatos baseDatos = new BaseDatos();
            baseDatos.SQLExecute(stringBuilder.ToString());
        }
        public static void UpdateDocuEstandard4(string iddocujudi, string documento)
        {
            if (string.IsNullOrEmpty(iddocujudi))
            {
                iddocujudi = "0";
            }
            StringBuilder stringBuilder = new StringBuilder();
            stringBuilder.Append(string.Concat(new object[]
			{
				"UPDATE DocuEstandard4 SET urldocumento = '",
				documento,
				"' WHERE id_docu_estan4 = ",
				Convert.ToInt64(iddocujudi)
			}));
            BaseDatos baseDatos = new BaseDatos();
            baseDatos.SQLExecute(stringBuilder.ToString());
        }
        public static void UpdateDocuEstandard2(string iddocujudi, string documento)
        {
            if (string.IsNullOrEmpty(iddocujudi))
            {
                iddocujudi = "0";
            }
            StringBuilder stringBuilder = new StringBuilder();
            stringBuilder.Append(string.Concat(new object[]
			{
				"UPDATE DocuEstandard2 SET urldocumento = '",
				documento,
				"' WHERE id_docu_estan2 = ",
				Convert.ToInt64(iddocujudi)
			}));
            BaseDatos baseDatos = new BaseDatos();
            baseDatos.SQLExecute(stringBuilder.ToString());
        }
        public static void UpdateDocuEstandard3(string iddocujudi, string documento)
        {
            if (string.IsNullOrEmpty(iddocujudi))
            {
                iddocujudi = "0";
            }
            StringBuilder stringBuilder = new StringBuilder();
            stringBuilder.Append(string.Concat(new object[]
			{
				"UPDATE DocuEstandard3 SET urldocumento = '",
				documento,
				"' WHERE id_docu_estan3 = ",
				Convert.ToInt64(iddocujudi)
			}));
            BaseDatos baseDatos = new BaseDatos();
            baseDatos.SQLExecute(stringBuilder.ToString());
        }
        public static void UpdateDocuPagare(string iddocupagare, string documento)
        {
            if (string.IsNullOrEmpty(iddocupagare))
            {
                iddocupagare = "0";
            }
            StringBuilder stringBuilder = new StringBuilder();
            stringBuilder.Append(string.Concat(new object[]
			{
				"UPDATE docupagare SET urldocumento = '",
				documento,
				"' WHERE id_docu_pagare = ",
				Convert.ToInt64(iddocupagare)
			}));
            BaseDatos baseDatos = new BaseDatos();
            baseDatos.SQLExecute(stringBuilder.ToString());
        }
        public static void UpdateDocumentoExhorto(string idexhorto, string documento)
        {
            if (string.IsNullOrEmpty(idexhorto))
            {
                idexhorto = "0";
            }
            StringBuilder stringBuilder = new StringBuilder();
            stringBuilder.Append(string.Concat(new object[]
			{
				"UPDATE exhorto SET urldocumento = '",
				documento,
				"' WHERE id_exhorto = ",
				Convert.ToInt64(idexhorto)
			}));
            BaseDatos baseDatos = new BaseDatos();
            baseDatos.SQLExecute(stringBuilder.ToString());
        }
        public static void UpdateDocumentoJuicio(string idjuicio, string documento)
        {
            if (string.IsNullOrEmpty(idjuicio))
            {
                idjuicio = "0";
            }
            StringBuilder stringBuilder = new StringBuilder();
            stringBuilder.Append(string.Concat(new object[]
			{
				"UPDATE juicios SET urldocumento = '",
				documento,
				"' WHERE id_juicios = ",
				Convert.ToInt64(idjuicio)
			}));
            BaseDatos baseDatos = new BaseDatos();
            baseDatos.SQLExecute(stringBuilder.ToString());
        }
        public static void UpdateExhorto(string id_exhorto)
        {
            if (string.IsNullOrEmpty(id_exhorto))
            {
                id_exhorto = "0";
            }
            StringBuilder stringBuilder = new StringBuilder();
            stringBuilder.Append("UPDATE exhorto SET tipo = 'N' WHERE id_exhorto = " + Convert.ToInt64(id_exhorto));
            BaseDatos baseDatos = new BaseDatos();
            baseDatos.SQLExecute(stringBuilder.ToString());
        }
        public static void Update_Estado_Juicio(string idCobranza, string Estado, string descripcion, string usuario, string estadoOld, string rol, string tribunal, string id_juicios)
        {
            Update_Estado_Juicio(idCobranza, Estado, descripcion, usuario, estadoOld, rol, tribunal, id_juicios, string.Empty, 0, new DateTime(1900, 1, 1));
        }

        public static void Update_Estado_Juicio (
            string idCobranza, 
            string Estado, 
            string descripcion, 
            string usuario, 
            string estadoOld, 
            string rol, 
            string tribunal, 
            string id_juicios, 
            string rut_cliente,
            int idRiesgo,
            DateTime fechaRiesgo
        )
        {
            if (string.IsNullOrEmpty(idCobranza)) idCobranza = "0";

            StringBuilder stringBuilder = new StringBuilder();
            stringBuilder.AppendFormat("update cobranza set tipo = '{0}' ", Estado);
            if (!string.IsNullOrEmpty(rut_cliente))
                stringBuilder.AppendFormat(",rut_cli = '{0}' ", rut_cliente);
            stringBuilder.AppendFormat("where id_cobranza = {0} ", Convert.ToInt64(idCobranza));

            BaseDatos baseDatos = new BaseDatos();
            baseDatos.SQLExecute(stringBuilder.ToString());

            stringBuilder = new StringBuilder();
            stringBuilder.Append(string.Concat(new object[]
			{
				"insert into BitacoraEstadoJuicio(descripcion,usuario,estado,fproceso,id_cobranza) values('",
				descripcion,
				"','",
				usuario,
				"','",
				estadoOld,
				"',getdate(),",
				Convert.ToInt64(idCobranza),
				")"
			}));
            baseDatos.SQLExecute(stringBuilder.ToString());

            if (rol != "")
            {
                stringBuilder = new StringBuilder();
                stringBuilder.Append(string.Concat(new object[]
				{
					"update juicios set id_tribunal = ",
					Convert.ToInt64(tribunal),
					", rol = '",
					rol,
					"' where id_juicios = ",
					Convert.ToInt64(id_juicios)
				}));
                baseDatos.SQLExecute(stringBuilder.ToString());
            }

            if (!string.IsNullOrEmpty(id_juicios))
            {
                stringBuilder = new StringBuilder();
                stringBuilder.Append(" UPDATE dbo.Juicios ");
                stringBuilder.AppendFormat(" SET id_riesgo = {0},", idRiesgo > 0 ? idRiesgo.ToString() : "NULL");
                stringBuilder.AppendFormat("    fecha_motivo_riesgo = {0}", fechaRiesgo.Year > 1900 ? string.Format("'{0:yyyyMMdd}'", fechaRiesgo) : "NULL");
                stringBuilder.AppendFormat(" WHERE id_juicios = {0}", id_juicios);
                baseDatos.SQLExecute(stringBuilder.ToString());
            }
        }

        public static void UPDATE_Abono_CHEQUE(string id_abono, string fechadeposito, string cuentadeposito, string nrocomprobantedeposito, string fechaliberacion, string estado, string userdeposito)
        {
            if (string.IsNullOrEmpty(id_abono))
            {
                id_abono = "0";
            }
            StringBuilder stringBuilder = new StringBuilder();
            stringBuilder.Append(" UPDATE abonos SET");
            stringBuilder.Append(" fechadeposito = '" + fechadeposito + "',");
            stringBuilder.Append(" cuentadeposito = '" + cuentadeposito + "',");
            stringBuilder.Append(" nrocomprobantedeposito = '" + nrocomprobantedeposito + "',");
            stringBuilder.Append(" fechaliberacion = '" + fechaliberacion + "',");
            stringBuilder.Append(" estado = '" + estado + "',");
            stringBuilder.Append(" userdeposito = '" + userdeposito + "'");
            stringBuilder.Append(" WHERE id_abono = " + Convert.ToInt64(id_abono));
            BaseDatos baseDatos = new BaseDatos();
            baseDatos.SQLExecute(stringBuilder.ToString());
        }
        
        public static void UPDATE_AbonoMCH_CHEQUE(string id_abono, string fechadeposito, string cuentadeposito, string nrocomprobantedeposito, string fechaliberacion, string estado, string userdeposito)
        {
            if (string.IsNullOrEmpty(id_abono))
            {
                id_abono = "0";
            }
            StringBuilder stringBuilder = new StringBuilder();
            stringBuilder.Append(" UPDATE abonosmch SET");
            stringBuilder.Append(" fechadeposito = '" + fechadeposito + "',");
            stringBuilder.Append(" cuentadeposito = '" + cuentadeposito + "',");
            stringBuilder.Append(" nrocomprobantedeposito = '" + nrocomprobantedeposito + "',");
            stringBuilder.Append(" fechaliberacion = '" + fechaliberacion + "',");
            stringBuilder.Append(" estado = '" + estado + "',");
            stringBuilder.Append(" userdeposito = '" + userdeposito + "'");
            stringBuilder.Append(" WHERE id_abonoMCH = " + Convert.ToInt64(id_abono));
            BaseDatos baseDatos = new BaseDatos();
            baseDatos.SQLExecute(stringBuilder.ToString());
        }
        
        public static void UPDATEREVERSAR(string OT, string codigoestado, string observacion, string usuario)
        {
            if (string.IsNullOrEmpty(OT))
            {
                OT = "0";
            }
            StringBuilder stringBuilder = new StringBuilder();
            stringBuilder.Append(" UPDATE reconstituciones SET");
            stringBuilder.Append(" estado_ot = '2',");
            stringBuilder.Append(" codigoestado = '" + codigoestado + "',");
            stringBuilder.Append(" observacion = '" + observacion + "',");
            stringBuilder.Append(" fechaestado = getdate(),");
            stringBuilder.Append(" fproceso = getdate()");
            stringBuilder.Append(" WHERE OT = " + Convert.ToDecimal(OT));
            BaseDatos baseDatos = new BaseDatos();
            baseDatos.SQLExecute(stringBuilder.ToString());
        }
        
        public static void UpdateResponsableReconstitucion(string OT, string user_responsable, string user_asignador)
        {
            StringBuilder stringBuilder = new StringBuilder();
            stringBuilder.Append(string.Concat(new object[]
			{
				" update reconstituciones set user_responsable = '",
				user_responsable,
				"',estado_ot='2',user_asignador= '",
				user_asignador,
				"' where ot = ",
				Convert.ToDecimal(OT),
				" "
			}));
            BaseDatos baseDatos = new BaseDatos();
            baseDatos.SQLExecute(stringBuilder.ToString());
        }
        
        public static void UpdateResponsablejuici(string OT, string user_asignador, string rut_abogado, string rut_procurador)
        {
            string text = "";
            BaseDatos baseDatos = new BaseDatos();
            DataTable resultset = baseDatos.getResultset("select nombres + ' ' + apaterno procurador from procuradores where rut_procurador =  '" + rut_procurador + "'");
            if (resultset.Rows.Count > 0 && resultset != null)
            {
                text = resultset.Rows[0]["procurador"].ToString();
            }
            StringBuilder stringBuilder = new StringBuilder();
            StringBuilder stringBuilder2 = new StringBuilder();
            stringBuilder.Append(string.Concat(new object[]
			{
				" update cobranza set estado_ot = 'EN PROCESO', user_asignador = '",
				user_asignador,
				"' ,user_responsable = '",
				text,
				"'  ,fecha_asignacion = getdate()  where id_cobranza = ",
				Convert.ToInt64(OT),
				" "
			}));
            BaseDatos baseDatos2 = new BaseDatos();
            baseDatos2.SQLExecute(stringBuilder.ToString());
            stringBuilder2.Append(string.Concat(new object[]
			{
				" update juicios set rut_abogado = '",
				rut_abogado,
				"', rut_procurador = '",
				rut_procurador,
				"'  where id_cobranza = ",
				Convert.ToInt64(OT),
				" "
			}));
            BaseDatos baseDatos3 = new BaseDatos();
            baseDatos3.SQLExecute(stringBuilder2.ToString());
        }
        
        public static void UpdateResponsableReasignarReconstitucion(string OT, string user_responsable_actual, string user_responsable_nuevo, string user_asignador)
        {
            StringBuilder stringBuilder = new StringBuilder();
            StringBuilder stringBuilder2 = new StringBuilder();
            stringBuilder.Append(string.Concat(new object[]
			{
				" update reconstituciones set user_responsable = '",
				user_responsable_nuevo,
				"' where ot = ",
				Convert.ToDecimal(OT),
				" "
			}));
            BaseDatos baseDatos = new BaseDatos();
            baseDatos.SQLExecute(stringBuilder.ToString());
            stringBuilder2.Append(string.Concat(new object[]
			{
				"INSERT INTO ReconstitucionesBitacoraReasignar(ot,user_asignado,user_reasignado,observacion,usuario,tipo,fproceso) VALUES(",
				Convert.ToDecimal(OT),
				",'",
				user_responsable_actual.ToString(),
				"','",
				user_responsable_nuevo.ToString(),
				"','','",
				user_asignador.ToString(),
				"','parcial',getdate() ) "
			}));
            BaseDatos baseDatos2 = new BaseDatos();
            baseDatos2.SQLExecute(stringBuilder2.ToString());
        }
        
        public static void CerrarOTReconstitucion(string OT)
        {
            StringBuilder stringBuilder = new StringBuilder();
            stringBuilder.Append(" update reconstituciones set estado_ot='3',codigoestado = '900' where ot = " + Convert.ToDecimal(OT) + " ");
            BaseDatos baseDatos = new BaseDatos();
            baseDatos.SQLExecute(stringBuilder.ToString());
        }
        
        public static void ActualizaRemesaManual(string Fecha, decimal remesa)
        {
            StringBuilder stringBuilder = new StringBuilder();
            stringBuilder.Append(string.Concat(new object[]
			{
				" update Reconstituciones set remesa = ",
				remesa,
				" where convert(varchar(10),fecha_remesa,103) = '",
				Fecha,
				"'"
			}));
            BaseDatos baseDatos = new BaseDatos();
            baseDatos.SQLExecute(stringBuilder.ToString());
        }
        
        public static void InsertaBitacoraEstadoReconstitucion(string ot, string codigoestado, string observacion, string usuario)
        {
            if (string.IsNullOrEmpty(ot))
            {
                ot = "0";
            }
            StringBuilder stringBuilder = new StringBuilder();
            stringBuilder.Append(" insert into ReconstitucionesBitacoraEstados(ot,codigoestado,fechaestado,observacion,usuario)");
            stringBuilder.Append(" VALUES(");
            stringBuilder.Append(" " + Convert.ToDecimal(ot) + ",");
            stringBuilder.Append(" '" + codigoestado + "',");
            stringBuilder.Append(" getdate(),");
            stringBuilder.Append(" '" + observacion + "',");
            stringBuilder.Append(" '" + usuario + "'");
            stringBuilder.Append(" )");
            BaseDatos baseDatos = new BaseDatos();
            baseDatos.SQLExecute(stringBuilder.ToString());
        }
        
        public static void InsertaEstadoReconst(string descripcion)
        {
            BaseDatos baseDatos = new BaseDatos();
            decimal num = 0m;
            DataTable resultset = baseDatos.getResultset("select max(id) + 1 cont from ReconstitucionesEstados");
            if (resultset.Rows.Count > 0 && resultset != null)
            {
                num = Convert.ToDecimal(resultset.Rows[0]["cont"].ToString());
            }
            StringBuilder stringBuilder = new StringBuilder();
            stringBuilder.Append(" insert into ReconstitucionesEstados(id,descripcion)");
            stringBuilder.Append(" VALUES(");
            stringBuilder.Append(string.Concat(new object[]
			{
				" ",
				num,
				",'",
				descripcion.ToUpper(),
				"'"
			}));
            stringBuilder.Append(" )");
            BaseDatos baseDatos2 = new BaseDatos();
            baseDatos2.SQLExecute(stringBuilder.ToString());
        }
        public static void InsertaTipoGastoReconst(string descripcion)
        {
            StringBuilder stringBuilder = new StringBuilder();
            stringBuilder.Append(" insert into ReconstitucionesTipoGastos(descripcion)");
            stringBuilder.Append(" VALUES(");
            stringBuilder.Append("'" + descripcion.Trim().ToUpper() + "'");
            stringBuilder.Append(" )");
            BaseDatos baseDatos = new BaseDatos();
            baseDatos.SQLExecute(stringBuilder.ToString());
        }
        public static void InsertaSubTramiteNuevo(string descripcion, string tipo, string termino)
        {
            BaseDatos baseDatos = new BaseDatos();
            DataTable resultset = baseDatos.getResultset("select max(id_sub_tramite)+ 1 maximo from SubTramiteGENERAL");
            int num = Convert.ToInt32(resultset.Rows[0]["maximo"].ToString());
            StringBuilder stringBuilder = new StringBuilder();
            stringBuilder.Append(" insert into SubTramiteGENERAL(id_sub_tramite,descripcion,tipo,termino)");
            stringBuilder.Append(" VALUES(");
            stringBuilder.Append(num + ",");
            stringBuilder.Append("'" + descripcion.Trim() + "',");
            stringBuilder.Append("'" + tipo.Trim().ToUpper() + "',");
            stringBuilder.Append("'" + termino.Trim().ToUpper() + "'");
            stringBuilder.Append(" )");
            BaseDatos baseDatos2 = new BaseDatos();
            baseDatos2.SQLExecute(stringBuilder.ToString());
        }
    }
}//namespace
