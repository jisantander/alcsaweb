namespace CobranzaALC.Dto
{
    using System;

    public class CobranzaDTO
    {
        public CobranzaDTO() { }

        public string Codigo { get; set; }

        public long Id_Materia { get; set; }

        public long Id_Procedimiento { get; set; }

        public long Id_Producto { get; set; }

        public string NroOperacion { get; set; }

        public string Rut_Cli { get; set; }

        public string Rut_Deudor { get; set; }

        public string Tipo_Cobranza { get; set; }

        public int id_remesa { get; set; }
    }
}

