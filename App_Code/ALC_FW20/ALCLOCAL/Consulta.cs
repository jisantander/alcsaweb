using ALCGLOBAL;
using System;
using System.Data;
using System.Text;

namespace ALC_FW20.ALCLOCAL
{
    public class Consulta
    {
        public static DataTable ComboProcurador()
        {
            BaseDatos baseDatos = new BaseDatos();
            return baseDatos.getResultset("SELECT rut_procurador rut,nombres + ' ' + apaterno + ' ' + amaterno nombres FROM procuradores ORDER BY nombres");
        }

        public static void UpdateResponsableExhorto(string RutResponsable, string idexhorto, string usuario)
        {
            if (string.IsNullOrEmpty(RutResponsable))
            {
                RutResponsable = "0";
            }
            if (string.IsNullOrEmpty(idexhorto))
            {
                idexhorto = "0";
            }
            int num = Convert.ToInt32(idexhorto);
            StringBuilder stringBuilder = new StringBuilder();
            stringBuilder.Append(string.Concat(new object[]
	        {
		        " update exhorto set responsable = '",
		        RutResponsable,
		        "',fIngResponsable = getdate(),usuarioasigna = '",
		        usuario,
		        "'  where id_exhorto = ",
		        num
	        }));
            BaseDatos baseDatos = new BaseDatos();
            baseDatos.SQLExecute(stringBuilder.ToString());
        }

        public static DataTable getBien_Mueble(string rutdeudor)
        {
            BaseDatos baseDatos = new BaseDatos();
            return baseDatos.getResultset("select (select top 1 mar.descripcion from dbo.Marca mar where mar.id_marca = bm.id_marca)marca,(select top 1 md.descripcion from dbo.Modelo md where md.id_modelo = bm.id_modelo)modelo,bm.n_chassis, bm.n_motor, bm.patente, bm.anio_fabricacion from dbo.BienMueble bm where bm.rut_deudor = '" + rutdeudor + "'");
        }

        public static DataTable getBien_Raiz(string rutdeudor)
        {
            BaseDatos baseDatos = new BaseDatos();
            return baseDatos.getResultset("select fojas_insc,n_insc,anio_insc,fojas1_hip,n1_hip,anio1_hip,rol_avaluo from dbo.BienRaiz where rut_deudor = '" + rutdeudor + "'");
        }

        public static DataTable ConsultaCobranzaConsulta(string RutDeudor, string NroOperacion)
        {
            BaseDatos baseDatos = new BaseDatos();
            StringBuilder stringBuilder = new StringBuilder();
            stringBuilder.Append(" SELECT jui.id_juicios,cob.id_cobranza,cob.Nrooperacion,cob.rut_cli,cob.rut_deudor,cob.tipo estado");
            stringBuilder.Append(" FROM cobranza cob inner join juicios jui on cob.id_cobranza = jui.id_cobranza ");
            stringBuilder.Append(" WHERE");
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
        public static DataTable TramiteGeneral()
        {
            BaseDatos baseDatos = new BaseDatos();
            return baseDatos.getResultset("select distinct etapa from TramiteGENERAL");
        }
        public static DataTable TraeRol(string Noperacion)
        {
            BaseDatos baseDatos = new BaseDatos();
            return baseDatos.getResultset("select jui.rol,jui.id_juicios from cobranza cob inner join juicios jui on cob.id_cobranza = jui.id_cobranza where cob.nrooperacion = '" + Noperacion.ToString() + "'");
        }
        public static void ActualizaRol(string IdExhorto, string RolExhorto, string idTribunal)
        {
            StringBuilder stringBuilder = new StringBuilder();
            stringBuilder.Append(string.Concat(new object[]
			{
				" UPDATE Exhorto SET rol_exhorto = '",
				RolExhorto,
				"',id_tribunal = '",
				Convert.ToInt32(idTribunal),
				"'   WHERE id_exhorto = ",
				Convert.ToInt32(IdExhorto),
				" "
			}));
            BaseDatos baseDatos = new BaseDatos();
            baseDatos.SQLExecute(stringBuilder.ToString());
        }
        public static DataTable ConsultaExhorto(string Rol, string RutDeudor, string NroOperacion)
        {
            BaseDatos baseDatos = new BaseDatos();
            StringBuilder stringBuilder = new StringBuilder();
            stringBuilder.Append(" SELECT exh.id_tribunal,exh.tipo tipoexh,exh.id_exhorto,cob.tipo,cob.id_cobranza,jui.id_juicios,exh.rol_exhorto rolexhorto,cob.nrooperacion operacion,cob.rut_deudor,convert(varchar(10),exh.fechaingreso,103) fingexh,  ");
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
        public static DataTable ComboTribunales()
        {
            BaseDatos baseDatos = new BaseDatos();
            return baseDatos.getResultset("SELECT id_tribunal,descripcion FROM tribunal");
        }
    }
}